void type metadata accessor for CSUICurrentUserCKShareStatus(uint64_t a1)
{
  sub_100004CE0(a1, &qword_10007DC50);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t sub_1000039C0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_1000039C8()
{
  return *v0;
}

uint64_t sub_1000039D0(uint64_t a1, uint64_t a2)
{
  return sub_100003B3C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000039E8(uint64_t a1, id *a2)
{
  uint64_t result = sub_1000646C0();
  *a2 = 0;
  return result;
}

uint64_t sub_100003A60(uint64_t a1, id *a2)
{
  char v3 = sub_1000646D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003AE0@<X0>(void *a1@<X8>)
{
  sub_1000646E0();
  NSString v2 = sub_1000646A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003B24(uint64_t a1, uint64_t a2)
{
  return sub_100003B3C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003B3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1000646E0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100003B80()
{
  sub_1000646E0();
  sub_100064720();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003BD4()
{
  sub_1000646E0();
  sub_100064C90();
  sub_100064720();
  Swift::Int v0 = sub_100064CB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100003C48(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD30, type metadata accessor for BRError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003CB4(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD30, type metadata accessor for BRError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003D24(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100003D90(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD70, type metadata accessor for CKError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003DFC(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD70, type metadata accessor for CKError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003E68(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

void *sub_100003ED4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100003EE4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100003EF0()
{
  return sub_1000646E0();
}

uint64_t sub_100003F00()
{
  sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);

  return sub_100064130();
}

uint64_t sub_100003F6C(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003FD8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100004068(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_1000040E8()
{
  return sub_1000646E0();
}

uint64_t sub_1000040F8()
{
  sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);

  return sub_100064130();
}

uint64_t sub_100004164(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000041D0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100004260()
{
  id v1 = *v0;
  uint64_t v2 = sub_100064A50();

  return v2;
}

uint64_t sub_100004298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004314()
{
  return sub_100064CB0();
}

uint64_t sub_100004374()
{
  uint64_t v0 = sub_1000646E0();
  uint64_t v2 = v1;
  if (v0 == sub_1000646E0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100064C10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100004400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100004484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100004508(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000451C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_1000646A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004564@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000646E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100004590(uint64_t a1)
{
  uint64_t v2 = sub_1000046DC(&qword_10007DC78, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_1000046DC(&qword_10007DC80, type metadata accessor for URLResourceKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000464C()
{
  return sub_1000046DC(&qword_10007DC60, type metadata accessor for URLResourceKey);
}

uint64_t sub_100004694()
{
  return sub_1000046DC(&qword_10007DC68, type metadata accessor for URLResourceKey);
}

uint64_t sub_1000046DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004724()
{
  return sub_1000046DC(&qword_10007DC70, type metadata accessor for URLResourceKey);
}

void type metadata accessor for CheckingType(uint64_t a1)
{
}

void type metadata accessor for BRError(uint64_t a1)
{
}

void type metadata accessor for ParticipantPermission(uint64_t a1)
{
}

void type metadata accessor for CKError(uint64_t a1)
{
}

__n128 sub_1000047BC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000047CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000047EC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_100004828()
{
  return sub_1000046DC(&qword_10007DD10, type metadata accessor for CKError);
}

uint64_t sub_100004870()
{
  return sub_1000046DC(&qword_10007DD18, type metadata accessor for CKError);
}

uint64_t sub_1000048B8()
{
  return sub_1000046DC(&qword_10007DD20, type metadata accessor for BRError);
}

uint64_t sub_100004900()
{
  return sub_1000046DC(&qword_10007DD28, type metadata accessor for BRError);
}

uint64_t sub_100004948()
{
  return sub_1000046DC(&qword_10007DD30, type metadata accessor for BRError);
}

uint64_t sub_100004990()
{
  return sub_1000046DC(&qword_10007DD38, type metadata accessor for BRError);
}

uint64_t sub_1000049D8()
{
  return sub_1000046DC(&qword_10007DD40, type metadata accessor for BRError);
}

uint64_t sub_100004A20()
{
  return sub_1000046DC(&qword_10007DD48, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_100004A7C()
{
  return sub_1000046DC(&qword_10007DD50, _s3__C4CodeOMa_0);
}

unint64_t sub_100004AC8()
{
  unint64_t result = qword_10007DD58;
  if (!qword_10007DD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DD58);
  }
  return result;
}

uint64_t sub_100004B1C()
{
  return sub_1000046DC(&qword_10007DD60, _s3__C4CodeOMa_0);
}

uint64_t sub_100004B64()
{
  return sub_1000046DC(&qword_10007DD68, type metadata accessor for BRError);
}

uint64_t sub_100004BAC()
{
  return sub_1000046DC(&qword_10007DD70, type metadata accessor for CKError);
}

uint64_t sub_100004BF4()
{
  return sub_1000046DC(&qword_10007DD78, type metadata accessor for CKError);
}

uint64_t sub_100004C3C()
{
  return sub_1000046DC(&qword_10007DD80, type metadata accessor for CKError);
}

uint64_t sub_100004C84()
{
  return sub_1000046DC(&qword_10007DD88, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100004CE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004D28()
{
  return sub_1000046DC(&qword_10007DD90, type metadata accessor for Code);
}

uint64_t sub_100004D70()
{
  return sub_1000046DC(&qword_10007DD98, type metadata accessor for Code);
}

uint64_t sub_100004DB8()
{
  return sub_1000046DC(&qword_10007DDA0, type metadata accessor for CKError);
}

uint64_t sub_100004E14(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    swift_beginAccess();
    *(void *)(a4 + 16) = a2;
    swift_errorRetain();
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100004E7C(uint64_t a1, char a2, uint64_t a3, void (*a4)(void, void *), uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    swift_errorRetain();
    v14 = (void *)sub_100064140();
    a4(0, v14);

    return sub_100007000(a1, 1);
  }
  else
  {
    swift_beginAccess();
    if (*(void *)(a3 + 16) || (swift_beginAccess(), *(void *)(a6 + 16)))
    {
      swift_errorRetain();
      v11 = (void *)sub_100064140();
      a4(0, v11);

      return swift_errorRelease();
    }
    else
    {
      return ((uint64_t (*)(uint64_t, void))a4)(a7, 0);
    }
  }
}

uint64_t sub_100004FA0(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v10 = (a4 >> 40) & 1;
  uint64_t v11 = sub_100006DC8(&qword_10007DF88);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  sub_1000062F8(a3, v10, a7, (uint64_t)sub_100006E80, v15);
  return swift_release();
}

uint64_t sub_1000050FC(void *a1, void *a2)
{
  if (!a1 || a2)
  {
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v5 = 0xD000000000000029;
    *(void *)(v5 + 8) = 0x8000000100068EC0;
    *(void *)(v5 + 24) = 0;
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 16) = a2;
    *(unsigned char *)(v5 + 40) = 4;
    id v6 = a2;
    sub_100006DC8(&qword_10007DF88);
    return sub_100064840();
  }
  else
  {
    id v3 = a1;
    sub_100006DC8(&qword_10007DF88);
    return sub_100064850();
  }
}

void sub_1000051BC(uint64_t a1, void *a2, char a3, void (*a4)(id, id, void *, id))
{
  if (a3)
  {
    swift_errorRetain();
    id v7 = (id)sub_100064140();
    a4(0, 0, 0, v7);
  }
  else
  {
    id v8 = a2;
    id v9 = [v8 share];
    id v7 = [v8 containerID];
    id v10 = v8;
    a4(v9, v7, a2, 0);
    sub_1000071D8(a2, 0);
  }

  sub_1000071D8(a2, a3 & 1);
}

uint64_t sub_1000052B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100006DC8(&qword_10007DF98);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_100006504(a3, a4, (uint64_t)sub_1000070F8, v11);
  return swift_release();
}

uint64_t sub_100005404(void *a1, void *a2, void *a3, void *a4)
{
  if (a1 && a2 && a3 && !a4)
  {
    id v7 = a1;
    id v8 = a2;
    id v9 = a3;
    sub_100006DC8(&qword_10007DF98);
    return sub_100064850();
  }
  else
  {
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v11 = 0xD00000000000002DLL;
    *(void *)(v11 + 8) = 0x8000000100068F10;
    *(void *)(v11 + 24) = 0;
    *(void *)(v11 + 32) = 0;
    *(void *)(v11 + 16) = a4;
    *(unsigned char *)(v11 + 40) = 5;
    id v12 = a4;
    sub_100006DC8(&qword_10007DF98);
    return sub_100064840();
  }
}

uint64_t sub_1000054E8(uint64_t a1, uint64_t a2)
{
  v2[16] = a1;
  v2[17] = a2;
  uint64_t v3 = sub_100064380();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = sub_100006DC8(&qword_10007DF78);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  return _swift_task_switch(sub_1000055EC, 0, 0);
}

uint64_t sub_1000055EC()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v1;
  v0[3] = sub_1000056E8;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000061BC;
  v0[13] = &unk_100079C38;
  v0[14] = v3;
  [v2 fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000056E8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 192) = v2;
  if (v2)
  {
    uint64_t v3 = sub_100005A78;
  }
  else
  {
    *(_DWORD *)(v1 + 200) = *(_DWORD *)(*(void *)(v1 + 168) + 48);
    uint64_t v3 = sub_100005804;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100005804()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v4 = (uint64_t *)(v2 + *(int *)(v0 + 200));
  uint64_t v5 = sub_1000640C0();
  id v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
  v6(v3, v2, v5);
  uint64_t v7 = *v4;
  unint64_t v8 = v4[1];
  uint64_t v20 = v7;
  v6(v1, v3, v5);
  sub_100064360();
  swift_bridgeObjectRetain_n();
  id v9 = sub_100064370();
  os_log_type_t v10 = sub_100064930();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v18 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 160);
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)id v12 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 120) = sub_10004BEF0(v20, v8, &v21);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Username: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v19, v18);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v15 = *(void *)(v0 + 144);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v16 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v16(v20, v8);
}

uint64_t sub_100005A78()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005B0C(uint64_t a1)
{
  v1[15] = a1;
  v1[16] = sub_100006DC8(&qword_10007DF78);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_100005BB4, 0, 0);
}

uint64_t sub_100005BB4()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = (void *)v0[15];
  v0[2] = v0;
  v0[7] = v1;
  v0[3] = sub_100005CB0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000061BC;
  v0[13] = &unk_100079C20;
  v0[14] = v3;
  [v2 fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100005CB0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 152) = v2;
  if (v2)
  {
    uint64_t v3 = sub_100005EE8;
  }
  else
  {
    *(_DWORD *)(v1 + 160) = *(_DWORD *)(*(void *)(v1 + 128) + 48);
    uint64_t v3 = sub_100005DCC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100005DCC()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = (uint64_t *)(v2 + *(int *)(v0 + 160));
  uint64_t v4 = (void *)(v1 + *(int *)(*(void *)(v0 + 128) + 48));
  uint64_t v5 = sub_1000640C0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v2, v5);
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  *uint64_t v4 = v7;
  v4[1] = v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v9(v7, v8);
}

uint64_t sub_100005EE8()
{
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100005F68()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants18CloudKitOperations__ckSourceAppBundleID;
  uint64_t v2 = sub_100006DC8((uint64_t *)&unk_10007EE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_100006024()
{
  return type metadata accessor for CloudKitOperations();
}

uint64_t type metadata accessor for CloudKitOperations()
{
  uint64_t result = qword_10007DE50;
  if (!qword_10007DE50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006078()
{
  sub_100006118();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100006118()
{
  if (!qword_10007DE60)
  {
    sub_100006174(&qword_10007EA40);
    unint64_t v0 = sub_1000644A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007DE60);
    }
  }
}

uint64_t sub_100006174(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000061BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_100006DC8(&qword_10007DF78);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 32);
  if (a4)
  {
    sub_100006DC8(&qword_10007DF80);
    uint64_t v10 = swift_allocError();
    void *v11 = a4;
    id v12 = a4;
    return _swift_continuation_throwingResumeWithError(v9, v10);
  }
  else
  {
    sub_1000640B0();
    uint64_t v13 = (uint64_t *)&v8[*(int *)(v6 + 48)];
    *uint64_t v13 = sub_1000646E0();
    v13[1] = v14;
    sub_100006E0C((uint64_t)v8, *(void *)(*(void *)(v9 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

void sub_1000062F8(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  sub_100006F04();
  sub_100006DC8(&qword_10007F410);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100066010;
  *(void *)(v10 + 32) = a1;
  uint64_t v19 = (void *)v10;
  sub_100064800();
  id v11 = a1;
  v21.value._rawValue = v19;
  v21.is_nil = 0;
  v12.super.super.super.super.isa = sub_1000649B0(v21, v22).super.super.super.super.isa;
  [(objc_class *)v12.super.super.super.super.isa setQualityOfService:25];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  swift_retain();
  sub_1000649C0();
  swift_retain();
  sub_1000649D0();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v13;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = v11;
  id v16 = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000649A0();
  uint64_t v17 = &selRef_privateCloudDatabase;
  if ((a2 & 1) == 0) {
    uint64_t v17 = &selRef_sharedCloudDatabase;
  }
  id v18 = [a3 *v17];
  [v18 addOperation:v12.super.super.super.super.isa];

  swift_release();
  swift_release();
}

void sub_100006504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v18 = [objc_allocWithZone((Class)CKContainer) initWithContainerSetupInfo:a2];
  }
  else
  {
    id v7 = objc_allocWithZone((Class)CKContainerID);
    NSString v8 = sub_1000646A0();
    id v9 = [v7 initWithContainerIdentifier:v8 environment:1];

    id v18 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v9];
  }
  sub_100006DC8(&qword_10007DFA0);
  uint64_t v10 = sub_1000641E0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100066020;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 16))(v13 + v12, a1, v10);
  id v14 = objc_allocWithZone((Class)CKFetchShareMetadataOperation);
  Class isa = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithShareURLs:isa];

  [v16 setShouldFetchRootRecord:0];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  swift_retain();
  sub_100064A00();
  [v18 addOperation:v16];
}

uint64_t sub_10000675C(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v3 = sub_1000640C0();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  uint64_t v4 = swift_task_alloc();
  v1[9] = v4;
  v1[10] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v1[11] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100006874;
  return sub_1000054E8(v4, a1);
}

uint64_t sub_100006874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v4[12] = a2;
  v4[13] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_100006CD8;
  }
  else {
    uint64_t v5 = sub_100006990;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100006990()
{
  (*(void (**)(void, void, void))(v0[8] + 32))(v0[10], v0[9], v0[7]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  void *v1 = v0;
  v1[1] = sub_100006A3C;
  uint64_t v2 = v0[6];
  return sub_100005B0C(v2);
}

uint64_t sub_100006A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 120) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_100006D44;
  }
  else
  {
    uint64_t v8 = v6[3];
    v6[16] = a2;
    v6[17] = a1;
    v6[18] = v8;
    uint64_t v7 = sub_100006B80;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100006B80()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[8];
  v17._object = (void *)0x8000000100068E60;
  v17._countAndFlagsBits = 0xD000000000000017;
  if (sub_1000647A0(v17))
  {
    uint64_t v1 = v2;
    uint64_t v3 = v4;
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = self;
  Class v9 = sub_1000640A0();
  id v10 = [v8 localizedStringFromPersonNameComponents:v9 style:2 options:0];

  uint64_t v11 = sub_1000646E0();
  uint64_t v13 = v12;

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  id v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[1];
  return v14(v11, v13, v1, v3);
}

uint64_t sub_100006CD8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100006D44()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[10], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100006DC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007DF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006E74()
{
  return sub_10000706C(&qword_10007DF88);
}

uint64_t sub_100006E80(void *a1, void *a2)
{
  sub_100006DC8(&qword_10007DF88);

  return sub_1000050FC(a1, a2);
}

unint64_t sub_100006F04()
{
  unint64_t result = qword_10007DF90;
  if (!qword_10007DF90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007DF90);
  }
  return result;
}

uint64_t sub_100006F44()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006F7C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_100004E14(a1, a2, a3 & 1, v3);
}

uint64_t sub_100006F9C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100006FEC(uint64_t a1, char a2)
{
  return sub_100004E7C(a1, a2 & 1, *(void *)(v2 + 16), *(void (**)(void, void *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_100007000(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

unint64_t sub_10000700C()
{
  unint64_t result = qword_10007EC70;
  if (!qword_10007EC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EC70);
  }
  return result;
}

uint64_t sub_100007060()
{
  return sub_10000706C(&qword_10007DF98);
}

uint64_t sub_10000706C(uint64_t *a1)
{
  uint64_t v2 = sub_100006DC8(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_1000070F8(void *a1, void *a2, void *a3, void *a4)
{
  sub_100006DC8(&qword_10007DF98);

  return sub_100005404(a1, a2, a3, a4);
}

uint64_t sub_100007194()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000071CC(uint64_t a1, void *a2, char a3)
{
  sub_1000051BC(a1, a2, a3 & 1, *(void (**)(id, id, void *, id))(v3 + 16));
}

void sub_1000071D8(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

BOOL sub_1000071E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100007200()
{
  Swift::UInt v1 = *v0;
  sub_100064C90();
  sub_100064CA0(v1);
  return sub_100064CB0();
}

void sub_100007248()
{
  sub_100064CA0(*v0);
}

Swift::Int sub_100007274()
{
  Swift::UInt v1 = *v0;
  sub_100064C90();
  sub_100064CA0(v1);
  return sub_100064CB0();
}

uint64_t sub_1000072B8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000732C(int a1)
{
  uint64_t v2 = v1;
  int v17 = a1;
  uint64_t v3 = sub_100006DC8(&qword_10007E080);
  uint64_t v15 = *(void *)(v3 - 8);
  uint64_t v16 = v3;
  __chkstk_darwin(v3);
  id v14 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100064950();
  uint64_t v5 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100064940();
  __chkstk_darwin(v8);
  uint64_t v9 = sub_100064640();
  __chkstk_darwin(v9 - 8);
  sub_100064550();
  swift_allocObject();
  *(void *)(v1 + 16) = sub_100064540();
  sub_100008130();
  sub_100064630();
  uint64_t v19 = &_swiftEmptyArrayStorage;
  sub_100008308(&qword_10007E090, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006DC8(&qword_10007E098);
  sub_100008350(&qword_10007E0A0, &qword_10007E098);
  sub_100064AE0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v13);
  *(void *)(v1 + 24) = sub_100064980();
  uint64_t v10 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants14NetworkMonitor__status;
  char v18 = 0;
  uint64_t v11 = v14;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v10, v11, v16);
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_1000081B0((uint64_t)sub_1000081A8);
  sub_100064520();
  swift_release();
  swift_release_n();
  if (v17) {
    sub_100064530();
  }
  return v2;
}

uint64_t sub_1000076E0(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_100064620();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v24 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100064640();
  uint64_t v23 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100064590();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100008130();
    uint64_t v21 = sub_100064960();
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v7);
    uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v22 = v4;
    uint64_t v14 = v2;
    uint64_t v15 = (v13 + 24) & ~v13;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v12;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, v10, v7);
    aBlock[4] = sub_10000828C;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100007C74;
    aBlock[3] = &unk_100079DF8;
    int v17 = _Block_copy(aBlock);
    swift_release();
    sub_100064630();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100008308(&qword_10007E0A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100006DC8(&qword_10007E0B0);
    sub_100008350(qword_10007E0B8, &qword_10007E0B0);
    char v18 = v24;
    sub_100064AE0();
    uint64_t v19 = (void *)v21;
    sub_100064970();
    _Block_release(v17);
    swift_release();

    (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v6, v22);
  }
  return result;
}

uint64_t sub_100007AC0()
{
  uint64_t v0 = sub_100064570();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v6 = &v10[-v5];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100064580();
    (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v4, enum case for NWPath.Status.satisfied(_:), v0);
    char v8 = sub_100064560();
    uint64_t v9 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
    v9(v4, v0);
    v9(v6, v0);
    swift_getKeyPath();
    swift_getKeyPath();
    v10[7] = (v8 & 1) == 0;
    return sub_100064490();
  }
  return result;
}

uint64_t sub_100007C74(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100007CB8()
{
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants14NetworkMonitor__status;
  uint64_t v2 = sub_100006DC8(&qword_10007E080);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_100007D6C()
{
  return type metadata accessor for NetworkMonitor();
}

uint64_t type metadata accessor for NetworkMonitor()
{
  uint64_t result = qword_10007DFD8;
  if (!qword_10007DFD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100007DC0()
{
  sub_100007E6C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100007E6C()
{
  if (!qword_10007DFE8)
  {
    unint64_t v0 = sub_1000644A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007DFE8);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for NetworkStatus(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkStatus(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NetworkStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000802CLL);
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

uint64_t sub_100008054(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008060(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkStatus()
{
  return &type metadata for NetworkStatus;
}

unint64_t sub_100008080()
{
  unint64_t result = qword_10007E078;
  if (!qword_10007E078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E078);
  }
  return result;
}

void *sub_1000080D4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_1000080E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100064430();
  *a1 = result;
  return result;
}

unint64_t sub_100008130()
{
  unint64_t result = qword_10007E088;
  if (!qword_10007E088)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007E088);
  }
  return result;
}

uint64_t sub_100008170()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000081A8(uint64_t a1)
{
  return sub_1000076E0(a1);
}

uint64_t sub_1000081B0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000081C0()
{
  uint64_t v1 = sub_100064590();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000828C()
{
  sub_100064590();

  return sub_100007AC0();
}

uint64_t sub_1000082F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008300()
{
  return swift_release();
}

uint64_t sub_100008308(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008350(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006174(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000083A0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100008424()
{
  return sub_100064490();
}

uint64_t sub_1000084A0()
{
  uint64_t result = sub_1000644A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000853C()
{
  return swift_release();
}

uint64_t sub_1000085F8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v45 = a1;
  uint64_t v3 = sub_1000641E0();
  uint64_t v41 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v40 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006DC8(&qword_10007E150);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  int v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006DC8(&qword_10007E520);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v44 = (uint64_t)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)&v40 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v40 - v18;
  uint64_t v48 = v17;
  unint64_t v20 = sub_1000098F8();
  unint64_t v49 = v20;
  swift_getKeyPath();
  uint64_t v46 = v9;
  unint64_t v47 = v20;
  swift_getKeyPath();
  v42 = v2;
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v21 = (uint64_t)&v8[*(int *)(v6 + 56)];
  sub_100009C3C((uint64_t)v19, (uint64_t)v8);
  sub_100009C3C(v45, v21);
  uint64_t v22 = v41;
  uint64_t v23 = *(uint64_t (**)(void, void, void))(v41 + 48);
  if (v23(v8, 1, v3) == 1)
  {
    int v24 = v23(v21, 1, v3);
    if (v24 == 1) {
      v25 = &qword_10007E520;
    }
    else {
      v25 = &qword_10007E150;
    }
    if (v24 == 1) {
      char v26 = -1;
    }
    else {
      char v26 = 0;
    }
  }
  else
  {
    sub_100009C3C((uint64_t)v8, (uint64_t)v16);
    if (v23(v21, 1, v3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v3);
      char v26 = 0;
      v25 = &qword_10007E150;
    }
    else
    {
      uint64_t v27 = v22;
      v28 = *(void (**)(void, void, void))(v22 + 32);
      v29 = v40;
      v28(v40, v21, v3);
      sub_10000996C();
      char v26 = sub_100064690();
      v30 = *(void (**)(void, void))(v27 + 8);
      v30(v29, v3);
      v30(v16, v3);
      v25 = &qword_10007E520;
    }
  }
  sub_100009CA4((uint64_t)v8, v25);
  sub_100009CA4((uint64_t)v19, &qword_10007E520);
  uint64_t v31 = v45;
  uint64_t v32 = v43;
  uint64_t v33 = sub_100009C3C(v45, v43);
  __chkstk_darwin(v33);
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  swift_getKeyPath();
  sub_100009C3C(v32, v44);
  v35 = v42;
  swift_retain();
  sub_100064490();
  sub_100009CA4(v32, &qword_10007E520);
  uint64_t v36 = *v35;
  if ((v26 & 1) == 0)
  {
    v37 = *(void (**)(void))((char *)v35 + *(void *)(v36 + 104));
    if (v37)
    {
      uint64_t v38 = swift_retain();
      v37(v38);
      sub_100009C2C((uint64_t)v37);
      return sub_100009CA4(v31, &qword_10007E520);
    }
  }
  if (*(uint64_t *)((char *)v35 + *(void *)(v36 + 104))) {
    return sub_100009CA4(v31, &qword_10007E520);
  }
  uint64_t result = sub_100064B90();
  __break(1u);
  return result;
}

uint64_t sub_100008B28()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  uint64_t v2 = sub_1000644A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_100009C2C(*(void *)(v0 + *(void *)(*(void *)v0 + 104)));
  return v0;
}

uint64_t sub_100008BD0()
{
  sub_100008B28();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ModelPublished()
{
  return sub_100009D00();
}

uint64_t sub_100008C40()
{
  uint64_t v0 = sub_100006DC8(&qword_10007E520);
  uint64_t v1 = __chkstk_darwin(v0);
  uint64_t v22 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v21 - v3;
  uint64_t v5 = sub_1000641E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderURL;
  uint64_t v25 = v0;
  unint64_t v9 = sub_1000098F8();
  unint64_t v26 = v9;
  swift_getKeyPath();
  uint64_t v23 = v0;
  unint64_t v24 = v9;
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100009CA4((uint64_t)v4, &qword_10007E520);
    swift_retain();
    sub_1000099C4(0, 0);
    uint64_t v10 = swift_release();
    __chkstk_darwin(v10);
    uint64_t v11 = sub_100006DC8(&qword_10007EA40);
    *(&v21 - 2) = v11;
    unint64_t v12 = sub_1000097E4();
    *(&v21 - 1) = v12;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v21 - 2) = v11;
    *(&v21 - 1) = v12;
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v14 = v28;
    if (v28) {
      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    BOOL v27 = v14 == 0;
    swift_retain();
    sub_100064490();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v15 = sub_100064170();
    uint64_t v17 = v16;
    swift_retain();
    sub_1000099C4(v15, v17);
    swift_release();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    BOOL v27 = 0;
    swift_retain();
    sub_100064490();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    __chkstk_darwin(result);
    *(&v21 - 2) = v0;
    *(&v21 - 1) = v9;
    uint64_t v19 = swift_getKeyPath();
    __chkstk_darwin(v19);
    *(&v21 - 2) = v0;
    *(&v21 - 1) = v9;
    swift_getKeyPath();
    swift_retain();
    uint64_t v20 = (uint64_t)v22;
    sub_100064480();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    return sub_100009CA4(v20, &qword_10007E520);
  }
  return result;
}

uint64_t sub_10000911C()
{
  uint64_t v0 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006DC8(&qword_10007EA40);
  v13[2] = v3;
  unint64_t v4 = sub_1000097E4();
  v13[3] = v4;
  swift_getKeyPath();
  v13[0] = v3;
  v13[1] = v4;
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v15;
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5)
  {
    __chkstk_darwin(v6);
    v13[-2] = v3;
    v13[-1] = v4;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    v13[-2] = v3;
    v13[-1] = v4;
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v8 = v15;
    swift_bridgeObjectRelease();
    if (v8)
    {
      BOOL v9 = 1;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v10 = sub_1000641E0();
      BOOL v9 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v2, 1, v10) != 1;
      sub_100009CA4((uint64_t)v2, &qword_10007E520);
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  BOOL v14 = v9;
  swift_retain();
  sub_100064490();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  BOOL v11 = v14;
  swift_getKeyPath();
  swift_getKeyPath();
  BOOL v14 = !v11;
  swift_retain();
  return sub_100064490();
}

uint64_t sub_100009474@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100009488()
{
  return sub_100009540();
}

uint64_t sub_10000949C@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000094B0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000952C()
{
  return sub_100009540();
}

uint64_t sub_100009540()
{
  return sub_100064490();
}

uint64_t sub_1000095B0()
{
  return swift_release();
}

uint64_t sub_10000964C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + a3 - 16);
  uint64_t v5 = *(void *)(a4 + a3 - 8);
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  BOOL v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  BOOL v11 = (char *)v14 - v10;
  unint64_t v12 = *(void (**)(char *))(v6 + 16);
  v12((char *)v14 - v10);
  v14[2] = v4;
  v14[3] = v5;
  swift_getKeyPath();
  v14[0] = v4;
  v14[1] = v5;
  swift_getKeyPath();
  ((void (*)(char *, char *, uint64_t))v12)(v9, v11, v4);
  swift_retain();
  sub_100064490();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v4);
}

uint64_t sub_1000097CC()
{
  return 16;
}

__n128 sub_1000097D8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

unint64_t sub_1000097E4()
{
  unint64_t result = qword_10007E140;
  if (!qword_10007E140)
  {
    sub_100006174(&qword_10007EA40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E140);
  }
  return result;
}

uint64_t sub_100009850@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100009878()
{
  return sub_100009540();
}

uint64_t sub_1000098A0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000098C8()
{
  return sub_100009540();
}

unint64_t sub_1000098F8()
{
  unint64_t result = qword_10007EEA0;
  if (!qword_10007EEA0)
  {
    sub_100006174(&qword_10007E520);
    sub_10000996C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EEA0);
  }
  return result;
}

unint64_t sub_10000996C()
{
  unint64_t result = qword_10007E148;
  if (!qword_10007E148)
  {
    sub_1000641E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E148);
  }
  return result;
}

uint64_t sub_1000099C4(uint64_t a1, uint64_t a2)
{
  sub_100006DC8(&qword_10007EA40);
  sub_1000097E4();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t v5 = swift_release();
  char v6 = a2 == 0;
  if (v13)
  {
    if (a2)
    {
      if (v12 == a1 && v13 == a2) {
        char v6 = 1;
      }
      else {
        char v6 = sub_100064C10();
      }
    }
    else
    {
      char v6 = 0;
    }
    uint64_t v5 = swift_bridgeObjectRelease();
  }
  __chkstk_darwin(v5);
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t result = sub_100064490();
  uint64_t v9 = *v2;
  if ((v6 & 1) != 0 || (uint64_t v10 = *(void (**)(uint64_t))((char *)v2 + *(void *)(v9 + 104))) == 0)
  {
    if (!*(uint64_t *)((char *)v2 + *(void *)(v9 + 104)))
    {
      uint64_t result = sub_100064B90();
      __break(1u);
    }
  }
  else
  {
    uint64_t v11 = swift_retain();
    v10(v11);
    return sub_100009C2C((uint64_t)v10);
  }
  return result;
}

uint64_t sub_100009C2C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100009C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009CA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006DC8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009D00()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100009D30()
{
  return sub_100009E6C();
}

uint64_t sub_100009D44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100009DB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();

  return swift_release();
}

uint64_t sub_100009E30()
{
  return sub_100009E6C();
}

uint64_t sub_100009E44()
{
  return sub_100009E6C();
}

uint64_t sub_100009E58()
{
  return sub_100009E6C();
}

uint64_t sub_100009E6C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

void sub_100009ED8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100064380();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v38 - v11;
  if (!a1) {
    goto LABEL_12;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v41 = a1;
  id v13 = a1;
  swift_retain();
  sub_100064490();
  BOOL v14 = (uint64_t *)(v3 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel_accountID);
  if (*(void *)(v3 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel_accountID + 8)) {
    goto LABEL_12;
  }
  uint64_t v38 = v7;
  uint64_t v39 = v6;
  id v40 = v13;
  id v15 = [v40 containerIdentifier];
  uint64_t v16 = sub_1000646E0();
  uint64_t v18 = v17;

  sub_1000646E0();
  uint64_t v19 = sub_100064700();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  if (v16 == v19 && v18 == v21)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_7;
  }
  char v22 = sub_100064C10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_7:
    if (swift_weakLoadStrong())
    {
      uint64_t v23 = sub_10000A2F4();
      uint64_t v25 = v24;
      swift_release();
      if (v25)
      {
        uint64_t *v14 = v23;
        v14[1] = v25;
        swift_bridgeObjectRelease();
        sub_100064360();
        unint64_t v26 = sub_100064370();
        os_log_type_t v27 = sub_100064930();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "found accountID for URL", v28, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v39);
LABEL_12:
        if (!a2) {
          return;
        }
        goto LABEL_13;
      }
      if (a2)
      {

LABEL_13:
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v41 = a2;
        id v29 = a2;
        swift_retain();
        sub_100064490();
        return;
      }
      if (swift_weakLoadStrong())
      {
        uint64_t v30 = sub_100020A04();
        uint64_t v32 = v31;
        swift_release();
        uint64_t v34 = v38;
        uint64_t v33 = v39;
        if (v32)
        {
          uint64_t *v14 = v30;
          v14[1] = v32;
          swift_bridgeObjectRelease();
          sub_100064360();
          v35 = sub_100064370();
          os_log_type_t v36 = sub_100064930();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v37 = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "found accountID for an EDS account", v37, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v33);
        }
        else
        {
        }
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }

  if (a2) {
    goto LABEL_13;
  }
}

uint64_t sub_10000A2F4()
{
  uint64_t v24 = sub_100064380();
  uint64_t v0 = *(void *)(v24 - 8);
  uint64_t v1 = __chkstk_darwin(v24);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v23 - v4;
  uint64_t v6 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000641E0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000EB0C((uint64_t)v8);
    sub_100064360();
    id v13 = sub_100064370();
    os_log_type_t v14 = sub_100064910();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "can't get the user iCloud account ID without a document/folder sharing URL--may get here from SPI with no fileURL, will try userICloudEDSAccountID then fall back on signed-in account w. accountID == nil", v15, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v3, v24);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  uint64_t v16 = sub_100020848((uint64_t)v12);
  if (!v17)
  {
    sub_100064360();
    uint64_t v19 = sub_100064370();
    os_log_type_t v20 = sub_100064910();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "accountID must be non-nil for document/folder sharing", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v5, v24);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return 0;
  }
  uint64_t v18 = v16;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

void sub_10000A6A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100064380();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v39 - v7;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  id v9 = v46;
  if (v46)
  {
    id v10 = [objc_allocWithZone((Class)CKContainer) initWithContainerSetupInfo:v46];
    swift_getKeyPath();
    swift_getKeyPath();
    id v46 = v10;
    swift_retain();
    sub_100064490();

    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  id v11 = v46;
  if (v46)
  {
    if (!*(void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel_accountID + 8))
    {
      id v30 = [objc_allocWithZone((Class)CKContainer) initWithContainerID:v46];
      swift_getKeyPath();
      swift_getKeyPath();
      id v46 = v30;
      swift_retain();
      sub_100064490();

      goto LABEL_16;
    }
    uint64_t v44 = v3;
    id v12 = objc_allocWithZone((Class)CKContainerOptions);
    swift_bridgeObjectRetain();
    id v13 = [v12 init];
    id v45 = v11;
    os_log_type_t v14 = v13;
    id v15 = objc_allocWithZone((Class)CKAccountOverrideInfo);
    NSString v16 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v17 = [v15 initWithAccountID:v16];

    [v14 setAccountOverrideInfo:v17];
    id v18 = objc_allocWithZone((Class)CKContainer);
    id v19 = [v18 initWithContainerID:v45 options:v14];
    swift_getKeyPath();
    swift_getKeyPath();
    id v46 = v19;
    swift_retain();
    sub_100064490();
    sub_100064360();
    swift_retain_n();
    os_log_type_t v20 = sub_100064370();
    int v21 = sub_100064930();
    if (!os_log_type_enabled(v20, (os_log_type_t)v21))
    {

      swift_release_n();
LABEL_15:
      uint64_t v3 = v44;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v2);
      goto LABEL_16;
    }
    int v40 = v21;
    id v41 = v14;
    os_log_t v42 = v20;
    id v43 = v17;
    char v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v48 = v23;
    *(_DWORD *)char v22 = 136315138;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    id v24 = v46;
    v39[1] = v23;
    if (v46
      && (id v25 = [v46 options],
          v24,
          id v24 = [v25 accountOverrideInfo],
          v25,
          v24))
    {
      id v26 = [v24 accountID];

      os_log_type_t v27 = v22;
      if (v26)
      {
        id v24 = (id)sub_1000646E0();
        uint64_t v29 = v28;

LABEL_14:
        id v46 = v24;
        uint64_t v47 = v29;
        sub_100006DC8(&qword_10007EA40);
        uint64_t v31 = sub_1000646F0();
        id v46 = (id)sub_10004BEF0(v31, v32, &v48);
        sub_100064A90();
        swift_release_n();
        swift_bridgeObjectRelease();
        os_log_t v33 = v42;
        _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v40, "replaceContainer container.options.accountOverrideInfo.accountID: %s", v27, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_15;
      }
      id v24 = 0;
    }
    else
    {
      os_log_type_t v27 = v22;
    }
    uint64_t v29 = 0;
    goto LABEL_14;
  }
LABEL_16:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  id v34 = v46;

  if (!v34)
  {
    sub_100064360();
    v35 = sub_100064370();
    uint64_t v36 = sub_100064910();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "replaceContainer throwing as it didn't build a container", v37, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v38 = 0xD000000000000012;
    *(void *)(v38 + 8) = 0x8000000100069180;
    *(_OWORD *)(v38 + 16) = xmmword_100066340;
    *(void *)(v38 + 32) = 0x80000001000691A0;
    *(unsigned char *)(v38 + 40) = 10;
    swift_willThrow();
  }
}

uint64_t sub_10000ADBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006DC8(&qword_10007E2F0);
  uint64_t v107 = *(void *)(v2 - 8);
  uint64_t v108 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v105 = (char *)v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v106 = (char *)v69 - v5;
  uint64_t v101 = sub_100006DC8(&qword_10007E2F8);
  uint64_t v98 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  v95 = (char *)v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100006DC8(&qword_10007ECA0);
  __chkstk_darwin(v102);
  v96 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100006DC8(&qword_10007E300);
  uint64_t v90 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  v89 = (char *)v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100006DC8(&qword_10007E308);
  __chkstk_darwin(v93);
  v92 = (char *)v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100006DC8(&qword_10007E310);
  uint64_t v97 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  v94 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006DC8(&qword_10007E318);
  uint64_t v103 = *(void *)(v11 - 8);
  uint64_t v104 = v11;
  __chkstk_darwin(v11);
  v100 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100006DC8(&qword_10007E320);
  uint64_t v88 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  v87 = (char *)v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_100006DC8(&qword_10007E328);
  uint64_t v86 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  v85 = (char *)v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100006DC8(&qword_10007E330);
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v82 = (char *)v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_100006DC8(&qword_10007E338);
  uint64_t v81 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  v80 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_100006DC8(&qword_10007E340);
  uint64_t v79 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  v78 = (char *)v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_100006DC8(&qword_10007E348);
  uint64_t v76 = *(void *)(v77 - 8);
  __chkstk_darwin(v77);
  v75 = (char *)v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100006DC8(&qword_10007E350);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  v72 = (char *)v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_100006DC8(&qword_10007E520);
  uint64_t v20 = __chkstk_darwin(v71);
  char v22 = (char *)v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  id v24 = (char *)v69 - v23;
  uint64_t v25 = sub_100006DC8(&qword_10007EE80);
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100006DC8((uint64_t *)&unk_10007EF20);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  unint64_t v32 = (char *)v69 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckShare;
  v112 = 0;
  sub_100006DC8((uint64_t *)&unk_10007F4B0);
  sub_100064450();
  id v34 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 32);
  v69[0] = v33;
  v69[1] = v29;
  v34(v33, v32, v29);
  uint64_t v35 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__currentUserIsOwner;
  LOBYTE(v112) = 1;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v35, v28, v25);
  uint64_t v36 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__sharingURL;
  uint64_t v37 = sub_1000641E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v24, 1, 1, v37);
  sub_100009C3C((uint64_t)v24, (uint64_t)v22);
  uint64_t v38 = v72;
  sub_100064450();
  sub_10000EB0C((uint64_t)v24);
  uint64_t v39 = v1;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v36, v38, v74);
  uint64_t v40 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckShareParticipantsCoOwnersState;
  v112 = &off_100079780;
  id v41 = v75;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v40, v41, v77);
  uint64_t v42 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__containerID;
  v112 = 0;
  sub_100006DC8(&qword_10007E1F8);
  id v43 = v78;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v42, v43, v109);
  uint64_t v44 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__containerSetupInfo;
  v112 = 0;
  sub_100006DC8((uint64_t *)&unk_10007F070);
  id v45 = v80;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 32))(v44, v45, v110);
  id v46 = (void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel_accountID);
  *id v46 = 0;
  v46[1] = 0;
  uint64_t v47 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__container;
  v112 = 0;
  sub_100006DC8(&qword_10007E210);
  uint64_t v48 = v82;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v83 + 32))(v47, v48, v84);
  uint64_t v49 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckSystemSharingUIObserver;
  v112 = 0;
  uint64_t v50 = sub_100006DC8((uint64_t *)&unk_10007E220);
  v51 = v85;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v86 + 32))(v49, v51, v111);
  swift_weakInit();
  uint64_t v84 = v50;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100064BA0()) {
    v52 = (void *)sub_10004DD20((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    v52 = &_swiftEmptySetSingleton;
  }
  uint64_t v53 = v70;
  *(void *)(v39 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel_store) = v52;
  swift_beginAccess();
  v54 = v87;
  sub_100064460();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_10000EDB4(&qword_10007E358, &qword_10007E320);
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v54, v53);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v55 = v89;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007E360, &qword_10007E300);
  sub_10000EBD4();
  uint64_t v56 = v91;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v55, v56);
  swift_beginAccess();
  v57 = v95;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4((unint64_t *)&unk_10007F060, &qword_10007E2F8);
  sub_10000EC60();
  uint64_t v58 = v101;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v57, v58);
  sub_10000EDB4(&qword_10007E390, &qword_10007E308);
  sub_10000EDB4(&qword_10007F090, &qword_10007ECA0);
  v59 = v94;
  sub_100064390();
  uint64_t v60 = swift_allocObject();
  swift_weakInit();
  uint64_t v61 = swift_allocObject();
  *(void *)(v61 + 16) = sub_10000ED3C;
  *(void *)(v61 + 24) = v60;
  sub_10000EDB4(&qword_10007E398, &qword_10007E310);
  uint64_t v62 = v99;
  v63 = v100;
  sub_1000644C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v59, v62);
  swift_beginAccess();
  v64 = v106;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007E3A0, &qword_10007E318);
  uint64_t v65 = v104;
  sub_100064510();
  (*(void (**)(char *, uint64_t))(v103 + 8))(v63, v65);
  uint64_t v67 = v107;
  uint64_t v66 = v108;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v105, v64, v108);
  swift_beginAccess();
  sub_100064470();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v64, v66);
  return v39;
}

void sub_10000BE90(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (!v1)
    {
      swift_release();
      return;
    }
    id v2 = v1;
    id v3 = [v2 currentUserParticipant];
    id v4 = [v2 owner];
    id v5 = v4;
    if (v3)
    {
      if (!v4)
      {
LABEL_9:

LABEL_10:
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100064490();
        swift_release();

        return;
      }
      sub_10000EF58(0, (unint64_t *)&qword_10007F1F0);
      id v6 = v3;
      sub_100064A40();
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    id v3 = v5;
    goto LABEL_9;
  }
}

id sub_10000BFF4(id a1, void *a2)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (a2)
    {
      id v4 = &selRef_initWithContainerSetupInfo_;
      a1 = a2;
    }
    else
    {
      if (!a1) {
        goto LABEL_9;
      }
      id v4 = &selRef_initWithContainerID_;
    }
    a1 = objc_msgSend(objc_allocWithZone((Class)CKContainer), *v4, a1);
    if (a1)
    {
      id v5 = objc_allocWithZone((Class)CKSystemSharingUIObserver);
      id v6 = a1;
      a1 = [v5 initWithContainer:v6];
      uint64_t v7 = swift_allocObject();
      swift_weakInit();
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v7;
      *(void *)(v8 + 24) = a2;
      id v9 = a2;
      swift_retain();
      sub_1000649E0();
      swift_release();
      swift_allocObject();
      swift_weakInit();
      swift_retain();
      sub_1000649F0();
      swift_release();
      swift_release();

      return a1;
    }
LABEL_9:
    swift_release();
    return a1;
  }
  return 0;
}

uint64_t sub_10000C1BC(uint64_t a1, void *a2, char a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_100064380();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    swift_errorRetain();
    sub_100064360();
    swift_errorRetain();
    swift_errorRetain();
    char v22 = sub_100064370();
    os_log_type_t v23 = sub_100064910();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)id v24 = 136315138;
      v28[1] = v24 + 4;
      v29[0] = v25;
      uint64_t v30 = (uint64_t)a2;
      swift_errorRetain();
      sub_100006DC8(&qword_10007DF80);
      uint64_t v26 = sub_1000646F0();
      uint64_t v30 = sub_10004BEF0(v26, v27, v29);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_1000071D8(a2, 1);
      sub_1000071D8(a2, 1);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "ckShareModel systemSharingUIDidSaveShareBlock error: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_1000071D8(a2, 1);
    }
    else
    {
      sub_1000071D8(a2, 1);
      sub_1000071D8(a2, 1);
      swift_errorRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    uint64_t v15 = sub_1000648A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    uint64_t v16 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    id v17 = a2;
    swift_release();
    sub_100064870();
    sub_10000EF94(a2, 0);
    id v18 = a5;
    swift_retain();
    uint64_t v19 = sub_100064860();
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = v19;
    v20[3] = &protocol witness table for MainActor;
    v20[4] = v16;
    v20[5] = v17;
    v20[6] = a5;
    swift_release();
    sub_10000F1B0((uint64_t)v14, (uint64_t)&unk_10007E3C8, (uint64_t)v20);
    sub_1000071D8(a2, 0);
    return swift_release();
  }
}

uint64_t sub_10000C5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  uint64_t v7 = sub_100064380();
  v6[13] = v7;
  v6[14] = *(void *)(v7 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v6[18] = swift_task_alloc();
  uint64_t v8 = sub_1000641E0();
  v6[19] = v8;
  v6[20] = *(void *)(v8 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  v6[23] = sub_100064870();
  v6[24] = sub_100064860();
  uint64_t v10 = sub_100064830();
  v6[25] = v10;
  v6[26] = v9;
  return _swift_task_switch(sub_10000C754, v10, v9);
}

uint64_t sub_10000C754()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 216) = Strong;
  if (!Strong) {
    goto LABEL_16;
  }
  uint64_t v2 = swift_weakLoadStrong();
  *(void *)(v0 + 224) = v2;
  if (!v2)
  {
LABEL_15:
    swift_release();
LABEL_16:
    swift_release();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  id v3 = [*(id *)(v0 + 88) recordID];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  id v4 = *(void **)(v0 + 40);
  if (!v4)
  {
    if (!v3) {
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  id v5 = [*(id *)(v0 + 40) recordID];

  if (!v3)
  {
    if (!v5) {
      goto LABEL_20;
    }

LABEL_14:
    swift_release();
    goto LABEL_15;
  }
  if (!v5)
  {
LABEL_11:

    goto LABEL_14;
  }
  sub_10000EF58(0, &qword_10007E3B8);
  id v6 = v3;
  char v7 = sub_100064A40();

  if ((v7 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_20:
  id v10 = [*(id *)(v0 + 88) URL];
  if (!v10)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 160) + 56))(*(void *)(v0 + 144), 1, 1, *(void *)(v0 + 152));
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v0 + 160);
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 152);
  sub_1000641B0();

  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
  v16(v15, v12, v14);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v14);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v14) == 1)
  {
LABEL_26:
    uint64_t v18 = *(void *)(v0 + 144);
    swift_release();
    swift_release();
    swift_release();
    sub_10000EB0C(v18);
    goto LABEL_17;
  }
  v16(*(void *)(v0 + 176), *(void *)(v0 + 144), *(void *)(v0 + 152));
  *(void *)(v0 + 232) = sub_100064860();
  id v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v17;
  *id v17 = v0;
  v17[1] = sub_10000CAEC;
  return sub_100045E18();
}

uint64_t sub_10000CAEC()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100064830();
  if (v0) {
    id v4 = sub_10000D028;
  }
  else {
    id v4 = sub_10000CC48;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_10000CC48()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  return _swift_task_switch(sub_10000CCAC, v1, v2);
}

uint64_t sub_10000CCAC()
{
  sub_100064360();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ckShareModel calling notifyClientShareDidChange()", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[14];

  char v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[32] = v7;
  v0[33] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v5);
  if (swift_unknownObjectWeakLoadStrong()) {
    swift_unknownObjectRelease();
  }
  uint64_t v8 = (void *)swift_task_alloc();
  v0[34] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10000CE10;
  uint64_t v9 = v0[22];
  uint64_t v10 = v0[12];
  return sub_10002F3AC(v9, v10);
}

uint64_t sub_10000CE10()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 208);
  uint64_t v4 = *(void *)(v2 + 200);
  if (v0) {
    uint64_t v5 = sub_10000D37C;
  }
  else {
    uint64_t v5 = sub_10000CF4C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000CF4C()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[20];
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10000D028()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  return _swift_task_switch(sub_10000D08C, v1, v2);
}

uint64_t sub_10000D08C()
{
  os_log_type_t v23 = v0;
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[31];
    uint64_t v19 = v0[19];
    uint64_t v20 = v0[22];
    uint64_t v17 = v0[16];
    uint64_t v18 = v0[20];
    uint64_t v4 = v0[14];
    uint64_t v16 = v0[13];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v22 = v6;
    v0[6] = v3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v7 = sub_1000646F0();
    v0[7] = sub_10004BEF0(v7, v8, &v22);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ckShareModel systemSharingUIDidSaveShareBlock failed to refetch share: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    swift_release();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v21 = v0[22];
    uint64_t v9 = v0[19];
    uint64_t v10 = v0[20];
    uint64_t v11 = v0[16];
    uint64_t v13 = v0[13];
    uint64_t v12 = v0[14];

    swift_release();
    swift_release();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v21, v9);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10000D37C()
{
  os_log_type_t v23 = v0;
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[35];
    uint64_t v20 = v0[22];
    uint64_t v4 = v0[20];
    uint64_t v18 = (void (*)(uint64_t, uint64_t))v0[32];
    uint64_t v19 = v0[19];
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[15];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v22 = v6;
    v0[8] = v3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v7 = sub_1000646F0();
    v0[9] = sub_10004BEF0(v7, v8, &v22);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "ckShareModel systemSharingUIDidSaveShareBlock failed to fetch share metadata: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    swift_release();
    swift_errorRelease();
    v18(v17, v16);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v20, v19);
  }
  else
  {
    uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[32];
    uint64_t v21 = v0[22];
    uint64_t v10 = v0[19];
    uint64_t v11 = v0[20];
    uint64_t v12 = v0[15];
    uint64_t v13 = v0[13];

    swift_release();
    swift_release();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    v9(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v10);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10000D668(void *a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100064380();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v34 - v14;
  if (a3)
  {
    swift_errorRetain();
    sub_100064360();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v22 = sub_100064370();
    os_log_type_t v23 = sub_100064910();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v37 = v9;
      uint64_t v38 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v39 = a2;
      swift_errorRetain();
      sub_100006DC8(&qword_10007DF80);
      uint64_t v26 = sub_1000646F0();
      uint64_t v39 = sub_10004BEF0(v26, v27, (uint64_t *)&v38);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_100007000(a2, 1);
      sub_100007000(a2, 1);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "ckShareModel systemSharingUIDidStopSharingBlock error: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_100007000(a2, 1);
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v37);
    }
    else
    {
      sub_100007000(a2, 1);
      sub_100007000(a2, 1);
      swift_errorRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  else
  {
    sub_100064360();
    uint64_t v16 = a1;
    uint64_t v17 = sub_100064370();
    os_log_type_t v18 = sub_100064930();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v37 = v9;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v36 = v10;
      id v34 = (void *)v20;
      uint64_t v35 = v8;
      *(_DWORD *)uint64_t v19 = 138412290;
      uint64_t v38 = v16;
      uint64_t v21 = v16;
      uint64_t v9 = v37;
      unint64_t v8 = v35;
      sub_100064A90();
      *id v34 = v16;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "ckShareModel systemSharingUIDidStopSharingBlock stopped sharing: %@", v19, 0xCu);
      sub_100006DC8(&qword_10007F1B0);
      swift_arrayDestroy();
      uint64_t v10 = v36;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v17 = v16;
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    uint64_t v29 = sub_1000648A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v8, 1, 1, v29);
    uint64_t v30 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    sub_100064870();
    uint64_t v31 = v16;
    swift_retain();
    uint64_t v32 = sub_100064860();
    uint64_t v33 = (void *)swift_allocObject();
    v33[2] = v32;
    v33[3] = &protocol witness table for MainActor;
    v33[4] = v30;
    v33[5] = v31;
    swift_release();
    sub_10000F1B0((uint64_t)v8, (uint64_t)&unk_10007E3B0, (uint64_t)v33);
    return swift_release();
  }
}

uint64_t sub_10000DBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_100064380();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  sub_100064870();
  v5[11] = sub_100064860();
  uint64_t v8 = sub_100064830();
  return _swift_task_switch(sub_10000DCA8, v8, v7);
}

uint64_t sub_10000DCA8()
{
  swift_release();
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    goto LABEL_12;
  }
  if (!swift_weakLoadStrong())
  {
LABEL_11:
    swift_release();
    goto LABEL_12;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v1 = (void *)v0[5];
  if (!v1) {
    goto LABEL_10;
  }
  id v2 = [v1 recordID];

  if (!v2
    || (uint64_t v3 = (void *)v0[7],
        sub_10000EF58(0, &qword_10007E3B8),
        id v4 = v3,
        char v5 = sub_100064A40(),
        v2,
        v4,
        v4,
        (v5 & 1) == 0))
  {
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  sub_100064360();
  uint64_t v6 = sub_100064370();
  os_log_type_t v7 = sub_100064930();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "ckShareModel systemSharingUIDidStopSharingBlock dismissing", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v10 = v0[9];
  uint64_t v9 = v0[10];
  uint64_t v11 = v0[8];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  swift_release();
  swift_release();
  if (Strong) {
    swift_unknownObjectRelease();
  }
LABEL_12:
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_10000DEF8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckShare;
  uint64_t v2 = sub_100006DC8((uint64_t *)&unk_10007EF20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__currentUserIsOwner;
  uint64_t v4 = sub_100006DC8(&qword_10007EE80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__sharingURL;
  uint64_t v6 = sub_100006DC8(&qword_10007E350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckShareParticipantsCoOwnersState;
  uint64_t v8 = sub_100006DC8(&qword_10007E348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__containerID;
  uint64_t v10 = sub_100006DC8(&qword_10007E340);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__containerSetupInfo;
  uint64_t v12 = sub_100006DC8(&qword_10007E338);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__container;
  uint64_t v14 = sub_100006DC8(&qword_10007E330);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12CKShareModel__ckSystemSharingUIObserver;
  uint64_t v16 = sub_100006DC8(&qword_10007E328);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000E18C()
{
  sub_10000DEF8();

  return swift_deallocClassInstance();
}

uint64_t sub_10000E1E4()
{
  return type metadata accessor for CKShareModel();
}

uint64_t type metadata accessor for CKShareModel()
{
  uint64_t result = qword_10007E1C8;
  if (!qword_10007E1C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000E238()
{
  sub_10000E550(319, &qword_10007E1D8, (uint64_t *)&unk_10007F4B0);
  if (v0 <= 0x3F)
  {
    sub_10000E508(319, &qword_10007E9B0);
    if (v1 <= 0x3F)
    {
      sub_10000E550(319, &qword_10007E1E0, &qword_10007E520);
      if (v2 <= 0x3F)
      {
        sub_10000E508(319, &qword_10007E1E8);
        if (v3 <= 0x3F)
        {
          sub_10000E550(319, &qword_10007E1F0, &qword_10007E1F8);
          if (v4 <= 0x3F)
          {
            sub_10000E550(319, &qword_10007E200, (uint64_t *)&unk_10007F070);
            if (v5 <= 0x3F)
            {
              sub_10000E550(319, &qword_10007E208, &qword_10007E210);
              if (v6 <= 0x3F)
              {
                sub_10000E550(319, &qword_10007E218, (uint64_t *)&unk_10007E220);
                if (v7 <= 0x3F) {
                  swift_updateClassMetadata2();
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_10000E508(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1000644A0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_10000E550(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_100006174(a3);
    unint64_t v4 = sub_1000644A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_10000E5A0(void *a1)
{
  if (!a1 || !swift_weakLoadStrong()) {
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if ([v2 publicPermission] != (id)1) {
    goto LABEL_21;
  }
  p_name = &stru_10007CFF8.name;
  id v4 = [v2 participants];
  sub_10000EF58(0, (unint64_t *)&qword_10007F1F0);
  unint64_t v5 = sub_1000647F0();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100064BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v6)
  {
LABEL_21:
    [v2 publicPermission];
    swift_release();

    return;
  }
  id v7 = [v2 participants];
  unint64_t v8 = sub_1000647F0();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100064BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9)
  {
    if (v9 < 1)
    {
      __break(1u);
      goto LABEL_55;
    }
    id v10 = v2;
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0) {
        id v12 = (id)sub_100064B20();
      }
      else {
        id v12 = *(id *)(v8 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      if ([v12 role] == (id)1 || objc_msgSend(v13, "permission") != (id)2)
      {
      }
      else
      {
        sub_100064B40();
        sub_100064B60();
        sub_100064B70();
        sub_100064B50();
      }
    }
    swift_bridgeObjectRelease();
    id v2 = v10;
    p_name = (char **)(&stru_10007CFF8 + 8);
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
  }
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v14 = _swiftEmptyArrayStorage[2];
    goto LABEL_27;
  }
LABEL_42:
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100064BA0();
  swift_release();
LABEL_27:
  swift_release();
  id v15 = objc_msgSend(v2, p_name[127]);
  unint64_t v16 = sub_1000647F0();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100064BA0();
    swift_bridgeObjectRelease();
    if (v17)
    {
LABEL_29:
      id v22 = v2;
      if (v17 >= 1)
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if ((v16 & 0xC000000000000001) != 0) {
            id v19 = (id)sub_100064B20();
          }
          else {
            id v19 = *(id *)(v16 + 8 * j + 32);
          }
          uint64_t v20 = v19;
          if ([v19 role] == (id)1 || objc_msgSend(v20, "permission") != (id)3)
          {
          }
          else
          {
            sub_100064B40();
            sub_100064B60();
            sub_100064B70();
            sub_100064B50();
          }
        }
        swift_bridgeObjectRelease();
        id v2 = v22;
        goto LABEL_45;
      }
LABEL_55:
      __break(1u);
      return;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRelease();
LABEL_45:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0
    || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_100064BA0();
    swift_release();
  }
  else
  {
    uint64_t v21 = _swiftEmptyArrayStorage[2];
  }
  swift_release();
  if (v14 <= 0 || v21 < 1)
  {
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();

    swift_release();
    swift_release();
  }
}

uint64_t sub_10000EB0C(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E520);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EB94()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000EBCC(void **a1)
{
}

unint64_t sub_10000EBD4()
{
  unint64_t result = qword_10007E368;
  if (!qword_10007E368)
  {
    sub_100006174(&qword_10007E1F8);
    sub_10000ECEC(&qword_10007E370, &qword_10007E378);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E368);
  }
  return result;
}

unint64_t sub_10000EC60()
{
  unint64_t result = qword_10007E380;
  if (!qword_10007E380)
  {
    sub_100006174((uint64_t *)&unk_10007F070);
    sub_10000ECEC(&qword_10007E388, &qword_10007F080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E380);
  }
  return result;
}

uint64_t sub_10000ECEC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000EF58(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_10000ED3C(id a1, void *a2)
{
  return sub_10000BFF4(a1, a2);
}

uint64_t sub_10000ED44()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000ED7C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_10000EDB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006174(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EDF8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EE38(uint64_t a1, void *a2, char a3)
{
  return sub_10000C1BC(a1, a2, a3 & 1, *(void *)(v3 + 16), *(void **)(v3 + 24));
}

uint64_t sub_10000EE44(void *a1, uint64_t a2, char a3)
{
  return sub_10000D668(a1, a2, a3 & 1);
}

uint64_t sub_10000EE50()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000EE98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_10000F1AC;
  return sub_10000DBB4(a1, v4, v5, v7, v6);
}

uint64_t sub_10000EF58(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id sub_10000EF94(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

uint64_t sub_10000EFA0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EFF0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000F0B8;
  return sub_10000C5A0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000F0B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000F1B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000648A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100064890();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100009CA4(a1, &qword_10007F3D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100064830();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000F35C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  id v45 = a2;
  uint64_t v46 = a3;
  uint64_t v14 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v14 - 8);
  uint64_t v44 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100064380();
  uint64_t v42 = *(void *)(v16 - 8);
  uint64_t v43 = v16;
  __chkstk_darwin(v16);
  os_log_type_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  id v19 = a1;
  uint64_t v20 = sub_100064370();
  os_log_type_t v21 = sub_100064930();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = v19;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v40 = a8;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v25 = swift_slowAlloc();
    int v41 = a6;
    uint64_t v37 = (void *)v25;
    uint64_t v38 = a4;
    uint64_t v39 = a5;
    *(_DWORD *)uint64_t v24 = 138412290;
    uint64_t v47 = v19;
    uint64_t v26 = v19;
    a4 = v38;
    a5 = v39;
    sub_100064A90();
    void *v37 = v22;

    id v19 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Begin addToCloudKitSharing share: %@", v24, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    LOBYTE(a6) = v41;
    swift_slowDealloc();
    a8 = v40;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v20 = v19;
  }

  (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v43);
  uint64_t v27 = sub_1000648A0();
  uint64_t v28 = (uint64_t)v44;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v44, 1, 1, v27);
  sub_100064870();
  id v29 = v45;
  id v30 = v45;
  swift_retain();
  uint64_t v31 = v46;
  swift_bridgeObjectRetain();
  uint64_t v32 = v19;
  uint64_t v33 = sub_100064860();
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v33;
  *(void *)(v34 + 24) = &protocol witness table for MainActor;
  *(void *)(v34 + 32) = v32;
  *(void *)(v34 + 40) = v29;
  *(void *)(v34 + 48) = a7;
  *(void *)(v34 + 56) = a8;
  *(void *)(v34 + 64) = v31;
  *(void *)(v34 + 72) = a4;
  *(void *)(v34 + 80) = a5;
  *(unsigned char *)(v34 + 88) = a6 & 1;
  sub_100033164(v28, (uint64_t)&unk_10007E3F8, v34);
  return swift_release();
}

uint64_t sub_10000F6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 59) = v16;
  *(void *)(v8 + 224) = v14;
  *(void *)(v8 + 232) = v15;
  *(void *)(v8 + 208) = a7;
  *(void *)(v8 + 216) = a8;
  *(void *)(v8 + 192) = a5;
  *(void *)(v8 + 200) = a6;
  *(void *)(v8 + 184) = a4;
  uint64_t v9 = sub_100064380();
  *(void *)(v8 + 240) = v9;
  *(void *)(v8 + 248) = *(void *)(v9 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  *(void *)(v8 + 280) = swift_task_alloc();
  sub_100064870();
  *(void *)(v8 + 288) = sub_100064860();
  uint64_t v11 = sub_100064830();
  *(void *)(v8 + 296) = v11;
  *(void *)(v8 + 304) = v10;
  return _swift_task_switch(sub_10000F80C, v11, v10);
}

uint64_t sub_10000F80C()
{
  type metadata accessor for ModelDelegateSPI();
  swift_allocObject();
  v0[39] = sub_100026D14();
  unint64_t v1 = (void *)swift_task_alloc();
  v0[40] = v1;
  void *v1 = v0;
  v1[1] = sub_10000F8CC;
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v4 = v0[24];
  return sub_100025478(v5, v4, v2, v3, 0);
}

uint64_t sub_10000F8CC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 304);
  uint64_t v3 = *(void *)(v1 + 296);
  return _swift_task_switch(sub_10000F9EC, v3, v2);
}

uint64_t sub_10000F9EC()
{
  uint64_t v1 = *(void *)(v0[39] + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel);
  v0[41] = v1;
  if (!v1) {
    return sub_100064B90();
  }
  uint64_t v2 = v0[27];
  uint64_t v3 = (void *)v0[23];
  swift_retain();
  sub_10002C378(v2);
  id v4 = [v3 participants];
  sub_10001A9B8();
  unint64_t v5 = sub_1000647F0();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100064BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v0[42] = v6;
  swift_bridgeObjectRelease();
  v0[43] = *(void *)(v1 + 16);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[44] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10000FBA8;
  return sub_10005FC94();
}

uint64_t sub_10000FBA8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 360) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 296);
    uint64_t v4 = *(void *)(v2 + 304);
    unint64_t v5 = sub_10001145C;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 296);
    uint64_t v4 = *(void *)(v2 + 304);
    unint64_t v5 = sub_10000FCC4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10000FCC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 57) & 1) == 0)
  {
LABEL_5:
    uint64_t v8 = *(void *)(v0 + 280);
    uint64_t v9 = *(void (**)(uint64_t, void, id))(v0 + 200);
    swift_release();
    uint64_t v10 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    sub_1000646E0();
    id v11 = objc_allocWithZone((Class)NSError);
    NSString v12 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v13 = [v11 initWithDomain:v12 code:10 userInfo:0];

    v9(v8, 0, v13);
    swift_release();
    goto LABEL_6;
  }
  if (*(void *)(v0 + 336) == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 58))
    {
      uint64_t v1 = *(void *)(v0 + 328);
      uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10007E400
                                                                                + dword_10007E400);
      uint64_t v2 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v2;
      *uint64_t v2 = v0;
      v2[1] = sub_10001011C;
      uint64_t v3 = *(unsigned __int8 *)(v0 + 59);
      uint64_t v4 = *(void *)(v0 + 224);
      uint64_t v5 = *(void *)(v0 + 232);
      uint64_t v6 = v1;
      uint64_t v7 = 1;
LABEL_11:
      return v24(v6, v4, v5, v3, v7);
    }
    goto LABEL_5;
  }
  id v16 = [*(id *)(v0 + 184) publicPermission];
  uint64_t v17 = *(void *)(v0 + 328);
  if (v16 == (id)1)
  {
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10007E400
                                                                              + dword_10007E400);
    os_log_type_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v18;
    *os_log_type_t v18 = v0;
    v18[1] = sub_100010820;
    uint64_t v3 = *(unsigned __int8 *)(v0 + 59);
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v5 = *(void *)(v0 + 232);
    uint64_t v6 = v17;
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(v0 + 280);
  id v19 = *(void (**)(uint64_t, void, id))(v0 + 200);
  swift_release();
  uint64_t v20 = sub_1000641E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  sub_1000646E0();
  id v21 = objc_allocWithZone((Class)NSError);
  NSString v22 = sub_1000646A0();
  swift_bridgeObjectRelease();
  id v23 = [v21 initWithDomain:v22 code:12 userInfo:0];

  v19(v8, 0, v23);
  swift_release();

LABEL_6:
  swift_release();
  sub_100009CA4(v8, &qword_10007E520);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_10001011C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 296);
    uint64_t v4 = *(void *)(v2 + 304);
    return _swift_task_switch(sub_1000103F4, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v2 + 384) = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_10001028C;
    char v6 = *(unsigned char *)(v2 + 59);
    return sub_10002FB48(v6);
  }
}

uint64_t sub_10001028C()
{
  uint64_t v2 = (void *)*v1;
  v2[49] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[37];
    uint64_t v4 = v2[38];
    return _swift_task_switch(sub_100011894, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v2[54] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_100010F28;
    return sub_1000316F4();
  }
}

uint64_t sub_1000103F4()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[47];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100010820()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 408) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 296);
    uint64_t v4 = *(void *)(v2 + 304);
    return _swift_task_switch(sub_100010AFC, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v2 + 416) = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_100010994;
    char v6 = *(unsigned char *)(v2 + 59);
    uint64_t v7 = *(void *)(v2 + 232);
    return sub_100030A38(v7, v6);
  }
}

uint64_t sub_100010994()
{
  uint64_t v2 = (void *)*v1;
  v2[53] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[37];
    uint64_t v4 = v2[38];
    return _swift_task_switch(sub_100011CC0, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v2[54] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_100010F28;
    return sub_1000316F4();
  }
}

uint64_t sub_100010AFC()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[51];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100010F28()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 304);
  uint64_t v4 = *(void *)(v2 + 296);
  if (v0) {
    uint64_t v5 = sub_1000120EC;
  }
  else {
    uint64_t v5 = sub_100011064;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100011064()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = sub_1000641E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100011140;
  uint64_t v4 = *(void *)(v0 + 272);
  return sub_100032498(v4);
}

uint64_t sub_100011140()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 272);
  *(void *)(*v1 + 456) = v0;
  swift_task_dealloc();
  sub_100009CA4(v3, &qword_10007E520);
  uint64_t v4 = *(void *)(v2 + 304);
  uint64_t v5 = *(void *)(v2 + 296);
  if (v0) {
    uint64_t v6 = sub_100012518;
  }
  else {
    uint64_t v6 = sub_1000112A0;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_1000112A0()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 176);
  if (v1)
  {
    id v2 = [*(id *)(v0 + 176) _copyWithoutPersonalInfo];
  }
  else
  {
    id v2 = 0;
  }
  uint64_t v3 = *(void *)(v0 + 264);
  (*(void (**)(uint64_t, id, void))(v0 + 200))(v3, v2, 0);
  swift_release();
  swift_release();

  sub_100009CA4(v3, &qword_10007E520);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001145C()
{
  os_log_type_t v18 = v0;
  swift_release();
  swift_release();
  v0[20] = v0[45];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100011894()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[49];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100011CC0()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[53];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_1000120EC()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[55];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100012518()
{
  os_log_type_t v18 = v0;
  swift_release();
  v0[20] = v0[57];
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v1 = sub_100064370();
    os_log_type_t v2 = sub_100064910();
    BOOL v3 = os_log_type_enabled(v1, v2);
    uint64_t v5 = v0[31];
    uint64_t v4 = v0[32];
    uint64_t v6 = v0[30];
    if (v3)
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v8 = sub_1000646F0();
      v0[21] = sub_10004BEF0(v8, v9, &v17);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing addToCloudKitSharing: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    }
    uint64_t v11 = v0[35];
    NSString v12 = (void (*)(uint64_t, void, id))v0[25];
    id v13 = sub_10002A254(0xD000000000000014, 0x8000000100069220);
    uint64_t v14 = sub_1000641E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
    id v15 = v13;
    v12(v11, 0, v13);
    swift_release();

    swift_release();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v11, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
  }
  return v10();
}

uint64_t sub_100012944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v50 = a7;
  uint64_t v51 = a4;
  uint64_t v48 = a6;
  uint64_t v49 = a3;
  int v52 = a5;
  uint64_t v47 = a2;
  uint64_t v8 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v8 - 8);
  uint64_t v55 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000641E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v53 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = v13;
  __chkstk_darwin(v12);
  id v15 = (char *)&v40 - v14;
  uint64_t v16 = sub_100064380();
  uint64_t v45 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  os_log_type_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  uint64_t v54 = v11;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v19(v15, a1, v10);
  uint64_t v20 = sub_100064370();
  os_log_type_t v21 = sub_100064930();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v43 = a1;
    id v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v41 = v16;
    uint64_t v57 = v24;
    uint64_t v42 = v19;
    *(_DWORD *)id v23 = 136315138;
    uint64_t v40 = v23 + 4;
    sub_10001ADF4();
    uint64_t v25 = sub_100064BF0();
    uint64_t v56 = sub_10004BEF0(v25, v26, &v57);
    uint64_t v19 = v42;
    sub_100064A90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v10);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Begin startFileSharing fileURL: %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v43;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v41);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v10);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v16);
  }
  uint64_t v44 = v10;
  uint64_t v27 = sub_1000648A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v55, 1, 1, v27);
  v19(v53, a1, v10);
  sub_100064870();
  uint64_t v28 = v50;
  swift_retain();
  uint64_t v29 = v47;
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_100064860();
  uint64_t v31 = v54;
  unint64_t v32 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  unint64_t v33 = (v46 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v34 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = v30;
  *(void *)(v36 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v36 + v32, v53, v44);
  uint64_t v37 = (void *)(v36 + v33);
  void *v37 = v48;
  v37[1] = v28;
  *(void *)(v36 + v34) = v29;
  *(void *)(v36 + v35) = v49;
  unint64_t v38 = v36 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v38 = v51;
  *(unsigned char *)(v38 + 8) = v52 & 1;
  sub_100033164(v55, (uint64_t)&unk_10007E410, v36);
  return swift_release();
}

uint64_t sub_100012E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 60) = v15;
  *(void *)(v8 + 248) = a8;
  *(void *)(v8 + 256) = v14;
  *(void *)(v8 + 232) = a6;
  *(void *)(v8 + 240) = a7;
  *(void *)(v8 + 216) = a4;
  *(void *)(v8 + 224) = a5;
  uint64_t v9 = sub_100064380();
  *(void *)(v8 + 264) = v9;
  *(void *)(v8 + 272) = *(void *)(v9 - 8);
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = swift_task_alloc();
  *(void *)(v8 + 296) = swift_task_alloc();
  *(void *)(v8 + 304) = swift_task_alloc();
  *(void *)(v8 + 312) = sub_100006DC8(&qword_10007E520);
  *(void *)(v8 + 320) = swift_task_alloc();
  *(void *)(v8 + 328) = swift_task_alloc();
  *(void *)(v8 + 336) = swift_task_alloc();
  *(void *)(v8 + 344) = swift_task_alloc();
  sub_100064870();
  *(void *)(v8 + 352) = sub_100064860();
  uint64_t v11 = sub_100064830();
  *(void *)(v8 + 360) = v11;
  *(void *)(v8 + 368) = v10;
  return _swift_task_switch(sub_100012F9C, v11, v10);
}

uint64_t sub_100012F9C()
{
  uint64_t v1 = v0[43];
  uint64_t v2 = v0[27];
  type metadata accessor for ModelDelegateSPI();
  swift_allocObject();
  v0[47] = sub_100026D14();
  uint64_t v3 = sub_1000641E0();
  v0[48] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[49] = v5;
  v0[50] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v2, v3);
  uint64_t v6 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
  v0[51] = v6;
  v0[52] = (v4 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v6(v1, 0, 1, v3);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[53] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100013104;
  uint64_t v8 = v0[43];
  uint64_t v9 = v0[28];
  uint64_t v10 = v0[29];
  return sub_100025AD4(v8, v9, v10);
}

uint64_t sub_100013104(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 344);
  *(void *)(*v1 + 432) = a1;
  swift_task_dealloc();
  sub_100009CA4(v3, &qword_10007E520);
  uint64_t v4 = *(void *)(v2 + 368);
  uint64_t v5 = *(void *)(v2 + 360);
  return _swift_task_switch(sub_100013258, v5, v4);
}

uint64_t sub_100013258()
{
  uint64_t v1 = *(void **)(v0 + 432);
  if (v1)
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 408);
    uint64_t v3 = *(void *)(v0 + 384);
    uint64_t v4 = *(void *)(v0 + 344);
    uint64_t v5 = *(void (**)(uint64_t, void, void *))(v0 + 224);
    id v6 = v1;
    swift_release();
    v2(v4, 1, 1, v3);
    id v7 = v6;
    v5(v4, 0, v1);

    swift_release();
    sub_100009CA4(v4, &qword_10007E520);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 376);
    uint64_t v11 = *(void *)(v10 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel);
    *(void *)(v0 + 440) = v11;
    if (v11)
    {
      uint64_t v12 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 408);
      uint64_t v13 = *(void *)(v0 + 384);
      uint64_t v14 = *(void *)(v0 + 344);
      uint64_t v15 = *(void *)(v0 + 240);
      (*(void (**)(uint64_t, void, uint64_t))(v0 + 392))(v14, *(void *)(v0 + 216), v13);
      v12(v14, 0, 1, v13);
      uint64_t v16 = v10 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_fileOrFolderURL;
      swift_beginAccess();
      swift_retain();
      sub_10001AE4C(v14, v16);
      swift_endAccess();
      sub_10002C378(v15);
      os_log_type_t v18 = (uint64_t (*)(uint64_t))((char *)&dword_10007E418 + dword_10007E418);
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 448) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_100013538;
      return v18(v11);
    }
    else
    {
      return sub_100064B90();
    }
  }
}

uint64_t sub_100013538(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 456) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 360);
    uint64_t v6 = *(void *)(v4 + 368);
    id v7 = sub_100013770;
  }
  else
  {
    *(unsigned char *)(v4 + 61) = a1 & 1;
    uint64_t v5 = *(void *)(v4 + 360);
    uint64_t v6 = *(void *)(v4 + 368);
    id v7 = sub_100013660;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100013660()
{
  if (*(unsigned char *)(v0 + 61))
  {
    *(void *)(v0 + 480) = *(void *)(*(void *)(v0 + 440) + 16);
    swift_retain();
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v1;
    void *v1 = v0;
    v1[1] = sub_100013DC4;
    return sub_10005FC94();
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 464) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_100013BE4;
    return sub_1000332EC();
  }
}

uint64_t sub_100013770()
{
  os_log_type_t v21 = v0;
  uint64_t v1 = v0[57];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100013BE4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 472) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 368);
  uint64_t v4 = *(void *)(v2 + 360);
  if (v0) {
    uint64_t v5 = sub_100015BD4;
  }
  else {
    uint64_t v5 = sub_100013D20;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100013D20()
{
  v0[60] = *(void *)(v0[55] + 16);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[61] = v1;
  void *v1 = v0;
  v1[1] = sub_100013DC4;
  return sub_10005FC94();
}

uint64_t sub_100013DC4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 360);
    uint64_t v4 = *(void *)(v2 + 368);
    uint64_t v5 = sub_100016048;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 360);
    uint64_t v4 = *(void *)(v2 + 368);
    uint64_t v5 = sub_100013EE0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100013EE0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 57))
  {
    uint64_t v1 = *(void *)(v0 + 440);
    if (*(unsigned char *)(v0 + 61))
    {
      uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, char))((char *)&dword_10007E400 + dword_10007E400);
      uint64_t v2 = (void *)swift_task_alloc();
      *(void *)(v0 + 536) = v2;
      *uint64_t v2 = v0;
      v2[1] = sub_100014A38;
      char v3 = *(unsigned char *)(v0 + 60);
      uint64_t v4 = *(void *)(v0 + 248);
      uint64_t v5 = *(void *)(v0 + 256);
      uint64_t v6 = v1;
      char v7 = 0;
LABEL_6:
      return v25(v6, v4, v5, v3, v7);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 59))
    {
      uint64_t v8 = *(void *)(v0 + 440);
      uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, char))((char *)&dword_10007E400 + dword_10007E400);
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 504) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_1000142EC;
      char v3 = *(unsigned char *)(v0 + 60);
      uint64_t v4 = *(void *)(v0 + 248);
      uint64_t v5 = *(void *)(v0 + 256);
      uint64_t v6 = v8;
      char v7 = 1;
      goto LABEL_6;
    }
  }
  swift_release();
  sub_100064360();
  uint64_t v11 = sub_100064370();
  os_log_type_t v12 = sub_100064910();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "currentUser is NOT owner, returning CKError.permissionFailure", v13, 2u);
    swift_slowDealloc();
  }
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 408);
  uint64_t v15 = *(void *)(v0 + 384);
  uint64_t v16 = *(void *)(v0 + 344);
  uint64_t v17 = *(void *)(v0 + 304);
  uint64_t v18 = *(void *)(v0 + 264);
  uint64_t v19 = *(void *)(v0 + 272);
  uint64_t v24 = *(void (**)(uint64_t, void, id))(v0 + 224);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  v14(v16, 1, 1, v15);
  sub_1000646E0();
  id v20 = objc_allocWithZone((Class)NSError);
  NSString v21 = sub_1000646A0();
  swift_bridgeObjectRelease();
  id v22 = [v20 initWithDomain:v21 code:10 userInfo:0];

  v24(v16, 0, v22);
  swift_release();
  swift_release();
  sub_100009CA4(v16, &qword_10007E520);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_1000142EC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 512) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 360);
    uint64_t v4 = *(void *)(v2 + 368);
    return _swift_task_switch(sub_1000145C4, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v2 + 520) = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_10001445C;
    char v6 = *(unsigned char *)(v2 + 60);
    return sub_10002FB48(v6);
  }
}

uint64_t sub_10001445C()
{
  uint64_t v2 = (void *)*v1;
  v2[66] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[45];
    uint64_t v4 = v2[46];
    return _swift_task_switch(sub_1000164C4, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v2[71] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_100015474;
    return sub_1000316F4();
  }
}

uint64_t sub_1000145C4()
{
  NSString v21 = v0;
  uint64_t v1 = v0[64];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    os_log_type_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100014A38()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 544) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 368);
  uint64_t v4 = *(void *)(v2 + 360);
  if (v0) {
    uint64_t v5 = sub_100014E98;
  }
  else {
    uint64_t v5 = sub_100014B74;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100014B74()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  int v1 = *(unsigned __int8 *)(v0 + 58);
  swift_release();
  if (v1 == 2)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 552) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_10001530C;
    char v3 = *(unsigned char *)(v0 + 60);
    uint64_t v4 = *(void *)(v0 + 256);
    return sub_100030A38(v4, v3);
  }
  else
  {
    swift_release();
    sub_100064360();
    uint64_t v6 = sub_100064370();
    os_log_type_t v7 = sub_100064910();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "startFileSharing called on a public share", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 408);
    uint64_t v10 = *(void *)(v0 + 384);
    uint64_t v11 = *(void *)(v0 + 344);
    uint64_t v12 = *(void *)(v0 + 296);
    uint64_t v13 = *(void *)(v0 + 264);
    uint64_t v14 = *(void *)(v0 + 272);
    uint64_t v19 = *(void (**)(uint64_t, void, id))(v0 + 224);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    v9(v11, 1, 1, v10);
    sub_1000646E0();
    id v15 = objc_allocWithZone((Class)NSError);
    NSString v16 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v17 = [v15 initWithDomain:v16 code:12 userInfo:0];

    v19(v11, 0, v17);
    swift_release();
    swift_release();
    sub_100009CA4(v11, &qword_10007E520);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
}

uint64_t sub_100014E98()
{
  NSString v21 = v0;
  uint64_t v1 = v0[68];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    uint64_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    id v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    id v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_10001530C()
{
  uint64_t v2 = (void *)*v1;
  v2[70] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[45];
    uint64_t v4 = v2[46];
    return _swift_task_switch(sub_100016938, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v2[71] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_100015474;
    return sub_1000316F4();
  }
}

uint64_t sub_100015474()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 576) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 368);
  uint64_t v4 = *(void *)(v2 + 360);
  if (v0) {
    uint64_t v5 = sub_100016DAC;
  }
  else {
    uint64_t v5 = sub_1000155B0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000155B0()
{
  uint64_t v1 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 336);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 392))(v3, *(void *)(v0 + 216), v2);
  v1(v3, 0, 1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 584) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10001568C;
  uint64_t v5 = *(void *)(v0 + 336);
  return sub_100032498(v5);
}

uint64_t sub_10001568C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 336);
  *(void *)(*v1 + 592) = v0;
  swift_task_dealloc();
  sub_100009CA4(v3, &qword_10007E520);
  uint64_t v4 = *(void *)(v2 + 368);
  uint64_t v5 = *(void *)(v2 + 360);
  if (v0) {
    uint64_t v6 = sub_100017220;
  }
  else {
    uint64_t v6 = sub_1000157EC;
  }
  return _swift_task_switch(v6, v5, v4);
}

uint64_t sub_1000157EC()
{
  uint64_t v18 = v0;
  swift_release();
  sub_100064360();
  swift_retain_n();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v14 = *(void *)(v0 + 272);
    uint64_t v15 = *(void *)(v0 + 264);
    uint64_t v16 = *(void *)(v0 + 288);
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v4 = sub_1000646F0();
    *(void *)(v0 + 208) = sub_10004BEF0(v4, v5, &v17);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finished startFileSharing shareURL: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 288);
    uint64_t v7 = *(void *)(v0 + 264);
    uint64_t v8 = *(void *)(v0 + 272);

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = *(void **)(v0 + 200);
  if (v9)
  {
    id v10 = [*(id *)(v0 + 200) _copyWithoutPersonalInfo];
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = *(void *)(v0 + 328);
  (*(void (**)(uint64_t, id, void))(v0 + 224))(v11, v10, 0);
  swift_release();
  swift_release();

  sub_100009CA4(v11, &qword_10007E520);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_100015BD4()
{
  NSString v21 = v0;
  uint64_t v1 = v0[59];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100016048()
{
  NSString v21 = v0;
  swift_release();
  uint64_t v1 = v0[62];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_1000164C4()
{
  NSString v21 = v0;
  uint64_t v1 = v0[66];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100016938()
{
  NSString v21 = v0;
  uint64_t v1 = v0[70];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100016DAC()
{
  NSString v21 = v0;
  uint64_t v1 = v0[72];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100017220()
{
  NSString v21 = v0;
  uint64_t v1 = v0[74];
  swift_release();
  v0[23] = v1;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    sub_10001A9F8((uint64_t)(v0 + 14), (uint64_t)(v0 + 2));
    sub_100064360();
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
    os_log_type_t v2 = sub_100064370();
    os_log_type_t v3 = sub_100064910();
    BOOL v4 = os_log_type_enabled(v2, v3);
    uint64_t v6 = v0[34];
    uint64_t v5 = v0[35];
    uint64_t v7 = v0[33];
    if (v4)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_10001A9F8((uint64_t)(v0 + 2), (uint64_t)(v0 + 8));
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AA54);
      uint64_t v9 = sub_1000646F0();
      v0[24] = sub_10004BEF0(v9, v10, &v20);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error finishing startFileSharing: %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    else
    {
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
      sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);

      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    }
    uint64_t v12 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[51];
    uint64_t v13 = v0[48];
    uint64_t v14 = v0[40];
    uint64_t v15 = (void (*)(uint64_t, void, id))v0[28];
    id v16 = sub_10002A254(0xD000000000000010, 0x8000000100069240);
    v12(v14, 1, 1, v13);
    uint64_t v17 = (void *)sub_100064140();
    id v18 = (id)CKXPCSuitableError();

    v15(v14, 0, v18);
    swift_release();
    swift_release();

    sub_10001AAB4((uint64_t)(v0 + 2), (void (*)(void, void, void, void, void, void))sub_10001AAF4);
    sub_100009CA4(v14, &qword_10007E520);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    swift_release();
    swift_release();
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100017694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  uint64_t v8 = sub_100064380();
  v7[14] = v8;
  v7[15] = *(void *)(v8 - 8);
  v7[16] = swift_task_alloc();
  v7[17] = swift_task_alloc();
  sub_100064870();
  v7[18] = sub_100064860();
  uint64_t v10 = sub_100064830();
  v7[19] = v10;
  v7[20] = v9;
  return _swift_task_switch(sub_10001779C, v10, v9);
}

uint64_t sub_10001779C()
{
  type metadata accessor for ModelDelegateSPI();
  swift_allocObject();
  v0[21] = sub_100026D14();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[22] = v1;
  void *v1 = v0;
  v1[1] = sub_10001786C;
  uint64_t v3 = v0[10];
  uint64_t v2 = v0[11];
  return sub_1000267BC(v3, v2, (uint64_t)nullsub_1, 0);
}

uint64_t sub_10001786C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return _swift_task_switch(sub_10001798C, v3, v2);
}

uint64_t sub_10001798C()
{
  uint64_t v1 = *(void *)(v0[21] + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel);
  v0[23] = v1;
  if (!v1) {
    return sub_100064B90();
  }
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[24] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100017AA8;
  return sub_100033D08();
}

uint64_t sub_100017AA8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 160);
  uint64_t v4 = *(void *)(v2 + 152);
  if (v0) {
    uint64_t v5 = sub_100017EEC;
  }
  else {
    uint64_t v5 = sub_100017BE4;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100017BE4()
{
  uint64_t v18 = v0;
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v1 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  sub_100064360();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_100064370();
  os_log_type_t v6 = sub_100064930();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v15 = *(void *)(v0 + 136);
    uint64_t v16 = v4;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 64) = sub_10004BEF0(v2, v1, &v17);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 72) = sub_10004BEF0(v16, v3, &v17);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished user name (%s) & email (%s)", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v16;
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 120);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, void))(v0 + 96))(v2, v1, v4, v3, 0);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_100017EEC()
{
  uint64_t v24 = v0;
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[25];
    uint64_t v4 = v0[15];
    uint64_t v21 = v0[14];
    uint64_t v22 = v0[16];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v23 = v6;
    v0[6] = v3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v7 = sub_1000646F0();
    v0[7] = sub_10004BEF0(v7, v8, &v23);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error finishing userNameAndEmail %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v22, v21);
  }
  else
  {
    uint64_t v10 = v0[15];
    uint64_t v9 = v0[16];
    uint64_t v11 = v0[14];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  uint64_t v12 = (void (*)(void, void, void, void, id))v0[12];
  sub_1000646E0();
  id v13 = objc_allocWithZone((Class)NSError);
  NSString v14 = sub_1000646A0();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithDomain:v14 code:12 userInfo:0];

  id v16 = v15;
  uint64_t v17 = (void *)sub_100064140();

  id v18 = (id)CKXPCSuitableError();
  v12(0, 0, 0, 0, v18);
  swift_release();
  swift_release();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

double sub_100018200@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100018288()
{
  return sub_100064490();
}

uint64_t sub_100018324(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100018400;
  return v6(a1);
}

uint64_t sub_100018400()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000184F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  *(unsigned char *)(v5 + 113) = a5;
  *(unsigned char *)(v5 + 112) = a4;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 16) = a1;
  sub_100064870();
  *(void *)(v5 + 40) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v5 + 48) = v7;
  *(void *)(v5 + 56) = v6;
  return _swift_task_switch(sub_10001859C, v7, v6);
}

uint64_t sub_10001859C()
{
  uint64_t v1 = v0[3];
  v0[8] = *(void *)(v0[2] + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[9] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100018660;
  uint64_t v3 = v0[2];
  if (v1 == 1) {
    char v4 = 2;
  }
  else {
    char v4 = 1;
  }
  return sub_10006049C(v4, v3, 0);
}

uint64_t sub_100018660()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_100018A0C;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_10001877C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10001877C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  *(void *)(v0 + 88) = *(void *)(*(void *)(v0 + 16) + 16);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100018848;
  char v3 = *(unsigned char *)(v0 + 113);
  uint64_t v4 = *(void *)(v0 + 16);
  if (v1 == 3) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  return sub_100060F3C(v5, v4, 0, v3);
}

uint64_t sub_100018848()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    char v5 = sub_100018A7C;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    char v5 = sub_100018964;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100018964()
{
  int v1 = *(unsigned __int8 *)(v0 + 112);
  swift_release();
  if (v1) {
    uint64_t v2 = &off_1000797D0;
  }
  else {
    uint64_t v2 = &off_1000797F8;
  }
  swift_retain();
  sub_100061A08((uint64_t)v2);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100018A0C()
{
  swift_release();
  swift_release();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100018A7C()
{
  swift_release();
  swift_release();
  int v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100018AEC(uint64_t a1)
{
  v1[18] = a1;
  sub_100006DC8(&qword_10007E520);
  v1[19] = swift_task_alloc();
  uint64_t v2 = sub_1000641E0();
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  uint64_t v3 = sub_100064380();
  v1[23] = v3;
  v1[24] = *(void *)(v3 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  sub_100064870();
  v1[30] = sub_100064860();
  uint64_t v5 = sub_100064830();
  v1[31] = v5;
  v1[32] = v4;
  return _swift_task_switch(sub_100018CA0, v5, v4);
}

uint64_t sub_100018CA0()
{
  sub_100064360();
  int v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "running fetchShareAndToleratePreshareErrors() for AddParticipants", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[29];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[24];
  uint64_t v7 = v0[20];
  uint64_t v8 = v0[21];
  uint64_t v9 = v0[19];

  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[33] = v10;
  v0[34] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v4, v5);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
  {
    sub_100009CA4(v0[19], &qword_10007E520);
    char v11 = 0;
  }
  else
  {
    uint64_t v13 = v0[21];
    uint64_t v12 = v0[22];
    uint64_t v14 = v0[20];
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 32))(v12, v0[19], v14);
    int v15 = shareStatus(url:)();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    char v11 = (v15 & 0x10001) == 1;
  }
  id v16 = (void *)swift_task_alloc();
  v0[35] = v16;
  *id v16 = v0;
  v16[1] = sub_100018ED0;
  uint64_t v17 = v0[18];
  return sub_100034D34(60, v17, v11);
}

uint64_t sub_100018ED0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 288) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  uint64_t v4 = *(void *)(v2 + 248);
  if (v0) {
    uint64_t v5 = sub_1000190D4;
  }
  else {
    uint64_t v5 = sub_10001900C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10001900C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v1 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v2 = *(void *)(v0 + 288) == 0;
  return v1(v2);
}

uint64_t sub_1000190D4()
{
  uint64_t v69 = v0;
  *(void *)(v0 + 128) = *(void *)(v0 + 288);
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (!swift_dynamicCast())
  {
    swift_release();
    swift_errorRelease();
    sub_100064360();
    swift_errorRetain();
    swift_errorRetain();
    char v11 = sub_100064370();
    os_log_type_t v12 = sub_100064910();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void *)(v0 + 288);
    int v15 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v16 = *(void *)(v0 + 200);
    uint64_t v17 = *(void *)(v0 + 184);
    if (v13)
    {
      uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
      id v18 = (uint8_t *)swift_slowAlloc();
      v68[0] = swift_slowAlloc();
      *(_DWORD *)id v18 = 136315138;
      *(void *)(v0 + 112) = v14;
      swift_errorRetain();
      uint64_t v19 = sub_1000646F0();
      *(void *)(v0 + 120) = sub_10004BEF0(v19, v20, v68);
      sub_100064A90();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "fetchShareAndToleratePreshareErrors unknown non-SharingError error: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v65(v16, v17);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v15(v16, v17);
    }
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v27 = 0xD00000000000002BLL;
    *(void *)(v27 + 8) = 0x8000000100069260;
    *(_OWORD *)(v27 + 16) = xmmword_100066630;
    *(void *)(v27 + 32) = 0x8000000100069290;
    *(unsigned char *)(v27 + 40) = 11;
    swift_willThrow();
    goto LABEL_14;
  }
  uint64_t result = swift_errorRelease();
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  *(void *)(v0 + 296) = v3;
  *(void *)(v0 + 304) = v2;
  uint64_t v4 = *(void **)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  *(void *)(v0 + 312) = v4;
  *(void *)(v0 + 320) = v5;
  uint64_t v6 = *(void *)(v0 + 96);
  *(void *)(v0 + 328) = v6;
  int v7 = *(unsigned __int8 *)(v0 + 104);
  if (v7 != 5)
  {
    swift_release();
    sub_100064360();
    sub_10001AA54(v3, v2, v4, v5, v6, v7);
    sub_10001AA54(v3, v2, v4, v5, v6, v7);
    uint64_t v21 = sub_100064370();
    os_log_type_t type = sub_100064910();
    BOOL v22 = os_log_type_enabled(v21, type);
    uint64_t v63 = *(void *)(v0 + 208);
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    uint64_t v62 = *(void *)(v0 + 184);
    if (v22)
    {
      uint64_t v60 = v21;
      uint64_t v23 = v3;
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      v68[0] = swift_slowAlloc();
      v59 = v24;
      *(_DWORD *)uint64_t v24 = 136315138;
      *(void *)(v0 + 16) = v23;
      *(void *)(v0 + 24) = v2;
      *(void *)(v0 + 32) = v4;
      *(void *)(v0 + 40) = v5;
      *(void *)(v0 + 48) = v6;
      *(unsigned char *)(v0 + 56) = v7;
      sub_10001AA54(v23, v2, v4, v5, v6, v7);
      uint64_t v25 = sub_1000646F0();
      *(void *)(v0 + 136) = sub_10004BEF0(v25, v26, v68);
      sub_100064A90();
      uint64_t v3 = v23;
      swift_bridgeObjectRelease();
      sub_10001AAF4(v23, v2, v4, v5, v6, v7);
      sub_10001AAF4(v23, v2, v4, v5, v6, v7);
      _os_log_impl((void *)&_mh_execute_header, v60, type, "fetchShareAndToleratePreshareErrors unexpected SharingError: %s", v59, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v66(v63, v62);
    }
    else
    {
      sub_10001AAF4(v3, v2, v4, v5, v6, v7);
      sub_10001AAF4(v3, v2, v4, v5, v6, v7);

      v66(v63, v62);
    }
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v28 = v3;
    *(void *)(v28 + 8) = v2;
    *(void *)(v28 + 16) = v4;
    *(void *)(v28 + 24) = v5;
    *(void *)(v28 + 32) = v6;
    *(unsigned char *)(v28 + 40) = v7;
    swift_willThrow();
    goto LABEL_14;
  }
  if (!v4)
  {
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  id v8 = v4;
  swift_bridgeObjectRetain();
  if (sub_10002AB30(3))
  {
    swift_release();
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v9 = v3;
    *(void *)(v9 + 8) = v2;
    *(void *)(v9 + 16) = v4;
    *(void *)(v9 + 24) = v5;
    *(void *)(v9 + 32) = v6;
    *(unsigned char *)(v9 + 40) = 5;
    swift_bridgeObjectRetain();
    id v10 = v8;
    swift_bridgeObjectRetain();
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001AAF4(v3, v2, v4, v5, v6, 5u);
LABEL_14:
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(BOOL))(v0 + 8);
    BOOL v30 = 0;
LABEL_15:
    return v29(v30);
  }
  uint64_t v64 = v6;
  uint64_t v67 = v4;
  id v31 = v8;
  id v32 = [v31 domain];
  uint64_t v33 = sub_1000646E0();
  uint64_t v35 = v34;

  uint64_t v58 = v3;
  if (v33 == sub_1000646E0() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    id v38 = [v31 code];

    BOOL v39 = v38 == (id)20;
    goto LABEL_24;
  }
  char v37 = sub_100064C10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_22;
  }

  BOOL v39 = 0;
LABEL_24:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 57) != 3)
  {
    if (v39) {
      char v40 = 1;
    }
    else {
      char v40 = 2;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 58) = v40;
    swift_retain();
    sub_100064490();
  }
  if (v39)
  {
    BOOL v41 = 0;
    uint64_t v42 = v64;
  }
  else
  {
    id v43 = v31;
    id v44 = [v43 domain];
    uint64_t v45 = sub_1000646E0();
    uint64_t v47 = v46;

    uint64_t v42 = v64;
    if (v45 == sub_1000646E0() && v47 == v48)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v49 = sub_100064C10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v49 & 1) == 0)
      {

        BOOL v41 = 1;
        goto LABEL_37;
      }
    }
    id v50 = [v43 code];

    BOOL v41 = v50 != (id)7;
  }
LABEL_37:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 59) & v39) != 1 || v41)
  {
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001AAF4(v58, v2, v67, v5, v42, 5u);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(BOOL))(v0 + 8);
    BOOL v30 = *(void *)(v0 + 288) == 0;
    goto LABEL_15;
  }
  sub_100064360();
  uint64_t v51 = sub_100064370();
  os_log_type_t v52 = sub_100064930();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v53 = 0;
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "starting folder sharing prep", v53, 2u);
    swift_slowDealloc();
  }
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v55 = *(void *)(v0 + 224);
  uint64_t v56 = *(void *)(v0 + 184);

  v54(v55, v56);
  uint64_t v57 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v57;
  void *v57 = v0;
  v57[1] = sub_100019BF4;
  return sub_100035FF0(0);
}

uint64_t sub_100019BF4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 344) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  uint64_t v4 = *(void *)(v2 + 248);
  if (v0) {
    uint64_t v5 = sub_100019F0C;
  }
  else {
    uint64_t v5 = sub_100019D30;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100019D30()
{
  swift_release();
  sub_100064360();
  int v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v5 = *(void *)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 328);
  uint64_t v7 = *(void *)(v0 + 304);
  uint64_t v6 = *(void **)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 296);
  if (v3)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "successfully completed folder sharing prep", v9, 2u);
    swift_slowDealloc();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_10001AAF4(v8, v7, v6, v5, v4, 5u);
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001AAF4(v8, v7, v6, v5, v4, 5u);
  }
  (*(void (**)(void, void))(v0 + 264))(*(void *)(v0 + 216), *(void *)(v0 + 184));
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = *(uint64_t (**)(BOOL))(v0 + 8);
  BOOL v11 = *(void *)(v0 + 288) == 0;
  return v10(v11);
}

uint64_t sub_100019F0C()
{
  uint64_t v1 = v0[40];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[38];
  BOOL v3 = (void *)v0[39];
  uint64_t v5 = v0[37];
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10001AAF4(v5, v4, v3, v1, v2, 5u);
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6(0);
}

uint64_t sub_10001A01C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v44 = a2;
  uint64_t v45 = a4;
  uint64_t v6 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v6 - 8);
  id v43 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  BOOL v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v14 = sub_100064380();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  sub_100009C3C(a1, (uint64_t)v13);
  id v18 = sub_100064370();
  os_log_type_t v19 = sub_100064930();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v40 = a3;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v39 = a1;
    uint64_t v47 = v22;
    uint64_t v38 = v14;
    *(_DWORD *)uint64_t v21 = 136315138;
    v37[1] = v21 + 4;
    sub_100009C3C((uint64_t)v13, (uint64_t)v11);
    uint64_t v23 = sub_1000646F0();
    uint64_t v46 = sub_10004BEF0(v23, v24, &v47);
    sub_100064A90();
    swift_bridgeObjectRelease();
    sub_100009CA4((uint64_t)v13, &qword_10007E520);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Begin userNameAndEmail fileURL: %s", v21, 0xCu);
    swift_arrayDestroy();
    a1 = v39;
    swift_slowDealloc();
    a3 = v40;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v38);
  }
  else
  {
    sub_100009CA4((uint64_t)v13, &qword_10007E520);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  uint64_t v25 = (uint64_t)v43;
  sub_100064880();
  uint64_t v26 = sub_1000648A0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  sub_100009C3C(a1, (uint64_t)v11);
  sub_100064870();
  id v27 = v44;
  id v28 = v44;
  uint64_t v29 = v45;
  swift_retain();
  uint64_t v30 = sub_100064860();
  unint64_t v31 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v32 = (uint64_t)v11;
  unint64_t v33 = (v42 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v30;
  *(void *)(v34 + 24) = &protocol witness table for MainActor;
  sub_10001A5B8(v32, v34 + v31);
  *(void *)(v34 + v33) = v27;
  uint64_t v35 = (void *)(v34 + ((v33 + 15) & 0xFFFFFFFFFFFFFFF8));
  void *v35 = a3;
  v35[1] = v29;
  sub_10000F1B0(v25, (uint64_t)&unk_10007E3D8, v34);
  return swift_release();
}

uint64_t sub_10001A460()
{
  uint64_t v1 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = sub_1000641E0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_release();

  return _swift_deallocObject(v0, v8 + 16, v2 | 7);
}

uint64_t sub_10001A5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A620(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = *(void *)(v1 + v6);
  uint64_t v10 = v1 + v5;
  BOOL v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  void *v14 = v2;
  v14[1] = sub_10000F0B8;
  return sub_100017694(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t sub_10001A768()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001A7A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10000F1AC;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10007E3E0 + dword_10007E3E0);
  return v6(a1, v4);
}

uint64_t sub_10001A860()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 89, 7);
}

uint64_t sub_10001A8B8(uint64_t a1)
{
  uint64_t v13 = v1[2];
  uint64_t v4 = v1[4];
  uint64_t v11 = v1[3];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[7];
  uint64_t v8 = v1[8];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000F0B8;
  return sub_10000F6B0(a1, v13, v11, v4, v5, v6, v7, v8);
}

unint64_t sub_10001A9B8()
{
  unint64_t result = qword_10007F1F0;
  if (!qword_10007F1F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007F1F0);
  }
  return result;
}

uint64_t sub_10001A9F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10001AA54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0xDu)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = a3;
  }
}

uint64_t sub_10001AAB4(uint64_t a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10001AAF4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0xDu)
  {
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001AB68()
{
  uint64_t v1 = sub_1000641E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 9;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001AC74(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1000641E0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v4;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *(void *)(v1 + v5);
  uint64_t v13 = *(void *)(v1 + v5 + 8);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  void *v14 = v2;
  v14[1] = sub_10000F1AC;
  return sub_100012E0C(a1, v7, v8, v9, v12, v13, v10, v11);
}

unint64_t sub_10001ADF4()
{
  unint64_t result = qword_10007E540;
  if (!qword_10007E540)
  {
    sub_1000641E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E540);
  }
  return result;
}

uint64_t sub_10001AE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for TriStateBool()
{
  return &type metadata for TriStateBool;
}

BOOL sub_10001AEE4(BOOL *a1, uint64_t *a2)
{
  return sub_10001AEF0(*a1, *a2);
}

BOOL sub_10001AEF0(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (!v2)
  {
    __break(1u);
    goto LABEL_23;
  }
  int v3 = *(unsigned __int8 *)(result + 32);
  if (v3 == 1)
  {
    if (v2 == 1)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (*(unsigned char *)(result + 33) == 1)
    {
      uint64_t v4 = 0;
      goto LABEL_11;
    }
    int v5 = 0;
  }
  else
  {
    if (v2 == 1)
    {
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    int v5 = *(unsigned __int8 *)(result + 33);
  }
  BOOL v6 = v3 == v5;
  uint64_t v4 = 1;
  if (!v6) {
    uint64_t v4 = 2;
  }
LABEL_11:
  uint64_t v7 = *(void *)(a2 + 16);
  if (!v7)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int v8 = *(unsigned __int8 *)(a2 + 32);
  if ((v8 & 1) == 0)
  {
    if (v7 != 1)
    {
      int v10 = *(unsigned __int8 *)(a2 + 33);
      goto LABEL_19;
    }
    goto LABEL_25;
  }
  if (v7 != 1)
  {
    if (*(unsigned char *)(a2 + 33) == 1)
    {
      uint64_t v9 = 0;
      return v4 == v9;
    }
    int v10 = 0;
LABEL_19:
    BOOL v6 = v8 == v10;
    uint64_t v9 = 1;
    if (!v6) {
      uint64_t v9 = 2;
    }
    return v4 == v9;
  }
LABEL_27:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for CloudDocsOperations()
{
  return &type metadata for CloudDocsOperations;
}

void sub_10001AFC8()
{
  id v0 = [objc_allocWithZone((Class)NSOperationQueue) init];
  [v0 setQualityOfService:25];
  NSString v1 = sub_1000646A0();
  [v0 setName:v1];

  qword_10007E420 = (uint64_t)v0;
}

uint64_t sub_10001B050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  return _swift_task_switch(sub_10001B074, 0, 0);
}

uint64_t sub_10001B074()
{
  NSString v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 40), *(int8x16_t *)(v0 + 40), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = sub_100006DC8(&qword_10007E4D8);
  *uint64_t v2 = v0;
  v2[1] = sub_10001B17C;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD00000000000002BLL, 0x8000000100069450, sub_100021100, v1, v3);
}

uint64_t sub_10001B17C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001B294, 0, 0);
}

uint64_t sub_10001B294()
{
  *(_OWORD *)*(void *)(v0 + 32) = *(_OWORD *)(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001B2B8(uint64_t a1, uint64_t a2)
{
  v2[93] = a2;
  v2[87] = a1;
  v2[94] = sub_100006DC8(&qword_10007E498);
  v2[95] = swift_task_alloc();
  v2[96] = swift_task_alloc();
  return _swift_task_switch(sub_10001B364, 0, 0);
}

uint64_t sub_10001B364()
{
  uint64_t v1 = *(void *)(v0 + 752);
  uint64_t v2 = *(void *)(v0 + 744);
  *(_DWORD *)(v0 + 800) = *(_DWORD *)(v1 + 48);
  *(_DWORD *)(v0 + 804) = *(_DWORD *)(v1 + 64);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 776) = v3;
  *(void *)(v3 + 16) = v2;
  swift_asyncLet_begin();
  uint64_t v4 = *(void *)(v0 + 768);
  return _swift_asyncLet_get(v0 + 16, v4, sub_10001B438, v0 + 656);
}

uint64_t sub_10001B438()
{
  return _swift_task_switch(sub_10001B454, 0, 0);
}

uint64_t sub_10001B454()
{
  uint64_t v1 = *(int *)(v0 + 804);
  uint64_t v2 = *(void ***)(v0 + 768);
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = (uint64_t)v2 + *(int *)(v0 + 800);
  uint64_t v5 = *(void *)(v0 + 760) + *(int *)(*(void *)(v0 + 752) + 48);
  uint64_t v6 = *v2;
  *(void *)(v0 + 784) = *v2;
  sub_100020E94(v4, v5, &qword_10007E520);
  uint64_t v7 = *(void **)((char *)v2 + v1);
  *(void *)(v0 + 792) = v7;
  sub_10001A5B8(v5, v3);
  id v8 = v7;
  id v9 = v6;
  uint64_t v10 = *(void *)(v0 + 768);
  return _swift_asyncLet_finish(v0 + 16, v10, sub_10001B530, v0 + 704);
}

uint64_t sub_10001B530()
{
  return _swift_task_switch(sub_10001B54C, 0, 0);
}

uint64_t sub_10001B54C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v2 = v0[99];
  uint64_t v3 = v0[98];
  return v1(v3, v2);
}

uint64_t sub_10001B5CC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v3 = sub_100006DC8(&qword_10007E498);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = swift_task_alloc();
  *(_DWORD *)(v2 + 64) = *(_DWORD *)(v3 + 48);
  *(_DWORD *)(v2 + 68) = *(_DWORD *)(v3 + 64);
  return _swift_task_switch(sub_10001B67C, 0, 0);
}

uint64_t sub_10001B67C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[6] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001B764;
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  return withCheckedContinuation<A>(isolation:function:_:)(v4, 0, 0, 0xD000000000000026, 0x8000000100069390, sub_100020EF8, v2, v5);
}

uint64_t sub_10001B764()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001B87C, 0, 0);
}

uint64_t sub_10001B87C()
{
  uint64_t v1 = *(int *)(v0 + 68);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(uint64_t **)(v0 + 40);
  uint64_t v4 = *(void **)(v0 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(uint64_t *)((char *)v3 + *(int *)(v2 + 64));
  sub_10001A5B8((uint64_t)v3 + *(int *)(v2 + 48), (uint64_t)v4 + *(int *)(v0 + 64));
  *uint64_t v4 = v5;
  *(void *)((char *)v4 + v1) = v6;
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_10001B920(uint64_t a1, uint64_t a2)
{
  v2[101] = a2;
  v2[95] = a1;
  uint64_t v3 = sub_1000641E0();
  v2[107] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[108] = v4;
  v2[109] = *(void *)(v4 + 64);
  v2[110] = swift_task_alloc();
  return _swift_task_switch(sub_10001B9EC, 0, 0);
}

uint64_t sub_10001B9EC()
{
  uint64_t v1 = v0[110];
  uint64_t v2 = v0[108];
  uint64_t v3 = v0[107];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v1, v0[101], v3);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  v0[111] = v5;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v5 + v4, v1, v3);
  swift_retain();
  sub_100006174(&qword_10007E480);
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 2, v0 + 87, sub_10001BB28, v0 + 82);
}

uint64_t sub_10001BB28()
{
  return _swift_task_switch(sub_10001BB44, 0, 0);
}

uint64_t sub_10001BB44()
{
  uint64_t v1 = (void *)v0[87];
  uint64_t v2 = v0[88];
  uint64_t v3 = v0[89];
  uint64_t v4 = v0[90];
  v0[112] = v4;
  uint64_t v5 = v0[91];
  v0[113] = v5;
  uint64_t v6 = (void *)v0[94];
  v0[114] = v6;
  if (v6 || !v1)
  {
    id v9 = v6;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10001BDCC;
    uint64_t v11 = v0 + 2;
    uint64_t v12 = v0 + 87;
    uint64_t v13 = v0 + 96;
    goto LABEL_11;
  }
  if (v3)
  {
    if (v5)
    {
      id v7 = v1;
      swift_bridgeObjectRetain_n();
      id v8 = v7;
      swift_bridgeObjectRetain();
      v21._object = (void *)0x8000000100068E60;
      v21._countAndFlagsBits = 0xD000000000000017;
      LOBYTE(v7) = sub_1000647A0(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v7)
      {
        uint64_t v4 = v2;
        uint64_t v5 = v3;
      }
      goto LABEL_10;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  id v14 = v1;
LABEL_10:
  v0[116] = v5;
  v0[115] = v4;
  id v15 = [self localizedStringFromPersonNameComponents:v1 style:2 options:0];
  uint64_t v16 = sub_1000646E0();
  uint64_t v18 = v17;

  v0[117] = v16;
  v0[118] = v18;
  uint64_t v10 = sub_10001BD0C;
  uint64_t v11 = v0 + 2;
  uint64_t v12 = v0 + 87;
  uint64_t v13 = v0 + 102;
LABEL_11:
  return _swift_asyncLet_finish(v11, v12, v10, v13);
}

uint64_t sub_10001BD0C()
{
  return _swift_task_switch(sub_10001BD28, 0, 0);
}

uint64_t sub_10001BD28()
{
  long long v5 = *(_OWORD *)(v0 + 920);
  long long v6 = *(_OWORD *)(v0 + 936);
  uint64_t v1 = *(void *)(v0 + 912);
  uint64_t v2 = *(void *)(v0 + 760);
  swift_release_n();
  swift_task_dealloc();
  *(_OWORD *)uint64_t v2 = v6;
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001BDCC()
{
  return _swift_task_switch(sub_10001BDE8, 0, 0);
}

uint64_t sub_10001BDE8()
{
  long long v5 = *(_OWORD *)(v0 + 896);
  uint64_t v1 = *(void *)(v0 + 912);
  uint64_t v2 = *(void *)(v0 + 760);
  swift_release_n();
  swift_task_dealloc();
  *(void *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001BE80(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return _swift_task_switch(sub_10001BEA0, 0, 0);
}

uint64_t sub_10001BEA0()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = swift_task_alloc();
  v0[12] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[13] = v3;
  uint64_t v4 = sub_100006DC8(&qword_10007E480);
  *uint64_t v3 = v0;
  v3[1] = sub_10001BFA4;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000003ALL, 0x80000001000692F0, sub_100020CB0, v2, v4);
}

uint64_t sub_10001BFA4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C0BC, 0, 0);
}

uint64_t sub_10001C0BC()
{
  uint64_t v1 = *(_OWORD **)(v0 + 80);
  long long v2 = *(_OWORD *)(v0 + 32);
  long long v3 = *(_OWORD *)(v0 + 48);
  long long v4 = *(_OWORD *)(v0 + 64);
  _OWORD *v1 = *(_OWORD *)(v0 + 16);
  v1[1] = v2;
  v1[2] = v3;
  v1[3] = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C0E8(uint64_t a1)
{
  *(void *)(v1 + 728) = a1;
  return _swift_task_switch(sub_10001C108, 0, 0);
}

uint64_t sub_10001C108()
{
  sub_100006174(&qword_10007E440);
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 16, v0 + 696, sub_10001C1B8, v0 + 656);
}

uint64_t sub_10001C1B8()
{
  return _swift_task_switch(sub_10001C1D4, 0, 0);
}

uint64_t sub_10001C1D4()
{
  uint64_t v1 = (void *)v0[87];
  v0[92] = v0[88];
  v0[93] = v0[89];
  uint64_t v2 = (void *)v0[90];
  v0[94] = v2;
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (v3)
  {
    id v4 = v2;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_10001C360;
  }
  else
  {
    long long v5 = self;
    swift_bridgeObjectRetain();
    id v6 = v1;
    id v7 = [v5 localizedStringFromPersonNameComponents:v6 style:2 options:0];
    uint64_t v8 = sub_1000646E0();
    uint64_t v10 = v9;

    v0[95] = v8;
    v0[96] = v10;
    uint64_t v11 = sub_10001C310;
  }
  return _swift_asyncLet_finish(v0 + 2, v0 + 87, v11, v0 + 82);
}

uint64_t sub_10001C310()
{
  return _swift_task_switch(sub_10001C32C, 0, 0);
}

uint64_t sub_10001C32C()
{
  uint64_t v1 = *(void *)(v0 + 768);
  uint64_t v2 = *(void *)(v0 + 752);
  uint64_t v3 = *(void *)(v0 + 728);
  long long v4 = *(_OWORD *)(v0 + 736);
  *(void *)uint64_t v3 = *(void *)(v0 + 760);
  *(void *)(v3 + 8) = v1;
  *(_OWORD *)(v3 + 16) = v4;
  *(void *)(v3 + 32) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C360()
{
  return _swift_task_switch(sub_10001C37C, 0, 0);
}

uint64_t sub_10001C37C()
{
  uint64_t v1 = *(void *)(v0 + 752);
  uint64_t v2 = *(void *)(v0 + 728);
  long long v3 = *(_OWORD *)(v0 + 736);
  *(void *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  *(_OWORD *)(v2 + 16) = v3;
  *(void *)(v2 + 32) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C3A8(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v2;
  uint64_t v3 = sub_100006DC8(&qword_10007E448);
  *uint64_t v2 = v1;
  v2[1] = sub_10001C490;
  return withCheckedContinuation<A>(isolation:function:_:)(v1 + 16, 0, 0, 0xD000000000000030, 0x80000001000692B0, sub_10001F964, 0, v3);
}

uint64_t sub_10001C490()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C58C, 0, 0);
}

uint64_t sub_10001C58C()
{
  uint64_t v1 = *(_OWORD **)(v0 + 48);
  long long v2 = *(_OWORD *)(v0 + 32);
  _OWORD *v1 = *(_OWORD *)(v0 + 16);
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C5B0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000F1AC;
  return sub_10001C3A8(a1);
}

uint64_t sub_10001C648(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  uint64_t v3 = sub_100006DC8(&qword_10007E4C0);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = swift_task_alloc();
  *(_DWORD *)(v2 + 64) = *(_DWORD *)(v3 + 48);
  return _swift_task_switch(sub_10001C6F0, 0, 0);
}

uint64_t sub_10001C6F0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[6] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001C7D8;
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  return withCheckedContinuation<A>(isolation:function:_:)(v4, 0, 0, 0xD00000000000001FLL, 0x8000000100069410, sub_100021000, v2, v5);
}

uint64_t sub_10001C7D8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C8F0, 0, 0);
}

uint64_t sub_10001C8F0()
{
  uint64_t v1 = *(int *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(*(void *)(v0 + 40) + *(int *)(*(void *)(v0 + 32) + 48));
  sub_10001A5B8(*(void *)(v0 + 40), v2);
  *(void *)(v2 + v1) = v3;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10001C980(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 1712) = a2;
  *(void *)(v2 + 1384) = a1;
  uint64_t v3 = sub_100064380();
  *(void *)(v2 + 1432) = v3;
  *(void *)(v2 + 1480) = *(void *)(v3 - 8);
  *(void *)(v2 + 1528) = swift_task_alloc();
  *(void *)(v2 + 1576) = swift_task_alloc();
  uint64_t v4 = sub_1000641E0();
  *(void *)(v2 + 1624) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v2 + 1632) = v5;
  *(void *)(v2 + 1640) = *(void *)(v5 + 64);
  *(void *)(v2 + 1648) = swift_task_alloc();
  *(void *)(v2 + 1656) = swift_task_alloc();
  return _swift_task_switch(sub_10001CAC8, 0, 0);
}

uint64_t sub_10001CAC8()
{
  uint64_t v1 = *(void *)(v0 + 1656);
  uint64_t v2 = *(void *)(v0 + 1632);
  uint64_t v3 = *(void *)(v0 + 1624);
  char v4 = *(unsigned char *)(v0 + 1712);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v5(v1, *(void *)(v0 + 1384), v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 1664) = v7;
  uint64_t v22 = *(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32);
  v22(v7 + v6, v1, v3);
  swift_retain();
  swift_asyncLet_begin();
  if (v4)
  {
    *(_OWORD *)(v0 + 1688) = 0u;
    uint64_t v8 = v0 + 16;
  }
  else
  {
    uint64_t v20 = v5;
    unint64_t v21 = v6;
    sub_100064360();
    uint64_t v9 = sub_100064370();
    os_log_type_t v10 = sub_100064930();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "isForcedFolderSharing is false, so call doBRSharingRunCleanFolder", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = *(void *)(v0 + 1648);
    uint64_t v13 = *(void *)(v0 + 1624);
    uint64_t v14 = *(void *)(v0 + 1576);
    uint64_t v15 = *(void *)(v0 + 1480);
    uint64_t v16 = *(void *)(v0 + 1432);
    uint64_t v17 = *(void *)(v0 + 1384);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    v20(v12, v17, v13);
    uint64_t v18 = swift_allocObject();
    *(void *)(v0 + 1672) = v18;
    v22(v18 + v21, v12, v13);
    swift_retain();
    swift_asyncLet_begin();
    uint64_t v8 = v0 + 656;
  }
  return _swift_asyncLet_get_throwing(v8);
}

uint64_t sub_10001CD78(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 1680) = v2;
  if (v2)
  {
    uint64_t v4 = v3 + 1344;
    uint64_t v5 = sub_10001CF70;
  }
  else
  {
    uint64_t v4 = v3 + 1488;
    uint64_t v5 = sub_10001CDB4;
  }
  return _swift_asyncLet_finish(v3 + 656, a2, v5, v4);
}

uint64_t sub_10001CDB4()
{
  return _swift_task_switch(sub_10001CDD0, 0, 0);
}

uint64_t sub_10001CDD0()
{
  swift_release();
  v0[212] = v0[209];
  v0[211] = &unk_10007E508;
  return _swift_asyncLet_get_throwing(v0 + 2);
}

uint64_t sub_10001CE5C(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 1704) = v2;
  if (v2)
  {
    uint64_t v4 = v3 + 1584;
    uint64_t v5 = sub_10001D2B8;
  }
  else
  {
    uint64_t v4 = v3 + 1440;
    uint64_t v5 = sub_10001CE98;
  }
  return _swift_asyncLet_finish(v3 + 16, a2, v5, v4);
}

uint64_t sub_10001CE98()
{
  return _swift_task_switch(sub_10001CEB4, 0, 0);
}

uint64_t sub_10001CEB4()
{
  uint64_t v1 = *(void *)(v0 + 1688);
  swift_release_n();
  sub_100009C2C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001CF70()
{
  return _swift_task_switch(sub_10001CF8C, 0, 0);
}

uint64_t sub_10001CF8C()
{
  swift_release();
  return _swift_asyncLet_finish(v0 + 16, v1, sub_10001CFFC, v0 + 1392);
}

uint64_t sub_10001CFFC()
{
  return _swift_task_switch(sub_10001D018, 0, 0);
}

uint64_t sub_10001D018()
{
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[167] = v5;
    sub_100064A90();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "runFolderSharingPrepOperations clean or prep error: %@", v3, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[191];
  uint64_t v7 = v0[185];
  uint64_t v8 = v0[179];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = sub_100064140();
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v10 = 0xD000000000000041;
  *(void *)(v10 + 8) = 0x80000001000694A0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 16) = v9;
  *(unsigned char *)(v10 + 40) = 3;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  sub_100009C2C((uint64_t)&unk_10007E508);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10001D2B8()
{
  return _swift_task_switch(sub_10001D2D4, 0, 0);
}

uint64_t sub_10001D2D4()
{
  uint64_t v13 = v0[211];
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[167] = v5;
    sub_100064A90();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "runFolderSharingPrepOperations clean or prep error: %@", v3, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[191];
  uint64_t v7 = v0[185];
  uint64_t v8 = v0[179];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = sub_100064140();
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v10 = 0xD000000000000041;
  *(void *)(v10 + 8) = 0x80000001000694A0;
  *(void *)(v10 + 24) = 0;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 16) = v9;
  *(unsigned char *)(v10 + 40) = 3;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  sub_100009C2C(v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10001D564(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return _swift_task_switch(sub_10001D584, 0, 0);
}

uint64_t sub_10001D584()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001D670;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v3, 0, 0, 0xD00000000000001ELL, 0x8000000100069540, sub_100021628, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_10001D670()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100021878;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100021894;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001D78C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return _swift_task_switch(sub_10001D7AC, 0, 0);
}

uint64_t sub_10001D7AC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = swift_task_alloc();
  v0[3] = v2;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[4] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001D89C;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v3, 0, 0, 0xD00000000000002ALL, 0x80000001000694F0, sub_100021610, v2, (char *)&type metadata for () + 8);
}

uint64_t sub_10001D89C()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001D9D0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10001D9B8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001D9B8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001D9D0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10001DA34(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10001DAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a1;
  uint64_t v32 = sub_100006DC8((uint64_t *)&unk_10007E510);
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v29 = v3;
  id v4 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000641E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v28 = v7;
  uint64_t v8 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = &v26[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v27 = sub_1000641C0();
  uint64_t v12 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a2, v5);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
  uint64_t v14 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) != 1)
  {
    sub_100064180(v13);
    uint64_t v14 = v15;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
  }
  id v16 = [objc_allocWithZone((Class)BRSharePrepFolderForSharing) initWithURL:v14];

  if (v16)
  {
    [v16 setQualityOfService:25];
    v12(v8, a2, v5);
    uint64_t v17 = v30;
    uint64_t v18 = v32;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v30 + 16))(v4, v31, v32);
    unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    unint64_t v20 = (v28 + *(unsigned __int8 *)(v17 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    uint64_t v21 = swift_allocObject();
    *(unsigned char *)(v21 + 16) = v27;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v6 + 32))(v21 + v19, v8, v5);
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v17 + 32))(v21 + v20, v4, v18);
    aBlock[4] = sub_100021624;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001DA34;
    aBlock[3] = &unk_10007A308;
    uint64_t v22 = _Block_copy(aBlock);
    swift_release();
    [v16 setPrepFolderSharingCompletionBlock:v22];
    _Block_release(v22);
    if (qword_10007DC40 != -1) {
      swift_once();
    }
    [(id)qword_10007E420 addOperation:v16];
  }
  else
  {
    sub_1000646E0();
    id v23 = objc_allocWithZone((Class)NSError);
    NSString v24 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v25 = [v23 initWithDomain:v24 code:80 userInfo:0];

    aBlock[0] = v25;
    sub_100064840();
  }
}

void sub_10001DF24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = sub_100006DC8((uint64_t *)&unk_10007E510);
  uint64_t v32 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v31 = v4;
  uint64_t v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_1000641E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v30 = v8;
  uint64_t v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v29 = sub_1000641C0();
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16);
  v13(v12, a2, v6);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  uint64_t v15 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    sub_100064180(v14);
    uint64_t v15 = v16;
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
  }
  id v17 = objc_allocWithZone((Class)BRShareProcessSubitems);
  id v18 = [v17 initWithURL:v15 processType:v33];

  if (v18)
  {
    [v18 setQualityOfService:25];
    [v18 setMaxSharedSubitemsBeforeFailure:4];
    v13(v9, a2, v6);
    uint64_t v19 = v32;
    uint64_t v20 = v35;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v32 + 16))(v5, v34, v35);
    unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v22 = (v30 + *(unsigned __int8 *)(v19 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v23 = swift_allocObject();
    *(unsigned char *)(v23 + 16) = v29;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v23 + v21, v9, v6);
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v19 + 32))(v23 + v22, v5, v20);
    aBlock[4] = sub_100021624;
    aBlock[5] = v23;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001DA34;
    aBlock[3] = &unk_10007A2B8;
    NSString v24 = _Block_copy(aBlock);
    swift_release();
    [v18 setProcessSubitemsCompletionBlock:v24];
    _Block_release(v24);
    if (qword_10007DC40 != -1) {
      swift_once();
    }
    [(id)qword_10007E420 addOperation:v18];
  }
  else
  {
    sub_1000646E0();
    id v25 = objc_allocWithZone((Class)NSError);
    NSString v26 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v27 = [v25 initWithDomain:v26 code:80 userInfo:0];

    aBlock[0] = v27;
    sub_100064840();
  }
}

uint64_t sub_10001E3C0(uint64_t a1, char a2)
{
  if (a2) {
    sub_1000641A0();
  }
  if (a1)
  {
    swift_errorRetain();
    sub_100006DC8((uint64_t *)&unk_10007E510);
    return sub_100064840();
  }
  else
  {
    sub_100006DC8((uint64_t *)&unk_10007E510);
    return sub_100064850();
  }
}

void sub_10001E448(uint64_t a1, uint64_t a2, void *a3)
{
  id v38 = a3;
  uint64_t v39 = a1;
  uint64_t v40 = sub_100006DC8(&qword_10007E4E0);
  uint64_t v4 = *(void *)(v40 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v40);
  char v37 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100006DC8(&qword_10007E520);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v35 + 64);
  uint64_t v8 = __chkstk_darwin(v6 - 8);
  uint64_t v36 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = &v33[-v10];
  __chkstk_darwin(v9);
  uint64_t v13 = &v33[-v12];
  sub_100020E94(a2, (uint64_t)&v33[-v12], &qword_10007E520);
  uint64_t v14 = sub_1000641E0();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14) == 1)
  {
    sub_100009CA4((uint64_t)v13, &qword_10007E520);
    BOOL v34 = 0;
  }
  else
  {
    BOOL v34 = sub_1000641C0();
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v13, v14);
  }
  sub_100020E94(a2, (uint64_t)v11, &qword_10007E520);
  unsigned int v17 = v16(v11, 1, v14);
  id v19 = v38;
  if (v17 == 1)
  {
    uint64_t v20 = 0;
  }
  else
  {
    sub_100064180(v18);
    uint64_t v20 = v21;
    (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v11, v14);
  }
  id v22 = [objc_allocWithZone((Class)BRShareSaveOperation) initWithShare:v19 fileURL:v20];

  if (v22)
  {
    [v22 setQualityOfService:25];
    uint64_t v23 = v36;
    sub_100020E94(a2, (uint64_t)v36, &qword_10007E520);
    NSString v24 = v37;
    uint64_t v25 = v40;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v37, v39, v40);
    unint64_t v26 = (*(unsigned __int8 *)(v35 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    unint64_t v27 = (v7 + *(unsigned __int8 *)(v4 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = v34;
    sub_10001A5B8((uint64_t)v23, v28 + v26);
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v4 + 32))(v28 + v27, v24, v25);
    uint64_t v45 = sub_1000212C8;
    uint64_t v46 = v28;
    aBlock = _NSConcreteStackBlock;
    uint64_t v42 = 1107296256;
    id v43 = sub_10001EA98;
    id v44 = &unk_10007A218;
    BOOL v29 = _Block_copy(&aBlock);
    swift_release();
    [v22 setShareSaveCompletionBlock:v29];
    _Block_release(v29);
    if (qword_10007DC40 != -1) {
      swift_once();
    }
    [(id)qword_10007E420 addOperation:v22];
  }
  else
  {
    sub_1000646E0();
    id v30 = objc_allocWithZone((Class)NSError);
    NSString v31 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v32 = [v30 initWithDomain:v31 code:80 userInfo:0];

    aBlock = 0;
    uint64_t v42 = (uint64_t)v32;
    sub_100064850();
  }
}

uint64_t sub_10001E928(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = (char *)v17 - v10;
  if (a3)
  {
    sub_100020E94(a4, (uint64_t)v17 - v10, &qword_10007E520);
    uint64_t v12 = sub_1000641E0();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      sub_1000641A0();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
      if (a2) {
        goto LABEL_5;
      }
LABEL_7:
      uint64_t v14 = 0;
      goto LABEL_8;
    }
    sub_100009CA4((uint64_t)v11, &qword_10007E520);
  }
  if (!a2) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v14 = sub_100064140();
LABEL_8:
  v17[0] = a1;
  v17[1] = v14;
  id v15 = a1;
  sub_100006DC8(&qword_10007E4E0);
  return sub_100064850();
}

void sub_10001EA98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10001EB24(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = a1;
  uint64_t v45 = sub_100006DC8(&qword_10007E4B0);
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v41 = v3;
  uint64_t v42 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000641E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v39 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100006DC8(&qword_10007E498);
  __chkstk_darwin(v37);
  uint64_t v36 = (uint64_t *)((char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v35 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - v11;
  BOOL v38 = sub_1000641C0();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v40 = a2;
  v13(v12, a2, v4);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v14(v12, 0, 1, v4);
  id v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) != 1)
  {
    sub_100064180(v15);
    id v16 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  }
  id v18 = [objc_allocWithZone((Class)BRShareCopyOperation) initWithURL:v16];

  if (v18)
  {
    [v18 setQualityOfService:25];
    id v19 = v39;
    v13(v39, v40, v4);
    unint64_t v21 = v42;
    uint64_t v20 = v43;
    uint64_t v22 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v42, v44, v45);
    unint64_t v23 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    unint64_t v24 = (v6 + *(unsigned __int8 *)(v20 + 80) + v23) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = v38;
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v25 + v23, v19, v4);
    (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v25 + v24, v21, v22);
    aBlock[4] = sub_100020F0C;
    aBlock[5] = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001F1B0;
    aBlock[3] = &unk_10007A178;
    unint64_t v26 = _Block_copy(aBlock);
    swift_release();
    [v18 setRootShareCopyCompletionBlock:v26];
    _Block_release(v26);
    if (qword_10007DC40 != -1) {
      swift_once();
    }
    [(id)qword_10007E420 addOperation:v18];
  }
  else
  {
    uint64_t v27 = (uint64_t)v35;
    v14(v35, 1, 1, v4);
    sub_1000646E0();
    id v28 = objc_allocWithZone((Class)NSError);
    NSString v29 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v30 = [v28 initWithDomain:v29 code:80 userInfo:0];

    NSString v31 = v36;
    uint64_t v32 = (uint64_t)v36 + *(int *)(v37 + 48);
    uint64_t v33 = *(int *)(v37 + 64);
    *uint64_t v36 = 0;
    sub_10001A5B8(v27, v32);
    *(void *)((char *)v31 + v33) = v30;
    sub_100064850();
  }
}

uint64_t sub_10001F050(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E498);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4) {
    sub_1000641A0();
  }
  sub_100020E94(a2, (uint64_t)v13, &qword_10007E520);
  if (a3) {
    uint64_t v14 = sub_100064140();
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (uint64_t)v10 + *(int *)(v8 + 48);
  uint64_t v16 = *(int *)(v8 + 64);
  *uint64_t v10 = a1;
  sub_10001A5B8((uint64_t)v13, v15);
  *(void *)((char *)v10 + v16) = v14;
  id v17 = a1;
  sub_100006DC8(&qword_10007E4B0);
  return sub_100064850();
}

uint64_t sub_10001F1B0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(void *, char *, void *))(a1 + 32);
  if (a3)
  {
    sub_1000641B0();
    uint64_t v12 = sub_1000641E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1000641E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  swift_retain();
  id v14 = a2;
  id v15 = a4;
  v11(a2, v10, a4);

  swift_release();
  return sub_100009CA4((uint64_t)v10, &qword_10007E520);
}

void sub_10001F318(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v3 = sub_100006DC8(&qword_10007E488);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = sub_1000641E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v19 = sub_1000641C0();
  sub_100064180(v10);
  unint64_t v21 = v11;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t v12 = v3;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(&v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v20, v3);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v14 = (v8 + *(unsigned __int8 *)(v4 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = v19;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v4 + 32))(v15 + v14, &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v12);
  aBlock[4] = sub_100020CC4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001F76C;
  aBlock[3] = &unk_10007A128;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  uint64_t v17 = v21;
  BRSharingCopyCurrentUserNameAndDisplayHandleForURL();
  _Block_release(v16);
}

uint64_t sub_10001F5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v15 = sub_100006DC8(&qword_10007E458);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a9) {
    sub_1000641A0();
  }
  sub_100020E94(a1, (uint64_t)v17, &qword_10007E458);
  uint64_t v18 = sub_1000640C0();
  uint64_t v19 = *(void *)(v18 - 8);
  Class v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
  {
    Class v20 = sub_1000640A0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  }
  if (a8) {
    uint64_t v21 = sub_100064140();
  }
  else {
    uint64_t v21 = 0;
  }
  Class v25 = v20;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v28 = v23;
  uint64_t v29 = a5;
  uint64_t v30 = v24;
  uint64_t v31 = a7;
  uint64_t v32 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100006DC8(&qword_10007E488);
  return sub_100064850();
}

uint64_t sub_10001F76C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12 = sub_100006DC8(&qword_10007E458);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1000640B0();
    uint64_t v15 = sub_1000640C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1000640C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  if (a3)
  {
    uint64_t v17 = sub_1000646E0();
    a3 = v18;
    if (a4) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v19 = 0;
    if (a5) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v21 = 0;
    goto LABEL_11;
  }
  uint64_t v17 = 0;
  if (!a4) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v19 = sub_1000646E0();
  a4 = v20;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v21 = sub_1000646E0();
  a5 = v22;
LABEL_11:
  swift_retain();
  id v23 = a6;
  v26(v14, v17, a3, v19, a4, v21, a5, a6);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_100009CA4((uint64_t)v14, &qword_10007E458);
}

void sub_10001F964(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E450);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  sub_10000EF58(0, (unint64_t *)&qword_10007E088);
  uint64_t v5 = (void *)sub_100064960();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_10001FD2C;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001FDC8;
  aBlock[3] = &unk_10007A0B0;
  uint64_t v8 = _Block_copy(aBlock);
  swift_release();
  BRSharingCopyCurrentUserNameAndDisplayHandle();
  _Block_release(v8);
}

uint64_t sub_10001FB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E458);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100020E94(a1, (uint64_t)v10, &qword_10007E458);
  uint64_t v11 = sub_1000640C0();
  uint64_t v12 = *(void *)(v11 - 8);
  Class v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    Class v13 = sub_1000640A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a4) {
    uint64_t v14 = sub_100064140();
  }
  else {
    uint64_t v14 = 0;
  }
  v16[0] = v13;
  v16[1] = a2;
  v16[2] = a3;
  v16[3] = v14;
  swift_bridgeObjectRetain();
  sub_100006DC8(&qword_10007E450);
  return sub_100064850();
}

uint64_t sub_10001FC98()
{
  uint64_t v1 = sub_100006DC8(&qword_10007E450);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001FD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100006DC8(&qword_10007E450);

  return sub_10001FB28(a1, a2, a3, a4);
}

uint64_t sub_10001FDC8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E458);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1000640B0();
    uint64_t v12 = sub_1000640C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1000640C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  if (a3)
  {
    uint64_t v14 = sub_1000646E0();
    a3 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  swift_retain();
  id v16 = a4;
  v11(v10, v14, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return sub_100009CA4((uint64_t)v10, &qword_10007E458);
}

uint64_t sub_10001FF48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001FF58()
{
  return swift_release();
}

void sub_10001FF60(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a1;
  uint64_t v58 = sub_100006DC8(&qword_10007E4C8);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v54 = v3;
  uint64_t v55 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000641E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v52 = v6;
  uint64_t v53 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006DC8(&qword_10007E4C0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006DC8(&qword_10007E520);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  BOOL v51 = sub_1000641C0();
  sub_100064180(v16);
  uint64_t v18 = v17;
  aBlock[0] = 0;
  id v19 = objc_msgSend(v17, "br_typeIdentifierWithError:", aBlock);

  id v20 = aBlock[0];
  if (v19)
  {
    uint64_t v46 = v7;
    uint64_t v47 = v13;
    uint64_t v48 = v9;
    uint64_t v50 = sub_1000646E0();
    id v21 = v20;

    char v49 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v49(v15, a2, v4);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v22(v15, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4) == 1)
    {
      uint64_t v24 = 0;
    }
    else
    {
      sub_100064180(v23);
      uint64_t v24 = v28;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    }
    id v29 = objc_allocWithZone((Class)BRShareCopyShareURLOperation);
    NSString v30 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v31 = [v29 initWithFileURL:v24 documentType:v30];

    if (v31)
    {
      [v31 setQualityOfService:25];
      uint64_t v32 = v53;
      v49(v53, a2, v4);
      uint64_t v34 = v55;
      uint64_t v33 = v56;
      uint64_t v35 = v58;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v57, v58);
      unint64_t v36 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      unint64_t v37 = (v52 + *(unsigned __int8 *)(v33 + 80) + v36) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
      BOOL v38 = (unsigned char *)swift_allocObject();
      v38[16] = v51;
      (*(void (**)(unsigned char *, char *, uint64_t))(v5 + 32))(&v38[v36], v32, v4);
      (*(void (**)(unsigned char *, char *, uint64_t))(v33 + 32))(&v38[v37], v34, v35);
      aBlock[4] = sub_100021014;
      aBlock[5] = v38;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_100020700;
      aBlock[3] = &unk_10007A1C8;
      uint64_t v39 = _Block_copy(aBlock);
      swift_release();
      [v31 setCopyShareURLCompletionBlock:v39];
      _Block_release(v39);
      if (qword_10007DC40 != -1) {
        swift_once();
      }
      [(id)qword_10007E420 addOperation:v31];
    }
    else
    {
      uint64_t v40 = (uint64_t)v47;
      v22(v47, 1, 1, v4);
      sub_1000646E0();
      id v41 = objc_allocWithZone((Class)NSError);
      NSString v42 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v43 = [v41 initWithDomain:v42 code:80 userInfo:0];

      uint64_t v44 = *(int *)(v46 + 48);
      uint64_t v45 = (uint64_t)v48;
      sub_10001A5B8(v40, (uint64_t)v48);
      *(void *)(v45 + v44) = v43;
      sub_100064850();
    }
  }
  else
  {
    id v25 = aBlock[0];
    sub_100064150();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, 1, 1, v4);
    uint64_t v26 = sub_100064140();
    uint64_t v27 = *(int *)(v7 + 48);
    sub_10001A5B8((uint64_t)v13, (uint64_t)v9);
    *(void *)&v9[v27] = v26;
    sub_100064850();
    swift_errorRelease();
  }
}

uint64_t sub_1000205B8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_100006DC8(&qword_10007E4C0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    sub_1000641A0();
  }
  sub_100020E94(a1, (uint64_t)v11, &qword_10007E520);
  if (a2) {
    uint64_t v12 = sub_100064140();
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  sub_10001A5B8((uint64_t)v11, (uint64_t)v8);
  *(void *)&v8[v13] = v12;
  sub_100006DC8(&qword_10007E4C8);
  return sub_100064850();
}

uint64_t sub_100020700(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_1000641B0();
    uint64_t v10 = sub_1000641E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1000641E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_100009CA4((uint64_t)v8, &qword_10007E520);
}

uint64_t sub_100020848(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000641E0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    sub_100064180(v7);
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  id v10 = [self accountDescriptorForURL:v8 mustBeLoggedIn:1];

  if (!v10) {
    return 0;
  }
  id v11 = [v10 accountIdentifier];
  if (!v11)
  {

    return 0;
  }
  id v12 = v11;
  uint64_t v13 = sub_1000646E0();

  return v13;
}

uint64_t sub_100020A04()
{
  uint64_t v0 = self;
  if (![v0 mightHaveDataSeparatedAccountDescriptor]) {
    return 0;
  }
  id v1 = [v0 allLoggedInAccountDescriptors];
  if (!v1) {
    return 0;
  }
  sub_10000EF58(0, &qword_10007E460);
  unint64_t v2 = sub_1000647F0();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_5;
    }
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100064BA0();
  if (!v3) {
    goto LABEL_20;
  }
LABEL_5:
  for (uint64_t i = 4; ; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_100064B20();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i);
    }
    uint64_t v6 = v5;
    uint64_t v7 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    if ([v5 isDataSeparated]) {
      break;
    }

    if (v7 == v3)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease_n();
  id v9 = [v6 accountIdentifier];

  if (!v9) {
    return 0;
  }
  uint64_t v8 = sub_1000646E0();

  return v8;
}

uint64_t sub_100020BC8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_1000641E0() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10000F1AC;
  v6[10] = a1;
  v6[11] = v5;
  return _swift_task_switch(sub_10001BEA0, 0, 0);
}

void sub_100020CB0(uint64_t a1)
{
  sub_10001F318(a1, *(void *)(v1 + 16));
}

uint64_t sub_100020CB8()
{
  return sub_10002163C(&qword_10007E488);
}

uint64_t sub_100020CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000641E0();
  sub_100006DC8(&qword_10007E488);
  return sub_10001F5B4(a1, a2, a3, a4, a5, a6, a7, a8, *(unsigned char *)(v8 + 16));
}

uint64_t sub_100020DF4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000F1AC;
  return sub_10001B5CC(a1, v4);
}

uint64_t sub_100020E94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006DC8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_100020EF8(uint64_t a1)
{
  sub_10001EB24(a1, *(void *)(v1 + 16));
}

uint64_t sub_100020F00()
{
  return sub_10002163C(&qword_10007E4B0);
}

uint64_t sub_100020F0C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000641E0();
  sub_100006DC8(&qword_10007E4B0);
  char v7 = *(unsigned char *)(v3 + 16);

  return sub_10001F050(a1, a2, a3, v7);
}

void sub_100021000(uint64_t a1)
{
  sub_10001FF60(a1, *(void *)(v1 + 16));
}

uint64_t sub_100021008()
{
  return sub_10002163C(&qword_10007E4C8);
}

uint64_t sub_100021014(uint64_t a1, uint64_t a2)
{
  sub_1000641E0();
  sub_100006DC8(&qword_10007E4C8);
  char v5 = *(unsigned char *)(v2 + 16);

  return sub_1000205B8(a1, a2, v5);
}

void sub_100021100(uint64_t a1)
{
  sub_10001E448(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100021108()
{
  uint64_t v1 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 17) & ~v2;
  uint64_t v13 = *(void *)(v1 + 64);
  uint64_t v4 = sub_100006DC8(&qword_10007E4E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = sub_1000641E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v3, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v3, v8);
  }
  uint64_t v10 = (v3 + v13 + v6) & ~v6;
  uint64_t v11 = v10 + v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v10, v4);

  return _swift_deallocObject(v0, v11, v2 | v6 | 7);
}

uint64_t sub_1000212C8(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100006DC8(&qword_10007E4E0);
  char v7 = *(unsigned char *)(v2 + 16);

  return sub_10001E928(a1, a2, v7, v2 + v6);
}

uint64_t sub_1000213BC()
{
  uint64_t v2 = *(void *)(sub_1000641E0() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000F1AC;
  v4[2] = v3;
  return _swift_task_switch(sub_10001D584, 0, 0);
}

uint64_t sub_1000214A0()
{
  uint64_t v1 = sub_1000641E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100021530()
{
  uint64_t v2 = *(void *)(sub_1000641E0() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000F0B8;
  v4[2] = v3;
  return _swift_task_switch(sub_10001D7AC, 0, 0);
}

void sub_100021610(uint64_t a1)
{
  sub_10001DF24(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100021618()
{
  return sub_10002163C((uint64_t *)&unk_10007E510);
}

void sub_100021628(uint64_t a1)
{
  sub_10001DAA0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100021630()
{
  return sub_10002163C((uint64_t *)&unk_10007E510);
}

uint64_t sub_10002163C(uint64_t *a1)
{
  uint64_t v3 = sub_1000641E0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 17) & ~v5;
  uint64_t v7 = *(void *)(v4 + 64);
  uint64_t v8 = sub_100006DC8(a1);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v6 + v7 + v10) & ~v10;
  uint64_t v12 = v11 + *(void *)(v9 + 64);
  uint64_t v13 = v5 | v10 | 7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + v11, v8);

  return _swift_deallocObject(v1, v12, v13);
}

uint64_t sub_100021790(uint64_t a1)
{
  sub_1000641E0();
  sub_100006DC8((uint64_t *)&unk_10007E510);
  return sub_10001E3C0(a1, *(unsigned char *)(v1 + 16));
}

uint64_t getEnumTagSinglePayload for SharingType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF7)
  {
    unsigned int v2 = a2 + 9;
    if (a2 + 9 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 9;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 9;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100021948);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 9;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 8) {
    unsigned int v8 = v7 - 7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 3) {
    return v8 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for SharingType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 9;
  if (a3 + 9 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xF7) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v7 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x100021A30);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t sub_100021A58(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 8) {
    return v1 - 7;
  }
  else {
    return 0;
  }
}

unsigned char *sub_100021A6C(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 7;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingType()
{
  return &type metadata for SharingType;
}

BOOL sub_100021A8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL sub_100021AA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  BOOL v4 = v3 == 8;
  BOOL v5 = v3 == 9;
  int v6 = v3 & 0xFE;
  BOOL v8 = v3 == 7 || v2 == v3;
  if (v2 == 7) {
    BOOL v8 = 1;
  }
  if (v6 == 8) {
    BOOL v8 = 0;
  }
  if (v2 == 9) {
    BOOL v8 = v5;
  }
  if (v2 == 8) {
    return v4;
  }
  else {
    return v8;
  }
}

uint64_t sub_100021AF0()
{
  return *(void *)&aUnspeciNotes[8 * *v0];
}

uint64_t sub_100021B14(char a1)
{
  if (a1 == 8) {
    return 0x6E776F6E6B6E752ELL;
  }
  if (a1 == 9) {
    return 0x6E656D75636F642ELL;
  }
  sub_100064B00(19);
  swift_bridgeObjectRelease();
  uint64_t v3 = 8 * a1;
  v4._countAndFlagsBits = *(void *)&aUnspeciNotes[v3];
  v4._object = *(void **)&aFied[v3];
  sub_100064760(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 41;
  v5._object = (void *)0xE100000000000000;
  sub_100064760(v5);
  return 0xD000000000000010;
}

uint64_t sub_100021C04()
{
  return sub_100021B14(*v0);
}

uint64_t sub_100021C0C(char a1)
{
  return byte_100066B70[a1];
}

uint64_t sub_100021C20(char a1)
{
  return *(void *)&aFolder_1[8 * a1];
}

uint64_t sub_100021C40(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_100021C20(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100021C20(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100064C10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100021CCC()
{
  char v1 = *v0;
  sub_100064C90();
  sub_100021C20(v1);
  sub_100064720();
  swift_bridgeObjectRelease();
  return sub_100064CB0();
}

uint64_t sub_100021D30()
{
  sub_100021C20(*v0);
  sub_100064720();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100021D84()
{
  char v1 = *v0;
  sub_100064C90();
  sub_100021C20(v1);
  sub_100064720();
  swift_bridgeObjectRelease();
  return sub_100064CB0();
}

uint64_t sub_100021DE4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000240CC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100021E14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021C20(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100021E40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0xD000000000000018;
  uint64_t v5 = sub_100064280();
  __chkstk_darwin(v5 - 8);
  uint64_t v60 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100064380();
  uint64_t v62 = *(void *)(v7 - 8);
  uint64_t v63 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  v59 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v61 = (char *)&v54 - v10;
  uint64_t v11 = sub_100006DC8(&qword_10007E528);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v54 - v16;
  __chkstk_darwin(v15);
  id v19 = (char *)&v54 - v18;
  uint64_t v20 = sub_100064340();
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v23 = __chkstk_darwin(v22);
  id v25 = (char *)&v54 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  id v31 = (char *)&v54 - v30;
  if (a1 == 0x726464756F6C6369 && a2 == 0xEB00000000657669) {
    return 0xD00000000000001BLL;
  }
  uint64_t v55 = v29;
  uint64_t v56 = v28;
  uint64_t v57 = v27;
  uint64_t v58 = v26;
  if (sub_100064C10()) {
    return 0xD00000000000001BLL;
  }
  unint64_t v32 = 0xD000000000000014;
  if (a1 == 0x7365746F6ELL && a2 == 0xE500000000000000 || (sub_100064C10() & 1) != 0) {
    return v32;
  }
  if ((a1 != 0x7265646E696D6572 || a2 != 0xE900000000000073) && (sub_100064C10() & 1) == 0)
  {
    unint64_t v32 = 0xD000000000000019;
    if (a1 == 0xD000000000000011 && a2 == 0x80000001000695C0 || (sub_100064C10() & 1) != 0) {
      return v32;
    }
    if ((a1 != 0x6D726F6665657266 || a2 != 0xE800000000000000) && (sub_100064C10() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_100064350();
      uint64_t v34 = v57;
      uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
      if (v35(v19, 1, v58) == 1)
      {
        sub_100009CA4((uint64_t)v19, &qword_10007E528);
        swift_bridgeObjectRetain();
        sub_100064270();
        uint64_t v36 = v58;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v14, 1, 1, v58);
        sub_1000642D0();
        if (v35(v17, 1, v36) == 1)
        {
          sub_100009CA4((uint64_t)v17, &qword_10007E528);
          swift_bridgeObjectRetain();
          return a1;
        }
        else
        {
          uint64_t v44 = v56;
          (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v56, v17, v36);
          uint64_t v45 = v59;
          sub_100064360();
          uint64_t v46 = v55;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v55, v44, v36);
          uint64_t v47 = sub_100064370();
          os_log_type_t v48 = sub_100064930();
          if (os_log_type_enabled(v47, v48))
          {
            char v49 = (uint8_t *)swift_slowAlloc();
            uint64_t v65 = swift_slowAlloc();
            *(_DWORD *)char v49 = 136315138;
            uint64_t v50 = sub_100064290();
            uint64_t v64 = sub_10004BEF0(v50, v51, &v65);
            sub_100064A90();
            swift_bridgeObjectRelease();
            uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
            v52(v46, v58);
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "utiOfItem(fromCKShareType)--type from filename extension: %s", v49, 0xCu);
            swift_arrayDestroy();
            uint64_t v36 = v58;
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
            v52(v46, v36);
          }

          (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v63);
          uint64_t v53 = v56;
          uint64_t v4 = sub_100064290();
          v52(v53, v36);
        }
      }
      else
      {
        uint64_t v37 = v58;
        (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v19, v58);
        sub_1000642E0();
        char v38 = sub_100064330();
        uint64_t v39 = *(void (**)(char *, uint64_t))(v34 + 8);
        v39(v25, v37);
        uint64_t v40 = v61;
        sub_100064360();
        id v41 = sub_100064370();
        os_log_type_t v42 = sub_100064930();
        if (os_log_type_enabled(v41, v42))
        {
          id v43 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v43 = 67109120;
          LODWORD(v65) = v38 & 1;
          sub_100064A90();
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "utiOfItem(fromCKShareType)--ckShareType is a UTType. Is file system item: %{BOOL}d", v43, 8u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v62 + 8))(v40, v63);
        uint64_t v4 = sub_100064290();
        v39(v31, v58);
      }
    }
  }
  return v4;
}

unint64_t sub_1000226C8(char *a1, void *a2)
{
  id v41 = a2;
  uint64_t v3 = sub_1000641E0();
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  char v38 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - v6;
  uint64_t v8 = sub_100064380();
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  id v43 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = sub_100064090();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006DC8(&qword_10007E530);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100066020;
  *(void *)(inited + 32) = NSURLTypeIdentifierKey;
  uint64_t v18 = NSURLTypeIdentifierKey;
  id v19 = sub_10004C990(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  URL.evictionSafeResourceValues(forKeys:)((uint64_t)v19, (uint64_t)v16);
  char v38 = a1;
  id v43 = v7;
  uint64_t v20 = v42;
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_100064050();
  if (!v22)
  {
    uint64_t v37 = v16;
    uint64_t v27 = v12;
    sub_100064360();
    uint64_t v28 = v43;
    uint64_t v29 = v3;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v43, v38, v3);
    uint64_t v30 = sub_100064370();
    os_log_type_t v31 = sub_100064910();
    if (os_log_type_enabled(v30, v31))
    {
      unint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v44[0] = v36;
      char v38 = v27;
      *(_DWORD *)unint64_t v32 = 136315138;
      uint64_t v35 = v32 + 4;
      sub_10001ADF4();
      uint64_t v33 = sub_100064BF0();
      uint64_t v45 = sub_10004BEF0(v33, v34, v44);
      sub_100064A90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v29);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "resourceValues(forKeys:) returned nil for typeIdentifier (UTI) for URL: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v40);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v29);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v27, v40);
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v37, v13);
    if (v41)
    {
      id v24 = v41;
      sub_100064A20();
      uint64_t v25 = sub_100064A30();

      swift_bridgeObjectRelease();
      if (v25)
      {
        uint64_t v45 = v25;
        sub_100006DC8(&qword_10007E538);
        if (swift_dynamicCast())
        {
          unint64_t v23 = sub_100021E40(v44[0], v44[1]);

          swift_bridgeObjectRelease();
          return v23;
        }
      }
    }
    return 0;
  }
  unint64_t v23 = v21;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v23;
}

uint64_t sub_100022E10()
{
  uint64_t v0 = sub_100064340();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064310();
  char v4 = sub_100064320();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  if (v4) {
    return 0;
  }
  sub_1000642B0();
  char v7 = sub_100064320();
  v5(v3, v0);
  if (v7) {
    return 3;
  }
  sub_1000642A0();
  char v8 = sub_100064320();
  v5(v3, v0);
  if (v8) {
    return 2;
  }
  sub_1000642F0();
  char v9 = sub_100064320();
  v5(v3, v0);
  if (v9) {
    return 4;
  }
  sub_100064300();
  char v10 = sub_100064320();
  v5(v3, v0);
  if (v10) {
    return 5;
  }
  sub_1000642C0();
  char v11 = sub_100064320();
  v5(v3, v0);
  if (v11) {
    return 6;
  }
  else {
    return 1;
  }
}

uint64_t sub_100022FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a1;
  uint64_t v5 = sub_100064280();
  __chkstk_darwin(v5 - 8);
  char v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006DC8(&qword_10007E528);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  char v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v32 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v32 - v15;
  uint64_t v17 = sub_100064340();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  unint64_t v23 = (char *)&v32 - v22;
  uint64_t v24 = sub_1000641E0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(a3, 1, v24) == 1)
  {
    uint64_t v25 = v33;
    if (v33 == 0xD000000000000014 && a2 == 0x80000001000695E0 || (sub_100064C10() & 1) != 0)
    {
      return 7;
    }
    else if (v25 == 0xD000000000000016 && a2 == 0x8000000100069580 || (sub_100064C10() & 1) != 0)
    {
      return 8;
    }
    else if (v25 == 0xD000000000000018 && a2 == 0x80000001000695A0 || (sub_100064C10() & 1) != 0)
    {
      return 9;
    }
    else if (v25 == 0xD000000000000019 && a2 == 0x8000000100069600 || (sub_100064C10() & 1) != 0)
    {
      return 10;
    }
    else if (v25 == 0x6C656D726163 && a2 == 0xE600000000000000)
    {
      return 11;
    }
    else
    {
      char v29 = sub_100064C10();
      BOOL v31 = v25 == 0xD000000000000018 && a2 == 0x8000000100069620;
      uint64_t v26 = 11;
      if ((v29 & 1) == 0
        && !v31
        && (sub_100064C10() & 1) == 0
        && (v25 != 0x6D726F6665657266 || a2 != 0xE800000000000000))
      {
        if (sub_100064C10()) {
          return 11;
        }
        else {
          return 12;
        }
      }
    }
  }
  else
  {
    unint64_t v32 = v7;
    swift_bridgeObjectRetain();
    sub_100064350();
    uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v27(v16, 1, v17) == 1)
    {
      sub_100009CA4((uint64_t)v16, &qword_10007E528);
      swift_bridgeObjectRetain();
      sub_100064270();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v11, 1, 1, v17);
      sub_1000642D0();
      if (v27(v14, 1, v17) == 1)
      {
        sub_100009CA4((uint64_t)v14, &qword_10007E528);
        return 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v14, v17);
        uint64_t v26 = sub_100022E10();
        (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v17);
      uint64_t v26 = sub_100022E10();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v23, v17);
    }
  }
  return v26;
}

uint64_t sub_100023564(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100064280();
  __chkstk_darwin(v4 - 8);
  uint64_t v39 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v6 - 8);
  char v38 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006DC8(&qword_10007E528);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  char v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v37 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v37 - v15;
  uint64_t v17 = sub_100064340();
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v23 = (char *)v37 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v27 = (char *)v37 - v26;
  if (a1 == 0x726464756F6C6369 && a2 == 0xEB00000000657669) {
    return 1;
  }
  uint64_t v28 = v25;
  uint64_t v29 = v24;
  if (sub_100064C10()) {
    return 1;
  }
  if (a1 == 0x737265626D756ELL && a2 == 0xE700000000000000 || (sub_100064C10() & 1) != 0) {
    return 2;
  }
  if (a1 == 0x7365676170 && a2 == 0xE500000000000000 || (sub_100064C10() & 1) != 0) {
    return 1;
  }
  if (a1 == 0x65746F6E79656BLL && a2 == 0xE700000000000000 || (sub_100064C10() & 1) != 0) {
    return 3;
  }
  if (a1 == 0x7365746F6ELL && a2 == 0xE500000000000000 || (sub_100064C10() & 1) != 0) {
    return 7;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x8000000100069580 || (sub_100064C10() & 1) != 0) {
    return 8;
  }
  if (a1 == 0x7265646E696D6572 && a2 == 0xE900000000000073
    || (sub_100064C10() & 1) != 0
    || a1 == 0xD000000000000018 && a2 == 0x80000001000695A0
    || (sub_100064C10() & 1) != 0)
  {
    return 9;
  }
  if (a1 == 0xD000000000000011 && a2 == 0x80000001000695C0 || (sub_100064C10() & 1) != 0) {
    return 10;
  }
  if (a1 == 0x6D726F6665657266 && a2 == 0xE800000000000000 || (sub_100064C10() & 1) != 0) {
    return 11;
  }
  swift_bridgeObjectRetain();
  sub_100064350();
  v37[0] = *(void *)(v28 + 48);
  v37[1] = v28 + 48;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v37[0])(v16, 1, v29) == 1)
  {
    sub_100009CA4((uint64_t)v16, &qword_10007E528);
    swift_bridgeObjectRetain();
    sub_100064270();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v11, 1, 1, v29);
    sub_1000642D0();
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v37[0])(v14, 1, v29) == 1)
    {
      sub_100009CA4((uint64_t)v14, &qword_10007E528);
      return 12;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v20, v14, v29);
      uint64_t v30 = sub_100022E10();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v29);
    }
  }
  else
  {
    uint64_t v32 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v27, v16, v29);
    sub_1000642E0();
    char v33 = sub_100064330();
    unint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
    v34(v23, v29);
    if (v33)
    {
      uint64_t v30 = sub_100022E10();
    }
    else
    {
      uint64_t v35 = sub_1000641E0();
      uint64_t v36 = (uint64_t)v38;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v38, 1, 1, v35);
      uint64_t v30 = sub_100022FF8(a1, a2, v36);
      sub_100009CA4(v36, &qword_10007E520);
    }
    v34(v27, v29);
  }
  return v30;
}

ValueMetadata *type metadata accessor for UTISupport()
{
  return &type metadata for UTISupport;
}

uint64_t getEnumTagSinglePayload for UTISupport.SharingItemType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UTISupport.SharingItemType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x100023E48);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UTISupport.SharingItemType()
{
  return &type metadata for UTISupport.SharingItemType;
}

uint64_t getEnumTagSinglePayload for CloudKitAppType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CloudKitAppType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x100023FDCLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

unsigned char *sub_100024004(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CloudKitAppType()
{
  return &type metadata for CloudKitAppType;
}

unint64_t sub_100024020()
{
  unint64_t result = qword_10007E550;
  if (!qword_10007E550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E550);
  }
  return result;
}

unint64_t sub_100024078()
{
  unint64_t result = qword_10007E558;
  if (!qword_10007E558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E558);
  }
  return result;
}

uint64_t sub_1000240CC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100079820;
  v6._object = a2;
  unint64_t v4 = sub_100064BE0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xE) {
    return 14;
  }
  else {
    return v4;
  }
}

_WORD *sub_100024120()
{
  uint64_t v1 = sub_100064380();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v96 = v1;
  uint64_t v97 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  v94 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v92 = (char *)&v87 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v93 = (char *)&v87 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = (uint8_t *)&v87 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (void (*)(char *, uint64_t))((char *)&v87 - v13);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v87 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v87 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v87 - v21;
  uint64_t v95 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t KeyPath = v101;
  if (v101) {
    return KeyPath;
  }
  uint64_t v90 = v14;
  uint64_t v91 = v20;
  uint64_t v88 = v11;
  id v89 = v17;
  BOOL v100 = 1;
  sub_100064360();
  uint64_t v24 = sub_100064370();
  os_log_type_t v25 = sub_100064930();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "configuredContainer needsBundleIDOverride initially true", v26, 2u);
    swift_slowDealloc();
  }

  uint64_t v28 = v97 + 8;
  uint64_t v27 = *(void (**)(char *, uint64_t))(v97 + 8);
  uint64_t v29 = v22;
  uint64_t v30 = v96;
  v27(v29, v96);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  BOOL v31 = v101;
  if (v101)
  {
    uint64_t v32 = v91;
    sub_100064360();
    uint64_t KeyPath = v31;
    char v33 = sub_100064370();
    os_log_type_t v34 = sub_100064930();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      id v89 = KeyPath;
      uint64_t v36 = (uint8_t *)v35;
      uint64_t v101 = (_WORD *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v88 = v36 + 4;
      id v37 = v89;
      uint64_t v97 = v28;
      uint64_t v90 = v27;
      id v38 = v37;
      id v39 = [v37 description];
      uint64_t v40 = sub_1000646E0();
      unint64_t v42 = v41;

      uint64_t v103 = (_WORD *)sub_10004BEF0(v40, v42, (uint64_t *)&v101);
      sub_100064A90();

      uint64_t v27 = v90;
      uint64_t v28 = v97;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "configuredContainer using setupInfo: %s", v36, 0xCu);
      swift_arrayDestroy();
      uint64_t v30 = v96;
      swift_slowDealloc();
      uint64_t KeyPath = v89;
      swift_slowDealloc();

      id v43 = v91;
    }
    else
    {

      id v43 = v32;
    }
    v27(v43, v30);
    uint64_t v50 = v98;
    id v51 = [KeyPath containerOptions];
    id v52 = [v51 applicationBundleIdentifierOverrideForContainerAccess];

    if (v52) {
    BOOL v100 = v52 == 0;
    }
  }
  else
  {
    swift_getKeyPath();
    uint64_t KeyPath = (_WORD *)swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v44 = v101;
    if (v101)
    {
      uint64_t v45 = v28;
      uint64_t KeyPath = v89;
      sub_100064360();
      uint64_t v46 = v44;
      uint64_t v47 = sub_100064370();
      os_log_type_t v48 = sub_100064930();
      if (os_log_type_enabled(v47, v48))
      {
        char v49 = (uint8_t *)swift_slowAlloc();
        uint64_t v91 = (char *)swift_slowAlloc();
        uint64_t v97 = v45;
        uint64_t v90 = v27;
        *(_DWORD *)char v49 = 138412290;
        uint64_t v101 = v46;
        uint64_t v46 = v46;
        uint64_t v30 = v96;
        uint64_t v45 = v97;
        sub_100064A90();
        *(void *)uint64_t v91 = v44;

        _os_log_impl((void *)&_mh_execute_header, v47, v48, "configuredContainer with id: %@", v49, 0xCu);
        sub_100006DC8(&qword_10007F1B0);
        uint64_t v27 = v90;
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t KeyPath = v89;
        swift_slowDealloc();
      }
      else
      {

        uint64_t v47 = v46;
      }
      uint64_t v50 = v98;

      v27((char *)KeyPath, v30);
      uint64_t v28 = v45;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (v101 != 9)
      {
        uint64_t v62 = (char *)v90;
        sub_100064360();
        uint64_t v63 = sub_100064370();
        os_log_type_t v64 = sub_100064910();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t KeyPath = (_WORD *)swift_slowAlloc();
          *uint64_t KeyPath = 0;
          _os_log_impl((void *)&_mh_execute_header, v63, v64, "configuredContainer throwing as it can't build a container", (uint8_t *)KeyPath, 2u);
          swift_slowDealloc();
        }

        v27(v62, v30);
        unint64_t v65 = 0xD000000000000019;
        unint64_t v66 = 0x80000001000691A0;
        goto LABEL_40;
      }
      sub_1000646E0();
      sub_100064700();
      uint64_t KeyPath = v53;
      swift_retain();
      swift_bridgeObjectRelease();
      id v54 = objc_allocWithZone((Class)CKContainerID);
      NSString v55 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v56 = [v54 initWithContainerIdentifier:v55 environment:1];

      sub_100009ED8(v56, 0);
      swift_release();

      uint64_t v57 = v88;
      sub_100064360();
      swift_retain_n();
      uint64_t v58 = sub_100064370();
      os_log_type_t v59 = sub_100064930();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v90 = v27;
        uint64_t v97 = v28;
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t KeyPath = (_WORD *)swift_slowAlloc();
        *(_DWORD *)uint64_t v60 = 138412290;
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100064480();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v61 = (uint64_t)v101;
        if (!v101) {
          uint64_t v101 = 0;
        }
        sub_100064A90();
        uint64_t v28 = v97;
        uint64_t v27 = v90;
        *(void *)uint64_t KeyPath = v61;
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "configuredContainer with containerID: %@", v60, 0xCu);
        sub_100006DC8(&qword_10007F1B0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v57 = v88;
      }
      else
      {

        swift_release_n();
      }
      uint64_t v30 = v96;
      v27((char *)v57, v96);
      uint64_t v50 = v98;
    }
  }
  swift_retain();
  sub_10000A6A0();
  swift_release();
  if (v50) {
    return KeyPath;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t KeyPath = v101;
  if (!v101)
  {
LABEL_36:
    uint64_t KeyPath = v94;
    sub_100064360();
    swift_retain_n();
    v80 = sub_100064370();
    os_log_type_t v81 = sub_100064930();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v97 = v28;
      uint64_t v90 = v27;
      v82 = (uint8_t *)swift_slowAlloc();
      uint64_t KeyPath = (_WORD *)swift_slowAlloc();
      uint64_t v103 = KeyPath;
      *(_DWORD *)v82 = 136315138;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      sub_100006DC8(&qword_10007EA40);
      uint64_t v83 = sub_1000646F0();
      uint64_t v101 = (_WORD *)sub_10004BEF0(v83, v84, (uint64_t *)&v103);
      sub_100064A90();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "configuredContainer throwing as it doesn't have a container or nil sourceAppBundleID: %s", v82, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v90(v94, v96);
    }
    else
    {

      swift_release_n();
      v27((char *)KeyPath, v30);
    }
    unint64_t v66 = 0x8000000100069680;
    unint64_t v65 = 0xD000000000000033;
LABEL_40:
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v85 = 0xD000000000000015;
    *(void *)(v85 + 8) = 0x8000000100069660;
    *(void *)(v85 + 16) = 0;
    *(void *)(v85 + 24) = v65;
    *(void *)(v85 + 32) = v66;
    *(unsigned char *)(v85 + 40) = 10;
    swift_willThrow();
    return KeyPath;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  unint64_t v67 = v102;
  if (!v102)
  {

    goto LABEL_36;
  }
  uint64_t v90 = v27;
  uint64_t v97 = v28;
  uint64_t v68 = (uint64_t)v101;
  uint64_t v69 = v93;
  sub_100064360();
  BOOL v70 = v100;
  uint64_t v71 = sub_100064370();
  os_log_type_t v72 = sub_100064930();
  if (os_log_type_enabled(v71, v72))
  {
    uint64_t v73 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v73 = 67109120;
    LODWORD(v101) = v70;
    sub_100064A90();
    _os_log_impl((void *)&_mh_execute_header, v71, v72, "configuredContainer about to return container, needsBundleIDOverride: %{BOOL}d", v73, 8u);
    uint64_t v69 = v93;
    swift_slowDealloc();
  }

  v90(v69, v96);
  swift_beginAccess();
  if (v100)
  {
    id v74 = [KeyPath options];
    NSString v75 = sub_1000646A0();
    [v74 setApplicationBundleIdentifierOverride:v75];

    uint64_t v76 = v92;
    sub_100064360();
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_100064370();
    os_log_type_t v78 = sub_100064930();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      uint64_t v103 = (_WORD *)swift_slowAlloc();
      *(_DWORD *)uint64_t v79 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_10004BEF0(v68, v67, (uint64_t *)&v103);
      sub_100064A90();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "configuredContainer options applicationBundleIDOverride set to: %s", v79, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v90(v92, v96);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v90(v76, v96);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return KeyPath;
}

double sub_10002510C@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10002518C()
{
  return sub_100064490();
}

uint64_t sub_100025210@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_100025224(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_100025238@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_10002524C(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_100025260@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_100025274@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000252F0(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_100025304(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_100064490();
}

uint64_t sub_100025378@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_1000253A0(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_1000253C8@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_1000253F0(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_100025418@<X0>(void *a1@<X8>)
{
  return sub_100025274(a1);
}

uint64_t sub_100025440(void **a1)
{
  return sub_100025304(a1);
}

uint64_t sub_100025478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = v5;
  *(unsigned char *)(v6 + 136) = a5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 16) = a1;
  sub_100006DC8(&qword_10007E520);
  *(void *)(v6 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_100025518, 0, 0);
}

uint64_t sub_100025518()
{
  uint64_t v1 = v0[5];
  id v2 = (void *)(v0[6] + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPI);
  *id v2 = v0[4];
  v2[1] = v1;
  swift_release();
  v0[8] = sub_100064870();
  swift_retain();
  v0[9] = sub_100064860();
  uint64_t v4 = sub_100064830();
  return _swift_task_switch(sub_1000255D8, v4, v3);
}

uint64_t sub_1000255D8()
{
  swift_release();
  type metadata accessor for CKShareModel();
  swift_allocObject();
  *(void *)(v0 + 80) = sub_10000ADBC();
  return _swift_task_switch(sub_100025660, 0, 0);
}

uint64_t sub_100025660()
{
  *(void *)(v0 + 88) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_1000256EC, v2, v1);
}

uint64_t sub_1000256EC()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  type metadata accessor for OptionsModel();
  swift_allocObject();
  *(void *)(v0 + 96) = sub_1000626E4(v1);
  return _swift_task_switch(sub_10002577C, 0, 0);
}

uint64_t sub_10002577C()
{
  *(void *)(v0 + 104) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_100025808, v2, v1);
}

uint64_t sub_100025808()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_release();
  type metadata accessor for SharingModel();
  swift_allocObject();
  *(void *)(v0 + 112) = sub_100036688(v1);
  return _swift_task_switch(sub_100025898, 0, 0);
}

uint64_t sub_100025898()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[2];
  uint64_t v3 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel;
  *(void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel) = v0[14];
  swift_release();
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_share);
  *(void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_share) = v2;

  uint64_t v5 = *(void *)(v1 + v3);
  v0[15] = v5;
  if (!v5) {
    return sub_100064B90();
  }
  uint64_t v6 = v0[7];
  uint64_t v7 = (void *)v0[2];
  uint64_t v8 = sub_1000641E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  id v9 = v7;
  swift_retain();
  v0[16] = sub_100064860();
  uint64_t v11 = sub_100064830();
  return _swift_task_switch(sub_100025A28, v11, v10);
}

uint64_t sub_100025A28()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  char v4 = *(unsigned char *)(v0 + 136);
  uint64_t v5 = *(void **)(v0 + 24);
  swift_release();
  sub_100027318(v3, v5, v2, v4, v1);
  swift_release();
  sub_10000EB0C(v2);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100025AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = sub_100064380();
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_100064090();
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v4[25] = swift_task_alloc();
  uint64_t v7 = sub_1000641E0();
  v4[26] = v7;
  v4[27] = *(void *)(v7 - 8);
  v4[28] = swift_task_alloc();
  return _swift_task_switch(sub_100025C80, 0, 0);
}

uint64_t sub_100025C80()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = (void *)(v0[18] + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPI);
  *uint64_t v2 = v0[16];
  v2[1] = v1;
  swift_release();
  v0[29] = sub_100064870();
  swift_retain();
  v0[30] = sub_100064860();
  uint64_t v4 = sub_100064830();
  return _swift_task_switch(sub_100025D40, v4, v3);
}

uint64_t sub_100025D40()
{
  swift_release();
  type metadata accessor for CKShareModel();
  swift_allocObject();
  *(void *)(v0 + 248) = sub_10000ADBC();
  return _swift_task_switch(sub_100025DC8, 0, 0);
}

uint64_t sub_100025DC8()
{
  *(void *)(v0 + 256) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_100025E54, v2, v1);
}

uint64_t sub_100025E54()
{
  uint64_t v1 = *(void *)(v0 + 248);
  swift_release();
  type metadata accessor for OptionsModel();
  swift_allocObject();
  *(void *)(v0 + 264) = sub_1000626E4(v1);
  return _swift_task_switch(sub_100025EE4, 0, 0);
}

uint64_t sub_100025EE4()
{
  *(void *)(v0 + 272) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_100025F70, v2, v1);
}

uint64_t sub_100025F70()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_release();
  type metadata accessor for SharingModel();
  swift_allocObject();
  *(void *)(v0 + 280) = sub_100036688(v1);
  return _swift_task_switch(sub_100026000, 0, 0);
}

uint64_t sub_100026000()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[25];
  uint64_t v5 = v0[18];
  uint64_t v6 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel;
  *(void *)(v5 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel) = v0[35];
  swift_release();
  uint64_t v7 = v5 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_fileOrFolderURL;
  swift_beginAccess();
  sub_1000283FC(v1, v7);
  swift_endAccess();
  sub_100009C3C(v1, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    sub_10000EB0C(v0[25]);
  }
  else
  {
    uint64_t v8 = v0[24];
    (*(void (**)(void, void, void))(v0[27] + 32))(v0[28], v0[25], v0[26]);
    sub_100006DC8(&qword_10007E530);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100066DD0;
    *(void *)(inited + 32) = NSURLIsPackageKey;
    *(void *)(inited + 40) = NSURLIsDirectoryKey;
    uint64_t v10 = NSURLIsPackageKey;
    uint64_t v11 = NSURLIsDirectoryKey;
    uint64_t v12 = sub_10004C990(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    URL.evictionSafeResourceValues(forKeys:)((uint64_t)v12, v8);
    uint64_t v13 = v0[27];
    os_log_t log = (os_log_t)v0[26];
    uint64_t v25 = v0[28];
    uint64_t v15 = v0[23];
    uint64_t v14 = v0[24];
    uint64_t v16 = v0[22];
    swift_bridgeObjectRelease();
    char v17 = sub_100064080();
    char v18 = sub_100064030();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    (*(void (**)(uint64_t, os_log_t))(v13 + 8))(v25, log);
    if (v18 == 2 || (v17 & 1) != 0) {
      char v19 = 0;
    }
    else {
      char v19 = v18 & 1;
    }
    *(unsigned char *)(v0[18] + 16) = v19;
  }
  uint64_t v20 = *(void *)(v5 + v6);
  v0[36] = v20;
  if (!v20) {
    return sub_100064B90();
  }
  swift_retain();
  v0[37] = sub_100064860();
  uint64_t v22 = sub_100064830();
  return _swift_task_switch(sub_100026700, v22, v21);
}

uint64_t sub_100026700()
{
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  swift_release();
  sub_100027318(v2, 0, v3, 0, v1);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4(0);
}

uint64_t sub_1000267BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return _swift_task_switch(sub_1000267E4, 0, 0);
}

uint64_t sub_1000267E4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)(v0[6]
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIFileOrSetup);
  *uint64_t v2 = v0[4];
  v2[1] = v1;
  swift_release();
  v0[7] = sub_100064870();
  swift_retain();
  v0[8] = sub_100064860();
  uint64_t v4 = sub_100064830();
  return _swift_task_switch(sub_1000268A4, v4, v3);
}

uint64_t sub_1000268A4()
{
  swift_release();
  type metadata accessor for CKShareModel();
  swift_allocObject();
  *(void *)(v0 + 72) = sub_10000ADBC();
  return _swift_task_switch(sub_10002692C, 0, 0);
}

uint64_t sub_10002692C()
{
  *(void *)(v0 + 80) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_1000269B8, v2, v1);
}

uint64_t sub_1000269B8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_release();
  type metadata accessor for OptionsModel();
  swift_allocObject();
  *(void *)(v0 + 88) = sub_1000626E4(v1);
  return _swift_task_switch(sub_100026A48, 0, 0);
}

uint64_t sub_100026A48()
{
  *(void *)(v0 + 96) = sub_100064860();
  uint64_t v2 = sub_100064830();
  return _swift_task_switch(sub_100026AD4, v2, v1);
}

uint64_t sub_100026AD4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  type metadata accessor for SharingModel();
  swift_allocObject();
  *(void *)(v0 + 104) = sub_100036688(v1);
  return _swift_task_switch(sub_100026B64, 0, 0);
}

uint64_t sub_100026B64()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel;
  *(void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel) = v0[13];
  swift_release();
  uint64_t v3 = *(void *)(v1 + v2);
  v0[14] = v3;
  if (!v3) {
    return sub_100064B90();
  }
  swift_retain();
  v0[15] = sub_100064860();
  uint64_t v5 = sub_100064830();
  return _swift_task_switch(sub_100026C84, v5, v4);
}

uint64_t sub_100026C84()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  sub_100027318(v2, v3, v4, 0, v1);
  swift_release();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100026D14()
{
  *(unsigned char *)(v0 + 16) = 2;
  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_fileOrFolderURL;
  uint64_t v2 = sub_1000641E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_itemUTI);
  *uint64_t v3 = 0;
  v3[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_share) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_sharingModel) = 0;
  uint64_t v4 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPI);
  *uint64_t v4 = nullsub_1;
  v4[1] = 0;
  uint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPISharingURL);
  *uint64_t v5 = nullsub_1;
  v5[1] = 0;
  uint64_t v6 = (void *)(v0
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIFileOrSetup);
  *uint64_t v6 = nullsub_1;
  v6[1] = 0;
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIRemove);
  *uint64_t v7 = nullsub_1;
  v7[1] = 0;
  uint64_t v8 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIMail);
  *uint64_t v8 = nullsub_1;
  v8[1] = 0;
  uint64_t v9 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIMetadata);
  *uint64_t v9 = nullsub_1;
  v9[1] = 0;
  uint64_t v10 = (void *)(v0
                 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPIUserStatus);
  *uint64_t v10 = j_nullsub_1;
  v10[1] = 0;
  *(void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_appIcon) = 0;
  uint64_t v11 = (void *)(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_appName);
  void *v11 = 0;
  v11[1] = 0;
  return v0;
}

uint64_t sub_100026EAC()
{
  sub_10000EB0C(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_fileOrFolderURL);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100026FB8()
{
  sub_100026EAC();

  return swift_deallocClassInstance();
}

uint64_t sub_100027010()
{
  return type metadata accessor for ModelDelegateSPI();
}

uint64_t type metadata accessor for ModelDelegateSPI()
{
  uint64_t result = qword_10007E588;
  if (!qword_10007E588) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100027064()
{
  sub_100027134();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100027134()
{
  if (!qword_10007F360)
  {
    sub_1000641E0();
    unint64_t v0 = sub_100064A80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007F360);
    }
  }
}

uint64_t sub_10002718C(uint64_t a1)
{
  uint64_t result = sub_100027FB4(&qword_10007E678);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000271D0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000271E4()
{
  return sub_100009540();
}

uint64_t sub_1000271F8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100027278(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_100064490();
}

uint64_t sub_1000272F0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100027304()
{
  return sub_100009540();
}

uint64_t sub_100027318(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v75 = a3;
  BOOL v70 = a2;
  uint64_t v7 = sub_100006DC8(&qword_10007E520);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v71 = (uint64_t)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v72 = (char *)&v69 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v69 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v69 - v15;
  uint64_t v17 = sub_1000641E0();
  uint64_t v76 = *(void *)(v17 - 8);
  uint64_t v77 = v17;
  __chkstk_darwin(v17);
  uint64_t v73 = (char *)&v69 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100064380();
  uint64_t v78 = *(void *)(v19 - 8);
  uint64_t v79 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  id v74 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v69 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v69 - v25;
  uint64_t v27 = sub_100027FB4(&qword_10007E688);
  sub_10004A1FC();
  *(void *)(a5 + 48) = v27;
  swift_unknownObjectWeakAssign();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectRelease();
  if (!Strong)
  {
    sub_100064360();
    uint64_t v29 = sub_100064370();
    os_log_type_t v30 = sub_100064930();
    if (os_log_type_enabled(v29, v30))
    {
      BOOL v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "ext computed property--extensionController is nil--will assert", v31, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v78 + 8))(v26, v79);
  }
  uint64_t v69 = v24;
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_35;
  }
  char v33 = *(void **)(result + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_share);
  id v34 = v33;
  swift_unknownObjectRelease();
  if (v33)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v81 = v33;
    swift_retain();
    sub_100064490();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v35 = (void *)v81;
  if ((void)v81)
  {
    swift_retain();
    id v36 = [v35 containerID];
    sub_100009ED8(v36, 0);
    swift_release();

    sub_100035DB4(0, a4 & 1);
  }
  else
  {
    swift_retain();
    sub_100061F10(2u);
    swift_release();
    swift_retain();
    sub_100062254(1u);
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  id v37 = (void *)v81;
  if ((void)v81)
  {
    id v38 = [(id)v81 containerIdentifier];
    uint64_t v39 = sub_1000646E0();
    uint64_t v41 = v40;

    sub_1000646E0();
    uint64_t v42 = sub_100064700();
    uint64_t v44 = v43;
    swift_bridgeObjectRelease();
    if (v39 == v42 && v41 == v44)
    {
      swift_bridgeObjectRelease_n();
LABEL_16:
      swift_getKeyPath();
      swift_getKeyPath();
      long long v81 = xmmword_100066DE0;
      swift_retain();
      sub_100064490();

      goto LABEL_19;
    }
    char v45 = sub_100064C10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v45) {
      goto LABEL_16;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v81 = 0xD000000000000013;
  *((void *)&v81 + 1) = 0x8000000100069810;
  swift_retain();
  sub_100064490();
LABEL_19:
  sub_100009C3C(v75, (uint64_t)v16);
  uint64_t v47 = v76;
  uint64_t v46 = v77;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v76 + 48))(v16, 1, v77) != 1)
  {
    id v52 = v73;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v73, v16, v46);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v14, v52, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v14, 0, 1, v46);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v53 = (uint64_t)v72;
    sub_100064480();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100009C3C((uint64_t)v14, v71);
    swift_retain();
    sub_100064490();
    sub_100043BDC(v53);
    sub_10000EB0C((uint64_t)v14);
    sub_10000EB0C(v53);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v81) = 9;
    swift_retain();
    sub_100064490();
    uint64_t v54 = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!v54)
    {
      NSString v55 = v69;
      sub_100064360();
      id v56 = sub_100064370();
      os_log_type_t v57 = sub_100064930();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v58 = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "ext computed property--extensionController is nil--will assert", v58, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v78 + 8))(v55, v79);
    }
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (result)
    {
      char v59 = *(unsigned char *)(result + 16);
      swift_unknownObjectRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v81) = v59 & 1;
      swift_retain();
      sub_100064490();
      swift_getKeyPath();
      swift_getKeyPath();
      long long v81 = xmmword_100066DE0;
      swift_retain();
      sub_100064490();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100064480();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v60 = v81;

      char v49 = v74;
      if (!v60)
      {
        sub_1000646E0();
        sub_100064700();
        swift_retain();
        swift_bridgeObjectRelease();
        id v61 = objc_allocWithZone((Class)CKContainerID);
        NSString v62 = sub_1000646A0();
        swift_bridgeObjectRelease();
        id v63 = [v61 initWithContainerIdentifier:v62 environment:1];

        sub_100009ED8(v63, 0);
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v77);
      goto LABEL_30;
    }
LABEL_35:
    __break(1u);
    return result;
  }
  sub_10000EB0C((uint64_t)v16);
  char v48 = sub_10003C9D4();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v81) = v48;
  swift_retain();
  sub_100064490();
  char v49 = v74;
  uint64_t v50 = v70;
  if (v70)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long v81 = v50;
    id v51 = v50;
    swift_retain();
    sub_100064490();
  }
LABEL_30:
  sub_100064360();
  swift_retain_n();
  os_log_type_t v64 = sub_100064370();
  os_log_type_t v65 = sub_100064930();
  if (os_log_type_enabled(v64, v65))
  {
    unint64_t v66 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    *(_DWORD *)unint64_t v66 = 136315138;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    sub_100006DC8(&qword_10007EA40);
    uint64_t v67 = sub_1000646F0();
    *(void *)&long long v81 = sub_10004BEF0(v67, v68, &v80);
    sub_100064A90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "setUpForExplicitSPI final sourceAppBundleID: %s.", v66, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v78 + 8))(v49, v79);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v81) = 1;
  swift_retain();
  return sub_100064490();
}

uint64_t sub_100027FB4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ModelDelegateSPI();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100028018@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100028040()
{
  return sub_100009540();
}

uint64_t sub_100028078@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000280A0()
{
  return sub_100009540();
}

uint64_t sub_1000280C8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100064380();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  id v11 = a1;
  uint64_t v12 = sub_100064370();
  os_log_type_t v13 = sub_100064910();
  if (os_log_type_enabled(v12, v13))
  {
    char v33 = v6;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = v8;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v35 = v30;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v28 = v15 + 4;
    id v16 = v11;
    uint64_t v32 = v2;
    id v17 = v16;
    id v18 = [v16 description];
    uint64_t v19 = sub_1000646E0();
    uint64_t v29 = v7;
    id v20 = v11;
    uint64_t v21 = v19;
    unint64_t v23 = v22;

    uint64_t v6 = v33;
    uint64_t v24 = v21;
    id v11 = v20;
    uint64_t v34 = sub_10004BEF0(v24, v23, &v35);
    sub_100064A90();

    uint64_t v2 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "cancelAppExtension error: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v25 = *(void (**)(char *, void, id))(v2
                                                  + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_concludeSPI);
  uint64_t v26 = sub_1000641E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
  swift_retain();
  v25(v6, 0, v11);
  swift_release();
  return sub_10000EB0C((uint64_t)v6);
}

uint64_t sub_1000283FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_100028464()
{
  unint64_t result = qword_10007E6A0;
  if (!qword_10007E6A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10007E6A0);
  }
  return result;
}

uint64_t sub_1000284A8(char a1)
{
  if (a1 == 8) {
    return 0x6E776F6E6B6E752ELL;
  }
  if (a1 == 9) {
    return 0x6E656D75636F642ELL;
  }
  sub_100064B00(19);
  swift_bridgeObjectRelease();
  uint64_t v3 = 8 * a1;
  v4._countAndFlagsBits = *(void *)&aUnspeciNotes_0[v3];
  v4._object = *(void **)&aFied_0[v3];
  sub_100064760(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 41;
  v5._object = (void *)0xE100000000000000;
  sub_100064760(v5);
  return 0xD000000000000010;
}

uint64_t sub_100028598(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = sub_100006DC8(&qword_10007E498);
  *(void *)(v2 + 24) = v4;
  *(void *)(v2 + 32) = swift_task_alloc();
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 48) = swift_task_alloc();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 56) = v5;
  uint64_t v6 = *(int *)(v4 + 48);
  *(_DWORD *)(v2 + 88) = v6;
  uint64_t v7 = v5 + v6;
  *(_DWORD *)(v2 + 92) = *(_DWORD *)(v4 + 64);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1000286B8;
  return sub_10001B2B8(v7, a2);
}

uint64_t sub_1000286B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000287B8, 0, 0);
}

uint64_t sub_1000287B8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(int *)(v0 + 92);
  uint64_t v5 = *(void **)(v0 + 48);
  uint64_t v4 = *(void **)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = (uint64_t)v4 + *(int *)(v0 + 88);
  *uint64_t v4 = v1;
  *(void *)((char *)v4 + v3) = v2;
  uint64_t v8 = (uint64_t)v5 + *(int *)(v6 + 48);
  uint64_t v9 = *(int *)(v6 + 64);
  *uint64_t v5 = v1;
  sub_100009C3C(v7, v8);
  *(void *)((char *)v5 + v9) = v2;
  if (v2)
  {
    uint64_t v10 = *(void **)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 56);
    id v12 = v10;
    sub_100009CA4(v8, &qword_10007E520);
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v13 = 0xD000000000000010;
    *(void *)(v13 + 8) = 0x8000000100069860;
    *(void *)(v13 + 24) = 0;
    *(void *)(v13 + 32) = 0;
    *(void *)(v13 + 16) = v10;
    *(unsigned char *)(v13 + 40) = 5;
    swift_willThrow();
    sub_100009CA4(v11, &qword_10007E498);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
  else
  {
    id v16 = *(void **)(v0 + 72);
    id v17 = *(void ***)(v0 + 56);
    uint64_t v30 = *(int *)(v0 + 92);
    uint64_t v19 = *(void *)(v0 + 32);
    id v18 = *(void **)(v0 + 40);
    uint64_t v21 = *(void *)(v0 + 16);
    uint64_t v20 = *(void *)(v0 + 24);
    uint64_t v22 = (uint64_t)v17 + *(int *)(v0 + 88);
    id v23 = v16;
    sub_100009CA4(v8, &qword_10007E520);
    uint64_t v24 = (uint64_t)v18 + *(int *)(v20 + 48);
    uint64_t v25 = *(int *)(v20 + 64);
    *id v18 = v16;
    sub_100009C3C(v22, v24);
    *(void *)((char *)v18 + v25) = 0;
    uint64_t v26 = v19 + *(int *)(v20 + 48);
    uint64_t v27 = *v17;
    sub_10001A5B8(v22, v26);

    sub_10001A5B8(v26, v21);
    sub_100009CA4(v24, &qword_10007E520);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v29 = *(void *)(v0 + 72);
    return v28(v29);
  }
}

uint64_t sub_100028A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  *(unsigned char *)(v6 + 49) = a6;
  *(unsigned char *)(v6 + 48) = a5;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  return _swift_task_switch(sub_100028A40, 0, 0);
}

uint64_t sub_100028A40()
{
  unint64_t v1 = *(void *)(v0 + 16);
  if (v1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (uint64_t i = swift_bridgeObjectRetain(); v2; uint64_t i = *(void *)(v0 + 16))
  {
    uint64_t v4 = 0;
    uint64_t v19 = (const mach_header_64 *)((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
    unint64_t v5 = v1 & 0xC000000000000001;
    uint64_t v6 = i + 32;
    uint64_t v7 = *(void *)(v0 + 40);
    p_name = (char **)(&stru_10007CFF8 + 8);
    while (1)
    {
      id v10 = v5 ? (id)sub_100064B20() : *(id *)(v6 + 8 * v4);
      unint64_t v1 = (unint64_t)v10;
      uint64_t v11 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      if (*(unsigned char *)(v0 + 49) == 1 && objc_msgSend(v10, p_name[130]) != (id)1)
      {
        uint64_t v12 = 1;
        switch(*(unsigned char *)(v0 + 36))
        {
          case 1:
            uint64_t v12 = 3;
            goto LABEL_16;
          case 2:
            uint64_t v12 = 2;
            goto LABEL_16;
          case 3:
            return sub_100064B90();
          default:
LABEL_16:
            [(id)v1 setPermission:v12];
            uint64_t v13 = *(void *)(v7 + 16);
            if (!v13) {
              goto LABEL_33;
            }
            if (*(unsigned char *)(v7 + 32) != 1)
            {
              if (v13 == 1) {
                goto LABEL_34;
              }
LABEL_26:
              if (*(unsigned char *)(v0 + 48)) {
                goto LABEL_4;
              }
              goto LABEL_27;
            }
            if (v13 == 1) {
              goto LABEL_35;
            }
            if (*(unsigned char *)(v7 + 33) != 1 || v19 != &_mh_execute_header) {
              goto LABEL_26;
            }
            if (objc_msgSend((id)v1, p_name[130]) == (id)3
              || (char v14 = *(unsigned char *)(v0 + 48), v18 = [(id)v1 role], v15 = sub_100064990(), (v14 & 1) != 0)
              || v18 == (id)v15)
            {
LABEL_4:
              uint64_t v9 = sub_100064990();
              goto LABEL_5;
            }
LABEL_27:
            uint64_t v9 = 3;
LABEL_5:
            [(id)v1 setRole:v9];
            p_name = &stru_10007CFF8.name;
            break;
        }
      }
      [*(id *)(v0 + 24) addParticipant:v1];

      ++v4;
      if (v11 == v2) {
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100064BA0();
  }
LABEL_28:
  swift_bridgeObjectRelease();
  id v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_100028D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 1036) = a6;
  *(void *)(v6 + 864) = a5;
  *(void *)(v6 + 856) = a4;
  *(void *)(v6 + 848) = a3;
  *(void *)(v6 + 840) = a2;
  *(void *)(v6 + 832) = a1;
  *(void *)(v6 + 872) = sub_100006DC8(&qword_10007E520);
  *(void *)(v6 + 880) = swift_task_alloc();
  *(void *)(v6 + 888) = swift_task_alloc();
  *(void *)(v6 + 896) = swift_task_alloc();
  uint64_t v7 = sub_100064380();
  *(void *)(v6 + 904) = v7;
  *(void *)(v6 + 912) = *(void *)(v7 - 8);
  *(void *)(v6 + 920) = swift_task_alloc();
  *(void *)(v6 + 928) = swift_task_alloc();
  *(void *)(v6 + 936) = swift_task_alloc();
  *(void *)(v6 + 944) = swift_task_alloc();
  *(void *)(v6 + 952) = swift_task_alloc();
  return _swift_task_switch(sub_100028E70, 0, 0);
}

uint64_t sub_100028E70()
{
  uint64_t v70 = v0;
  unint64_t v1 = *(void **)(v0 + 840);
  uint64_t v2 = (NSString *)sub_1000646A0();
  SEL v3 = NSSelectorFromString(v2);

  if ([v1 respondsToSelector:v3]) {
    unsigned int v4 = objc_msgSend(*(id *)(v0 + 840), "br_isCloudDocsShare");
  }
  else {
    unsigned int v4 = 0;
  }
  sub_100064360();
  swift_bridgeObjectRetain_n();
  unint64_t v5 = sub_100064370();
  os_log_type_t v6 = sub_100064930();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 952);
  uint64_t v9 = *(void *)(v0 + 912);
  uint64_t v10 = *(void *)(v0 + 904);
  if (v7)
  {
    uint64_t v66 = *(void *)(v0 + 904);
    char v11 = *(unsigned char *)(v0 + 857);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v13 = sub_1000284A8(v11);
    *(void *)(v0 + 824) = sub_10004BEF0(v13, v14, &v69);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 1024;
    *(_DWORD *)(v0 + 1032) = v4;
    sub_100064A90();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "saveShare attr.sharingType: %s, isCloudDocsShare: %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v15(v8, v66);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v15(v8, v10);
  }
  *(void *)(v0 + 960) = v15;
  if ((*(void *)(v0 + 856) & 0xFE00) == 0x800) {
    char v16 = 1;
  }
  else {
    char v16 = v4;
  }
  if (v16)
  {
    uint64_t v17 = *(void *)(v0 + 896);
    id v18 = *(void **)(v0 + 840);
    uint64_t v19 = *(void *)(v0 + 832);
    sub_100064360();
    sub_100009C3C(v19, v17);
    id v20 = v18;
    uint64_t v21 = sub_100064370();
    os_log_type_t v22 = sub_100064930();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = *(void *)(v0 + 928);
    uint64_t v25 = *(void *)(v0 + 904);
    uint64_t v26 = *(void *)(v0 + 896);
    if (v23)
    {
      uint64_t v68 = *(void *)(v0 + 928);
      uint64_t v27 = *(void *)(v0 + 888);
      uint64_t v28 = *(void **)(v0 + 840);
      uint64_t v63 = *(void *)(v0 + 904);
      uint64_t v29 = swift_slowAlloc();
      NSString v62 = (void *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      sub_100009C3C(v26, v27);
      uint64_t v30 = sub_1000646F0();
      *(void *)(v0 + 776) = sub_10004BEF0(v30, v31, &v69);
      sub_100064A90();
      swift_bridgeObjectRelease();
      sub_100009CA4(v26, &qword_10007E520);
      *(_WORD *)(v29 + 12) = 2112;
      *(void *)(v0 + 784) = v28;
      id v32 = v28;
      sub_100064A90();
      *NSString v62 = v28;

      _os_log_impl((void *)&_mh_execute_header, v21, v22, "saveShare performing CloudDocs (fileURL) operation \"%s\" -- %@", (uint8_t *)v29, 0x16u);
      sub_100006DC8(&qword_10007F1B0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v15(v68, v63);
    }
    else
    {
      uint64_t v42 = *(void **)(v0 + 840);
      sub_100009CA4(*(void *)(v0 + 896), &qword_10007E520);

      v15(v24, v25);
    }
    uint64_t v43 = (int8x16_t *)swift_task_alloc();
    *(void *)(v0 + 1008) = v43;
    v43[1] = vextq_s8(*(int8x16_t *)(v0 + 832), *(int8x16_t *)(v0 + 832), 8uLL);
    sub_100006174(&qword_10007E4D8);
    swift_asyncLet_begin();
    return _swift_asyncLet_get(v0 + 16, v0 + 696, sub_100029BC4, v0 + 656);
  }
  else
  {
    char v33 = *(void **)(v0 + 840);
    type metadata accessor for CloudKitOperations();
    uint64_t v34 = (void *)swift_allocObject();
    *(void *)(v0 + 968) = v34;
    v34[2] = 0xD000000000000021;
    v34[3] = 0x8000000100069910;
    v34[4] = 0xD000000000000016;
    v34[5] = 0x8000000100069940;
    v34[6] = 0xD00000000000001DLL;
    v34[7] = 0x8000000100069960;
    *(void *)(v0 + 712) = 0;
    *(void *)(v0 + 720) = 0;
    sub_100006DC8(&qword_10007EA40);
    sub_100064450();
    sub_100064360();
    id v35 = v33;
    id v36 = sub_100064370();
    os_log_type_t v37 = sub_100064930();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = *(void **)(v0 + 840);
    if (v38)
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v64 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 138412290;
      *(void *)(v0 + 816) = v39;
      id v41 = v39;
      sub_100064A90();
      void *v64 = v39;

      _os_log_impl((void *)&_mh_execute_header, v36, v37, "saveShare performing CloudKit operation %@", v40, 0xCu);
      sub_100006DC8(&qword_10007F1B0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v36 = *(NSObject **)(v0 + 840);
    }
    uint64_t v44 = *(void *)(v0 + 944);
    uint64_t v45 = *(void *)(v0 + 912);
    uint64_t v46 = *(void *)(v0 + 904);
    uint64_t v47 = *(void *)(v0 + 848);

    *(void *)(v0 + 976) = (v45 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v48 = ((uint64_t (*)(uint64_t, uint64_t))v15)(v44, v46);
    if (v47)
    {
      char v67 = *(unsigned char *)(v0 + 1036);
      uint64_t v65 = *(void *)(v0 + 864);
      uint64_t v56 = *(void *)(v0 + 856);
      uint64_t v57 = *(void *)(v0 + 848);
      uint64_t v58 = *(void *)(v0 + 840);
      uint64_t v59 = swift_task_alloc();
      *(void *)(v0 + 984) = v59;
      *(void *)(v59 + 16) = v34;
      *(void *)(v59 + 24) = v58;
      *(_WORD *)(v59 + 32) = v56;
      *(unsigned char *)(v59 + 34) = BYTE2(v56);
      *(unsigned char *)(v59 + 35) = BYTE3(v56);
      *(unsigned char *)(v59 + 36) = BYTE4(v56);
      *(unsigned char *)(v59 + 37) = BYTE5(v56) & 1;
      *(unsigned char *)(v59 + 38) = BYTE6(v56) & 1;
      *(void *)(v59 + 40) = v65;
      *(unsigned char *)(v59 + 48) = v67;
      *(void *)(v59 + 56) = v57;
      uint64_t v60 = (void *)swift_task_alloc();
      *(void *)(v0 + 992) = v60;
      unint64_t v55 = sub_10002A214();
      *uint64_t v60 = v0;
      v60[1] = sub_1000296F8;
      unint64_t v51 = 0xD000000000000029;
      unint64_t v52 = 0x8000000100068EC0;
      uint64_t v53 = sub_10002A1CC;
      uint64_t v48 = v0 + 800;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v54 = v59;
    }
    else
    {
      __break(1u);
    }
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v48, v49, v50, v51, v52, v53, v54, v55);
  }
}

uint64_t sub_1000296F8()
{
  *(void *)(*(void *)v1 + 1000) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100029814;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10002998C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100029814()
{
  uint64_t v1 = *(void *)(v0 + 968);
  swift_task_dealloc();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants18CloudKitOperations__ckSourceAppBundleID;
  uint64_t v3 = sub_100006DC8((uint64_t *)&unk_10007EE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_deallocClassInstance();
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

uint64_t sub_10002998C()
{
  uint64_t v1 = *(void **)(v0 + 840);
  uint64_t v2 = *(void *)(v0 + 800);
  sub_100064360();
  id v3 = v1;
  uint64_t v4 = sub_100064370();
  os_log_type_t v5 = sub_100064930();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 840);
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 138412290;
    *(void *)(v0 + 808) = v6;
    id v9 = v6;
    sub_100064A90();
    *uint64_t v8 = v6;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "saveShare completed CloudKit operation %@", v7, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v10 = *(void **)(v0 + 840);
  }
  swift_release();

  (*(void (**)(void, void))(v0 + 960))(*(void *)(v0 + 936), *(void *)(v0 + 904));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v11(v2);
}

uint64_t sub_100029BC4()
{
  uint64_t v1 = (void *)v0[87];
  v0[127] = v1;
  uint64_t v2 = (void *)v0[88];
  v0[128] = v2;
  id v3 = v2;
  id v4 = v1;
  return _swift_asyncLet_finish(v0 + 2, v0 + 87, sub_100029C54, v0 + 92);
}

uint64_t sub_100029C54()
{
  return _swift_task_switch(sub_100029C70, 0, 0);
}

uint64_t sub_100029C70()
{
  unint64_t v31 = v0;
  uint64_t v1 = v0[110];
  uint64_t v2 = (void *)v0[105];
  uint64_t v3 = v0[104];
  swift_task_dealloc();
  sub_100064360();
  sub_100009C3C(v3, v1);
  id v4 = v2;
  os_log_type_t v5 = sub_100064370();
  os_log_type_t v6 = sub_100064930();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v28 = v0[115];
    uint64_t v29 = (void (*)(uint64_t, uint64_t))v0[120];
    uint64_t v27 = v0[113];
    uint64_t v7 = v0[111];
    uint64_t v8 = v0[110];
    id v9 = (void *)v0[105];
    uint64_t v10 = swift_slowAlloc();
    char v11 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    sub_100009C3C(v8, v7);
    uint64_t v12 = sub_1000646F0();
    v0[99] = sub_10004BEF0(v12, v13, &v30);
    sub_100064A90();
    swift_bridgeObjectRelease();
    sub_100009CA4(v8, &qword_10007E520);
    *(_WORD *)(v10 + 12) = 2112;
    v0[91] = v9;
    id v14 = v9;
    sub_100064A90();
    void *v11 = v9;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "saveShare completed CloudDocs (fileURL) operation \"%s\" -- %@", (uint8_t *)v10, 0x16u);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v29(v28, v27);
  }
  else
  {
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[120];
    uint64_t v16 = v0[115];
    uint64_t v17 = v0[113];
    id v18 = (void *)v0[105];
    sub_100009CA4(v0[110], &qword_10007E520);

    v15(v16, v17);
  }
  uint64_t v19 = (void *)v0[128];
  id v20 = (void *)v0[127];
  if (v19)
  {
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v21 = 0xD000000000000032;
    *(void *)(v21 + 8) = 0x80000001000698A0;
    *(void *)(v21 + 24) = 0;
    *(void *)(v21 + 32) = 0;
    *(void *)(v21 + 16) = v19;
    *(unsigned char *)(v21 + 40) = 4;
    id v22 = v19;
    swift_willThrow();

LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  if (!v20)
  {
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v26 = 0xD000000000000032;
    *(void *)(v26 + 8) = 0x80000001000698A0;
    *(_OWORD *)(v26 + 16) = xmmword_100067100;
    *(void *)(v26 + 32) = 0x80000001000698E0;
    *(unsigned char *)(v26 + 40) = 11;
    swift_willThrow();
    goto LABEL_6;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void *))v0[1];
  return v25(v20);
}

uint64_t sub_10002A120(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *os_log_type_t v6 = v2;
  v6[1] = sub_10000F0B8;
  return sub_10001B050(a1, v5, v4);
}

uint64_t sub_10002A1CC(uint64_t a1)
{
  uint64_t v2 = 0x10000000000;
  if (!*(unsigned char *)(v1 + 37)) {
    uint64_t v2 = 0;
  }
  uint64_t v3 = 0x1000000000000;
  if (!*(unsigned char *)(v1 + 38)) {
    uint64_t v3 = 0;
  }
  return sub_100004FA0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(unsigned int *)(v1 + 32) | ((unint64_t)*(unsigned __int8 *)(v1 + 36) << 32) | v2 | v3, *(void *)(v1 + 40), *(unsigned __int8 *)(v1 + 48), *(void **)(v1 + 56));
}

unint64_t sub_10002A214()
{
  unint64_t result = qword_10007F260;
  if (!qword_10007F260)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007F260);
  }
  return result;
}

id sub_10002A254(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100064380();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000646E0();
  id v10 = objc_allocWithZone((Class)NSError);
  NSString v11 = sub_1000646A0();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithDomain:v11 code:12 userInfo:0];

  id v48 = v12;
  sub_10001A9F8(v3, (uint64_t)v49);
  switch(v53)
  {
    case 1:
    case 2:
    case 3:
      if (!v50)
      {
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        JUMPOUT(0x10002A7D4);
      }
      id v13 = v50;

      id v48 = v13;
      id v12 = v13;
      goto LABEL_13;
    case 4:
      id v14 = v50;

      if (!v14) {
        goto LABEL_24;
      }
      id v48 = v14;
      swift_bridgeObjectRetain();
      id v12 = v14;
      swift_bridgeObjectRetain();
      char v15 = sub_10002AB30(32);

      if (v15)
      {
        uint64_t v16 = a1;
        id v17 = v12;
        id v12 = (id)sub_10002A800();

        swift_bridgeObjectRelease();
        if (!v12)
        {

          swift_bridgeObjectRelease();
          return v17;
        }
        swift_bridgeObjectRelease();

        id v48 = v12;
        a1 = v16;
      }
      else
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
LABEL_13:
      sub_100064360();
      swift_bridgeObjectRetain_n();
      id v27 = v12;
      uint64_t v28 = sub_100064370();
      os_log_type_t v29 = sub_100064910();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v43 = v9;
        uint64_t v44 = v7;
        uint64_t v45 = v6;
        uint64_t v30 = swift_slowAlloc();
        unint64_t v31 = (void *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        v47[0] = v42;
        *(_DWORD *)uint64_t v30 = 136315394;
        uint64_t v32 = sub_1000647B0();
        sub_100036458(v32, v33, a1, a2);
        char v35 = v34;
        swift_bridgeObjectRelease();
        if (v35)
        {
          uint64_t v36 = 0;
          unint64_t v38 = 0xE000000000000000;
        }
        else
        {
          swift_bridgeObjectRetain();
          sub_1000647C0();
          swift_bridgeObjectRelease();
          uint64_t v36 = sub_100064710();
          unint64_t v38 = v37;
          swift_bridgeObjectRelease();
        }
        uint64_t v46 = sub_10004BEF0(v36, v38, v47);
        sub_100064A90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2112;
        uint64_t v46 = (uint64_t)v27;
        id v39 = v27;
        sub_100064A90();
        *unint64_t v31 = v27;

        _os_log_impl((void *)&_mh_execute_header, v28, v29, "returning %s mapped error: %@", (uint8_t *)v30, 0x16u);
        sub_100006DC8(&qword_10007F1B0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      }
      swift_beginAccess();
      return v48;
    case 5:
      id v18 = v50;

      if (v18) {
        goto LABEL_12;
      }
      goto LABEL_25;
    case 8:
      id v18 = v50;

      if (v18)
      {
LABEL_12:
        id v48 = v18;
        id v12 = v18;
      }
      else
      {
        __break(1u);
LABEL_10:
        uint64_t v19 = a1;
        unint64_t v20 = a2;
        id v21 = v50;
        uint64_t v22 = v51;
        uint64_t v23 = v52;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v24 = v21;
        a2 = v20;
        id v25 = v24;
        id v26 = sub_10002B60C(v22, v23);

        swift_bridgeObjectRelease();
        a1 = v19;
        swift_bridgeObjectRelease();
        id v48 = v26;
        id v12 = v26;
      }
      goto LABEL_13;
    case 11:
      goto LABEL_10;
    default:
      goto LABEL_13;
  }
}

uint64_t sub_10002A800()
{
  swift_willThrow();
  id v1 = v0;
  sub_100006DC8(&qword_10007DF80);
  type metadata accessor for BRError(0);
  if (swift_dynamicCast())
  {
    sub_10002B28C(&qword_10007DD68, type metadata accessor for BRError);
    sub_100064110();
    if (v17 == 17)
    {
      id v2 = v18;
      uint64_t v3 = (void *)sub_100064140();

      id v4 = [v3 underlyingErrors];
      uint64_t v5 = sub_1000647F0();

      uint64_t v6 = *(void *)(v5 + 16);
      if (v6)
      {
        uint64_t v7 = (uint64_t *)(v5 + 32);
        do
        {
          uint64_t v8 = *v7;
          swift_errorRetain();
          id v9 = (void *)sub_100064140();
          char v10 = sub_10002AB30(32);

          if (v10)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_10002B2D4(0, _swiftEmptyArrayStorage[2] + 1, 1);
            }
            unint64_t v12 = _swiftEmptyArrayStorage[2];
            unint64_t v11 = _swiftEmptyArrayStorage[3];
            if (v12 >= v11 >> 1) {
              sub_10002B2D4(v11 > 1, v12 + 1, 1);
            }
            _swiftEmptyArrayStorage[2] = v12 + 1;
            _swiftEmptyArrayStorage[v12 + 4] = v8;
          }
          else
          {
            swift_errorRelease();
          }
          ++v7;
          --v6;
        }
        while (v6);
      }
      swift_bridgeObjectRelease();
      if (_swiftEmptyArrayStorage[2])
      {
        swift_errorRetain();
        swift_release();
        uint64_t v15 = sub_100064140();

        swift_errorRelease();
      }
      else
      {
        swift_release();

        uint64_t v15 = 0;
      }
      goto LABEL_22;
    }
  }
  swift_errorRelease();
  type metadata accessor for CKError(0);
  id v13 = v1;
  if (swift_dynamicCast())
  {
    sub_10002B28C(&qword_10007DDA0, type metadata accessor for CKError);
    sub_100064110();
    if (v17 == 32)
    {
      id v14 = v18;
      uint64_t v15 = sub_100064140();

LABEL_22:
      swift_errorRelease();
      return v15;
    }
  }
  swift_errorRelease();
  return 0;
}

uint64_t sub_10002AB30(uint64_t a1)
{
  swift_willThrow();
  id v3 = v1;
  sub_100006DC8(&qword_10007DF80);
  type metadata accessor for BRError(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    swift_errorRelease();
    type metadata accessor for CKError(0);
    id v13 = v3;
    if (swift_dynamicCast())
    {
      sub_10002B28C(&qword_10007DDA0, type metadata accessor for CKError);
      sub_100064110();

      swift_errorRelease();
      if (v18 == a1) {
        return 1;
      }
    }
    else
    {
      swift_errorRelease();
    }
    return 0;
  }
  sub_10002B28C(&qword_10007DD68, type metadata accessor for BRError);
  sub_100064110();
  if (v18 != 17)
  {

    goto LABEL_7;
  }
  id v4 = v19;
  uint64_t v5 = (void *)sub_100064140();

  id v6 = [v5 underlyingErrors];
  uint64_t v7 = sub_1000647F0();

  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();

LABEL_19:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v9 = (void *)sub_100064140();
  char v10 = sub_10002AB30(a1);

  uint64_t result = swift_errorRelease();
  if (v10)
  {
LABEL_5:

    swift_bridgeObjectRelease_n();
    uint64_t v12 = 1;
LABEL_20:
    swift_errorRelease();
    return v12;
  }
  if (v8 == 1)
  {
LABEL_18:

    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  uint64_t v14 = 5;
  while (1)
  {
    uint64_t v15 = v14 - 3;
    if (__OFADD__(v14 - 4, 1)) {
      break;
    }
    swift_errorRetain();
    uint64_t v16 = (void *)sub_100064140();
    char v17 = sub_10002AB30(a1);

    uint64_t result = swift_errorRelease();
    if (v17) {
      goto LABEL_5;
    }
    ++v14;
    if (v15 == v8) {
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002AE0C(id a1)
{
  swift_willThrow();
  id v3 = v1;
  sub_100006DC8(&qword_10007DF80);
  type metadata accessor for BRError(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    swift_errorRelease();
    type metadata accessor for CKError(0);
    id v16 = v3;
    if (swift_dynamicCast())
    {
      sub_10002B28C(&qword_10007DDA0, type metadata accessor for CKError);
      sub_100064110();
      if (v36 == CKErrorCodeForUnderlyingErrorCode())
      {
        id v4 = v37;
        char v17 = (void *)sub_100064140();

        id v18 = [v17 underlyingErrors];
        uint64_t v19 = sub_1000647F0();

        uint64_t v20 = *(void *)(v19 + 16);
        if (v20)
        {
          swift_bridgeObjectRetain();
          swift_errorRetain();
          id v21 = (void *)sub_100064140();
          char v22 = sub_10002AE0C(a1);

          uint64_t result = swift_errorRelease();
          if ((v22 & 1) == 0)
          {
            if (v20 != 1)
            {
              uint64_t v32 = 5;
              while (1)
              {
                uint64_t v33 = v32 - 3;
                if (__OFADD__(v32 - 4, 1)) {
                  goto LABEL_35;
                }
                swift_errorRetain();
                char v34 = (void *)sub_100064140();
                char v35 = sub_10002AE0C(a1);

                uint64_t result = swift_errorRelease();
                if (v35) {
                  goto LABEL_16;
                }
                ++v32;
                if (v33 == v20) {
                  goto LABEL_30;
                }
              }
            }
            goto LABEL_30;
          }
LABEL_16:

          swift_bridgeObjectRelease_n();
          uint64_t v23 = 1;
LABEL_32:
          swift_errorRelease();
          return v23;
        }
LABEL_23:
        swift_bridgeObjectRelease();

LABEL_31:
        uint64_t v23 = 0;
        goto LABEL_32;
      }
    }
    swift_errorRelease();
    id v24 = v16;
    id v25 = [v24 domain];
    uint64_t v26 = sub_1000646E0();
    uint64_t v28 = v27;

    if (v26 == sub_1000646E0() && v28 == v29)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v30 = sub_100064C10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {

        return 0;
      }
    }
    id v31 = [v24 code];

    return v31 == a1;
  }
  sub_10002B28C(&qword_10007DD68, type metadata accessor for BRError);
  sub_100064110();
  if (v36 != 17)
  {

    goto LABEL_12;
  }
  id v4 = v37;
  uint64_t v5 = (void *)sub_100064140();

  id v6 = [v5 underlyingErrors];
  uint64_t v7 = sub_1000647F0();

  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v9 = (void *)sub_100064140();
  char v10 = sub_10002AE0C(a1);

  uint64_t result = swift_errorRelease();
  if (v10) {
    goto LABEL_16;
  }
  if (v8 == 1)
  {
LABEL_30:

    swift_bridgeObjectRelease_n();
    goto LABEL_31;
  }
  uint64_t v12 = 5;
  while (1)
  {
    uint64_t v13 = v12 - 3;
    if (__OFADD__(v12 - 4, 1)) {
      break;
    }
    swift_errorRetain();
    uint64_t v14 = (void *)sub_100064140();
    char v15 = sub_10002AE0C(a1);

    uint64_t result = swift_errorRelease();
    if (v15) {
      goto LABEL_16;
    }
    ++v12;
    if (v13 == v8) {
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_10002B28C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002B2D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002B314(a1, a2, a3, (void *)*v3);
  *id v3 = result;
  return result;
}

uint64_t sub_10002B2F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002B4A0(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_10002B314(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006DC8(&qword_10007E6C8);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100006DC8(&qword_10007DF80);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100064BC0();
  __break(1u);
  return result;
}

uint64_t sub_10002B4A0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006DC8(&qword_10007E6D8);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_100064BC0();
  __break(1u);
  return result;
}

id sub_10002B60C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100006DC8(&qword_10007E6D0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100066020;
    *(void *)(inited + 32) = sub_1000646E0();
    *(void *)(inited + 40) = v5;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_10002F24C(inited);
  }
  else
  {
    unint64_t v6 = 0;
  }
  sub_1000646E0();
  NSString v7 = sub_1000646A0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    v8.super.Class isa = sub_100064650().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.Class isa = 0;
  }
  id v9 = [objc_allocWithZone((Class)NSError) initWithDomain:v7 code:1 userInfo:v8.super.isa];

  return v9;
}

uint64_t initializeBufferWithCopyOfBuffer for SharingError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharingError(uint64_t a1)
{
  return sub_10001AAF4(*(void *)a1, *(void *)(a1 + 8), *(void **)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for SharingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10001AA54(*(void *)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for SharingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  unsigned __int8 v8 = *(unsigned char *)(a2 + 40);
  sub_10001AA54(*(void *)a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  int64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  unsigned __int8 v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_10001AAF4(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 initializeWithTake for SharingError(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SharingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  unsigned __int8 v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_10001AAF4(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF3 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 243);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 0xD) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 243;
    if (a3 >= 0xF3) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF3) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10002B990(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_10002B998(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SharingError()
{
  return &type metadata for SharingError;
}

__n128 initializeWithTake for ErrorMessage(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NSErrorContext()
{
  return &type metadata for NSErrorContext;
}

uint64_t _s40com_apple_CloudSharingUI_AddParticipants12ErrorMessageVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s40com_apple_CloudSharingUI_AddParticipants12ErrorMessageVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  id v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *_s40com_apple_CloudSharingUI_AddParticipants12ErrorMessageVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s40com_apple_CloudSharingUI_AddParticipants12ErrorMessageVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s40com_apple_CloudSharingUI_AddParticipants12ErrorMessageVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10002BBA8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorMessage()
{
  return &type metadata for ErrorMessage;
}

void URL.evictionSafeResourceValues(forKeys:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = sub_100006DC8(&qword_10007E6E0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v22 = (uint64_t)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - v6;
  id v24 = 0;
  uint64_t v8 = sub_100064090();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  id v10 = [objc_allocWithZone((Class)NSFileCoordinator) init];
  sub_100064180(v11);
  uint64_t v13 = v12;
  unsigned __int8 v14 = (void *)swift_allocObject();
  v14[2] = v7;
  v14[3] = a1;
  void v14[4] = &v24;
  char v15 = (void *)swift_allocObject();
  v15[2] = sub_10002C108;
  v15[3] = v14;
  aBlock[4] = sub_10002C124;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10002C14C;
  aBlock[3] = &unk_10007A800;
  id v16 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  [v10 coordinateReadingItemAtURL:v13 options:4 error:aBlock byAccessor:v16];
  _Block_release(v16);

  id v17 = aBlock[0];
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v16) {
    __break(1u);
  }
  if (v17)
  {
    id v18 = v17;
    swift_willThrow();
    sub_10002C2B0((uint64_t)v7);

    swift_release();
  }
  else if (v24)
  {
    v24;
    swift_willThrow();
    sub_10002C2B0((uint64_t)v7);

    swift_release();
  }
  else
  {
    uint64_t v19 = v22;
    sub_10002C248((uint64_t)v7, v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v19, 1, v8) == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v21, v19, v8);
      sub_10002C2B0((uint64_t)v7);

      swift_release();
    }
  }
}

uint64_t sub_10002BF90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100006DC8(&qword_10007E6E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064190();
  uint64_t v6 = sub_100064090();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_10002C310((uint64_t)v5, a2);
}

uint64_t sub_10002C0D0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002C108(uint64_t a1)
{
  return sub_10002BF90(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002C114()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002C124()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002C14C(uint64_t a1)
{
  uint64_t v2 = sub_1000641E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_1000641B0();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10002C230(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002C240()
{
  return swift_release();
}

uint64_t sub_10002C248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C2B0(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E6E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002C310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006DC8(&qword_10007E6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C378(uint64_t a1)
{
  uint64_t v104 = sub_100064380();
  uint64_t v2 = *(void *)(v104 - 8);
  uint64_t v3 = __chkstk_darwin(v104);
  uint64_t v5 = (char *)v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v105 = (char *)v85 - v6;
  uint64_t v7 = sub_100006DC8(&qword_10007E520);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = (char *)v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v101 = (uint64_t)v85 - v11;
  uint64_t v87 = *(void *)(a1 + 16);
  if (!v87)
  {
    unsigned __int8 v14 = _swiftEmptyArrayStorage;
LABEL_69:
    swift_getKeyPath();
    swift_getKeyPath();
    id v107 = v14;
    swift_retain();
    return sub_100064490();
  }
  uint64_t v86 = a1 + 32;
  uint64_t v103 = (void (**)(char *, uint64_t))(v2 + 8);
  v85[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  unsigned __int8 v14 = _swiftEmptyArrayStorage;
  *(void *)&long long v15 = 136315394;
  long long v95 = v15;
  v94 = (char *)&type metadata for Any + 8;
  *(void *)&long long v15 = 67109120;
  long long v98 = v15;
  uint64_t v97 = v5;
  unint64_t v102 = v10;
  while (1)
  {
    id v17 = (uint64_t *)(v86 + 16 * v12);
    uint64_t v18 = *v17;
    unint64_t v19 = v17[1];
    if ((v19 & 0x1000000000000000) != 0) {
      Swift::Int v20 = sub_100064780();
    }
    else {
      Swift::Int v20 = sub_100064790();
    }
    Swift::Int v21 = v20;
    id v22 = objc_allocWithZone((Class)NSDataDetector);
    id v107 = 0;
    swift_bridgeObjectRetain();
    id v23 = [v22 initWithTypes:32 error:&v107];
    if (!v23)
    {
      id v83 = v107;
      sub_100064150();

      swift_willThrow();
      goto LABEL_74;
    }
    id v24 = v23;
    id v25 = v107;
    NSString v26 = sub_1000646A0();
    id v100 = v24;
    id v27 = objc_msgSend(v24, "matchesInString:options:range:", v26, 0, 0, v21);

    unint64_t v99 = sub_10002D478();
    unint64_t v28 = sub_1000647F0();

    swift_bridgeObjectRetain();
    uint64_t v91 = v18;
    unint64_t v29 = (unint64_t)sub_10002D4B8(v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v92 = v19;
    uint64_t v90 = v14;
    uint64_t v89 = v12;
    uint64_t v93 = v13;
    uint64_t v96 = HIBYTE(v19) & 0xF;
    if (v29 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100064BA0();
      if (v30)
      {
LABEL_10:
        uint64_t v31 = 4;
        while (1)
        {
          if ((v29 & 0xC000000000000001) != 0) {
            id v32 = (id)sub_100064B20();
          }
          else {
            id v32 = *(id *)(v29 + 8 * v31);
          }
          uint64_t v33 = v32;
          uint64_t v34 = v31 - 3;
          if (__OFADD__(v31 - 4, 1))
          {
            __break(1u);
LABEL_71:
            __break(1u);
          }
          id v35 = [v32 URL];
          if (v35)
          {
            uint64_t v36 = v35;
            sub_1000641B0();

            uint64_t v37 = sub_1000641E0();
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v10, 0, 1, v37);
          }
          else
          {
            uint64_t v37 = sub_1000641E0();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v10, 1, 1, v37);
          }
          uint64_t v38 = (uint64_t)v10;
          uint64_t v39 = v101;
          sub_10001A5B8(v38, v101);
          sub_1000641E0();
          uint64_t v40 = *(void *)(v37 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v39, 1, v37) == 1)
          {
            sub_10000EB0C(v39);
            char v41 = 0;
          }
          else
          {
            uint64_t v42 = sub_1000641D0();
            uint64_t v43 = v39;
            uint64_t v44 = v42;
            uint64_t v46 = v45;
            (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v43, v37);
            if (v46)
            {
              if (v44 == 0x6F746C69616DLL && v46 == 0xE600000000000000)
              {
                swift_bridgeObjectRelease();
                char v41 = 1;
              }
              else
              {
                char v41 = sub_100064C10();
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              char v41 = 0;
            }
          }
          sub_100064360();
          uint64_t v47 = sub_100064370();
          os_log_type_t v48 = sub_100064930();
          if (os_log_type_enabled(v47, v48))
          {
            uint64_t v49 = swift_slowAlloc();
            *(_DWORD *)uint64_t v49 = v98;
            *(_DWORD *)(v49 + 4) = v41 & 1;
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "isValid(address...) is link, valid email: %{BOOL}d", (uint8_t *)v49, 8u);
            swift_slowDealloc();
          }

          (*v103)(v105, v104);
          if (v41) {
            break;
          }
          ++v31;
          id v10 = v102;
          if (v34 == v30) {
            goto LABEL_30;
          }
        }

        swift_bridgeObjectRelease_n();
        uint64_t v74 = v91;
        unint64_t v75 = v92;
        uint64_t v76 = sub_10002CEC8();
        id v10 = v102;
        if (v76[2])
        {
          uint64_t v74 = v76[4];
          unint64_t v77 = v76[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v78 = 0;
          unint64_t v75 = v77;
        }
        else
        {
          swift_bridgeObjectRelease();
          char v78 = 0;
        }
        unsigned __int8 v14 = v90;
        uint64_t v16 = v89;
        uint64_t v13 = v93;
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v30) {
        goto LABEL_10;
      }
    }
LABEL_30:

    swift_bridgeObjectRelease_n();
    id v50 = (void *)((v92 & 0x1000000000000000) != 0 ? sub_100064780() : sub_100064790());
    id v100 = v50;
    uint64_t v51 = v97;
    uint64_t v52 = v93;
    id v53 = objc_allocWithZone((Class)NSDataDetector);
    id v107 = 0;
    id v54 = [v53 initWithTypes:2048 error:&v107];
    if (!v54) {
      break;
    }
    unint64_t v55 = v54;
    id v56 = v107;
    NSString v57 = sub_1000646A0();
    id v58 = objc_msgSend(v55, "matchesInString:options:range:", v57, 0, 0, v100);

    unint64_t v59 = sub_1000647F0();
    swift_bridgeObjectRetain();
    unint64_t v60 = (unint64_t)sub_10002D4B8(v59);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v93 = v52;
    id v88 = v55;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_100064BA0();
      if (!v61) {
        goto LABEL_3;
      }
LABEL_36:
      unint64_t v99 = v60 & 0xC000000000000001;
      uint64_t v62 = 4;
      uint64_t v96 = v60;
      while (1)
      {
        if (v99) {
          id v63 = (id)sub_100064B20();
        }
        else {
          id v63 = *(id *)(v60 + 8 * v62);
        }
        os_log_type_t v64 = v63;
        uint64_t v65 = v62 - 3;
        if (__OFADD__(v62 - 4, 1)) {
          goto LABEL_71;
        }
        if ([v63 range]) {
          BOOL v67 = 0;
        }
        else {
          BOOL v67 = v66 == v100;
        }
        int v68 = v67;
        sub_100064360();
        uint64_t v69 = sub_100064370();
        os_log_type_t v70 = sub_100064930();
        if (os_log_type_enabled(v69, v70))
        {
          uint64_t v71 = swift_slowAlloc();
          id v107 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v71 = v95;
          uint64_t v106 = 2048;
          type metadata accessor for CheckingType(0);
          uint64_t v72 = sub_1000646F0();
          *(void *)(v71 + 4) = sub_10004BEF0(v72, v73, (uint64_t *)&v107);
          uint64_t v51 = v97;
          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 12) = 1024;
          *(_DWORD *)(v71 + 14) = v68;
          _os_log_impl((void *)&_mh_execute_header, v69, v70, "isValid(address...) is %s, valid: %{BOOL}d", (uint8_t *)v71, 0x12u);
          swift_arrayDestroy();
          unint64_t v60 = v96;
          swift_slowDealloc();
          id v10 = v102;
          swift_slowDealloc();
        }

        (*v103)(v51, v104);
        if (v68) {
          break;
        }
        ++v62;
        if (v65 == v61) {
          goto LABEL_3;
        }
      }

      swift_bridgeObjectRelease_n();
      char v78 = 1;
      unsigned __int8 v14 = v90;
      uint64_t v16 = v89;
      unint64_t v75 = v92;
      uint64_t v13 = v93;
      uint64_t v74 = v91;
LABEL_57:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unsigned __int8 v14 = sub_10002D354(0, v14[2] + 1, 1, v14);
      }
      unint64_t v80 = v14[2];
      unint64_t v79 = v14[3];
      if (v80 >= v79 >> 1) {
        unsigned __int8 v14 = sub_10002D354((void *)(v79 > 1), v80 + 1, 1, v14);
      }
      v14[2] = v80 + 1;
      long long v81 = &v14[3 * v80];
      v81[4] = v74;
      v81[5] = v75;
      *((unsigned char *)v81 + 48) = v78;
      goto LABEL_4;
    }
    uint64_t v61 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v61) {
      goto LABEL_36;
    }
LABEL_3:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    unsigned __int8 v14 = v90;
    uint64_t v16 = v89;
    uint64_t v13 = v93;
LABEL_4:
    uint64_t v12 = v16 + 1;
    if (v12 == v87)
    {
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
  }
  id v84 = v107;
  sub_100064150();

  swift_willThrow();
LABEL_74:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

void *sub_10002CEC8()
{
  uint64_t v0 = sub_100064380();
  __chkstk_darwin(v0);
  NSString v1 = sub_1000646A0();
  id v2 = objc_allocWithZone((Class)NSRegularExpression);
  id v3 = sub_10002D278(0xD00000000000002FLL, 0x8000000100069AC0, 1);
  uint64_t v4 = sub_100064730();
  NSString v5 = sub_1000646A0();
  id v6 = objc_msgSend(v3, "matchesInString:options:range:", v5, 1, 0, v4);

  sub_10002D478();
  unint64_t v7 = sub_1000647F0();

  id v8 = v1;
  uint64_t v9 = sub_10002D648(v7, v8);
  swift_bridgeObjectRelease();

  return v9;
}

id sub_10002D278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_1000646A0();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100064150();

    swift_willThrow();
  }
  return v6;
}

void *sub_10002D354(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006DC8(&qword_10007E6F0);
      id v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10002D7DC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_10002D478()
{
  unint64_t result = qword_10007E6E8;
  if (!qword_10007E6E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007E6E8);
  }
  return result;
}

void *sub_10002D4B8(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v11 = v1;
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v12 = v1 & 0xC000000000000001;
      while (v4)
      {
        id v6 = (id)sub_100064B20();
LABEL_9:
        uint64_t v7 = v6;
        unint64_t v8 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        [v6 range];
        sub_1000648F0();
        if (v9)
        {
        }
        else
        {
          sub_100064B40();
          sub_100064B60();
          sub_100064B70();
          sub_100064B50();
          unint64_t v1 = v11;
          unint64_t v4 = v12;
        }
        ++v3;
        if (v8 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_100064BA0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v6 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_10002D648(unint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    unint64_t result = (void *)sub_10002B2F4(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0) {
      break;
    }
    unint64_t v18 = v3;
    uint64_t v7 = 0;
    while (v5 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v8 = (id)sub_100064B20();
      }
      else {
        id v8 = *(id *)(a1 + 8 * v7 + 32);
      }
      char v9 = v8;
      id v10 = objc_msgSend(v8, "range", v18);
      id v12 = objc_msgSend(a2, "substringWithRange:", v10, v11);
      uint64_t v13 = sub_1000646E0();
      uint64_t v15 = v14;

      unint64_t v3 = _swiftEmptyArrayStorage[2];
      unint64_t v16 = _swiftEmptyArrayStorage[3];
      if (v3 >= v16 >> 1) {
        sub_10002B2F4(v16 > 1, v3 + 1, 1);
      }
      ++v7;
      _swiftEmptyArrayStorage[2] = v3 + 1;
      id v17 = &_swiftEmptyArrayStorage[2 * v3];
      v17[4] = v13;
      v17[5] = v15;
      if (v5 == v7) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100064BA0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10002D7DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100064BC0();
  __break(1u);
  return result;
}

uint64_t *sub_10002D8D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100064210();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    id v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *id v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10002D9D8(uint64_t a1)
{
  uint64_t v2 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002DA6C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  id v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10002DB20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002DC04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10002DC94(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10002DD50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002DD64);
}

uint64_t sub_10002DD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100064210();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10002DE28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002DE3C);
}

uint64_t sub_10002DE3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100064210();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for AlertViewModel(uint64_t a1)
{
  return sub_10002EEB8(a1, qword_10007E750);
}

uint64_t sub_10002DF1C()
{
  uint64_t result = sub_100064210();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_10002DFCC()
{
  unint64_t result = qword_10007E790;
  if (!qword_10007E790)
  {
    sub_100064210();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007E790);
  }
  return result;
}

uint64_t sub_10002E028@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100064210();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

void *sub_10002E090(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100064210();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)((char *)a2 + v8);
    uint64_t v12 = *(void *)((char *)a2 + v8 + 8);
    char v13 = *((unsigned char *)a2 + v8 + 16);
    sub_10002E2A8(v11, v12, v13);
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
    *((void *)v9 + 3) = *((void *)v10 + 3);
    uint64_t v14 = a3[6];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_1000645A0();
    uint64_t v18 = *(void *)(v17 - 8);
    unint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    swift_bridgeObjectRetain();
    if (v19(v16, 1, v17))
    {
      uint64_t v20 = sub_100006DC8(&qword_10007E798);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v22 = a3[7];
    id v23 = (void *)((char *)a1 + v22);
    id v24 = (void *)((char *)a2 + v22);
    if (*v24)
    {
      uint64_t v25 = v24[1];
      *id v23 = *v24;
      v23[1] = v25;
      swift_retain();
    }
    else
    {
      *(_OWORD *)id v23 = *(_OWORD *)v24;
    }
  }
  return a1;
}

uint64_t sub_10002E2A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10002E2B8(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_10002E3F4(*(void *)(a1 + a2[5]), *(void *)(a1 + a2[5] + 8), *(unsigned char *)(a1 + a2[5] + 16));
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_1000645A0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  if (*(void *)(a1 + a2[7]))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_10002E3F4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10002E404(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  char v12 = *(unsigned char *)(a2 + v7 + 16);
  sub_10002E2A8(v10, v11, v12);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_1000645A0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = sub_100006DC8(&qword_10007E798);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  if (*v22)
  {
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  }
  return a1;
}

uint64_t sub_10002E5CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)(a2 + v7);
  uint64_t v11 = *(void *)(a2 + v7 + 8);
  char v12 = *(unsigned char *)(a2 + v7 + 16);
  sub_10002E2A8(v10, v11, v12);
  uint64_t v13 = *(void *)v8;
  uint64_t v14 = *(void *)(v8 + 8);
  char v15 = *(unsigned char *)(v8 + 16);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  sub_10002E3F4(v13, v14, v15);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_1000645A0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v8) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (v8)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_6:
    uint64_t v23 = sub_100006DC8(&qword_10007E798);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_7:
  uint64_t v24 = a3[7];
  uint64_t v25 = (void *)(a1 + v24);
  NSString v26 = (uint64_t *)(a2 + v24);
  uint64_t v27 = *(void *)(a1 + v24);
  uint64_t v28 = *v26;
  if (!v27)
  {
    if (v28)
    {
      uint64_t v30 = v26[1];
      void *v25 = v28;
      v25[1] = v30;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
    return a1;
  }
  if (!v28)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v29 = v26[1];
  void *v25 = v28;
  v25[1] = v29;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10002E834(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  char v12 = (void *)(a1 + v8);
  uint64_t v13 = (const void *)(a2 + v8);
  uint64_t v14 = sub_1000645A0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100006DC8(&qword_10007E798);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v20 = *v19;
  if (*v19)
  {
    uint64_t v21 = v19[1];
    *uint64_t v18 = v20;
    v18[1] = v21;
  }
  else
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  }
  return a1;
}

uint64_t sub_10002E9C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100064210();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  LOBYTE(v7) = *(unsigned char *)(a2 + v7 + 16);
  uint64_t v10 = *(void *)v8;
  uint64_t v11 = *(void *)(v8 + 8);
  char v12 = *(unsigned char *)(v8 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v7;
  sub_10002E3F4(v10, v11, v12);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_1000645A0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    uint64_t v21 = sub_100006DC8(&qword_10007E798);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  uint64_t v22 = a3[7];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v25 = *(void *)(a1 + v22);
  uint64_t v26 = *v24;
  if (!v25)
  {
    if (v26)
    {
      uint64_t v28 = v24[1];
      *uint64_t v23 = v26;
      v23[1] = v28;
      return a1;
    }
LABEL_13:
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
    return a1;
  }
  if (!v26)
  {
    swift_release();
    goto LABEL_13;
  }
  uint64_t v27 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v27;
  swift_release();
  return a1;
}

uint64_t sub_10002EC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002EC1C);
}

uint64_t sub_10002EC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100064210();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_100006DC8(&qword_10007E798);
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10002ED50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002ED64);
}

uint64_t sub_10002ED64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100064210();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_100006DC8(&qword_10007E798);
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for AlertViewModelButton(uint64_t a1)
{
  return sub_10002EEB8(a1, (uint64_t *)&unk_10007E7F8);
}

uint64_t sub_10002EEB8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002EEF0()
{
  sub_100064210();
  if (v0 <= 0x3F)
  {
    sub_10002EFC8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10002EFC8()
{
  if (!qword_10007E808)
  {
    sub_1000645A0();
    unint64_t v0 = sub_100064A80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007E808);
    }
  }
}

unint64_t sub_10002F020(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006DC8(&qword_10007F200);
  uint64_t v2 = (void *)sub_100064BB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10004C548(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_10002F13C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006DC8(&qword_10007F270);
  uint64_t v2 = (void *)sub_100064BB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 48);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 16);
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10004C5C0(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    char v10 = (void *)(v2[7] + 16 * result);
    *char v10 = v7;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
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

unint64_t sub_10002F24C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006DC8(&qword_10007F278);
  uint64_t v2 = sub_100064BB0();
  uint64_t v3 = (void *)v2;
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
    sub_100020E94(v6, (uint64_t)&v15, &qword_10007F280);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10004C548(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10004FFA0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10002F384()
{
  return sub_100043AC4();
}

uint64_t sub_10002F398()
{
  return sub_100043B48();
}

uint64_t sub_10002F3AC(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  sub_100064870();
  v3[12] = sub_100064860();
  uint64_t v5 = sub_100064830();
  v3[13] = v5;
  v3[14] = v4;
  return _swift_task_switch(sub_10002F448, v5, v4);
}

uint64_t sub_10002F448()
{
  type metadata accessor for CloudKitOperations();
  uint64_t v1 = (void *)swift_allocObject();
  v0[15] = v1;
  v1[2] = 0xD000000000000021;
  v1[3] = 0x8000000100069910;
  v1[4] = 0xD000000000000016;
  v1[5] = 0x8000000100069940;
  v1[6] = 0xD00000000000001DLL;
  v1[7] = 0x8000000100069960;
  v0[6] = 0;
  v0[5] = 0;
  sub_100006DC8(&qword_10007EA40);
  sub_100064450();
  return _swift_task_switch(sub_10002F540, 0, 0);
}

uint64_t sub_10002F540()
{
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[16] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  uint64_t v6 = sub_100006DC8(&qword_10007F210);
  *uint64_t v5 = v0;
  v5[1] = sub_10002F654;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000002DLL, 0x8000000100068F10, sub_10004FA94, v4, v6);
}

uint64_t sub_10002F654()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10002F9C0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_10002F770;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002F770()
{
  *(_OWORD *)(v0 + 152) = *(_OWORD *)(v0 + 16);
  *(void *)(v0 + 168) = *(void *)(v0 + 32);
  return _swift_task_switch(sub_10002F798, *(void *)(v0 + 104), *(void *)(v0 + 112));
}

uint64_t sub_10002F798()
{
  uint64_t v1 = v0[10];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[10];
    swift_getKeyPath();
    swift_getKeyPath();
    v0[8] = v2;
    id v3 = v2;
    swift_retain();
    sub_100064490();
  }
  else
  {
    uint64_t v4 = (void *)v0[20];
    swift_retain();
    id v5 = v4;
    sub_100009ED8(v4, 0);

    swift_release();
  }
  uint64_t v7 = (void *)v0[20];
  uint64_t v6 = (void *)v0[21];
  uint64_t v8 = (void *)v0[19];
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[11];
  uint64_t v11 = *(void **)(v10 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_ckMetadata);
  *(void *)(v10 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_ckMetadata) = v6;
  id v12 = v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v0[7] = v8;
  swift_retain();
  id v13 = v8;
  sub_100064490();

  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v9 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants18CloudKitOperations__ckSourceAppBundleID;
  uint64_t v15 = sub_100006DC8((uint64_t *)&unk_10007EE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_deallocClassInstance();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10002F9C0()
{
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  return _swift_task_switch(sub_10002FA24, v1, v2);
}

uint64_t sub_10002FA24()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants18CloudKitOperations__ckSourceAppBundleID;
  uint64_t v3 = sub_100006DC8((uint64_t *)&unk_10007EE10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_deallocClassInstance();
  swift_release();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002FB34()
{
  return sub_100043B48();
}

uint64_t sub_10002FB48(char a1)
{
  *(void *)(v2 + 56) = v1;
  *(unsigned char *)(v2 + 210) = a1;
  uint64_t v3 = sub_100064380();
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 72) = *(void *)(v3 - 8);
  *(void *)(v2 + 80) = swift_task_alloc();
  *(void *)(v2 + 88) = swift_task_alloc();
  sub_100064870();
  *(void *)(v2 + 96) = sub_100064860();
  uint64_t v5 = sub_100064830();
  *(void *)(v2 + 104) = v5;
  *(void *)(v2 + 112) = v4;
  return _swift_task_switch(sub_10002FC50, v5, v4);
}

uint64_t sub_10002FC50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 16);
  if (!v1)
  {
    swift_release();
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v10 = 0xD00000000000002CLL;
    *(void *)(v10 + 8) = 0x800000010006A120;
    *(_OWORD *)(v10 + 16) = xmmword_100067390;
    *(void *)(v10 + 32) = 0x800000010006A150;
    *(unsigned char *)(v10 + 40) = 11;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
LABEL_7:
    return v9();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 209);
  swift_release();
  if (v2 == 1)
  {
    swift_release();
    sub_100064360();
    uint64_t v3 = sub_100064370();
    os_log_type_t v4 = sub_100064930();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "addParticipantsToShare, doing nothing as we have a public share", v5, 2u);
      swift_slowDealloc();
    }
    uint64_t v6 = *(void *)(v0 + 88);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v8 = *(void *)(v0 + 72);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_7;
  }
  *(void *)(v0 + 32) = _swiftEmptyArrayStorage;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v12 = *(void *)(v0 + 40);
  *(void *)(v0 + 120) = v12;
  uint64_t v13 = *(void *)(v12 + 16);
  *(void *)(v0 + 128) = v13;
  if (v13)
  {
    *(void *)(v0 + 136) = 0;
    uint64_t v14 = *(void *)(v12 + 32);
    *(void *)(v0 + 144) = v14;
    uint64_t v15 = *(void *)(v12 + 40);
    *(void *)(v0 + 152) = v15;
    char v16 = *(unsigned char *)(v12 + 48);
    *(unsigned char *)(v0 + 211) = v16;
    sub_10004F730();
    long long v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v17;
    *long long v17 = v0;
    v17[1] = sub_1000301D4;
    return sub_100044844(v14, v15, v16);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100064360();
    swift_retain_n();
    uint64_t v18 = sub_100064370();
    os_log_type_t v19 = sub_100064930();
    if (os_log_type_enabled(v18, v19))
    {
      int v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)int v20 = 134217984;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v21 = *(void *)(*(void *)(v0 + 48) + 16);
      swift_bridgeObjectRelease();
      swift_release();
      *(void *)(v0 + 24) = v21;
      sub_100064A90();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "addParticipantsToShare, adding %ld", v20, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    uint64_t v22 = *(void *)(v0 + 32);
    *(void *)(v0 + 184) = v22;
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_1000307B4;
    return sub_100045830(v22, 1, 1);
  }
}

uint64_t sub_1000301D4(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[21] = a1;
  v3[22] = v1;
  swift_task_dealloc();
  sub_10004F738();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[13];
    uint64_t v5 = v3[14];
    uint64_t v6 = sub_100030944;
  }
  else
  {
    uint64_t v4 = v3[13];
    uint64_t v5 = v3[14];
    uint64_t v6 = sub_100030314;
  }
  return _swift_task_switch(v6, v4, v5);
}

uint64_t sub_100030314()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v1 = 1;
  switch(*(unsigned char *)(v0 + 208))
  {
    case 1:
      uint64_t v1 = 3;
      goto LABEL_4;
    case 2:
      uint64_t v1 = 2;
      goto LABEL_4;
    case 3:
      return sub_100064B90();
    default:
LABEL_4:
      int v2 = *(void **)(v0 + 168);
      unsigned __int8 v3 = *(unsigned char *)(v0 + 210);
      swift_release();
      [v2 setPermission:v1];
      objc_msgSend(v2, "setRole:", sub_100045658((uint64_t)objc_msgSend(v2, "permission"), v3));
      id v4 = v2;
      sub_1000647D0();
      if (*(void *)((*(void *)(v0 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        sub_100064810();
      uint64_t v5 = *(void **)(v0 + 168);
      uint64_t v6 = *(void *)(v0 + 128);
      uint64_t v7 = *(void *)(v0 + 136) + 1;
      sub_100064820();
      sub_100064800();

      if (v7 == v6)
      {
        swift_bridgeObjectRelease();
        sub_100064360();
        swift_retain_n();
        uint64_t v8 = sub_100064370();
        os_log_type_t v9 = sub_100064930();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v10 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v10 = 134217984;
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100064480();
          swift_release();
          swift_release();
          uint64_t v11 = *(void *)(*(void *)(v0 + 48) + 16);
          swift_bridgeObjectRelease();
          swift_release();
          *(void *)(v0 + 24) = v11;
          sub_100064A90();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v8, v9, "addParticipantsToShare, adding %ld", v10, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_release_n();
        }

        (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
        uint64_t v19 = *(void *)(v0 + 32);
        *(void *)(v0 + 184) = v19;
        int v20 = (void *)swift_task_alloc();
        *(void *)(v0 + 192) = v20;
        *int v20 = v0;
        v20[1] = sub_1000307B4;
        return sub_100045830(v19, 1, 1);
      }
      else
      {
        uint64_t v12 = *(void *)(v0 + 136) + 1;
        *(void *)(v0 + 136) = v12;
        uint64_t v13 = *(void *)(v0 + 120) + 24 * v12;
        uint64_t v14 = *(void *)(v13 + 32);
        *(void *)(v0 + 144) = v14;
        uint64_t v15 = *(void *)(v13 + 40);
        *(void *)(v0 + 152) = v15;
        char v16 = *(unsigned char *)(v13 + 48);
        *(unsigned char *)(v0 + 211) = v16;
        sub_10004F730();
        long long v17 = (void *)swift_task_alloc();
        *(void *)(v0 + 160) = v17;
        *long long v17 = v0;
        v17[1] = sub_1000301D4;
        return sub_100044844(v14, v15, v16);
      }
  }
}

uint64_t sub_1000307B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_1000309B8;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_1000308D0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000308D0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100030944()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000309B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100030A38(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 216) = a2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v2;
  uint64_t v4 = sub_100064380();
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = *(void *)(v4 - 8);
  *(void *)(v3 + 88) = swift_task_alloc();
  sub_100064870();
  *(void *)(v3 + 96) = sub_100064860();
  uint64_t v6 = sub_100064830();
  *(void *)(v3 + 104) = v6;
  *(void *)(v3 + 112) = v5;
  return _swift_task_switch(sub_100030B30, v6, v5);
}

uint64_t sub_100030B30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 120) = v1;
  if (v1)
  {
    if ([v1 publicPermission] == (id)1)
    {
      *(void *)(v0 + 24) = _swiftEmptyArrayStorage;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v2 = *(void *)(v0 + 32);
      *(void *)(v0 + 128) = v2;
      uint64_t v3 = *(void *)(v2 + 16);
      *(void *)(v0 + 136) = v3;
      if (v3)
      {
        *(void *)(v0 + 144) = 0;
        uint64_t v4 = *(void *)(v2 + 32);
        *(void *)(v0 + 152) = v4;
        uint64_t v5 = *(void *)(v2 + 40);
        *(void *)(v0 + 160) = v5;
        char v6 = *(unsigned char *)(v2 + 48);
        *(unsigned char *)(v0 + 217) = v6;
        sub_10004F730();
        uint64_t v7 = (void *)swift_task_alloc();
        *(void *)(v0 + 168) = v7;
        *uint64_t v7 = v0;
        v7[1] = sub_100030FA0;
        return sub_100044844(v4, v5, v6);
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_100064360();
        swift_retain_n();
        uint64_t v11 = sub_100064370();
        os_log_type_t v12 = sub_100064930();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v13 = 134217984;
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100064480();
          swift_release();
          swift_release();
          uint64_t v14 = *(void *)(*(void *)(v0 + 40) + 16);
          swift_bridgeObjectRelease();
          swift_release();
          *(void *)(v0 + 48) = v14;
          sub_100064A90();
          swift_release();
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "addParticipantsToShareWithOptions, adding %ld", v13, 0xCu);
          swift_slowDealloc();
        }
        else
        {
          swift_release_n();
        }

        (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
        uint64_t v15 = *(void *)(v0 + 24);
        *(void *)(v0 + 192) = v15;
        char v16 = (void *)swift_task_alloc();
        *(void *)(v0 + 200) = v16;
        *char v16 = v0;
        v16[1] = sub_100031470;
        return sub_100045830(v15, 0, 1);
      }
    }
  }
  swift_release();
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v9 = 0xD000000000000046;
  *(void *)(v9 + 8) = 0x800000010006A2E0;
  *(_OWORD *)(v9 + 16) = xmmword_1000673A0;
  *(void *)(v9 + 32) = 0x800000010006A330;
  *(unsigned char *)(v9 + 40) = 11;
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_100030FA0(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[22] = a1;
  v3[23] = v1;
  swift_task_dealloc();
  sub_10004F738();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[13];
    uint64_t v5 = v3[14];
    char v6 = sub_100031600;
  }
  else
  {
    uint64_t v4 = v3[13];
    uint64_t v5 = v3[14];
    char v6 = sub_1000310E0;
  }
  return _swift_task_switch(v6, v4, v5);
}

uint64_t sub_1000310E0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void **)(v0 + 176);
  unsigned __int8 v3 = *(unsigned char *)(v0 + 216);
  [v2 setPermission:v1];
  objc_msgSend(v2, "setRole:", sub_100045658(v1, v3));
  id v4 = v2;
  sub_1000647D0();
  if (*(void *)((*(void *)(v0 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_100064810();
  uint64_t v5 = *(void **)(v0 + 176);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 144) + 1;
  sub_100064820();
  sub_100064800();

  if (v7 == v6)
  {
    swift_bridgeObjectRelease();
    sub_100064360();
    swift_retain_n();
    uint64_t v8 = sub_100064370();
    os_log_type_t v9 = sub_100064930();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134217984;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v11 = *(void *)(*(void *)(v0 + 40) + 16);
      swift_bridgeObjectRelease();
      swift_release();
      *(void *)(v0 + 48) = v11;
      sub_100064A90();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "addParticipantsToShareWithOptions, adding %ld", v10, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
    uint64_t v19 = *(void *)(v0 + 24);
    *(void *)(v0 + 192) = v19;
    int v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v20;
    *int v20 = v0;
    v20[1] = sub_100031470;
    return sub_100045830(v19, 0, 1);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 144) + 1;
    *(void *)(v0 + 144) = v12;
    uint64_t v13 = *(void *)(v0 + 128) + 24 * v12;
    uint64_t v14 = *(void *)(v13 + 32);
    *(void *)(v0 + 152) = v14;
    uint64_t v15 = *(void *)(v13 + 40);
    *(void *)(v0 + 160) = v15;
    char v16 = *(unsigned char *)(v13 + 48);
    *(unsigned char *)(v0 + 217) = v16;
    sub_10004F730();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_100030FA0;
    return sub_100044844(v14, v15, v16);
  }
}

uint64_t sub_100031470()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_100031674;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_10003158C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10003158C()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100031600()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100031674()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000316F4()
{
  v1[8] = v0;
  uint64_t v2 = sub_100064380();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v1[13] = swift_task_alloc();
  sub_100064870();
  v1[14] = sub_100064860();
  uint64_t v4 = sub_100064830();
  v1[15] = v4;
  v1[16] = v3;
  return _swift_task_switch(sub_100031828, v4, v3);
}

uint64_t sub_100031828()
{
  uint64_t v26 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 184) = 2;
  swift_retain();
  sub_100064490();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 136) = v1;
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    if ((*(unsigned char *)(v0 + 187) & 0xFE) == 8) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = sub_100024120();
    }
    *(void *)(v0 + 144) = v2;
    unint64_t v16 = sub_100050A94();
    uint64_t v18 = v17;
    char v20 = v19;
    *(void *)(v0 + 152) = v17;
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10007E6B0
                                                                                    + dword_10007E6B0);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_100031D5C;
    uint64_t v22 = *(void *)(v0 + 104);
    return v24(v22, v1, (uint64_t)v2, v16 & 0x101FFFFFFFFFFLL, v18, v20 & 1);
  }
  else
  {
    swift_release();
    sub_10000700C();
    uint64_t v3 = swift_allocError();
    *(_OWORD *)uint64_t v4 = xmmword_1000673B0;
    *(_OWORD *)(v4 + 16) = xmmword_1000673C0;
    *(void *)(v4 + 32) = 0x800000010006A0F0;
    *(unsigned char *)(v4 + 40) = 11;
    swift_willThrow();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 186) = 0;
    swift_retain();
    sub_100064490();
    sub_100064360();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = sub_100064370();
    os_log_type_t v6 = sub_100064910();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 72);
    if (v7)
    {
      uint64_t v23 = *(void *)(v0 + 88);
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      *(void *)(v0 + 40) = v3;
      swift_errorRetain();
      sub_100006DC8(&qword_10007DF80);
      uint64_t v12 = sub_1000646F0();
      *(void *)(v0 + 48) = sub_10004BEF0(v12, v13, &v25);
      sub_100064A90();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "saveShare error: %s", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v23, v10);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    }
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_100031D5C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  v4[21] = a1;
  v4[22] = v1;
  swift_task_dealloc();
  uint64_t v5 = (void *)v3[18];
  sub_100009CA4(v3[13], &qword_10007E520);
  swift_bridgeObjectRelease();

  uint64_t v6 = v3[16];
  uint64_t v7 = v3[15];
  if (v1) {
    uint64_t v8 = sub_100032200;
  }
  else {
    uint64_t v8 = sub_100031EFC;
  }
  return _swift_task_switch(v8, v7, v6);
}

uint64_t sub_100031EFC()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 56) = v1;
  swift_retain();
  id v2 = v1;
  sub_100064490();
  sub_100064360();
  id v3 = v2;
  uint64_t v4 = sub_100064370();
  os_log_type_t v5 = sub_100064930();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 168);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v19 = *(void *)(v0 + 72);
    uint64_t v20 = *(void *)(v0 + 96);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v0 + 32) = [v6 rootRecordID];
    sub_100006DC8(&qword_10007F180);
    uint64_t v9 = sub_1000646F0();
    *(void *)(v0 + 16) = sub_10004BEF0(v9, v10, &v21);
    sub_100064A90();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "saveShare succeeded, rootRecordID: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 168);
    uint64_t v12 = *(void *)(v0 + 96);
    uint64_t v13 = *(void *)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 80);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  if (swift_unknownObjectWeakLoadStrong()) {
    swift_unknownObjectRelease();
  }
  uint64_t v15 = *(void **)(v0 + 168);
  unint64_t v16 = *(void **)(v0 + 136);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 185) = 3;
  swift_retain();
  sub_100064490();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_100032200()
{
  uint64_t v18 = v0;
  uint64_t v1 = *(void **)(v0 + 136);
  swift_release();

  uint64_t v2 = *(void *)(v0 + 176);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 186) = 0;
  swift_retain();
  sub_100064490();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  id v3 = sub_100064370();
  os_log_type_t v4 = sub_100064910();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 80);
    uint64_t v15 = *(void *)(v0 + 72);
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v17 = v7;
    *(void *)(v0 + 40) = v2;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v8 = sub_1000646F0();
    *(void *)(v0 + 48) = sub_10004BEF0(v8, v9, &v17);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "saveShare error: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v16, v15);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v12 = *(void *)(v0 + 72);
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_100032498(uint64_t a1)
{
  v2[94] = v1;
  v2[93] = a1;
  v2[95] = sub_100006DC8(&qword_10007E4C0);
  v2[96] = swift_task_alloc();
  v2[97] = swift_task_alloc();
  v2[98] = swift_task_alloc();
  v2[99] = swift_task_alloc();
  v2[100] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v2[101] = swift_task_alloc();
  v2[102] = swift_task_alloc();
  v2[103] = swift_task_alloc();
  v2[104] = swift_task_alloc();
  uint64_t v3 = sub_1000641E0();
  v2[105] = v3;
  v2[106] = *(void *)(v3 - 8);
  v2[107] = swift_task_alloc();
  v2[108] = swift_task_alloc();
  v2[109] = swift_task_alloc();
  sub_100064870();
  v2[110] = sub_100064860();
  uint64_t v5 = sub_100064830();
  v2[111] = v5;
  v2[112] = v4;
  return _swift_task_switch(sub_100032670, v5, v4);
}

uint64_t sub_100032670()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 944) & 0xFE) != 8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v1 = *(void **)(v0 + 696);
    if (v1)
    {
      id v2 = [*(id *)(v0 + 696) URL];
      if (v2)
      {
        uint64_t v3 = v2;
        uint64_t v4 = *(void *)(v0 + 864);
        uint64_t v5 = *(void *)(v0 + 848);
        uint64_t v6 = *(void *)(v0 + 840);
        uint64_t v7 = *(void *)(v0 + 832);
        sub_1000641B0();

        uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
        v8(v7, v4, v6);
        unint64_t v9 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
        v9(v7, 0, 1, v6);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v6) != 1)
        {
          uint64_t v10 = *(void *)(v0 + 872);
          uint64_t v23 = v8;
          uint64_t v11 = *(void *)(v0 + 848);
          uint64_t v12 = *(void *)(v0 + 840);
          uint64_t v13 = *(void *)(v0 + 832);
          uint64_t v24 = *(void *)(v0 + 824);
          uint64_t v25 = *(void *)(v0 + 816);
          swift_release();
          v23(v10, v13, v12);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v24, v10, v12);
          v9(v24, 0, 1, v12);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100020E94(v24, v25, &qword_10007E520);
          swift_retain_n();
          sub_100064490();
          sub_100009CA4(v24, &qword_10007E520);

          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
LABEL_10:
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
          return v20();
        }
      }
      else
      {
        (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 848) + 56))(*(void *)(v0 + 832), 1, 1, *(void *)(v0 + 840));
      }
      uint64_t v14 = *(void *)(v0 + 832);

      sub_100009CA4(v14, &qword_10007E520);
    }
  }
  uint64_t v15 = *(void *)(v0 + 848);
  uint64_t v16 = *(void *)(v0 + 840);
  uint64_t v17 = *(void *)(v0 + 808);
  sub_100020E94(*(void *)(v0 + 744), v17, &qword_10007E520);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  *(void *)(v0 + 904) = v18;
  *(void *)(v0 + 912) = (v15 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v18(v17, 1, v16) == 1)
  {
    uint64_t v19 = *(void *)(v0 + 808);
    swift_release();
    sub_100009CA4(v19, &qword_10007E520);
    goto LABEL_10;
  }
  uint64_t v22 = *(void *)(v0 + 760);
  (*(void (**)(void, void, void))(*(void *)(v0 + 848) + 32))(*(void *)(v0 + 856), *(void *)(v0 + 808), *(void *)(v0 + 840));
  *(_DWORD *)(v0 + 936) = *(_DWORD *)(v22 + 48);
  return _swift_task_switch(sub_100032B24, 0, 0);
}

uint64_t sub_100032B24()
{
  uint64_t v1 = *(void *)(v0 + 856);
  *(_DWORD *)(v0 + 940) = *(_DWORD *)(*(void *)(v0 + 760) + 48);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 920) = v2;
  *(void *)(v2 + 16) = v1;
  swift_asyncLet_begin();
  uint64_t v3 = *(void *)(v0 + 792);
  return _swift_asyncLet_get(v0 + 16, v3, sub_100032BF0, v0 + 656);
}

uint64_t sub_100032BF0()
{
  return _swift_task_switch(sub_100032C0C, 0, 0);
}

uint64_t sub_100032C0C()
{
  uint64_t v1 = *(int *)(v0 + 940);
  uint64_t v2 = *(void *)(v0 + 800);
  uint64_t v3 = *(void *)(v0 + 792);
  uint64_t v4 = *(void *)(v0 + 784);
  sub_100020E94(v3, v4, &qword_10007E520);
  uint64_t v5 = *(void **)(v3 + v1);
  *(void *)(v0 + 928) = v5;
  sub_10004FDB8(v4, v2, &qword_10007E520);
  id v6 = v5;
  uint64_t v7 = *(void *)(v0 + 792);
  return _swift_asyncLet_finish(v0 + 16, v7, sub_100032CD4, v0 + 704);
}

uint64_t sub_100032CD4()
{
  return _swift_task_switch(sub_100032CF0, 0, 0);
}

uint64_t sub_100032CF0()
{
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v0 + 896);
  uint64_t v2 = *(void *)(v0 + 888);
  return _swift_task_switch(sub_100032D58, v2, v1);
}

uint64_t sub_100032D58()
{
  uint64_t v1 = *(void *)(v0 + 928);
  uint64_t v2 = *(int *)(v0 + 936);
  uint64_t v3 = *(void *)(v0 + 800);
  uint64_t v4 = *(void *)(v0 + 776);
  uint64_t v5 = *(void *)(v0 + 760);
  swift_release();
  *(void *)(v3 + v2) = v1;
  uint64_t v6 = *(int *)(v5 + 48);
  sub_100020E94(v3, v4, &qword_10007E520);
  *(void *)(v4 + v6) = v1;
  if (v1)
  {
    uint64_t v7 = *(void **)(v0 + 928);
    uint64_t v8 = *(void *)(v0 + 856);
    uint64_t v9 = *(void *)(v0 + 848);
    uint64_t v10 = *(void *)(v0 + 840);
    uint64_t v11 = *(void *)(v0 + 800);
    uint64_t v12 = *(void *)(v0 + 776);
    id v13 = v7;
    sub_100009CA4(v12, &qword_10007E520);
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v14 = 0xD00000000000001CLL;
    *(void *)(v14 + 8) = 0x800000010006A0D0;
    *(void *)(v14 + 24) = 0;
    *(void *)(v14 + 32) = 0;
    *(void *)(v14 + 16) = v7;
    *(unsigned char *)(v14 + 40) = 7;
    swift_willThrow();
    sub_100009CA4(v11, &qword_10007E4C0);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 904);
    uint64_t v17 = *(void *)(v0 + 840);
    uint64_t v18 = *(void *)(v0 + 800);
    uint64_t v19 = *(void *)(v0 + 768);
    uint64_t v20 = *(void *)(v0 + 760);
    sub_100009CA4(*(void *)(v0 + 776), &qword_10007E520);
    uint64_t v21 = *(int *)(v20 + 48);
    sub_100020E94(v18, v19, &qword_10007E520);
    *(void *)(v19 + v21) = 0;
    uint64_t result = v16(v19, 1, v17);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v23 = *(void *)(v0 + 848);
    uint64_t v24 = *(void *)(v0 + 840);
    uint64_t v25 = *(void *)(v0 + 824);
    uint64_t v26 = *(void *)(v0 + 816);
    uint64_t v29 = *(void *)(v0 + 800);
    uint64_t v30 = *(void *)(v0 + 856);
    uint64_t v27 = *(void *)(v0 + 768);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v25, v27, v24);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v24);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100020E94(v25, v26, &qword_10007E520);
    swift_retain_n();
    sub_100064490();
    sub_100009CA4(v25, &qword_10007E520);
    swift_release();
    sub_100009CA4(v29, &qword_10007E4C0);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v28(v30, v24);
    v28(v27, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v15();
}

uint64_t sub_100033164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000648A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_100064890();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_100009CA4(a1, &qword_10007F3D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100064830();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1000332EC()
{
  v1[5] = v0;
  sub_100006DC8(&qword_10007E520);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  uint64_t v2 = sub_1000641E0();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = sub_100064380();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  sub_100064870();
  v1[15] = sub_100064860();
  uint64_t v5 = sub_100064830();
  return _swift_task_switch(sub_1000334BC, v5, v4);
}

uint64_t sub_1000334BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 133) = 1;
  swift_retain();
  sub_100064490();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 129) & 0xFE) != 8)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!Strong)
    {
      sub_100064360();
      uint64_t v7 = sub_100064370();
      os_log_type_t v8 = sub_100064930();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "ext computed property--extensionController is nil--will assert", v9, 2u);
        swift_slowDealloc();
      }
      uint64_t v11 = *(void *)(v0 + 104);
      uint64_t v10 = *(void *)(v0 + 112);
      uint64_t v12 = *(void *)(v0 + 96);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    if (!swift_unknownObjectWeakLoadStrong())
    {
      __break(1u);
      JUMPOUT(0x100033CF8);
    }
    swift_release();
    swift_unknownObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 135) = 0;
    swift_retain();
    goto LABEL_23;
  }
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) != 1)
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 80) + 32))(*(void *)(v0 + 88), *(void *)(v0 + 64), *(void *)(v0 + 72));
    sub_100064180(v13);
    uint64_t v15 = v14;
    *(void *)(v0 + 32) = 0;
    id v16 = (id)BRSharingCreateShareForItemAtURL();

    if (v16)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      id v17 = v16;
      swift_retain();
      sub_100064480();
      swift_release();
      swift_release();
      int v18 = *(unsigned __int8 *)(v0 + 132);
      swift_release();
      if (v18 == 1)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100064480();
        swift_release();
        swift_release();
        uint64_t v19 = 1;
        switch(*(unsigned char *)(v0 + 134))
        {
          case 1:
            uint64_t v19 = 3;
            goto LABEL_20;
          case 2:
            uint64_t v19 = 2;
            goto LABEL_20;
          case 3:
            return sub_100064B90();
          default:
LABEL_20:
            swift_release();
            break;
        }
      }
      else
      {
        uint64_t v19 = 1;
      }
      [v17 setPublicPermission:v19];
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 16) = v16;
      swift_retain();
      sub_100064490();
    }
    else
    {
      uint64_t v20 = *(void **)(v0 + 32);
      if (v20)
      {
        uint64_t v22 = *(void *)(v0 + 80);
        uint64_t v21 = *(void *)(v0 + 88);
        uint64_t v23 = *(void *)(v0 + 72);
        sub_10000700C();
        swift_allocError();
        *(_OWORD *)uint64_t v24 = xmmword_1000673D0;
        *(void *)(v24 + 24) = 0;
        *(void *)(v24 + 32) = 0;
        *(void *)(v24 + 16) = v20;
        *(unsigned char *)(v24 + 40) = 1;
        id v25 = v20;
        swift_willThrow();

        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 131) = 0;
        goto LABEL_4;
      }
      uint64_t v26 = *(void *)(v0 + 72);
      uint64_t v27 = *(void *)(v0 + 80);
      uint64_t v29 = *(void *)(v0 + 48);
      uint64_t v28 = *(void *)(v0 + 56);
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 24) = 0;
      swift_retain_n();
      sub_100064490();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v28, 1, 1, v26);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100020E94(v28, v29, &qword_10007E520);
      swift_retain();
      sub_100064490();
      sub_100009CA4(v28, &qword_10007E520);
      swift_release();
    }
    (*(void (**)(void, void))(*(void *)(v0 + 80) + 8))(*(void *)(v0 + 88), *(void *)(v0 + 72));
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 130) = 0;
    swift_retain();
LABEL_23:
    sub_100064490();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_24;
  }
  sub_100009CA4(*(void *)(v0 + 64), &qword_10007E520);
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v4 = 0xD000000000000016;
  *(void *)(v4 + 8) = 0x8000000100069FD0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 40) = 0;
  swift_willThrow();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 128) = 0;
LABEL_4:
  swift_retain();
  sub_100064490();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
LABEL_24:
  return v5();
}

uint64_t sub_100033D08()
{
  v1[20] = v0;
  sub_100006DC8(&qword_10007E520);
  v1[21] = swift_task_alloc();
  uint64_t v2 = sub_1000641E0();
  v1[22] = v2;
  v1[23] = *(void *)(v2 - 8);
  v1[24] = swift_task_alloc();
  sub_100064870();
  v1[25] = sub_100064860();
  uint64_t v4 = sub_100064830();
  v1[26] = v4;
  v1[27] = v3;
  return _swift_task_switch(sub_100033E2C, v4, v3);
}

uint64_t sub_100033E2C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  if ((*(void *)(v0 + 96) || *(void *)(v0 + 104) != 0xE000000000000000) && (sub_100064C10() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (!v2 && v1 == 0xE000000000000000)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  char v3 = sub_100064C10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
LABEL_13:
    swift_release();
    goto LABEL_14;
  }
LABEL_8:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 384) & 0xFE) == 8)
  {
    uint64_t v4 = *(void *)(v0 + 176);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 168);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
    {
      uint64_t v7 = *(void *)(v0 + 168);
      swift_release();
      sub_100009CA4(v7, &qword_10007E520);
LABEL_14:
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
      return v9();
    }
    (*(void (**)(void, void, void))(*(void *)(v0 + 184) + 32))(*(void *)(v0 + 192), *(void *)(v0 + 168), *(void *)(v0 + 176));
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v11;
    void *v11 = v0;
    v11[1] = sub_1000345D0;
    uint64_t v12 = *(void *)(v0 + 192);
    return sub_10001B920(v0 + 16, v12);
  }
  else
  {
    os_log_type_t v8 = sub_100024120();
    *(void *)(v0 + 224) = v8;
    uint64_t v13 = (uint64_t)v8;
    uint64_t v15 = (uint64_t (*)(uint64_t))((char *)&dword_10007DF60 + dword_10007DF60);
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v14;
    void *v14 = v0;
    v14[1] = sub_10003424C;
    return v15(v13);
  }
}

uint64_t sub_10003424C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *v5;
  *(void *)(*v5 + 240) = v4;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v11 = *(void *)(v10 + 208);
    uint64_t v12 = *(void *)(v10 + 216);
    uint64_t v13 = sub_100034528;
  }
  else
  {

    *(void *)(v10 + 248) = a4;
    *(void *)(v10 + 256) = a3;
    *(void *)(v10 + 264) = a2;
    *(void *)(v10 + 272) = a1;
    uint64_t v11 = *(void *)(v10 + 208);
    uint64_t v12 = *(void *)(v10 + 216);
    uint64_t v13 = sub_10003439C;
  }
  return _swift_task_switch(v13, v11, v12);
}

uint64_t sub_10003439C()
{
  swift_release();
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[31];
  if (v1) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v4 = 0xD000000000000016;
    *(void *)(v4 + 8) = 0x8000000100069FB0;
    *(void *)(v4 + 24) = 0;
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 16) = 0;
    *(unsigned char *)(v4 + 40) = 6;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = v0[32];
    uint64_t v6 = v0[34];
    swift_getKeyPath();
    swift_getKeyPath();
    v0[16] = v6;
    v0[17] = v1;
    v0[18] = v5;
    v0[19] = v2;
    swift_retain();
    sub_100064490();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100034528()
{
  *(void *)(v0 + 328) = *(void *)(v0 + 240);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v1;
  void *v1 = v0;
  v1[1] = sub_100034950;
  return sub_10001C0E8(v0 + 56);
}

uint64_t sub_1000345D0()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)v0;
  long long v3 = *(_OWORD *)(*(void *)v0 + 32);
  *((_OWORD *)v2 + 18) = *((_OWORD *)v2 + 1);
  *((_OWORD *)v2 + 19) = v3;
  v2[40] = v1[6];
  swift_task_dealloc();
  uint64_t v4 = v1[27];
  uint64_t v5 = v1[26];
  return _swift_task_switch(sub_10003470C, v5, v4);
}

uint64_t sub_10003470C()
{
  uint64_t v1 = v0[40];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[40];
    uint64_t v4 = v0[23];
    uint64_t v3 = v0[24];
    uint64_t v5 = v0[22];
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD000000000000016;
    *(void *)(v6 + 8) = 0x8000000100069FB0;
    *(void *)(v6 + 24) = 0;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 16) = v2;
    *(unsigned char *)(v6 + 40) = 6;
    id v7 = v2;
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
    uint64_t v8 = v0[39];
    uint64_t v9 = v0[37];
    if (v9) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      uint64_t v12 = v0[36];
      uint64_t v13 = v0[38];
      swift_getKeyPath();
      swift_getKeyPath();
      v0[16] = v12;
      v0[17] = v9;
      v0[18] = v13;
      v0[19] = v8;
      swift_retain();
      sub_100064490();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v14 = (uint64_t (*)(void))v0[1];
      goto LABEL_10;
    }
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v11 = 0xD000000000000016;
    *(void *)(v11 + 8) = 0x8000000100069FB0;
    *(void *)(v11 + 24) = 0;
    *(void *)(v11 + 32) = 0;
    *(void *)(v11 + 16) = 0;
    *(unsigned char *)(v11 + 40) = 6;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
LABEL_10:
  return v14();
}

uint64_t sub_100034950()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = (void *)*v0;
  *(_OWORD *)(v2 + 43) = *(_OWORD *)(v2 + 7);
  *(_OWORD *)(v2 + 45) = *(_OWORD *)(v2 + 9);
  v2[47] = v1[11];
  swift_task_dealloc();
  uint64_t v3 = v1[27];
  uint64_t v4 = v1[26];
  return _swift_task_switch(sub_100034A9C, v4, v3);
}

uint64_t sub_100034A9C()
{
  uint64_t v1 = v0[47];
  swift_release();
  if (v1)
  {
    uint64_t v2 = (void *)v0[47];
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v3 = 0xD000000000000016;
    *(void *)(v3 + 8) = 0x8000000100069FB0;
    *(void *)(v3 + 24) = 0;
    *(void *)(v3 + 32) = 0;
    *(void *)(v3 + 16) = v2;
    *(unsigned char *)(v3 + 40) = 6;
    id v4 = v2;
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    uint64_t v5 = v0[46];
    uint64_t v6 = v0[44];
    if (v6) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      uint64_t v9 = v0[43];
      uint64_t v10 = v0[45];
      swift_getKeyPath();
      swift_getKeyPath();
      v0[16] = v9;
      v0[17] = v6;
      v0[18] = v10;
      v0[19] = v5;
      swift_retain();
      sub_100064490();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v11 = (uint64_t (*)(void))v0[1];
      goto LABEL_10;
    }
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v8 = 0xD000000000000016;
    *(void *)(v8 + 8) = 0x8000000100069FB0;
    *(void *)(v8 + 24) = 0;
    *(void *)(v8 + 32) = 0;
    *(void *)(v8 + 16) = 0;
    *(unsigned char *)(v8 + 40) = 6;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
LABEL_10:
  return v11();
}

uint64_t sub_100034CBC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100034D34(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 57) = a3;
  *(void *)(v3 + 104) = a1;
  *(void *)(v3 + 112) = a2;
  sub_100006DC8(&qword_10007E520);
  *(void *)(v3 + 120) = swift_task_alloc();
  uint64_t v4 = sub_100064380();
  *(void *)(v3 + 128) = v4;
  *(void *)(v3 + 136) = *(void *)(v4 - 8);
  *(void *)(v3 + 144) = swift_task_alloc();
  *(void *)(v3 + 152) = swift_task_alloc();
  *(void *)(v3 + 160) = swift_task_alloc();
  *(void *)(v3 + 168) = swift_task_alloc();
  *(void *)(v3 + 176) = swift_task_alloc();
  sub_100064870();
  *(void *)(v3 + 184) = sub_100064860();
  uint64_t v6 = sub_100064830();
  *(void *)(v3 + 192) = v6;
  *(void *)(v3 + 200) = v5;
  return _swift_task_switch(sub_100034E90, v6, v5);
}

void sub_100034E90()
{
  uint64_t v1 = v0[13];
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    v0[26] = BRCloudDocsErrorDomain;
    v0[27] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[28] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100034F40;
    sub_100045E18();
  }
}

uint64_t sub_100034F40()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 200);
  uint64_t v4 = *(void *)(v2 + 192);
  if (v0) {
    uint64_t v5 = sub_1000351E8;
  }
  else {
    uint64_t v5 = sub_10003507C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10003507C()
{
  swift_release();
  sub_100064360();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[27];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    v0[12] = v3;
    sub_100064A90();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "fetchShare completed with this many retries left: %ld", v4, 0xCu);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[16];
  uint64_t v7 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_1000351E8()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 232);
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    uint64_t v1 = swift_errorRelease();
    uint64_t v4 = *(void *)(v0 + 16);
    uint64_t v5 = *(void *)(v0 + 24);
    *(void *)(v0 + 240) = v4;
    *(void *)(v0 + 248) = v5;
    uint64_t v6 = *(void **)(v0 + 32);
    uint64_t v7 = *(void *)(v0 + 40);
    *(void *)(v0 + 256) = v6;
    *(void *)(v0 + 264) = v7;
    uint64_t v8 = *(void *)(v0 + 48);
    *(void *)(v0 + 272) = v8;
    int v9 = *(unsigned __int8 *)(v0 + 56);
    uint64_t v68 = v8;
    uint64_t v69 = v4;
    if (v9 != 5)
    {
      swift_release();
      sub_100064360();
      uint64_t v16 = sub_100064370();
      os_log_type_t v17 = sub_100064910();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = v5;
        uint64_t v19 = *(void *)(v0 + 216);
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 134217984;
        *(void *)(v0 + 72) = v19;
        uint64_t v5 = v18;
        sub_100064A90();
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "tryToFetchShare error: throwing unexpected error--retries that were left: %ld", v20, 0xCu);
        swift_slowDealloc();
      }
      uint64_t v22 = *(void *)(v0 + 136);
      uint64_t v21 = *(void *)(v0 + 144);
      uint64_t v23 = *(void *)(v0 + 128);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      sub_10000700C();
      swift_allocError();
      *(void *)uint64_t v24 = 0xD00000000000003ELL;
      *(void *)(v24 + 8) = 0x800000010006ABF0;
      *(_OWORD *)(v24 + 16) = xmmword_1000673E0;
      *(void *)(v24 + 32) = 0x800000010006AC30;
      *(unsigned char *)(v24 + 40) = 11;
      swift_willThrow();
      uint64_t v26 = v68;
      uint64_t v25 = v69;
      uint64_t v27 = v5;
      uint64_t v28 = v6;
      uint64_t v29 = v7;
      unsigned __int8 v30 = v9;
      goto LABEL_23;
    }
    if (!v6)
    {
      __break(1u);
      return _swift_task_switch(v1, v2, v3);
    }
    swift_bridgeObjectRetain();
    id v66 = v6;
    id v10 = v6;
    swift_bridgeObjectRetain();
    id v11 = [v10 domain];
    uint64_t v12 = sub_1000646E0();
    uint64_t v14 = v13;

    if (v12 == sub_1000646E0() && v14 == v15)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v31 = sub_100064C10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {

        goto LABEL_17;
      }
    }
    id v32 = [v10 code];

    if (v32 == (id)7)
    {
      uint64_t v33 = *(void *)(v0 + 120);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v34 = sub_1000641E0();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 48))(v33, 1, v34) == 1)
      {
        uint64_t v35 = *(void *)(v0 + 120);
        swift_release();
        sub_100009CA4(v35, &qword_10007E520);
LABEL_18:
        sub_100064360();
        id v36 = v10;
        uint64_t v37 = sub_100064370();
        os_log_type_t v38 = sub_100064910();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = *(void *)(v0 + 216);
          uint64_t v40 = swift_slowAlloc();
          uint64_t v65 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v40 = 134218242;
          *(void *)(v0 + 80) = v39;
          sub_100064A90();
          *(_WORD *)(v40 + 12) = 2112;
          *(void *)(v0 + 88) = v36;
          os_log_t log = v37;
          id v41 = v36;
          id v42 = v36;
          sub_100064A90();
          uint64_t v43 = v66;
          *uint64_t v65 = v66;

          id v36 = v41;
          uint64_t v37 = log;
          _os_log_impl((void *)&_mh_execute_header, log, v38, "tryToFetchShare failed to fetch share so throwing--retries that were left: %ld, error: %@", (uint8_t *)v40, 0x16u);
          sub_100006DC8(&qword_10007F1B0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          uint64_t v43 = v66;
        }

        (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 128));
        sub_10000700C();
        swift_allocError();
        uint64_t v44 = v68;
        *(void *)uint64_t v45 = v69;
        *(void *)(v45 + 8) = v5;
        *(void *)(v45 + 16) = v43;
        *(void *)(v45 + 24) = v7;
        *(void *)(v45 + 32) = v68;
        *(unsigned char *)(v45 + 40) = 5;
        swift_bridgeObjectRetain();
        id v46 = v36;
        swift_bridgeObjectRetain();
        swift_willThrow();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v25 = v69;
        uint64_t v27 = v5;
        uint64_t v28 = v43;
LABEL_22:
        uint64_t v29 = v7;
        uint64_t v26 = v44;
        unsigned __int8 v30 = 5;
LABEL_23:
        sub_10001AAF4(v25, v27, v28, v29, v26, v30);
        goto LABEL_24;
      }
      char v49 = *(unsigned char *)(v0 + 57);
      sub_100009CA4(*(void *)(v0 + 120), &qword_10007E520);
      if ((v49 & 1) == 0)
      {
        uint64_t v44 = v8;
        swift_release();
        sub_100064360();
        NSString v57 = sub_100064370();
        os_log_type_t v58 = sub_100064910();
        if (os_log_type_enabled(v57, v58))
        {
          unint64_t v59 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, v58, "tryToFetchShare not synced to iCloud AND not shared so throw notInICloud error", v59, 2u);
          swift_slowDealloc();
        }
        uint64_t v60 = *(void *)(v0 + 168);
        uint64_t v61 = *(void *)(v0 + 128);
        uint64_t v62 = *(void *)(v0 + 136);

        (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
        sub_10000700C();
        swift_allocError();
        *(void *)uint64_t v63 = v69;
        *(void *)(v63 + 8) = v5;
        *(void *)(v63 + 16) = v66;
        *(void *)(v63 + 24) = v7;
        *(void *)(v63 + 32) = v44;
        *(unsigned char *)(v63 + 40) = 5;
        swift_bridgeObjectRetain();
        id v64 = v10;
        swift_bridgeObjectRetain();
        swift_willThrow();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v25 = v69;
        uint64_t v27 = v5;
        uint64_t v28 = v66;
        goto LABEL_22;
      }
      sub_100064360();
      id v50 = sub_100064370();
      os_log_type_t v51 = sub_100064930();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = *(void *)(v0 + 216);
        uint64_t v53 = swift_slowAlloc();
        *(_DWORD *)uint64_t v53 = 134217984;
        *(void *)(v53 + 4) = v52;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "About to retry tryToFetchShare post-share when unsynced after 1 second--retries left including this one: %ld", (uint8_t *)v53, 0xCu);
        swift_slowDealloc();
      }
      uint64_t v54 = *(void *)(v0 + 160);
      uint64_t v55 = *(void *)(v0 + 128);
      uint64_t v56 = *(void *)(v0 + 136);

      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
      uint64_t v1 = (uint64_t)sub_100035A6C;
      uint64_t v2 = 0;
      uint64_t v3 = 0;
      return _swift_task_switch(v1, v2, v3);
    }
LABEL_17:
    swift_release();
    goto LABEL_18;
  }
  swift_release();
LABEL_24:
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

uint64_t sub_100035A6C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v1;
  void *v1 = v0;
  v1[1] = sub_100035B04;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_100035B04()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 192);
    uint64_t v4 = *(void *)(v2 + 200);
    uint64_t v5 = sub_10005002C;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 192);
    uint64_t v4 = *(void *)(v2 + 200);
    uint64_t v5 = sub_100035C28;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100035C28()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v4 = v0[31];
  uint64_t v3 = (void *)v0[32];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[27];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10001AAF4(v5, v4, v3, v1, v2, 5u);
  uint64_t result = swift_errorRelease();
  if (v6 == 1)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v8 = v0[27];
    if (v8 < 2)
    {
      __break(1u);
    }
    else
    {
      v0[27] = v8 - 1;
      int v9 = (void *)swift_task_alloc();
      v0[28] = v9;
      *int v9 = v0;
      v9[1] = sub_100034F40;
      return sub_100045E18();
    }
  }
  return result;
}

uint64_t sub_100035DB4(char a1, char a2)
{
  uint64_t v4 = sub_100064380();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    if (a1)
    {
      sub_100064360();
      uint64_t v8 = sub_100064370();
      os_log_type_t v9 = sub_100064910();
      if (os_log_type_enabled(v8, v9))
      {
        id v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "setExecutionModeForSPI specified true for both isPreShare and isAddPeople; this will eventually become an internal error",
          v10,
          2u);
        swift_slowDealloc();
      }

      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    v13[13] = 3;
    swift_retain();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    uint64_t result = swift_release();
    if (v13[15] == 3) {
      return result;
    }
    if (a1) {
      char v12 = 1;
    }
    else {
      char v12 = 2;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    v13[14] = v12;
    swift_retain();
  }
  return sub_100064490();
}

uint64_t sub_100035FDC()
{
  return sub_100043B48();
}

uint64_t sub_100035FF0(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 88) = a1;
  sub_100006DC8(&qword_10007E520);
  *(void *)(v2 + 24) = swift_task_alloc();
  sub_100064870();
  *(void *)(v2 + 32) = sub_100064860();
  uint64_t v4 = sub_100064830();
  *(void *)(v2 + 40) = v4;
  *(void *)(v2 + 48) = v3;
  return _swift_task_switch(sub_1000360BC, v4, v3);
}

uint64_t sub_1000360BC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v2 = sub_1000641E0();
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  *(void *)(v0 + 64) = v3;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_100036208;
    uint64_t v6 = *(void *)(v0 + 24);
    char v7 = *(unsigned char *)(v0 + 88);
    return sub_10001C980(v6, v7);
  }
  return result;
}

uint64_t sub_100036208()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[5];
    uint64_t v4 = v2[6];
    uint64_t v5 = sub_1000363A0;
  }
  else
  {
    (*(void (**)(void, void))(v2[8] + 8))(v2[3], v2[7]);
    uint64_t v3 = v2[5];
    uint64_t v4 = v2[6];
    uint64_t v5 = sub_100036334;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100036334()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000363A0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[3];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100036430()
{
  return sub_100043B48();
}

uint64_t sub_100036444()
{
  return sub_100044024();
}

unint64_t sub_100036458(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_1000647B0() != a1 || v9 != a2)
  {
    char v10 = sub_100064C10();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_100064740();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

BOOL sub_100036548()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if (!v3) {
    return 0;
  }

  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (!v2) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  return v1 != 0;
}

uint64_t sub_100036688(uint64_t a1)
{
  uint64_t v422 = *v1;
  uint64_t v444 = sub_100006DC8(&qword_10007EC80);
  uint64_t v443 = *(void *)(v444 - 8);
  __chkstk_darwin(v444);
  v442 = (char *)&v304 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v447 = sub_100006DC8(&qword_10007EC88);
  uint64_t v446 = *(void *)(v447 - 8);
  __chkstk_darwin(v447);
  v445 = (char *)&v304 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v450 = sub_100006DC8((uint64_t *)&unk_10007EC90);
  uint64_t v449 = *(void *)(v450 - 8);
  __chkstk_darwin(v450);
  v448 = (char *)&v304 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v436 = sub_100006DC8(&qword_10007E2F8);
  uint64_t v435 = *(void *)(v436 - 8);
  __chkstk_darwin(v436);
  v433 = (char *)&v304 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v437 = sub_100006DC8(&qword_10007ECA0);
  __chkstk_darwin(v437);
  v434 = (char *)&v304 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v441 = sub_100006DC8(&qword_10007ECA8);
  uint64_t v438 = *(void *)(v441 - 8);
  uint64_t v8 = __chkstk_darwin(v441);
  v439 = (char *)&v304 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v440 = (char *)&v304 - v10;
  uint64_t v427 = sub_100006DC8(&qword_10007ECB0);
  __chkstk_darwin(v427);
  v425 = (char *)&v304 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v429 = sub_100006DC8(&qword_10007ECB8);
  uint64_t v428 = *(void *)(v429 - 8);
  __chkstk_darwin(v429);
  v426 = (char *)&v304 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v432 = sub_100006DC8(&qword_10007ECC0);
  uint64_t v431 = *(void *)(v432 - 8);
  __chkstk_darwin(v432);
  v430 = (char *)&v304 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v424 = sub_100006DC8(&qword_10007ECC8);
  uint64_t v423 = *(void *)(v424 - 8);
  uint64_t v14 = __chkstk_darwin(v424);
  v420 = (char *)&v304 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v421 = (char *)&v304 - v16;
  uint64_t v417 = sub_100006DC8(&qword_10007ECD0);
  uint64_t v415 = *(void *)(v417 - 8);
  __chkstk_darwin(v417);
  v414 = (char *)&v304 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v409 = sub_100006DC8(&qword_10007ECD8);
  uint64_t v408 = *(void *)(v409 - 8);
  __chkstk_darwin(v409);
  v406 = (char *)&v304 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v410 = sub_100006DC8(&qword_10007ECE0);
  uint64_t v19 = __chkstk_darwin(v410);
  v407 = (char *)&v304 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v405 = (char *)&v304 - v21;
  uint64_t v413 = sub_100006DC8(&qword_10007ECE8);
  uint64_t v412 = *(void *)(v413 - 8);
  __chkstk_darwin(v413);
  v411 = (char *)&v304 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v419 = sub_100006DC8(&qword_10007ECF0);
  uint64_t v418 = *(void *)(v419 - 8);
  __chkstk_darwin(v419);
  v416 = (char *)&v304 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v404 = sub_100006DC8(&qword_10007ECF8);
  uint64_t v403 = *(void *)(v404 - 8);
  __chkstk_darwin(v404);
  v402 = (char *)&v304 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v401 = sub_100006DC8(&qword_10007ED00);
  uint64_t v400 = *(void *)(v401 - 8);
  __chkstk_darwin(v401);
  v399 = (char *)&v304 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v398 = sub_100006DC8(&qword_10007ED08);
  uint64_t v397 = *(void *)(v398 - 8);
  __chkstk_darwin(v398);
  v396 = (char *)&v304 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v395 = sub_100006DC8(&qword_10007ED10);
  uint64_t v394 = *(void *)(v395 - 8);
  __chkstk_darwin(v395);
  v393 = (char *)&v304 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v392 = sub_100006DC8(&qword_10007ED18);
  uint64_t v391 = *(void *)(v392 - 8);
  __chkstk_darwin(v392);
  v390 = (char *)&v304 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v389 = sub_100006DC8(&qword_10007ED20);
  uint64_t v388 = *(void *)(v389 - 8);
  __chkstk_darwin(v389);
  v387 = (char *)&v304 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v375 = sub_100006DC8(&qword_10007ED28);
  uint64_t v374 = *(void *)(v375 - 8);
  __chkstk_darwin(v375);
  v373 = (char *)&v304 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v383 = sub_100006DC8(&qword_10007ED30);
  uint64_t v382 = *(void *)(v383 - 8);
  __chkstk_darwin(v383);
  v381 = (char *)&v304 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v370 = sub_100006DC8(&qword_10007ED38);
  uint64_t v369 = *(void *)(v370 - 8);
  __chkstk_darwin(v370);
  v367 = (char *)&v304 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v378 = sub_100006DC8(&qword_10007ED40);
  uint64_t v377 = *(void *)(v378 - 8);
  __chkstk_darwin(v378);
  v376 = (char *)&v304 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v372 = sub_100006DC8(&qword_10007ED48);
  uint64_t v371 = *(void *)(v372 - 8);
  __chkstk_darwin(v372);
  v466 = (char *)&v304 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v379 = sub_100006DC8(&qword_10007ED50);
  __chkstk_darwin(v379);
  v380 = (char *)&v304 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v386 = sub_100006DC8(&qword_10007ED58);
  uint64_t v385 = *(void *)(v386 - 8);
  __chkstk_darwin(v386);
  v384 = (char *)&v304 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v465 = sub_100006DC8((uint64_t *)&unk_10007ED60);
  uint64_t v368 = *(void *)(v465 - 8);
  uint64_t v37 = __chkstk_darwin(v465);
  v365 = (char *)&v304 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  v366 = (char *)&v304 - v39;
  uint64_t v488 = sub_100006DC8(&qword_10007E320);
  uint64_t v467 = *(void *)(v488 - 8);
  __chkstk_darwin(v488);
  v487 = (char *)&v304 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v360 = sub_100006DC8(&qword_10007ED70);
  uint64_t v359 = *(void *)(v360 - 8);
  __chkstk_darwin(v360);
  v358 = (char *)&v304 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v363 = sub_100006DC8(&qword_10007ED78);
  uint64_t v362 = *(void *)(v363 - 8);
  __chkstk_darwin(v363);
  v361 = (char *)&v304 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100006DC8(&qword_10007ED80);
  __chkstk_darwin(v43 - 8);
  v502 = (char *)&v304 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v483 = sub_100006DC8(&qword_10007ED88);
  uint64_t v497 = *(void *)(v483 - 8);
  __chkstk_darwin(v483);
  v364 = (char *)&v304 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v463 = sub_100006DC8(&qword_10007ED90);
  uint64_t v462 = *(void *)(v463 - 8);
  __chkstk_darwin(v463);
  v461 = (char *)&v304 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v455 = sub_100006DC8(&qword_10007ED98);
  v356 = *(void (***)(char *, uint64_t))(v455 - 8);
  __chkstk_darwin(v455);
  v355 = (char *)&v304 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v485 = sub_100006DC8(&qword_10007EDA0);
  uint64_t v498 = *(void *)(v485 - 8);
  uint64_t v48 = __chkstk_darwin(v485);
  v479 = (char *)&v304 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v48);
  v484 = (char *)&v304 - v50;
  uint64_t v51 = sub_100006DC8(&qword_10007EDA8);
  uint64_t v490 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  v472 = (char *)&v304 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v475 = sub_100006DC8(&qword_10007EDB0);
  __chkstk_darwin(v475);
  v491 = (char *)&v304 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v353 = (void *)sub_100006DC8(&qword_10007EDB8);
  uint64_t v352 = *(v353 - 1);
  __chkstk_darwin(v353);
  v350 = (char *)&v304 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v478 = sub_100006DC8(&qword_10007EDC0);
  uint64_t v55 = __chkstk_darwin(v478);
  v457 = (char *)&v304 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v55);
  v451 = (void (*)(char *, uint64_t))((char *)&v304 - v57);
  uint64_t v470 = sub_100006DC8(&qword_10007EDC8);
  uint64_t v489 = *(void *)(v470 - 8);
  __chkstk_darwin(v470);
  v469 = (char *)&v304 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v471 = sub_100006DC8(&qword_10007EDD0);
  __chkstk_darwin(v471);
  v499 = (char *)&v304 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v454 = sub_100006DC8(&qword_10007EDD8);
  unint64_t v452 = *(void *)(v454 - 8);
  __chkstk_darwin(v454);
  v354 = (char *)&v304 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  v477 = (void (*)(void))sub_100006DC8(&qword_10007EDE0);
  v456 = (void (**)(char *, void (*)(void)))*((void *)v477 - 1);
  __chkstk_darwin(v477);
  v453 = (char *)&v304 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v480 = (void *)sub_100006DC8(&qword_10007EDE8);
  uint64_t v351 = *(v480 - 1);
  __chkstk_darwin(v480);
  v349 = (char *)&v304 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v348 = sub_100006DC8(&qword_10007EDF0);
  v347 = *(void (**)(char *, uint64_t))(v348 - 8);
  __chkstk_darwin(v348);
  v344 = (char *)&v304 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v346 = sub_100006DC8(&qword_10007EDF8);
  v345 = *(void (**)(uint64_t, char *, uint64_t))(v346 - 8);
  __chkstk_darwin(v346);
  v343 = (char *)&v304 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v468 = sub_100006DC8(&qword_10007EE00);
  uint64_t v342 = *(void *)(v468 - 8);
  __chkstk_darwin(v468);
  v341 = (char *)&v304 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v476 = sub_100006DC8(&qword_10007EE08);
  uint64_t v340 = *(void *)(v476 - 8);
  __chkstk_darwin(v476);
  v339 = (char *)&v304 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  v494 = (void *)sub_100006DC8((uint64_t *)&unk_10007EE10);
  uint64_t v357 = *(v494 - 1);
  __chkstk_darwin(v494);
  v338 = (char *)&v304 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v486 = sub_100006DC8(&qword_10007E350);
  uint64_t v337 = *(void *)(v486 - 8);
  __chkstk_darwin(v486);
  v336 = (char *)&v304 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v335 = sub_100006DC8(&qword_10007EE20);
  uint64_t v334 = *(void *)(v335 - 8);
  __chkstk_darwin(v335);
  v333 = (char *)&v304 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v474 = sub_100006DC8(&qword_10007EE28);
  uint64_t v332 = *(void *)(v474 - 8);
  __chkstk_darwin(v474);
  v331 = (char *)&v304 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v328 = sub_100006DC8(&qword_10007EE30);
  uint64_t v327 = *(void *)(v328 - 8);
  __chkstk_darwin(v328);
  v326 = (char *)&v304 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v459 = sub_100006DC8(&qword_10007EE38);
  uint64_t v325 = *(void *)(v459 - 8);
  __chkstk_darwin(v459);
  v324 = (char *)&v304 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  v492 = (void *)sub_100006DC8(&qword_10007E520);
  uint64_t v73 = __chkstk_darwin(v492);
  uint64_t v323 = (uint64_t)&v304 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __chkstk_darwin(v73);
  uint64_t v330 = (uint64_t)&v304 - v76;
  __chkstk_darwin(v75);
  v329 = (char *)&v304 - v77;
  uint64_t v322 = sub_100006DC8(&qword_10007EE40);
  uint64_t v321 = *(void *)(v322 - 8);
  __chkstk_darwin(v322);
  v320 = (char *)&v304 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v319 = sub_100006DC8(&qword_10007EA00);
  uint64_t v79 = __chkstk_darwin(v319);
  uint64_t v318 = (uint64_t)&v304 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v79);
  v317 = (char *)&v304 - v81;
  uint64_t v464 = sub_100006DC8(&qword_10007EE48);
  uint64_t v316 = *(void *)(v464 - 8);
  __chkstk_darwin(v464);
  v315 = (char *)&v304 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v460 = sub_100006DC8(&qword_10007EE50);
  uint64_t v314 = *(void *)(v460 - 8);
  __chkstk_darwin(v460);
  v313 = (char *)&v304 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v458 = sub_100006DC8(&qword_10007EE58);
  uint64_t v312 = *(void *)(v458 - 8);
  __chkstk_darwin(v458);
  v311 = (char *)&v304 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v310 = sub_100006DC8(&qword_10007EE60);
  uint64_t v309 = *(void *)(v310 - 8);
  __chkstk_darwin(v310);
  v308 = (char *)&v304 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v307 = sub_100006DC8(&qword_10007EE68);
  uint64_t v306 = *(void *)(v307 - 8);
  __chkstk_darwin(v307);
  uint64_t v87 = (char *)&v304 - ((v86 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v496 = sub_100006DC8(&qword_10007EE70);
  uint64_t v88 = *(void *)(v496 - 8);
  __chkstk_darwin(v496);
  uint64_t v90 = (char *)&v304 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v481 = sub_100006DC8(&qword_10007EE78);
  uint64_t v91 = *(void *)(v481 - 8);
  __chkstk_darwin(v481);
  uint64_t v93 = (char *)&v304 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100006DC8(&qword_10007EE80);
  uint64_t v95 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v97 = (char *)&v304 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v504 = a1;
  uint64_t v473 = v51;
  v305 = v87;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100064BA0()) {
    long long v98 = (void *)sub_10004DD20((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    long long v98 = &_swiftEmptySetSingleton;
  }
  uint64_t v99 = v500;
  uint64_t v100 = v500;
  *(void *)(v500 + 32) = v98;
  uint64_t v495 = v100 + 32;
  *(void *)(v99 + 48) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v99 + 56) = swift_getKeyPath();
  *(unsigned char *)(v99 + 64) = 0;
  uint64_t v101 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isDelegateInitialized;
  LOBYTE(v505) = 0;
  sub_100064450();
  v482 = *(void (**)(uint64_t, char *, uint64_t))(v95 + 32);
  v503 = (void *)(v95 + 32);
  v501 = (void (*)(void, void))v94;
  v482(v101, v97, v94);
  uint64_t v102 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__executionMode;
  LOBYTE(v505) = 0;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v91 + 32))(v102, v93, v481);
  uint64_t v103 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingType;
  LOBYTE(v505) = 8;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v103, v90, v496);
  uint64_t v104 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingStage;
  LOBYTE(v505) = 0;
  v105 = v305;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v306 + 32))(v104, v105, v307);
  uint64_t v106 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__addedAddresses;
  unint64_t v505 = (unint64_t)_swiftEmptyArrayStorage;
  sub_100006DC8(&qword_10007E9D8);
  id v107 = v308;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v309 + 32))(v106, v107, v310);
  uint64_t v108 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__createOrLoadStage;
  LOBYTE(v505) = 0;
  uint64_t v109 = v311;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v312 + 32))(v108, v109, v458);
  uint64_t v110 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__addingAddressesStage;
  LOBYTE(v505) = 0;
  uint64_t v111 = v313;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v314 + 32))(v110, v111, v460);
  uint64_t v112 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__savingStage;
  LOBYTE(v505) = 2;
  v113 = v315;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v316 + 32))(v112, v113, v464);
  uint64_t v114 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__alertNowShowing;
  uint64_t v115 = type metadata accessor for AlertViewModel(0);
  uint64_t v116 = (uint64_t)v317;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56))(v317, 1, 1, v115);
  sub_100020E94(v116, v318, &qword_10007EA00);
  v117 = v320;
  sub_100064450();
  sub_100009CA4(v116, &qword_10007EA00);
  (*(void (**)(uint64_t, char *, uint64_t))(v321 + 32))(v114, v117, v322);
  uint64_t v118 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isShowingAlert;
  LOBYTE(v505) = 0;
  v493 = v97;
  sub_100064450();
  v119 = v501;
  v120 = v482;
  v482(v118, v97, (uint64_t)v501);
  uint64_t v121 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isFolderShare;
  LOBYTE(v505) = 0;
  sub_100064450();
  v120(v121, v97, (uint64_t)v119);
  uint64_t v319 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderURL;
  uint64_t v321 = sub_1000641E0();
  uint64_t v122 = *(void *)(v321 - 8);
  v320 = *(char **)(v122 + 56);
  uint64_t v322 = v122 + 56;
  uint64_t v123 = (uint64_t)v329;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v320)(v329, 1, 1, v321);
  sub_100006DC8(&qword_10007EE88);
  uint64_t v124 = swift_allocObject();
  v125 = (void *)(v124 + *(void *)(*(void *)v124 + 104));
  void *v125 = 0;
  v125[1] = 0;
  uint64_t v126 = v330;
  sub_100020E94(v123, v330, &qword_10007E520);
  swift_beginAccess();
  sub_100020E94(v126, v323, &qword_10007E520);
  sub_100064450();
  sub_100009CA4(v126, &qword_10007E520);
  swift_endAccess();
  sub_100009CA4(v123, &qword_10007E520);
  *(void *)(v99 + v319) = v124;
  uint64_t v127 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isFolderSubshare;
  LOBYTE(v505) = 0;
  v128 = v493;
  sub_100064450();
  v120(v127, v128, (uint64_t)v119);
  v129 = v120;
  uint64_t v130 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderTitle;
  sub_100006DC8(&qword_10007EE90);
  uint64_t v131 = swift_allocObject();
  v132 = (void *)(v131 + *(void *)(*(void *)v131 + 104));
  void *v132 = 0;
  v132[1] = 0;
  swift_beginAccess();
  id v509 = 0;
  uint64_t v510 = 0;
  uint64_t v133 = sub_100006DC8(&qword_10007EA40);
  sub_100064450();
  swift_endAccess();
  *(void *)(v99 + v130) = v131;
  uint64_t v134 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__ckFolderSubitemName;
  uint64_t v135 = swift_allocObject();
  v136 = (void *)(v135 + *(void *)(*(void *)v135 + 104));
  void *v136 = 0;
  v136[1] = 0;
  swift_beginAccess();
  id v509 = 0;
  uint64_t v510 = 0;
  uint64_t v323 = v133;
  sub_100064450();
  swift_endAccess();
  *(void *)(v99 + v134) = v135;
  uint64_t v137 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__folderSharingStage;
  LOBYTE(v505) = 4;
  sub_100006DC8(&qword_10007EA10);
  v138 = v324;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v325 + 32))(v137, v138, v459);
  uint64_t v139 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__shareSaveStatus;
  LOBYTE(v505) = 0;
  v140 = v326;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v327 + 32))(v139, v140, v328);
  v141 = (void *)(v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_lastServicesData);
  void *v141 = 0;
  v141[1] = 0;
  uint64_t v142 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingOptionsAllowedFromSPI;
  unint64_t v505 = 15;
  v143 = v331;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v332 + 32))(v142, v143, v474);
  uint64_t v144 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__yourNameAndEmail;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  uint64_t v507 = 0;
  unint64_t v508 = 0xE000000000000000;
  sub_100006DC8((uint64_t *)&unk_10007EA30);
  v145 = v333;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v334 + 32))(v144, v145, v335);
  uint64_t v146 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharedFileOrFolderURL;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v320)(v123, 1, 1, v321);
  sub_100020E94(v123, v126, &qword_10007E520);
  v147 = v336;
  sub_100064450();
  sub_100009CA4(v123, &qword_10007E520);
  (*(void (**)(uint64_t, char *, uint64_t))(v337 + 32))(v146, v147, v486);
  *(unsigned char *)(v99
           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_shouldStopAccessingSharedFileOrFolderURL) = 0;
  uint64_t v148 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__itemUTI;
  unint64_t v505 = 0;
  unint64_t v506 = 0;
  v149 = v338;
  sub_100064450();
  v492 = *(void **)(v357 + 32);
  ((void (*)(uint64_t, char *, void *))v492)(v148, v149, v494);
  uint64_t v150 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isShareRoot;
  LOBYTE(v505) = 1;
  v151 = v493;
  sub_100064450();
  v129(v150, v151, (uint64_t)v501);
  uint64_t v152 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnail;
  unint64_t v505 = (unint64_t)[objc_allocWithZone((Class)UIImage) init];
  uint64_t v357 = sub_10000EF58(0, &qword_10007EA50);
  v153 = v339;
  sub_100064450();
  (*(void (**)(uint64_t, char *, uint64_t))(v340 + 32))(v152, v153, v476);
  uint64_t v154 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnailFromCloudKitSPI;
  unint64_t v505 = 0;
  sub_100006DC8(&qword_10007EA60);
  v155 = v341;
  sub_100064450();
  v156 = *(void (**)(uint64_t, char *, uint64_t))(v342 + 32);
  uint64_t v157 = v468;
  v156(v154, v155, v468);
  uint64_t v158 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnailFromDocumentSPI;
  unint64_t v505 = 0;
  sub_100064450();
  v156(v158, v155, v157);
  uint64_t v159 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__itemTitle;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  v160 = v343;
  sub_100064450();
  v161 = (void (*)(uint64_t, char *, uint64_t))*((void *)v345 + 4);
  uint64_t v162 = v346;
  v161(v159, v160, v346);
  uint64_t v163 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sourceAppBundleID;
  unint64_t v505 = 0;
  unint64_t v506 = 0;
  sub_100064450();
  ((void (*)(uint64_t, char *, void *))v492)(v163, v149, v494);
  uint64_t v164 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sectionTitleForAuxiliaryToggles;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  sub_100064450();
  v161(v164, v160, v162);
  uint64_t v165 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__primaryCheckboxTitle;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  sub_100064450();
  v161(v165, v160, v162);
  v345 = v161;
  uint64_t v166 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__secondaryCheckboxTitle;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  sub_100064450();
  v161(v166, v160, v162);
  uint64_t v167 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__primaryCheckboxState;
  LOBYTE(v505) = 0;
  v168 = v493;
  sub_100064450();
  v169 = v501;
  v170 = v482;
  v482(v167, v168, (uint64_t)v501);
  uint64_t v171 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__secondaryCheckboxState;
  LOBYTE(v505) = 0;
  sub_100064450();
  v170(v171, v168, (uint64_t)v169);
  uint64_t v172 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__ckContainerIdentifier;
  unint64_t v505 = (unint64_t)[objc_allocWithZone((Class)CKContainerID) init];
  sub_10000EF58(0, &qword_10007E378);
  v173 = v344;
  sub_100064450();
  (*((void (**)(uint64_t, char *, unint64_t))v347 + 4))(v172, v173, v348);
  uint64_t v174 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__helpAnchor;
  unint64_t v505 = 0;
  unint64_t v506 = 0xE000000000000000;
  sub_100064450();
  v345(v174, v160, v162);
  uint64_t v175 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__participantDetails;
  unint64_t v505 = sub_10002F020((uint64_t)_swiftEmptyArrayStorage);
  sub_100006DC8((uint64_t *)&unk_10007EA88);
  v176 = v349;
  sub_100064450();
  (*(void (**)(uint64_t, char *, void *))(v351 + 32))(v175, v176, v480);
  uint64_t v177 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_networkMonitor;
  type metadata accessor for NetworkMonitor();
  swift_allocObject();
  uint64_t v178 = v99;
  *(void *)(v99 + v177) = sub_10000732C(0);
  *(void *)(v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_ckMetadata) = 0;
  uint64_t v179 = v504;
  *(void *)(v99 + 16) = v504;
  *(void *)(v99 + 24) = *(void *)(v179
                                    + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel_ckShareModel);
  swift_weakAssign();
  uint64_t v351 = v99 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharedFileOrFolderURL;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  v180 = v469;
  sub_100064460();
  swift_endAccess();
  v503 = &protocol conformance descriptor for Published<A>.Publisher;
  v349 = (char *)sub_10000EDB4(&qword_10007EE98, &qword_10007EDC8);
  unint64_t v348 = sub_1000098F8();
  uint64_t v181 = v470;
  sub_1000644F0();
  v182 = *(void (**)(char *, uint64_t))(v489 + 8);
  v489 += 8;
  v347 = v182;
  v182(v180, v181);
  swift_beginAccess();
  v183 = v350;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4((unint64_t *)&unk_10007EEB0, &qword_10007EDB8);
  sub_1000097E4();
  v184 = v353;
  sub_1000644F0();
  v185 = *(void (**)(char *, void *))(v352 + 8);
  v185(v183, v184);
  swift_beginAccess();
  sub_100064460();
  swift_endAccess();
  sub_1000644F0();
  v185(v183, v184);
  swift_beginAccess();
  v186 = v472;
  sub_100064460();
  swift_endAccess();
  uint64_t v346 = sub_10000EDB4(&qword_10007EEC0, &qword_10007EDA8);
  uint64_t v187 = v473;
  sub_1000644F0();
  v188 = *(void (**)(uint64_t, char *, uint64_t))(v490 + 8);
  v490 += 8;
  v345 = v188;
  ((void (*)(char *, uint64_t))v188)(v186, v187);
  v350 = (char *)sub_10000EDB4(&qword_10007EEC8, &qword_10007EDD0);
  sub_10000EDB4(&qword_10007EED0, &qword_10007EDC0);
  v482 = (void (*)(uint64_t, char *, uint64_t))&protocol conformance descriptor for Publishers.RemoveDuplicates<A>;
  uint64_t v352 = sub_10000EDB4(&qword_10007EED8, &qword_10007EDB0);
  v189 = v354;
  sub_1000643D0();
  uint64_t v190 = swift_allocObject();
  *(void *)(v190 + 16) = sub_10004D4F0;
  *(void *)(v190 + 24) = v178;
  v353 = &protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>;
  sub_10000EDB4(&qword_10007EEE0, &qword_10007EDD8);
  swift_retain();
  v191 = v453;
  uint64_t v192 = v454;
  sub_1000644C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v452 + 8))(v189, v192);
  uint64_t v193 = v178 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingType;
  swift_beginAccess();
  v194 = v484;
  sub_100064460();
  swift_endAccess();
  v457 = (char *)&protocol conformance descriptor for Publishers.Map<A, B>;
  sub_10000EDB4(&qword_10007EEE8, &qword_10007EDE0);
  v195 = v477;
  sub_100064510();
  v456[1](v191, v195);
  uint64_t v196 = v498;
  uint64_t v197 = v485;
  (*(void (**)(char *, char *, uint64_t))(v498 + 16))(v479, v194, v485);
  uint64_t v454 = v193;
  swift_beginAccess();
  sub_100064470();
  swift_endAccess();
  v198 = *(void (***)(char *, void (*)(void)))(v196 + 8);
  uint64_t v498 = v196 + 8;
  v456 = v198;
  ((void (*)(char *, uint64_t))v198)(v194, v197);
  v199 = (char *)(v178 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__executionMode);
  swift_beginAccess();
  v200 = v364;
  sub_100064460();
  swift_endAccess();
  v453 = (char *)sub_10000EDB4(&qword_10007EEF0, &qword_10007ED88);
  unint64_t v452 = sub_10004D59C();
  v201 = v461;
  uint64_t v202 = v483;
  sub_1000644F0();
  v203 = *(void (**)(char *, uint64_t))(v497 + 8);
  v497 += 8;
  v451 = v203;
  v203(v200, v202);
  v494 = self;
  unint64_t v505 = (unint64_t)[v494 mainRunLoop];
  v492 = (void *)sub_100064A60();
  uint64_t v204 = *(v492 - 1);
  v477 = *(void (**)(void))(v204 + 56);
  v493 = (char *)(v204 + 56);
  uint64_t v205 = (uint64_t)v502;
  v477();
  v479 = (char *)sub_10000EF58(0, &qword_10007EF00);
  v344 = (char *)sub_10000EDB4(&qword_10007EF08, &qword_10007ED90);
  uint64_t v478 = sub_10004D5F0((unint64_t *)&qword_10007EF10, &qword_10007EF00);
  v206 = v355;
  uint64_t v207 = v463;
  sub_1000644E0();
  sub_100009CA4(v205, &qword_10007ED80);

  (*(void (**)(char *, uint64_t))(v462 + 8))(v201, v207);
  v480 = &protocol conformance descriptor for Publishers.ReceiveOn<A, B>;
  sub_10000EDB4(&qword_10007EF18, &qword_10007ED98);
  swift_retain();
  uint64_t v208 = v455;
  sub_100064500();
  swift_release();
  v356[1](v206, v208);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  v354 = v199;
  swift_beginAccess();
  sub_100064460();
  swift_endAccess();
  uint64_t v209 = v483;
  sub_1000644F0();
  v451(v200, v209);
  swift_beginAccess();
  swift_retain();
  uint64_t v455 = sub_100006DC8((uint64_t *)&unk_10007EF20);
  sub_100064460();
  swift_endAccess();
  swift_release();
  v355 = (char *)sub_10000EDB4(&qword_10007E358, &qword_10007E320);
  v210 = v358;
  sub_100064390();
  uint64_t v211 = swift_allocObject();
  swift_weakInit();
  uint64_t v212 = swift_allocObject();
  *(void *)(v212 + 16) = sub_10004D674;
  *(void *)(v212 + 24) = v211;
  v356 = (void (**)(char *, uint64_t))&protocol conformance descriptor for Publishers.CombineLatest<A, B>;
  sub_10000EDB4((unint64_t *)&unk_10007EF30, &qword_10007ED70);
  v213 = v361;
  uint64_t v214 = v360;
  sub_1000644C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v359 + 8))(v210, v214);
  swift_beginAccess();
  swift_retain();
  uint64_t v215 = sub_100006DC8(&qword_10007E348);
  v216 = v366;
  uint64_t v360 = v215;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007EF40, &qword_10007ED78);
  uint64_t v217 = v363;
  sub_100064510();
  (*(void (**)(char *, uint64_t))(v362 + 8))(v213, v217);
  uint64_t v218 = v368;
  uint64_t v219 = v465;
  (*(void (**)(char *, char *, uint64_t))(v368 + 16))(v365, v216, v465);
  swift_beginAccess();
  sub_100064470();
  swift_endAccess();
  uint64_t v368 = *(void *)(v218 + 8);
  ((void (*)(char *, uint64_t))v368)(v216, v219);
  swift_release();
  swift_beginAccess();
  sub_100064460();
  swift_endAccess();
  uint64_t v220 = v483;
  sub_1000644F0();
  v451(v200, v220);
  swift_beginAccess();
  v221 = v484;
  sub_100064460();
  swift_endAccess();
  uint64_t v497 = sub_10000EDB4(&qword_10007EF48, &qword_10007EDA0);
  sub_10004D6B4();
  uint64_t v222 = v485;
  sub_1000644F0();
  ((void (*)(char *, uint64_t))v456)(v221, v222);
  swift_beginAccess();
  swift_retain();
  v223 = v487;
  sub_100064460();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  sub_100006DC8(&qword_10007EF58);
  v224 = v367;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007EF60, &qword_10007ED38);
  sub_10004D708();
  v225 = v376;
  uint64_t v226 = v370;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v369 + 8))(v224, v226);
  swift_beginAccess();
  sub_100006DC8(&qword_10007EF70);
  v227 = v373;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007EF78, &qword_10007ED28);
  sub_10004D75C();
  v228 = v381;
  uint64_t v229 = v375;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v374 + 8))(v227, v229);
  swift_beginAccess();
  swift_retain();
  sub_100064460();
  swift_endAccess();
  swift_release();
  sub_10000EDB4(&qword_10007EF88, (uint64_t *)&unk_10007ED60);
  sub_10004D7B0();
  v230 = v387;
  uint64_t v231 = v465;
  sub_1000644F0();
  ((void (*)(char *, uint64_t))v368)(v216, v231);
  uint64_t v232 = (uint64_t)v380;
  (*(void (**)(char *, char *, uint64_t))(v462 + 32))(v380, v461, v463);
  v233 = (int *)v379;
  (*(void (**)(uint64_t, char *, uint64_t))(v371 + 32))(v232 + *(int *)(v379 + 116), v466, v372);
  (*(void (**)(uint64_t, char *, uint64_t))(v467 + 32))(v232 + v233[30], v223, v488);
  (*(void (**)(uint64_t, char *, uint64_t))(v377 + 32))(v232 + v233[31], v225, v378);
  (*(void (**)(uint64_t, char *, uint64_t))(v382 + 32))(v232 + v233[32], v228, v383);
  (*(void (**)(uint64_t, char *, uint64_t))(v388 + 32))(v232 + v233[33], v230, v389);
  unint64_t v505 = (unint64_t)[v494 mainRunLoop];
  uint64_t v234 = (uint64_t)v502;
  v235 = v477;
  ((void (*)(char *, uint64_t, uint64_t, void *))v477)(v502, 1, 1, v492);
  sub_10000EDB4(&qword_10007EF98, &qword_10007ED50);
  v236 = v384;
  sub_1000644E0();
  sub_100009CA4(v234, &qword_10007ED80);

  sub_100009CA4(v232, &qword_10007ED50);
  uint64_t v237 = swift_allocObject();
  swift_weakInit();
  uint64_t v238 = swift_allocObject();
  uint64_t v239 = v504;
  *(void *)(v238 + 16) = v237;
  *(void *)(v238 + 24) = v239;
  uint64_t v240 = swift_allocObject();
  *(void *)(v240 + 16) = sub_10004D844;
  *(void *)(v240 + 24) = v238;
  sub_10000EDB4(&qword_10007EFA0, &qword_10007ED58);
  swift_retain();
  uint64_t v241 = v386;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v385 + 8))(v236, v241);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  swift_retain();
  v242 = v487;
  sub_100064460();
  swift_endAccess();
  swift_release();
  unint64_t v505 = (unint64_t)[v494 mainRunLoop];
  uint64_t v243 = (uint64_t)v502;
  ((void (*)(char *, uint64_t, uint64_t, void *))v235)(v502, 1, 1, v492);
  v244 = v390;
  uint64_t v245 = v488;
  sub_1000644E0();
  sub_100009CA4(v243, &qword_10007ED80);

  (*(void (**)(char *, uint64_t))(v467 + 8))(v242, v245);
  swift_allocObject();
  swift_weakInit();
  sub_10000EDB4(&qword_10007EFA8, &qword_10007ED18);
  uint64_t v246 = v392;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v391 + 8))(v244, v246);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v247 = v484;
  sub_100064460();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  uint64_t v248 = v485;
  sub_100064500();
  swift_release();
  ((void (*)(char *, uint64_t))v456)(v247, v248);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v249 = v393;
  sub_100064460();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_10000EDB4(&qword_10007EFB0, &qword_10007ED10);
  uint64_t v250 = v395;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v394 + 8))(v249, v250);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v251 = v396;
  sub_100064460();
  swift_endAccess();
  uint64_t v252 = swift_allocObject();
  swift_weakInit();
  uint64_t v253 = swift_allocObject();
  *(void *)(v253 + 16) = sub_10004D8A4;
  *(void *)(v253 + 24) = v252;
  sub_10000EDB4(&qword_10007EFB8, &qword_10007ED08);
  uint64_t v254 = v398;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v397 + 8))(v251, v254);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v255 = v399;
  sub_100064460();
  swift_endAccess();
  uint64_t v256 = swift_allocObject();
  swift_weakInit();
  uint64_t v257 = swift_allocObject();
  *(void *)(v257 + 16) = sub_10004D8D8;
  *(void *)(v257 + 24) = v256;
  sub_10000EDB4(&qword_10007EFC0, &qword_10007ED00);
  uint64_t v258 = v401;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v400 + 8))(v255, v258);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v259 = v402;
  sub_100064460();
  swift_endAccess();
  uint64_t v260 = swift_allocObject();
  swift_weakInit();
  uint64_t v261 = swift_allocObject();
  *(void *)(v261 + 16) = sub_10004D90C;
  *(void *)(v261 + 24) = v260;
  sub_10000EDB4(&qword_10007EFC8, &qword_10007ECF8);
  uint64_t v262 = v404;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v403 + 8))(v259, v262);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v263 = v469;
  sub_100064460();
  swift_endAccess();
  uint64_t v264 = v470;
  sub_1000644F0();
  v347(v263, v264);
  swift_beginAccess();
  v265 = v472;
  sub_100064460();
  swift_endAccess();
  uint64_t v266 = v473;
  sub_1000644F0();
  ((void (*)(char *, uint64_t))v345)(v265, v266);
  swift_beginAccess();
  v267 = v406;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007EFD0, &qword_10007ECD8);
  sub_10004D940();
  uint64_t v268 = v409;
  sub_1000644F0();
  v269 = *(void (**)(char *, uint64_t))(v408 + 8);
  v269(v267, v268);
  swift_beginAccess();
  sub_100064460();
  swift_endAccess();
  sub_1000644F0();
  v269(v267, v268);
  sub_10000EDB4(&qword_10007EFE8, &qword_10007ECE0);
  v270 = v411;
  sub_1000643D0();
  uint64_t v271 = swift_allocObject();
  swift_weakInit();
  uint64_t v272 = swift_allocObject();
  *(void *)(v272 + 16) = v271;
  *(int64x2_t *)(v272 + 24) = vdupq_n_s64(0x4060000000000000uLL);
  *(void *)(v272 + 40) = v422;
  uint64_t v273 = swift_allocObject();
  *(void *)(v273 + 16) = &unk_10007EFF8;
  *(void *)(v273 + 24) = v272;
  uint64_t v274 = swift_allocObject();
  *(void *)(v274 + 16) = &unk_10007F008;
  *(void *)(v274 + 24) = v273;
  swift_retain();
  sub_100064400();
  sub_100006DC8(&qword_10007F010);
  sub_10000EDB4(&qword_10007F018, &qword_10007ECE8);
  sub_10000EDB4(&qword_10007F020, &qword_10007F010);
  v275 = v414;
  uint64_t v276 = v413;
  v277 = v270;
  sub_1000644D0();
  swift_release();
  sub_10000EDB4(&qword_10007F028, &qword_10007ECD0);
  uint64_t v278 = v417;
  unint64_t v279 = sub_1000644B0();
  (*(void (**)(char *, uint64_t))(v415 + 8))(v275, v278);
  swift_release();
  (*(void (**)(char *, uint64_t))(v412 + 8))(v277, v276);
  unint64_t v505 = v279;
  id v509 = [v494 mainRunLoop];
  uint64_t v280 = (uint64_t)v502;
  ((void (*)(char *, uint64_t, uint64_t, void *))v477)(v502, 1, 1, v492);
  sub_100006DC8(&qword_10007F030);
  sub_10000EDB4(&qword_10007F038, &qword_10007F030);
  v281 = v416;
  sub_1000644E0();
  sub_100009CA4(v280, &qword_10007ED80);

  swift_release();
  swift_beginAccess();
  v282 = v421;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007F040, &qword_10007ECF0);
  uint64_t v283 = v419;
  sub_100064510();
  (*(void (**)(char *, uint64_t))(v418 + 8))(v281, v283);
  uint64_t v284 = v423;
  uint64_t v285 = v424;
  (*(void (**)(char *, char *, uint64_t))(v423 + 16))(v420, v282, v424);
  swift_beginAccess();
  sub_100064470();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v284 + 8))(v282, v285);
  swift_beginAccess();
  v286 = v440;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007F048, &qword_10007ECA8);
  sub_10004DCC4();
  uint64_t v287 = v441;
  sub_1000644F0();
  uint64_t v288 = v438;
  v501 = *(void (**)(void, void))(v438 + 8);
  v501(v286, v287);
  swift_beginAccess();
  swift_retain();
  sub_100006DC8(&qword_10007E338);
  v289 = v433;
  sub_100064460();
  swift_endAccess();
  swift_release();
  sub_10000EDB4((unint64_t *)&unk_10007F060, &qword_10007E2F8);
  sub_10000EC60();
  uint64_t v290 = v436;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v435 + 8))(v289, v290);
  sub_10000EDB4(&qword_10007F088, &qword_10007ECB0);
  sub_10000EDB4(&qword_10007F090, &qword_10007ECA0);
  v291 = v426;
  sub_100064390();
  sub_10000EDB4(&qword_10007F098, &qword_10007ECB8);
  v292 = v430;
  uint64_t v293 = v429;
  sub_1000644C0();
  (*(void (**)(char *, uint64_t))(v428 + 8))(v291, v293);
  swift_beginAccess();
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4((unint64_t *)&unk_10007F0A0, &qword_10007ECC0);
  uint64_t v294 = v432;
  sub_100064510();
  (*(void (**)(char *, uint64_t))(v431 + 8))(v292, v294);
  (*(void (**)(char *, char *, uint64_t))(v288 + 16))(v439, v286, v287);
  swift_beginAccess();
  sub_100064470();
  swift_endAccess();
  v501(v286, v287);
  uint64_t v295 = v500;
  swift_beginAccess();
  swift_retain();
  sub_100006DC8(&qword_10007E080);
  v296 = v442;
  sub_100064460();
  swift_endAccess();
  swift_release();
  sub_10000EDB4((unint64_t *)&unk_10007F0B0, &qword_10007EC80);
  sub_100008080();
  v297 = v445;
  uint64_t v298 = v444;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v443 + 8))(v296, v298);
  unint64_t v505 = (unint64_t)[v494 mainRunLoop];
  uint64_t v299 = (uint64_t)v502;
  ((void (*)(char *, uint64_t, uint64_t, void *))v477)(v502, 1, 1, v492);
  sub_10000EDB4(&qword_10007F0C0, &qword_10007EC88);
  v300 = v448;
  uint64_t v301 = v447;
  sub_1000644E0();
  sub_100009CA4(v299, &qword_10007ED80);

  (*(void (**)(char *, uint64_t))(v446 + 8))(v297, v301);
  swift_allocObject();
  swift_weakInit();
  sub_10000EDB4(&qword_10007F0C8, (uint64_t *)&unk_10007EC90);
  uint64_t v302 = v450;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v449 + 8))(v300, v302);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_release();
  return v295;
}

uint64_t sub_10003BF78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v60 = a2;
  unint64_t v61 = a3;
  uint64_t v10 = sub_100064380();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v62 = v10;
  uint64_t v63 = v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v59 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v59 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v59 - v21;
  uint64_t v23 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v23 - 8);
  unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = (char *)&v59 - v25;
  if ((a6 & 1) == 0) {
    return 8;
  }
  if (!a5)
  {
    sub_100020E94(a1, (uint64_t)&v59 - v25, &qword_10007E520);
    uint64_t v41 = sub_1000641E0();
    int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v26, 1, v41);
    sub_100009CA4((uint64_t)v26, &qword_10007E520);
    if (v42 != 1) {
      return 9;
    }
    uint64_t v43 = sub_10003C9D4();
    if ((v43 & 0xFE) != 8)
    {
      uint64_t v29 = v43;
      if (v43 > 7u || ((1 << v43) & 0xC1) == 0)
      {
        sub_100064360();
        uint64_t v52 = sub_100064370();
        os_log_type_t v53 = sub_100064930();
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v54 = (uint8_t *)swift_slowAlloc();
          v64[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v54 = 136315138;
          uint64_t v55 = sub_100021B14(v29);
          uint64_t v65 = sub_10004BEF0(v55, v56, v64);
          sub_100064A90();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v52, v53, "Combine for sharingType specific CK sharingType: %s.", v54, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v63 + 8))(v17, v62);
        return v29;
      }
    }
    sub_100064360();
    uint64_t v44 = v61;
    swift_bridgeObjectRetain_n();
    uint64_t v45 = sub_100064370();
    os_log_type_t v46 = sub_100064930();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      v64[1] = v44;
      uint64_t v65 = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      uint64_t v49 = v60;
      v64[0] = v60;
      sub_100006DC8(&qword_10007EA40);
      uint64_t v50 = sub_100064A70();
      v64[0] = sub_10004BEF0(v50, v51, &v65);
      sub_100064A90();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Combine for sharingType sourceAppBundleID: %s.", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v62);
      if (!v44) {
        return 0;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v62);
      uint64_t v49 = v60;
      if (!v44) {
        return 0;
      }
    }
    if (v49 == 0x6C7070612E6D6F63 && v44 == 0xEF7365746F4E2E65
      || (sub_100064C10() & 1) != 0
      || v49 == 0xD000000000000015 && v44 == 0x800000010006A2C0
      || (sub_100064C10() & 1) != 0)
    {
      return 1;
    }
    if (v49 == 0xD000000000000013 && v44 == 0x800000010006A2A0 || (sub_100064C10() & 1) != 0) {
      return 3;
    }
    if (v49 == 0xD000000000000010 && v44 == 0x800000010006A280
      || (sub_100064C10() & 1) != 0
      || v49 == 0xD000000000000016 && v44 == 0x800000010006A260
      || (sub_100064C10() & 1) != 0)
    {
      return 4;
    }
    if (v49 == 0xD000000000000010 && v61 == 0x800000010006A240
      || (sub_100064C10() & 1) != 0
      || v60 == 0xD000000000000012 && v61 == 0x800000010006A220
      || (sub_100064C10() & 1) != 0)
    {
      return 5;
    }
    uint64_t v57 = HIBYTE(v61) & 0xF;
    if ((v61 & 0x2000000000000000) == 0) {
      uint64_t v57 = v60 & 0xFFFFFFFFFFFFLL;
    }
    if (v57) {
      return 6;
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  char v27 = sub_100022FF8(a4, a5, a1);
  uint64_t v28 = sub_100021C0C(v27);
  uint64_t v29 = v28;
  if ((v28 & 0xFE) != 8 && (v28 == 7 || !(_BYTE)v28) && v61)
  {
    uint64_t v30 = HIBYTE(v61) & 0xF;
    if ((v61 & 0x2000000000000000) == 0) {
      uint64_t v30 = v60 & 0xFFFFFFFFFFFFLL;
    }
    if (v30)
    {
      sub_100064360();
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_100064370();
      os_log_type_t v32 = sub_100064930();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        v64[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v33 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_10004BEF0(a4, a5, v64);
        sub_100064A90();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v33 + 12) = 2080;
        uint64_t v34 = sub_100021B14(v29);
        uint64_t v65 = sub_10004BEF0(v34, v35, v64);
        sub_100064A90();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Combine for sharingType itemUTI: %s, sharingType: %s--return .other for unspecified.", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v63 + 8))(v22, v62);
      return 6;
    }
  }
  sub_100064360();
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_100064370();
  os_log_type_t v37 = sub_100064930();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    v64[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_10004BEF0(a4, a5, v64);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v39 = sub_100021B14(v29);
    uint64_t v65 = sub_10004BEF0(v39, v40, v64);
    sub_100064A90();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Combine for sharingType itemUTI: %s, sharingType: %s.", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v63 + 8))(v20, v62);
  return v29;
}

uint64_t sub_10003C9D4()
{
  uint64_t v0 = sub_100064380();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v31 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - v8;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if (!v34[0])
  {
    sub_100064360();
    uint64_t v26 = sub_100064370();
    os_log_type_t v27 = sub_100064930();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "ckSharingTypeFromShare on model--no CKShare yet so return .cloudKit(type: .other).", v28, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    return 6;
  }
  uint64_t v10 = v34[0];
  sub_100064A20();
  uint64_t v11 = sub_100064A30();

  swift_bridgeObjectRelease();
  if (!v11 || (uint64_t v35 = v11, sub_100006DC8(&qword_10007E538), (swift_dynamicCast() & 1) == 0))
  {
    sub_100064360();
    uint64_t v22 = sub_100064370();
    os_log_type_t v23 = sub_100064930();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "ckSharingTypeFromShare on model--couldn't get a string from CKShare.shareType so return .cloudKit(type: .other).", v24, 2u);
      swift_slowDealloc();
      unint64_t v25 = v10;
    }
    else
    {
      unint64_t v25 = v22;
      uint64_t v22 = v10;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v7, v0);
    return 6;
  }
  unint64_t v12 = sub_100021E40((uint64_t)v34[0], (uint64_t)v34[1]);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  sub_100064360();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_100064370();
  os_log_type_t v16 = sub_100064930();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v33 = v12;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v32 = (void *)swift_slowAlloc();
    v34[0] = v32;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v31 = v17 + 4;
    char v18 = sub_100023564(v33, v14);
    char v19 = sub_100021C0C(v18);
    uint64_t v20 = sub_100021B14(v19);
    uint64_t v35 = sub_10004BEF0(v20, v21, (uint64_t *)v34);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    unint64_t v12 = v33;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "ckSharingTypeFromShare on model--CKShare converts to: %s.", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
  char v30 = sub_100023564(v12, v14);
  swift_bridgeObjectRelease();

  return sub_100021C0C(v30);
}

unsigned char *sub_10003CE58(unsigned char *result)
{
  if (*result == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return (unsigned char *)sub_100064490();
  }
  return result;
}

_UNKNOWN **sub_10003CED8(char a1, void *a2)
{
  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    return &off_100079A30;
  }
  if (!a2)
  {
    swift_release();
    return &off_100079A30;
  }
  char v22 = a1;
  id v4 = a2;
  id v5 = [v4 participants];
  sub_10000EF58(0, (unint64_t *)&qword_10007F1F0);
  unint64_t v6 = sub_1000647F0();

  id v7 = v4;
  swift_retain();
  sub_10000E5A0(a2);
  uint64_t v23 = v8;
  swift_release();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (_UNKNOWN **)sub_100064BA0();
    uint64_t v9 = (uint64_t)result;
  }
  else
  {
    uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (_UNKNOWN **)swift_bridgeObjectRetain();
  }
  if (v9)
  {
    if (v9 < 1)
    {
LABEL_52:
      __break(1u);
      __break(1u);
      return result;
    }
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v12 = (id)sub_100064B20();
      }
      else {
        id v12 = *(id *)(v6 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      if ([v12 role] != (id)1
        && (id v14 = [v13 role], v14 == (id)sub_100064990())
        && [v13 permission] == (id)3)
      {
        sub_100064B40();
        sub_100064B60();
        sub_100064B70();
        sub_100064B50();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
  }
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v15 = _swiftEmptyArrayStorage[2];
    goto LABEL_24;
  }
LABEL_49:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100064BA0();
  swift_release();
LABEL_24:
  swift_release();
  if (v9)
  {
    uint64_t v21 = v15;
    for (uint64_t j = 0; j != v9; ++j)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v17 = (id)sub_100064B20();
      }
      else {
        id v17 = *(id *)(v6 + 8 * j + 32);
      }
      char v18 = v17;
      if (objc_msgSend(v17, "role", v21) == (id)1
        || (id v19 = [v18 role], v19 == (id)sub_100064990()) && objc_msgSend(v18, "permission") != (id)2)
      {
      }
      else
      {
        sub_100064B40();
        sub_100064B60();
        sub_100064B70();
        sub_100064B50();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v15 = v21;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_50;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_50;
    }
  }
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
  {
    uint64_t v20 = _swiftEmptyArrayStorage[2];
    goto LABEL_40;
  }
LABEL_50:
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_100064BA0();
  swift_release();
LABEL_40:
  uint64_t result = (_UNKNOWN **)swift_release();
  if (__OFSUB__(v20, v23))
  {
    __break(1u);
    goto LABEL_52;
  }
  if (v15 <= 0)
  {
    swift_release();

    return &off_100079990;
  }
  else if (v20 - v23 < 1)
  {
    swift_release();

    return &off_100079A08;
  }
  else
  {
    swift_release();

    if (v22 == 3) {
      return &off_1000799B8;
    }
    else {
      return &off_1000799E0;
    }
  }
}

uint64_t sub_10003D30C(int a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = sub_100064380();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v41 - v14;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v17 = result;
    if ((_BYTE)a1)
    {
      uint64_t v43 = a6;
      uint64_t v44 = v13;
      uint64_t v47 = v10;
      LODWORD(v46) = (a2 < 0xAu) & (0x23Eu >> a2);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      int v18 = v48;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      int v19 = v48;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (v48 != 1) {
        goto LABEL_8;
      }
      if (a1 != 1)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100064480();
        swift_release();
        swift_release();
        swift_release();
        if (v48 != 1) {
          goto LABEL_8;
        }
      }
      if (v18 == 2 || (char v20 = v46, v19 != 2)) {
LABEL_8:
      }
        char v20 = 0;
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v48) = v20;
      swift_retain();
      sub_100064490();
      sub_100064360();
      swift_retain_n();
      uint64_t v21 = sub_100064370();
      os_log_type_t v22 = sub_100064930();
      BOOL v23 = os_log_type_enabled(v21, v22);
      int v45 = a1;
      if (v23)
      {
        BOOL v41 = v19 == 2;
        BOOL v42 = a1 == 1;
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 67110144;
        LODWORD(v48) = v46;
        sub_100064A90();
        *(_WORD *)(v24 + 8) = 1024;
        LODWORD(v48) = v18 == 2;
        sub_100064A90();
        *(_WORD *)(v24 + 14) = 1024;
        LODWORD(v48) = v41;
        sub_100064A90();
        *(_WORD *)(v24 + 20) = 1024;
        LODWORD(v48) = v42;
        sub_100064A90();
        *(_WORD *)(v24 + 26) = 1024;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        swift_release();
        LODWORD(v48) = v48;
        sub_100064A90();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "executionMode is set. appIsOKForCoOwners: %{BOOL}d, R/O: %{BOOL}d, private: %{BOOL}d, isPreShare: %{BOOL}d, allowCoOwnersEditing: %{BOOL}d", (uint8_t *)v24, 0x20u);
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
      }
      uint64_t v25 = v47 + 8;
      uint64_t v26 = *(void (**)(char *, uint64_t))(v47 + 8);
      v26(v15, v9);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (v48)
      {
        if (v45 != 1)
        {
          uint64_t v27 = v17;
          uint64_t v28 = v9;
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          sub_100064480();
          swift_release();
          swift_release();
          uint64_t v29 = v48;
          if (v48)
          {
            uint64_t v46 = v27;
            id v30 = [v48 participants];
            sub_10000EF58(0, (unint64_t *)&qword_10007F1F0);
            unint64_t v31 = sub_1000647F0();

            uint64_t v47 = v25;
            if (v31 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v40 = sub_100064BA0();
              swift_release();

              swift_bridgeObjectRelease_n();
              if (v40 > 1)
              {
LABEL_17:
                uint64_t v33 = v28;
                sub_100061A08(v43);
                uint64_t v34 = v44;
                sub_100064360();
                swift_retain_n();
                uint64_t v35 = sub_100064370();
                os_log_type_t v36 = sub_100064930();
                if (!os_log_type_enabled(v35, v36))
                {

                  swift_release();
                  swift_release_n();
                  return ((uint64_t (*)(char *, uint64_t))v26)(v34, v33);
                }
                os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
                *(_DWORD *)os_log_type_t v37 = 67109120;
                swift_getKeyPath();
                swift_getKeyPath();
                sub_100064480();
                swift_release();
                uint64_t result = swift_release();
                unint64_t v38 = v48[2];
                if (v38)
                {
                  if (*((unsigned char *)v48 + 32) == 1)
                  {
                    if (v38 >= 2)
                    {
                      int v39 = *((unsigned __int8 *)v48 + 33);
                      swift_release();
                      swift_bridgeObjectRelease();
LABEL_29:
                      LODWORD(v48) = v39;
                      sub_100064A90();
                      swift_release();
                      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Setting newParticipantsCanBeCoOwners from CKShare state: %{BOOL}d.", v37, 8u);
                      swift_slowDealloc();
                      swift_release();

                      uint64_t v33 = v28;
                      return ((uint64_t (*)(char *, uint64_t))v26)(v34, v33);
                    }
                    goto LABEL_35;
                  }
                  swift_release();
                  uint64_t result = swift_bridgeObjectRelease();
                  if (v38 >= 2)
                  {
                    int v39 = 0;
                    goto LABEL_29;
                  }
                }
                else
                {
                  __break(1u);
                }
                __break(1u);
LABEL_35:
                __break(1u);
                return result;
              }
            }
            else
            {
              uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_release();
              swift_bridgeObjectRelease();

              if (v32 > 1) {
                goto LABEL_17;
              }
            }
          }
          else
          {
            swift_release();
          }
        }
      }
      else
      {
        sub_100061A08((uint64_t)&off_100079A58);
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_10003DB3C()
{
  return sub_100043B48();
}

void sub_10003DB50(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (!v1)
    {
      swift_release();
      return;
    }
    id v2 = v1;
    sub_100064A20();
    uint64_t v3 = sub_100064A30();

    swift_bridgeObjectRelease();
    if (v3)
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        sub_1000646E0();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064490();
        swift_unknownObjectRelease();
LABEL_9:

        return;
      }
      swift_unknownObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064490();
    goto LABEL_9;
  }
}

uint64_t sub_10003DC94(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      if (v1 == 8)
      {
LABEL_4:
        swift_release();
        return swift_unknownObjectRelease();
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (v3 == 8)
      {
LABEL_12:
        switch(v1)
        {
          case 0:
          case 7:
            goto LABEL_4;
          case 4:
LABEL_13:
            swift_getKeyPath();
            swift_getKeyPath();
            swift_retain();
            sub_100064490();
            goto LABEL_14;
          default:
            goto LABEL_14;
        }
      }
      if (v3 == 9)
      {
        switch(v1)
        {
          case 0:
          case 7:
          case 9:
            goto LABEL_4;
          case 4:
            goto LABEL_13;
          default:
            goto LABEL_14;
        }
      }
      if (v1 != 9)
      {
        if (v3 == 7 || v1 == 7 || v3 == v1) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
LABEL_14:
      swift_unknownObjectRelease();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_10003DE98(unsigned char *a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007F3D0);
  uint64_t result = __chkstk_darwin(v2 - 8);
  id v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*a1 == 2)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v6 = result;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (v10[7] == 3)
      {
        sub_100064880();
        uint64_t v7 = sub_1000648A0();
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
        sub_100064870();
        swift_retain();
        uint64_t v8 = sub_100064860();
        uint64_t v9 = (void *)swift_allocObject();
        v9[2] = v8;
        v9[3] = &protocol witness table for MainActor;
        v9[4] = v6;
        sub_10000F1B0((uint64_t)v5, (uint64_t)&unk_10007F1E8, (uint64_t)v9);
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10003E04C()
{
  return sub_100043B48();
}

uint64_t sub_10003E060()
{
  v0[2] = sub_100064870();
  v0[3] = sub_100064860();
  int v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_10003E110;
  return sub_10003E2AC(1500);
}

uint64_t sub_10003E110()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100064830();
  return _swift_task_switch(sub_10003E24C, v1, v0);
}

uint64_t sub_10003E24C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10003E2AC(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  uint64_t v3 = sub_100064380();
  v2[12] = v3;
  v2[13] = *(void *)(v3 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  sub_100064870();
  v2[16] = sub_100064860();
  uint64_t v5 = sub_100064830();
  v2[17] = v5;
  v2[18] = v4;
  return _swift_task_switch(sub_10003E3B0, v5, v4);
}

uint64_t sub_10003E3B0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  if (v1 < 1)
  {
    __break(1u);
    JUMPOUT(0x10003E67CLL);
  }
  *(void *)(v0 + 152) = BRCloudDocsErrorDomain;
  *(void *)(v0 + 160) = CKErrorDomain;
  *(void *)(v0 + 168) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  switch(*(unsigned char *)(v0 + 61))
  {
    case 1:
      return _swift_task_switch(sub_10003E694, 0, 0);
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      goto LABEL_9;
    default:
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v0 + 63) = 3;
      swift_retain();
      sub_100064490();
LABEL_4:
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      int v2 = *(unsigned __int8 *)(v0 + 58);
      if (v2 == 4 || v2 == 2)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 57) = 1;
        swift_retain();
        sub_100064490();
        uint64_t v3 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v3;
        *uint64_t v3 = v0;
        v3[1] = sub_10003EB20;
        return sub_1000332EC();
      }
      else
      {
LABEL_9:
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
        return v5();
      }
  }
}

uint64_t sub_10003E694()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v1;
  void *v1 = v0;
  v1[1] = sub_10003E72C;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_10003E72C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_100050028;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_10003E850;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10003E850()
{
  uint64_t v1 = *(void *)(v0 + 168);
  if (v1 == 1)
  {
LABEL_10:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    if (v1 < 2)
    {
      __break(1u);
      JUMPOUT(0x10003EB08);
    }
    *(void *)(v0 + 168) = v1 - 1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    switch(*(unsigned char *)(v0 + 61))
    {
      case 1:
        return _swift_task_switch(sub_10003E694, 0, 0);
      case 3:
        goto LABEL_5;
      case 4:
      case 5:
        goto LABEL_10;
      default:
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 63) = 3;
        swift_retain();
        sub_100064490();
LABEL_5:
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        int v2 = *(unsigned __int8 *)(v0 + 58);
        if (v2 != 4 && v2 != 2) {
          goto LABEL_10;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 57) = 1;
        swift_retain();
        sub_100064490();
        uint64_t v3 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v3;
        *uint64_t v3 = v0;
        v3[1] = sub_10003EB20;
        uint64_t result = sub_1000332EC();
        break;
    }
  }
  return result;
}

uint64_t sub_10003EB20()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  if (v0) {
    uint64_t v5 = sub_10003EF78;
  }
  else {
    uint64_t v5 = sub_10003EC5C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10003EC5C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 62) = 4;
  swift_retain();
  sub_100064490();
  uint64_t v1 = *(void *)(v0 + 168);
  if (v1 == 1)
  {
LABEL_10:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    if (v1 < 2)
    {
      __break(1u);
      JUMPOUT(0x10003EF60);
    }
    *(void *)(v0 + 168) = v1 - 1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    switch(*(unsigned char *)(v0 + 61))
    {
      case 1:
        return _swift_task_switch(sub_10003E694, 0, 0);
      case 3:
        goto LABEL_5;
      case 4:
      case 5:
        goto LABEL_10;
      default:
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 63) = 3;
        swift_retain();
        sub_100064490();
LABEL_5:
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        int v2 = *(unsigned __int8 *)(v0 + 58);
        if (v2 != 4 && v2 != 2) {
          goto LABEL_10;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 57) = 1;
        swift_retain();
        sub_100064490();
        uint64_t v3 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v3;
        *uint64_t v3 = v0;
        v3[1] = sub_10003EB20;
        uint64_t result = sub_1000332EC();
        break;
    }
  }
  return result;
}

uint64_t sub_10003EF78()
{
  uint64_t v55 = v0;
  *(void *)(v0 + 72) = *(void *)(v0 + 192);
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  *(void *)(v0 + 200) = v1;
  *(void *)(v0 + 208) = v2;
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  *(void *)(v0 + 216) = v4;
  *(void *)(v0 + 224) = v3;
  uint64_t v5 = *(void *)(v0 + 48);
  *(void *)(v0 + 232) = v5;
  int v6 = *(unsigned __int8 *)(v0 + 56);
  if (v6 != 1)
  {
    sub_10001AAF4(v1, v2, v4, v3, v5, v6);
LABEL_16:
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 59) = 5;
    swift_retain();
    sub_100064490();
    sub_1000646E0();
    id v31 = objc_allocWithZone((Class)NSError);
    NSString v32 = sub_1000646A0();
    swift_bridgeObjectRelease();
    id v33 = [v31 initWithDomain:v32 code:1 userInfo:0];

    sub_100064360();
    uint64_t v34 = sub_100064370();
    os_log_type_t v35 = sub_100064910();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "tryToCreateShareIfNeeded unexpected error, returning CKError.internalError as best approximation", v36, 2u);
      swift_slowDealloc();
    }
    uint64_t v38 = *(void *)(v0 + 104);
    uint64_t v37 = *(void *)(v0 + 112);
    uint64_t v39 = *(void *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
    id v40 = v33;
    sub_100046A60(1u, v33);

    swift_errorRelease();
    uint64_t v41 = *(void *)(v0 + 168);
    if (v41 == 1)
    {
LABEL_27:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      int v45 = *(uint64_t (**)(void))(v0 + 8);
      return v45();
    }
    if (v41 >= 2)
    {
      *(void *)(v0 + 168) = v41 - 1;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      switch(*(unsigned char *)(v0 + 61))
      {
        case 1:
          uint64_t v15 = sub_10003E694;
          goto LABEL_31;
        case 3:
          break;
        case 4:
        case 5:
          goto LABEL_27;
        default:
          swift_getKeyPath();
          swift_getKeyPath();
          *(unsigned char *)(v0 + 63) = 3;
          swift_retain();
          sub_100064490();
          break;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      int v42 = *(unsigned __int8 *)(v0 + 58);
      if (v42 == 4 || v42 == 2)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 57) = 1;
        swift_retain();
        sub_100064490();
        uint64_t v43 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v43;
        *uint64_t v43 = v0;
        v43[1] = sub_10003EB20;
        return sub_1000332EC();
      }
      goto LABEL_27;
    }
    __break(1u);
LABEL_35:
    __break(1u);
    JUMPOUT(0x10003F7D0);
  }
  uint64_t v51 = v3;
  uint64_t v52 = v1;
  if (!v4) {
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  id v7 = v4;
  uint64_t v53 = v2;
  swift_bridgeObjectRetain();
  id v8 = [v7 domain];
  uint64_t v9 = sub_1000646E0();
  uint64_t v11 = v10;

  if (v9 == sub_1000646E0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_100064C10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {

      goto LABEL_12;
    }
  }
  id v14 = [v7 code];

  if (v14 != (id)7)
  {
LABEL_12:
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 60) = 5;
    swift_retain();
    sub_100064490();
    sub_100064360();
    id v16 = v7;
    uint64_t v17 = v2;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v18 = v16;
    int v19 = sub_100064370();
    os_log_type_t type = sub_100064910();
    BOOL v20 = os_log_type_enabled(v19, type);
    uint64_t v21 = *(void *)(v0 + 120);
    uint64_t v22 = *(void *)(v0 + 96);
    uint64_t v23 = *(void *)(v0 + 104);
    if (v20)
    {
      os_log_t log = v19;
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      buf = v24;
      *(_DWORD *)uint64_t v24 = 136315138;
      id v25 = v18;
      uint64_t v47 = v22;
      id v26 = [v25 description];
      uint64_t v27 = sub_1000646E0();
      id v49 = v18;
      unint64_t v29 = v28;

      *(void *)(v0 + 64) = sub_10004BEF0(v27, v29, &v54);
      sub_100064A90();
      id v18 = v49;
      uint64_t v17 = v53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, log, type, "tryToCreateShareIfNeeded not-in-iCloud error after retries: %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v47);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    }
    id v30 = v18;
    sub_100046A60(1u, v4);
    sub_10001AAF4(v52, v17, v4, v51, v5, 1u);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v15 = sub_10003F7E8;
LABEL_31:
  return _swift_task_switch(v15, 0, 0);
}

uint64_t sub_10003F7E8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 240) = v1;
  void *v1 = v0;
  v1[1] = sub_10003F880;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_10003F880()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_10005004C;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v5 = sub_10003F9A4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10003F9A4()
{
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v3 = *(void **)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 200);
  swift_errorRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10001AAF4(v5, v4, v3, v1, v2, 1u);
  uint64_t v6 = *(void *)(v0 + 168);
  if (v6 == 1)
  {
LABEL_10:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    if (v6 < 2)
    {
      __break(1u);
      JUMPOUT(0x10003FC9CLL);
    }
    *(void *)(v0 + 168) = v6 - 1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    switch(*(unsigned char *)(v0 + 61))
    {
      case 1:
        return _swift_task_switch(sub_10003E694, 0, 0);
      case 3:
        goto LABEL_5;
      case 4:
      case 5:
        goto LABEL_10;
      default:
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 63) = 3;
        swift_retain();
        sub_100064490();
LABEL_5:
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        int v7 = *(unsigned __int8 *)(v0 + 58);
        if (v7 != 4 && v7 != 2) {
          goto LABEL_10;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 57) = 1;
        swift_retain();
        sub_100064490();
        id v8 = (void *)swift_task_alloc();
        *(void *)(v0 + 184) = v8;
        *id v8 = v0;
        v8[1] = sub_10003EB20;
        uint64_t result = sub_1000332EC();
        break;
    }
  }
  return result;
}

uint64_t sub_10003FCB4(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t v2 = sub_100006DC8(&qword_10007F3D0);
  uint64_t result = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1 == 4)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v6 = result;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (HIBYTE(v13) == 1)
      {
        sub_100064880();
        uint64_t v7 = sub_1000648A0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
        sub_100064870();
        swift_retain();
        uint64_t v8 = sub_100064860();
        uint64_t v9 = (void *)swift_allocObject();
        v9[2] = v8;
        v9[3] = &protocol witness table for MainActor;
        v9[4] = v6;
        uint64_t v10 = &unk_10007F1D8;
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        if (HIBYTE(v13) != 3) {
          return swift_release();
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        if (HIBYTE(v13) - 6 > 0xFFFFFFFB || (v13 & 0x100000000000000) != 0) {
          return swift_release();
        }
        sub_100064880();
        uint64_t v11 = sub_1000648A0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 0, 1, v11);
        sub_100064870();
        swift_retain();
        uint64_t v12 = sub_100064860();
        uint64_t v9 = (void *)swift_allocObject();
        v9[2] = v12;
        v9[3] = &protocol witness table for MainActor;
        v9[4] = v6;
        uint64_t v10 = &unk_10007F1C8;
      }
      sub_10000F1B0((uint64_t)v5, (uint64_t)v10, (uint64_t)v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10003FFB0()
{
  return sub_100043B48();
}

uint64_t sub_10003FFC4()
{
  v0[2] = sub_100064870();
  v0[3] = sub_100064860();
  int v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100040074;
  return sub_1000401B0(1);
}

uint64_t sub_100040074()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100064830();
  return _swift_task_switch(sub_100050050, v1, v0);
}

uint64_t sub_1000401B0(char a1)
{
  *(void *)(v2 + 96) = v1;
  *(unsigned char *)(v2 + 162) = a1;
  *(void *)(v2 + 104) = sub_100064870();
  *(void *)(v2 + 112) = sub_100064860();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 120) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100040268;
  return sub_10003E2AC(300);
}

uint64_t sub_100040268()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100064830();
  *(void *)(v1 + 128) = v3;
  *(void *)(v1 + 136) = v2;
  return _swift_task_switch(sub_1000403AC, v3, v2);
}

uint64_t sub_1000403AC()
{
  if ((*(unsigned char *)(v0 + 162) & 1) == 0)
  {
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 59) = 3;
    swift_retain();
LABEL_7:
    sub_100064490();
    goto LABEL_8;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 63) != 4)
  {
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 60) = 1;
    swift_retain();
    goto LABEL_7;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 58) == 2)
  {
    swift_release();
LABEL_8:
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 57) = 1;
  swift_retain();
  sub_100064490();
  swift_retain();
  char v3 = sub_100061E58();
  swift_release();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100040654;
  return sub_10002FB48(v3 & 1);
}

uint64_t sub_100040654()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v5 = sub_100040844;
  }
  else {
    uint64_t v5 = sub_100040790;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100040790()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 161) = 2;
  swift_retain();
  sub_100064490();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100040844()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 152);
  swift_release();
  *(void *)(v0 + 88) = v2;
  uint64_t v3 = v0 + 88;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v4 = *(void *)(v0 + 24);
    uint64_t v23 = *(void *)(v0 + 16);
    uint64_t v6 = *(void **)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 48);
    int v8 = *(unsigned __int8 *)(v0 + 56);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 160) = 4;
    swift_retain();
    uint64_t result = sub_100064490();
    if (v8 == 10)
    {
      if (!v6)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      id v10 = v6;
      swift_bridgeObjectRetain();
      sub_100046A60(1u, v6);
      sub_10001AAF4(v23, v4, v6, v5, v7, 0xAu);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000646E0();
      id v18 = objc_allocWithZone((Class)NSError);
      NSString v19 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v20 = [v18 initWithDomain:v19 code:46 userInfo:0];

      sub_100046A60(2u, v20);
      sub_10001AAF4(v23, v4, v6, v5, v7, v8);
    }
  }
  else
  {
    uint64_t v11 = (void **)(v0 + 80);
    uint64_t v12 = *(void *)(v0 + 152);
    swift_errorRelease();
    *(void *)(v1 + 64) = v12;
    swift_errorRetain();
    type metadata accessor for CKError(0);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      uint64_t v13 = *v11;
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v3 - 26) = 4;
      swift_retain();
      sub_100064490();
      sub_1000646E0();
      *(void *)(v3 - 16) = v13;
      sub_10004D4A8(&qword_10007DDA0, type metadata accessor for CKError);
      uint64_t v14 = sub_100064130();
      id v15 = objc_allocWithZone((Class)NSError);
      NSString v16 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v17 = [v15 initWithDomain:v16 code:v14 userInfo:0];

      sub_100046A60(1u, v17);
    }
    else
    {
      swift_errorRelease();
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v3 - 27) = 4;
      swift_retain();
      sub_100064490();
      uint64_t v21 = (void *)sub_100064140();
      sub_100046A60(2u, v21);
    }
  }
  swift_errorRelease();
  uint64_t v22 = *(uint64_t (**)(void))(v1 + 8);
  return v22();
}

uint64_t sub_100040C7C()
{
  return sub_100043B48();
}

uint64_t sub_100040C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_100064870();
  v4[3] = sub_100064860();
  uint64_t v6 = sub_100064830();
  v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(sub_100040D28, v6, v5);
}

uint64_t sub_100040D28()
{
  uint64_t v1 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_lastServicesData);
  uint64_t v2 = *v1;
  v0[6] = *v1;
  uint64_t v3 = v1[1];
  swift_unknownObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100040DF4;
  return sub_100040F38(0, v2, v3);
}

uint64_t sub_100040DF4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_10003E24C, v3, v2);
}

uint64_t sub_100040F38(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 80) = a3;
  *(void *)(v4 + 88) = v3;
  *(void *)(v4 + 72) = a2;
  *(unsigned char *)(v4 + 145) = a1;
  sub_100064870();
  *(void *)(v4 + 96) = sub_100064860();
  uint64_t v6 = sub_100064830();
  *(void *)(v4 + 104) = v6;
  *(void *)(v4 + 112) = v5;
  return _swift_task_switch(sub_100040FD8, v6, v5);
}

uint64_t sub_100040FD8()
{
  *(_OWORD *)(*(void *)(v0 + 88)
            + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_lastServicesData) = *(_OWORD *)(v0 + 72);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v1;
  void *v1 = v0;
  v1[1] = sub_100041098;
  char v2 = *(unsigned char *)(v0 + 145);
  return sub_1000401B0(v2);
}

uint64_t sub_100041098()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 104);
  return _swift_task_switch(sub_1000411B8, v3, v2);
}

uint64_t sub_1000411B8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 62) != 4) {
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 57) != 3)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 58) != 2)
    {
LABEL_6:
      char v1 = *(unsigned char *)(v0 + 145);
      swift_release();
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v0 + 61) = v1;
      swift_retain();
      sub_100064490();
      goto LABEL_7;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 59) == 3)
  {
    swift_release();
LABEL_7:
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  char v4 = *(unsigned char *)(v0 + 145);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 60) = v4;
  swift_retain();
  sub_100064490();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100041498;
  return sub_1000316F4();
}

uint64_t sub_100041498()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v5 = sub_100041684;
  }
  else {
    uint64_t v5 = sub_1000415D4;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000415D4()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 144) = 3;
  swift_retain();
  sub_100064490();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100041684()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 136);
  swift_release();
  *(void *)(v0 + 64) = v2;
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v0 + 24);
    uint64_t v15 = *(void *)(v0 + 16);
    uint64_t v5 = *(void **)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 48);
    int v7 = *(unsigned __int8 *)(v0 + 56);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 63) = 5;
    swift_retain();
    uint64_t result = sub_100064490();
    if (v7 == 4)
    {
      if (!v5)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      id v9 = v5;
      swift_bridgeObjectRetain();
      sub_100046A60(5u, v5);
      sub_10001AAF4(v15, v3, v5, v4, v6, 4u);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000646E0();
      id v11 = objc_allocWithZone((Class)NSError);
      NSString v12 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v13 = [v11 initWithDomain:v12 code:46 userInfo:0];

      sub_100046A60(2u, v13);
      sub_10001AAF4(v15, v3, v5, v4, v6, v7);
    }
  }
  else
  {
    swift_errorRelease();
    id v10 = (void *)sub_100064140();
    sub_100046A60(2u, v10);
  }
  swift_errorRelease();
  uint64_t v14 = *(uint64_t (**)(void))(v1 + 8);
  return v14();
}

uint64_t sub_100041900(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t v2 = sub_100006DC8(&qword_10007F3D0);
  uint64_t result = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1 == 2)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v6 = result;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (HIBYTE(v11) - 2 >= 4)
      {
        char v7 = HIBYTE(v11) & 1;
        sub_100064880();
        uint64_t v8 = sub_1000648A0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
        sub_100064870();
        swift_retain();
        uint64_t v9 = sub_100064860();
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = v9;
        *(void *)(v10 + 24) = &protocol witness table for MainActor;
        *(void *)(v10 + 32) = v6;
        *(unsigned char *)(v10 + 40) = v7;
        sub_10000F1B0((uint64_t)v5, (uint64_t)&unk_10007F160, v10);
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100041ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 64) = a5;
  *(void *)(v5 + 16) = a4;
  sub_100064870();
  *(void *)(v5 + 24) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v6;
  return _swift_task_switch(sub_100041B58, v7, v6);
}

uint64_t sub_100041B58()
{
  int v1 = (uint64_t *)(*(void *)(v0 + 16)
                 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_lastServicesData);
  uint64_t v2 = *v1;
  *(void *)(v0 + 48) = *v1;
  uint64_t v3 = v1[1];
  swift_unknownObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100040DF4;
  char v5 = *(unsigned char *)(v0 + 64);
  return sub_100040F38(v5, v2, v3);
}

uint64_t sub_100041C28(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t v2 = sub_100006DC8(&qword_10007F3D0);
  uint64_t result = __chkstk_darwin(v2 - 8);
  char v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1 == 3)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v6 = result;
      sub_100064880();
      uint64_t v7 = sub_1000648A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
      sub_100064870();
      swift_retain();
      uint64_t v8 = sub_100064860();
      uint64_t v9 = (void *)swift_allocObject();
      v9[2] = v8;
      v9[3] = &protocol witness table for MainActor;
      v9[4] = v6;
      sub_100033164((uint64_t)v5, (uint64_t)&unk_10007F138, (uint64_t)v9);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100041D90(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7)
{
  *(double *)(v7 + 96) = a6;
  *(double *)(v7 + 104) = a7;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(unsigned char *)(v7 + 200) = a2;
  *(void *)(v7 + 64) = a1;
  *(void *)(v7 + 72) = a3;
  sub_100006DC8(&qword_10007E520);
  *(void *)(v7 + 112) = swift_task_alloc();
  *(void *)(v7 + 120) = swift_task_alloc();
  uint64_t v8 = sub_1000641E0();
  *(void *)(v7 + 128) = v8;
  *(void *)(v7 + 136) = *(void *)(v8 - 8);
  *(void *)(v7 + 144) = swift_task_alloc();
  sub_100064870();
  *(void *)(v7 + 152) = sub_100064860();
  uint64_t v10 = sub_100064830();
  *(void *)(v7 + 160) = v10;
  *(void *)(v7 + 168) = v9;
  return _swift_task_switch(sub_100041ED0, v10, v9);
}

uint64_t sub_100041ED0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 176) = Strong;
  if (!Strong)
  {
    swift_release();
    id v4 = [objc_allocWithZone((Class)UIImage) init];
LABEL_21:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v18 = *(uint64_t (**)(id))(v0 + 8);
    return v18(v4);
  }
  uint64_t v2 = *(void **)(v0 + 72);
  if (v2)
  {
    id v3 = v2;
    swift_release();
    id v4 = *(id *)(v0 + 72);
    goto LABEL_11;
  }
  if (*(unsigned char *)(v0 + 200) == 1)
  {
    swift_release();
    NSString v5 = sub_1000646A0();
    id v4 = [self imageNamed:v5];

    goto LABEL_11;
  }
  uint64_t v6 = *(void **)(v0 + 80);
  if (v6)
  {
    id v7 = v6;
    swift_release();
    id v4 = *(id *)(v0 + 80);
    goto LABEL_11;
  }
  uint64_t v8 = Strong;
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v11 = *(void *)(v0 + 120);
  sub_100020E94(*(void *)(v0 + 64), v11, &qword_10007E520);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    uint64_t v12 = *(void *)(v0 + 120);
    swift_release();
    sub_100009CA4(v12, &qword_10007E520);
    id v4 = 0;
    goto LABEL_11;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 136) + 32))(*(void *)(v0 + 144), *(void *)(v0 + 120), *(void *)(v0 + 128));
  uint64_t v20 = *(void *)(v8 + 56);
  char v21 = *(unsigned char *)(v8 + 64);
  sub_10004E5E0(v20, v21);
  double v22 = sub_1000436B8(v20, v21);
  sub_10004E5EC(v20, v21);
  uint64_t v23 = swift_unknownObjectWeakLoadStrong();
  if (v23)
  {
    uint64_t v24 = *(void *)(v23 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_itemUTI + 8);
    if (v24)
    {
      uint64_t v25 = *(void *)(v0 + 136);
      uint64_t v26 = *(void *)(v0 + 128);
      uint64_t v27 = *(void *)(v0 + 112);
      uint64_t v28 = *(void *)(v23 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants16ModelDelegateSPI_itemUTI);
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 16))(v27, *(void *)(v0 + 144), v26);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v26);
      swift_bridgeObjectRetain();
      LOBYTE(v26) = sub_100022FF8(v28, v24, v27);
      swift_bridgeObjectRelease();
      sub_100009CA4(v27, &qword_10007E520);
      if (sub_100021C20(v26) == 0x7265646C6F66 && v29 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      char v30 = sub_100064C10();
      swift_bridgeObjectRelease();
      if (v30)
      {
LABEL_31:
        NSString v31 = sub_1000646A0();
        id v4 = [self imageNamed:v31];

        swift_unknownObjectRelease();
        if (v4)
        {
          (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
          swift_release();
LABEL_11:
          sub_10000EF58(0, &qword_10007F120);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100064480();
          swift_release();
          swift_release();
          id v13 = *(void **)(v0 + 40);
          if (qword_10007DC48 != -1) {
            swift_once();
          }
          char v14 = sub_100064A40();

          if (v14)
          {
            if (v4) {
              goto LABEL_20;
            }
          }
          else
          {
            swift_getKeyPath();
            swift_getKeyPath();
            sub_100064480();
            swift_release();
            swift_release();
            uint64_t v15 = *(void **)(v0 + 48);
            id v16 = [objc_allocWithZone((Class)UIImage) init];
            char v17 = sub_100064A40();

            if (v4) {
              goto LABEL_20;
            }
            if ((v17 & 1) == 0)
            {
              swift_getKeyPath();
              swift_getKeyPath();
              sub_100064480();
              swift_release();
              swift_release();
              swift_release();
              id v4 = *(id *)(v0 + 56);
              goto LABEL_21;
            }
          }
          id v4 = (id)qword_10007E840;
LABEL_20:
          swift_release();
          goto LABEL_21;
        }
        goto LABEL_34;
      }
    }
    swift_unknownObjectRelease();
  }
LABEL_34:
  NSString v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v32;
  *NSString v32 = v0;
  v32[1] = sub_1000424E4;
  uint64_t v33 = *(void *)(v0 + 144);
  double v34 = *(double *)(v0 + 96);
  double v35 = *(double *)(v0 + 104);
  return sub_10004ECB0(v33, v34, v35, v22);
}

uint64_t sub_1000424E4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 168);
  uint64_t v4 = *(void *)(v2 + 160);
  return _swift_task_switch(sub_10004260C, v4, v3);
}

uint64_t sub_10004260C()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[17];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  id v4 = (id)v0[24];
  sub_10000EF58(0, &qword_10007F120);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  NSString v5 = (void *)v0[5];
  if (qword_10007DC48 != -1) {
    swift_once();
  }
  char v6 = sub_100064A40();

  if (v6)
  {
    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  id v7 = (void *)v0[6];
  id v8 = [objc_allocWithZone((Class)UIImage) init];
  char v9 = sub_100064A40();

  if (v4) {
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_9:
    id v4 = (id)qword_10007E840;
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  id v4 = (id)v0[7];
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(id))v0[1];
  return v10(v4);
}

uint64_t sub_10004288C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100042900(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  char v6 = (int *)sub_100006DC8(&qword_10007F108);
  uint64_t v7 = *(unsigned __int8 *)(a2 + v6[12]);
  uint64_t v8 = *(void *)(a2 + v6[16]);
  uint64_t v9 = *(void *)(a2 + v6[20]);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_100042A20;
  return v12(a2, v7, v8, v9);
}

uint64_t sub_100042A20(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

void sub_100042B30(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    id v5 = [v3 containerOptions];
    unsigned int v6 = [v5 prefersHiddenAllowedSharingOptionsUI];

    if (v6) {
      uint64_t v4 = 0;
    }
  }
  *a2 = v4;
}

uint64_t sub_100042B98(char *a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v8 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    uint64_t v10 = sub_1000641E0();
    int v11 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v7, 1, v10);
    sub_100009CA4((uint64_t)v7, &qword_10007E520);
    if (v11 == 1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      BOOL v12 = (v18 & 0xFE) != 8;
      if (v8) {
        return swift_release();
      }
    }
    else
    {
      if (v8) {
        return swift_release();
      }
      BOOL v12 = 1;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    if (v18 == 2 && v12)
    {
      uint64_t v13 = sub_1000648A0();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
      uint64_t v14 = swift_allocObject();
      swift_weakInit();
      sub_100064870();
      swift_retain();
      uint64_t v15 = sub_100064860();
      id v16 = (void *)swift_allocObject();
      v16[2] = v15;
      v16[3] = &protocol witness table for MainActor;
      void v16[4] = v14;
      swift_release();
      sub_10000F1B0((uint64_t)v4, (uint64_t)&unk_10007F0F8, (uint64_t)v16);
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_100042EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_100064380();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  v4[12] = sub_100064870();
  v4[13] = sub_100064860();
  uint64_t v7 = sub_100064830();
  v4[14] = v7;
  v4[15] = v6;
  return _swift_task_switch(sub_100042FC8, v7, v6);
}

uint64_t sub_100042FC8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[16] = Strong;
  if (Strong)
  {
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    v0[17] = v2;
    if (v2)
    {
      sub_100064360();
      uint64_t v3 = sub_100064370();
      os_log_type_t v4 = sub_100064930();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Refetching share due to network change.", v5, 2u);
        swift_slowDealloc();
      }
      uint64_t v6 = v0[11];
      uint64_t v7 = v0[8];
      uint64_t v8 = v0[9];

      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v0[18] = v9;
      v0[19] = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v9(v6, v7);
      v0[20] = sub_100064860();
      uint64_t v10 = (void *)swift_task_alloc();
      v0[21] = v10;
      *uint64_t v10 = v0;
      v10[1] = sub_1000431B4;
      return sub_100045E18();
    }
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_1000431B4()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100064830();
  if (v0) {
    os_log_type_t v4 = sub_1000433F8;
  }
  else {
    os_log_type_t v4 = sub_100043310;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100043310()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return _swift_task_switch(sub_100043374, v1, v2);
}

uint64_t sub_100043374()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000433F8()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  return _swift_task_switch(sub_10004345C, v1, v2);
}

uint64_t sub_10004345C()
{
  char v17 = v0;
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[22];
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[18];
    uint64_t v14 = v0[10];
    uint64_t v4 = v0[8];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v16 = v6;
    v0[5] = v3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v7 = sub_1000646F0();
    v0[6] = sub_10004BEF0(v7, v8, &v16);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to refetch share for network change %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v15(v14, v4);
  }
  else
  {
    uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[18];
    uint64_t v10 = v0[10];
    uint64_t v11 = v0[8];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v9(v10, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

double sub_1000436B8(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000645E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100064920();
  uint64_t v9 = sub_100064600();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10004BEF0(0x74616F6C464743, 0xE700000000000000, &v14);
    sub_100064A90();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000645D0();
  swift_getAtKeyPath();
  sub_10004E5EC(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_1000438C8()
{
  return sub_100043B48();
}

uint64_t sub_1000438DC@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000438F0()
{
  return sub_100009540();
}

uint64_t sub_100043904@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100043918()
{
  return sub_100009540();
}

uint64_t sub_10004392C()
{
  return sub_100043B48();
}

uint64_t sub_100043940()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000439B4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100043A34()
{
  return sub_100064490();
}

uint64_t sub_100043AB0()
{
  return sub_100043AC4();
}

uint64_t sub_100043AC4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();

  return swift_release();
}

uint64_t sub_100043B34()
{
  return sub_100043B48();
}

uint64_t sub_100043B48()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100043BB4()
{
  return sub_100043B48();
}

uint64_t sub_100043BC8()
{
  return sub_100043B48();
}

uint64_t sub_100043BDC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000641E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v17 - v12;
  uint64_t v14 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_shouldStopAccessingSharedFileOrFolderURL;
  if (*(unsigned char *)(v2
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_shouldStopAccessingSharedFileOrFolderURL) == 1)
  {
    sub_100020E94(a1, (uint64_t)&v17 - v12, &qword_10007E520);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
    {
      sub_100009CA4((uint64_t)v13, &qword_10007E520);
    }
    else
    {
      sub_1000641A0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4))
  {
    uint64_t result = sub_100009CA4((uint64_t)v11, &qword_10007E520);
    BOOL v16 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v11, v4);
    sub_100009CA4((uint64_t)v11, &qword_10007E520);
    BOOL v16 = sub_1000641C0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(unsigned char *)(v2 + v14) = v16;
  return result;
}

uint64_t sub_100043E60()
{
  return sub_10004BD3C();
}

uint64_t sub_100043E74(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E520);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v12 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v12 - v9;
  sub_100020E94(a1, (uint64_t)&v12 - v9, &qword_10007E520);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020E94((uint64_t)v10, (uint64_t)v5, &qword_10007E520);
  swift_retain();
  sub_100064490();
  sub_100043BDC((uint64_t)v8);
  sub_100009CA4((uint64_t)v10, &qword_10007E520);
  return sub_100009CA4((uint64_t)v8, &qword_10007E520);
}

uint64_t sub_100044010()
{
  return sub_100044024();
}

uint64_t sub_100044024()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

double sub_100044090@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100044110()
{
  return sub_100064490();
}

uint64_t sub_100044194@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100044214(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_100064490();
}

uint64_t sub_10004428C(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007E520);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = sub_1000641E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  switch(v31)
  {
    case 1:
      goto LABEL_17;
    case 2:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      char v12 = 8;
      goto LABEL_4;
    case 3:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      char v12 = 9;
      goto LABEL_4;
    case 4:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      char v12 = 10;
      goto LABEL_4;
    case 5:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      char v12 = 11;
      goto LABEL_4;
    case 9:
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_100064480();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v20 = v30;
        unint64_t v21 = sub_1000226C8(v11, v30);
        uint64_t v23 = v22;

        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
        LOBYTE(v20) = sub_100022FF8(v21, v23, (uint64_t)v5);
        swift_bridgeObjectRelease();
        sub_100009CA4((uint64_t)v5, &qword_10007E520);
        switch((char)v20)
        {
          case 1:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 1;
            goto LABEL_52;
          case 2:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 2;
            goto LABEL_52;
          case 3:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 3;
            goto LABEL_52;
          case 4:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 4;
            goto LABEL_52;
          case 5:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 5;
            goto LABEL_52;
          case 6:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 6;
            goto LABEL_52;
          case 7:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 7;
            goto LABEL_52;
          case 8:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 8;
            goto LABEL_52;
          case 9:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 9;
            goto LABEL_52;
          case 10:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 10;
            goto LABEL_52;
          case 11:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 11;
            goto LABEL_52;
          case 12:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 12;
            goto LABEL_52;
          case 13:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            unint64_t v25 = sub_10004C5C0(13);
            if (v28) {
              goto LABEL_53;
            }
            uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
            v9 += 8;
            v29(v11, v8);
            if (*(void *)(a1 + 16)) {
              goto LABEL_6;
            }
            __break(1u);
LABEL_58:
            (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
            goto LABEL_5;
          default:
            if (!*(void *)(a1 + 16)) {
              goto LABEL_58;
            }
            char v24 = 0;
LABEL_52:
            unint64_t v25 = sub_10004C5C0(v24);
            if ((v26 & 1) == 0) {
              goto LABEL_58;
            }
LABEL_53:
            uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 16 * v25);
            uint64_t v27 = *(void (**)(char *, uint64_t))(v9 + 8);
            swift_bridgeObjectRetain();
            v27(v11, v8);
            return v16;
        }
      }
      sub_100009CA4((uint64_t)v7, &qword_10007E520);
      if (!*(void *)(a1 + 16)) {
        goto LABEL_61;
      }
      unint64_t v13 = sub_10004C5C0(1);
      if (v18) {
        goto LABEL_7;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_61;
      }
      unint64_t v13 = sub_10004C5C0(13);
      if (v19) {
        goto LABEL_7;
      }
      __break(1u);
LABEL_17:
      if (*(void *)(a1 + 16))
      {
        char v12 = 7;
LABEL_4:
        unint64_t v13 = sub_10004C5C0(v12);
        if (v14) {
          goto LABEL_7;
        }
      }
LABEL_5:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_60;
      }
LABEL_6:
      unint64_t v13 = sub_10004C5C0(13);
      if ((v15 & 1) == 0)
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        JUMPOUT(0x1000447E4);
      }
LABEL_7:
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 16 * v13);
      swift_bridgeObjectRetain();
      return v16;
    default:
      if (!*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      char v12 = 13;
      goto LABEL_4;
  }
}

uint64_t sub_100044844(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 256) = a2;
  *(void *)(v4 + 264) = v3;
  *(unsigned char *)(v4 + 368) = a3;
  *(void *)(v4 + 248) = a1;
  uint64_t v5 = sub_100064380();
  *(void *)(v4 + 272) = v5;
  *(void *)(v4 + 280) = *(void *)(v5 - 8);
  *(void *)(v4 + 288) = swift_task_alloc();
  sub_100064870();
  *(void *)(v4 + 296) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v4 + 304) = v7;
  *(void *)(v4 + 312) = v6;
  return _swift_task_switch(sub_100044940, v7, v6);
}

uint64_t sub_100044940()
{
  if (*(unsigned char *)(v0 + 368))
  {
    uint64_t v6 = sub_100024120();
    *(void *)(v0 + 328) = v6;
    uint64_t v7 = v6;
    NSString v8 = sub_1000646A0();
    *(void *)(v0 + 352) = v8;
    *(void *)(v0 + 80) = v0;
    *(void *)(v0 + 120) = v0 + 240;
    *(void *)(v0 + 88) = sub_100044F28;
    uint64_t v9 = swift_continuation_init();
    *(void *)(v0 + 184) = _NSConcreteStackBlock;
    *(void *)(v0 + 192) = 0x40000000;
    *(void *)(v0 + 200) = sub_1000438C4;
    *(void *)(v0 + 208) = &unk_10007AAC0;
    *(void *)(v0 + 216) = v9;
    [v7 fetchShareParticipantWithPhoneNumber:v8 completionHandler:v0 + 184];
    uint64_t v5 = v0 + 80;
  }
  else
  {
    uint64_t v1 = sub_100024120();
    *(void *)(v0 + 320) = v1;
    uint64_t v2 = v1;
    NSString v3 = sub_1000646A0();
    *(void *)(v0 + 336) = v3;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 232;
    *(void *)(v0 + 24) = sub_100044D6C;
    uint64_t v4 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_1000438C4;
    *(void *)(v0 + 168) = &unk_10007AAD8;
    *(void *)(v0 + 176) = v4;
    [v2 fetchShareParticipantWithEmailAddress:v3 completionHandler:v0 + 144];
    uint64_t v5 = v0 + 16;
  }
  return _swift_continuation_await(v5);
}

uint64_t sub_100044D6C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 344) = v2;
  uint64_t v3 = *(void *)(v1 + 312);
  uint64_t v4 = *(void *)(v1 + 304);
  if (v2) {
    uint64_t v5 = sub_1000450E4;
  }
  else {
    uint64_t v5 = sub_100044E9C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100044E9C()
{
  uint64_t v1 = (void *)v0[42];
  uint64_t v2 = (void *)v0[40];
  swift_release();
  uint64_t v3 = v0[29];

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_100044F28()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 360) = v2;
  uint64_t v3 = *(void *)(v1 + 312);
  uint64_t v4 = *(void *)(v1 + 304);
  if (v2) {
    uint64_t v5 = sub_100045340;
  }
  else {
    uint64_t v5 = sub_100045058;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100045058()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v2 = (void *)v0[41];
  swift_release();
  uint64_t v3 = v0[30];

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  return v4(v3);
}

uint64_t sub_1000450E4()
{
  uint64_t v1 = (void *)v0[42];
  uint64_t v2 = (void *)v0[40];
  swift_release();
  swift_willThrow();

  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_100064370();
  os_log_type_t v4 = sub_100064910();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[28] = v7;
    sub_100064A90();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "participant(withAddress) got CK error: %@", v5, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = v0[35];
  uint64_t v8 = v0[36];
  uint64_t v10 = v0[34];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  uint64_t v11 = sub_100064140();
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v12 = 0xD000000000000019;
  *(void *)(v12 + 8) = 0x800000010006A1D0;
  *(void *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = 0;
  *(void *)(v12 + 16) = v11;
  *(unsigned char *)(v12 + 40) = 2;
  swift_willThrow();
  swift_errorRelease();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_100045340()
{
  uint64_t v1 = (void *)v0[44];
  uint64_t v2 = (void *)v0[41];
  swift_release();
  swift_willThrow();

  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_100064370();
  os_log_type_t v4 = sub_100064910();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[28] = v7;
    sub_100064A90();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "participant(withAddress) got CK error: %@", v5, 0xCu);
    sub_100006DC8(&qword_10007F1B0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = v0[35];
  uint64_t v8 = v0[36];
  uint64_t v10 = v0[34];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  uint64_t v11 = sub_100064140();
  sub_10000700C();
  swift_allocError();
  *(void *)uint64_t v12 = 0xD000000000000019;
  *(void *)(v12 + 8) = 0x800000010006A1D0;
  *(void *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = 0;
  *(void *)(v12 + 16) = v11;
  *(unsigned char *)(v12 + 40) = 2;
  swift_willThrow();
  swift_errorRelease();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_100045598(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006DC8(&qword_10007DF80);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_100045658(uint64_t a1, unsigned __int8 a2)
{
  if (sub_100036548())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    if (v8) {
      goto LABEL_6;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if (v7 != 1) {
    return 3;
  }
LABEL_6:
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if ((v6 & 1) == 0 && (a2 & (a1 == 3)) == 0) {
    return 3;
  }
  return sub_100064990();
}

uint64_t sub_100045830(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v4 + 114) = a3;
  *(unsigned char *)(v4 + 113) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = sub_100064380();
  *(void *)(v4 + 40) = v5;
  *(void *)(v4 + 48) = *(void *)(v5 - 8);
  *(void *)(v4 + 56) = swift_task_alloc();
  sub_100064870();
  *(void *)(v4 + 64) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v4 + 72) = v7;
  *(void *)(v4 + 80) = v6;
  return _swift_task_switch(sub_10004592C, v7, v6);
}

uint64_t sub_10004592C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 88) = v1;
  if (!v1)
  {
    swift_release();
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v19 = 0xD000000000000034;
    *(void *)(v19 + 8) = 0x800000010006A190;
    *(_OWORD *)(v19 + 16) = xmmword_100067390;
    *(void *)(v19 + 32) = 0x800000010006A150;
    *(unsigned char *)(v19 + 40) = 11;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
LABEL_11:
    return v9();
  }
  if (*(unsigned char *)(v0 + 113) == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    int v2 = *(unsigned __int8 *)(v0 + 112);
    swift_release();
    if (v2 == 1)
    {
      swift_release();
      sub_100064360();
      uint64_t v3 = sub_100064370();
      os_log_type_t v4 = sub_100064930();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "addParticipantsToShare, doing nothing as we have a public share", v5, 2u);
        swift_slowDealloc();
      }
      uint64_t v7 = *(void *)(v0 + 48);
      uint64_t v6 = *(void *)(v0 + 56);
      uint64_t v8 = *(void *)(v0 + 40);

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      swift_task_dealloc();
      uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_11;
    }
  }
  unint64_t v10 = sub_100050A94();
  uint64_t v12 = v11;
  char v14 = v13;
  *(void *)(v0 + 96) = v11;
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char, char))((char *)&dword_10007E6C0
                                                                               + dword_10007E6C0);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_100045C60;
  char v16 = *(unsigned char *)(v0 + 114);
  uint64_t v17 = *(void *)(v0 + 24);
  return v20(v17, (uint64_t)v1, v10 & 0x101FFFFFFFFFFLL, v12, v14 & 1, v16);
}

uint64_t sub_100045C60()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return _swift_task_switch(sub_100045DA4, v3, v2);
}

uint64_t sub_100045DA4()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100045E18()
{
  v1[5] = v0;
  uint64_t v2 = sub_100064380();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  uint64_t v3 = sub_1000641E0();
  v1[15] = v3;
  v1[16] = *(void *)(v3 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  sub_100064870();
  v1[19] = sub_100064860();
  uint64_t v5 = sub_100064830();
  v1[20] = v5;
  v1[21] = v4;
  return _swift_task_switch(sub_100045FE8, v5, v4);
}

uint64_t sub_100045FE8()
{
  uint64_t v31 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 224) & 0xFE) != 8)
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
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  *(void *)(v0 + 176) = v4;
  *(void *)(v0 + 184) = (v2 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v4(v3, 1, v1) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 112);
    swift_release();
    sub_100009CA4(v5, &qword_10007E520);
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD000000000000016;
    *(void *)(v6 + 8) = 0x8000000100069FD0;
    *(void *)(v6 + 24) = 0;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 16) = 0;
    *(unsigned char *)(v6 + 40) = 0;
    swift_willThrow();
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
LABEL_5:
    return v7();
  }
  uint64_t v10 = *(void *)(v0 + 136);
  uint64_t v9 = *(void *)(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 32))(v9, *(void *)(v0 + 112), v11);
  sub_100064360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v9, v11);
  char v13 = sub_100064370();
  os_log_type_t v14 = sub_100064930();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v17 = *(void *)(v0 + 128);
  uint64_t v16 = *(void *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v20 = *(void *)(v0 + 56);
  uint64_t v19 = *(void *)(v0 + 64);
  uint64_t v21 = *(void *)(v0 + 48);
  if (v15)
  {
    uint64_t v29 = *(void *)(v0 + 64);
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_10004D4A8((unint64_t *)&qword_10007E540, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v23 = sub_100064BF0();
    *(void *)(v0 + 32) = sub_10004BEF0(v23, v24, &v30);
    sub_100064A90();
    swift_bridgeObjectRelease();
    unint64_t v25 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v25(v16, v18);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Fetching share for URL: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v29, v21);
  }
  else
  {
    unint64_t v25 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v25(*(void *)(v0 + 136), *(void *)(v0 + 120));

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  *(void *)(v0 + 192) = v25;
  char v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v26;
  *char v26 = v0;
  v26[1] = sub_1000464FC;
  uint64_t v27 = *(void *)(v0 + 144);
  uint64_t v28 = *(void *)(v0 + 96);
  return sub_100028598(v28, v27);
}

uint64_t sub_1000464FC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 208) = a1;
  *(void *)(v4 + 216) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 168);
  uint64_t v6 = *(void *)(v3 + 160);
  if (v1) {
    uint64_t v7 = sub_100046964;
  }
  else {
    uint64_t v7 = sub_100046640;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_100046640()
{
  uint64_t v1 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 88);
  swift_release();
  sub_10004FDB8(v4, v3, &qword_10007E520);
  sub_100020E94(v3, v5, &qword_10007E520);
  if (v1(v5, 1, v2) == 1)
  {
    sub_100009CA4(*(void *)(v0 + 88), &qword_10007E520);
    id v6 = *(id *)(v0 + 208);
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 88);
    id v8 = *(id *)(v0 + 208);
    sub_100009CA4(v7, &qword_10007E520);
    id v6 = [objc_allocWithZone((Class)BRCKShareSubitem) initWithShare:v8];
  }
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 80);
  sub_100020E94(*(void *)(v0 + 104), v10, &qword_10007E520);
  sub_100020E94(v10, v9, &qword_10007E520);
  swift_retain();
  sub_1000085F8(v9);
  swift_release();
  sub_100009CA4(v10, &qword_10007E520);
  swift_getKeyPath();
  swift_getKeyPath();
  if (v6)
  {
    *(void *)(v0 + 24) = v6;
    swift_retain();
    sub_100064490();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 120);
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 72);
    uint64_t v13 = *(void *)(v0 + 80);
    *(void *)(v0 + 16) = 0;
    swift_retain_n();
    sub_100064490();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v13, 1, 1, v11);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100020E94(v13, v14, &qword_10007E520);
    swift_retain();
    sub_100064490();
    sub_100009CA4(v13, &qword_10007E520);
    swift_release();
  }
  BOOL v15 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v17 = *(void *)(v0 + 120);
  sub_100009CA4(*(void *)(v0 + 104), &qword_10007E520);
  v15(v16, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_100046964()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[24];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[15];
  swift_release();
  v1(v2, v3);
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

void sub_100046A60(unsigned __int8 a1, void *a2)
{
  uint64_t v3 = v2;
  int v5 = a1;
  uint64_t v6 = sub_100064380();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v78 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v78 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v78 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v78 - v20;
  if (v5 == 6)
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!Strong)
    {
      sub_100064360();
      uint64_t v23 = sub_100064370();
      os_log_type_t v24 = sub_100064930();
      if (os_log_type_enabled(v23, v24))
      {
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "ext computed property--extensionController is nil--will assert", v25, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v6);
    }
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_1000646E0();
      id v26 = objc_allocWithZone((Class)NSError);
      NSString v27 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v28 = [v26 initWithDomain:v27 code:3072 userInfo:0];

      sub_1000280C8(v28);
      swift_unknownObjectRelease();

      return;
    }
    __break(1u);
    goto LABEL_57;
  }
  if (a2)
  {
    uint64_t v85 = v3;
    id v29 = a2;
    sub_100064360();
    uint64_t v30 = v29;
    uint64_t v31 = sub_100064370();
    int v32 = sub_100064910();
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      LODWORD(v79) = v32;
      os_log_t v81 = v31;
      uint64_t v82 = v30;
      uint64_t v83 = v7;
      uint64_t v84 = v6;
      uint64_t v33 = (_DWORD *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      uint64_t v87 = v78;
      uint64_t v80 = v33;
      *uint64_t v33 = 136315394;
      uint64_t v34 = sub_1000647B0();
      uint64_t v36 = v35;
      if ((0x800000010006A0B0 & 0x2000000000000000) != 0) {
        unint64_t v37 = (0x800000010006A0B0 & 0xF00000000000000) >> 54;
      }
      else {
        unint64_t v37 = 124;
      }
      if ((((unint64_t)" to the next service" >> 61) & ((0x800000010006A0B0 & 0xF00000000000000) >> 54 == 0)) != 0)
      {
LABEL_21:
        swift_bridgeObjectRelease();
        uint64_t v42 = 0;
        unint64_t v43 = 0xE000000000000000;
      }
      else
      {
        uint64_t v38 = v34;
        while (sub_1000647B0() != v38 || v39 != v36)
        {
          char v41 = sub_100064C10();
          swift_bridgeObjectRelease();
          if (v41) {
            goto LABEL_38;
          }
          if (v37 == (unint64_t)sub_100064740() >> 14) {
            goto LABEL_21;
          }
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        sub_1000647C0();
        uint64_t v42 = sub_100064710();
        unint64_t v43 = v58;
        swift_bridgeObjectRelease();
      }
      uint64_t v59 = v80;
      uint64_t v86 = sub_10004BEF0(v42, v43, &v87);
      sub_100064A90();
      swift_bridgeObjectRelease();
      *((_WORD *)v59 + 6) = 2080;
      uint64_t v30 = v82;
      uint64_t v60 = v82;
      id v61 = [v60 description];
      uint64_t v62 = sub_1000646E0();
      unint64_t v64 = v63;

      uint64_t v86 = sub_10004BEF0(v62, v64, &v87);
      sub_100064A90();

      swift_bridgeObjectRelease();
      os_log_t v65 = v81;
      _os_log_impl((void *)&_mh_execute_header, v81, (os_log_type_t)v79, "%s cancelling via extension with error: %s", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v7 = v83;
      uint64_t v6 = v84;
    }
    else
    {
    }
    uint64_t v66 = *(void (**)(char *, uint64_t))(v7 + 8);
    v66(v19, v6);
    uint64_t v67 = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!v67)
    {
      sub_100064360();
      uint64_t v68 = sub_100064370();
      os_log_type_t v69 = sub_100064930();
      if (os_log_type_enabled(v68, v69))
      {
        uint64_t v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v70 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, v69, "ext computed property--extensionController is nil--will assert", v70, 2u);
        swift_slowDealloc();
      }

      v66(v16, v6);
    }
    if (!swift_unknownObjectWeakLoadStrong())
    {
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      return;
    }
    sub_1000280C8(v30);
  }
  else
  {
    sub_100064360();
    uint64_t v44 = sub_100064370();
    int v45 = sub_100064930();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      LODWORD(v80) = v45;
      uint64_t v82 = v44;
      uint64_t v83 = v7;
      uint64_t v84 = v6;
      uint64_t v85 = v3;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      uint64_t v87 = v79;
      os_log_t v81 = v46;
      LODWORD(v46->isa) = 136315138;
      uint64_t v47 = sub_1000647B0();
      uint64_t v49 = v48;
      if ((0x800000010006A0B0 & 0x2000000000000000) != 0) {
        unint64_t v50 = (0x800000010006A0B0 & 0xF00000000000000) >> 54;
      }
      else {
        unint64_t v50 = 124;
      }
      if ((((unint64_t)" to the next service" >> 61) & ((0x800000010006A0B0 & 0xF00000000000000) >> 54 == 0)) != 0)
      {
LABEL_34:
        swift_bridgeObjectRelease();
        uint64_t v55 = 0;
        unint64_t v56 = 0xE000000000000000;
      }
      else
      {
        uint64_t v51 = v47;
        while (sub_1000647B0() != v51 || v52 != v49)
        {
          char v54 = sub_100064C10();
          swift_bridgeObjectRelease();
          if (v54) {
            goto LABEL_47;
          }
          if (v50 == (unint64_t)sub_100064740() >> 14) {
            goto LABEL_34;
          }
        }
        swift_bridgeObjectRelease();
LABEL_47:
        swift_bridgeObjectRelease();
        sub_1000647C0();
        uint64_t v55 = sub_100064710();
        unint64_t v56 = v71;
        swift_bridgeObjectRelease();
      }
      uint64_t v72 = (uint8_t *)v81;
      uint64_t v86 = sub_10004BEF0(v55, v56, &v87);
      sub_100064A90();
      swift_bridgeObjectRelease();
      uint64_t v73 = v82;
      _os_log_impl((void *)&_mh_execute_header, v82, (os_log_type_t)v80, "%s dismissing via extension without error", v72, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v6 = v84;
      uint64_t v57 = *(void (**)(char *, uint64_t))(v83 + 8);
      v57(v13, v84);
    }
    else
    {

      uint64_t v57 = *(void (**)(char *, uint64_t))(v7 + 8);
      v57(v13, v6);
    }
    uint64_t v74 = swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectRelease();
    if (!v74)
    {
      sub_100064360();
      uint64_t v75 = sub_100064370();
      os_log_type_t v76 = sub_100064930();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "ext computed property--extensionController is nil--will assert", v77, 2u);
        swift_slowDealloc();
      }

      v57(v10, v6);
    }
    if (!swift_unknownObjectWeakLoadStrong()) {
      goto LABEL_58;
    }
  }
  swift_unknownObjectRelease();
}

uint64_t sub_1000473C8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10004FFB0(v0 + 40);
  sub_10004E5EC(*(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isDelegateInitialized;
  uint64_t v2 = sub_100006DC8(&qword_10007EE80);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__executionMode;
  uint64_t v5 = sub_100006DC8(&qword_10007EE78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingType;
  uint64_t v7 = sub_100006DC8(&qword_10007EE70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingStage;
  uint64_t v9 = sub_100006DC8(&qword_10007EE68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__addedAddresses;
  uint64_t v11 = sub_100006DC8(&qword_10007EE60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__createOrLoadStage;
  uint64_t v13 = sub_100006DC8(&qword_10007EE58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__addingAddressesStage;
  uint64_t v15 = sub_100006DC8(&qword_10007EE50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__savingStage;
  uint64_t v17 = sub_100006DC8(&qword_10007EE48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  uint64_t v18 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__alertNowShowing;
  uint64_t v19 = sub_100006DC8(&qword_10007EE40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isShowingAlert, v2);
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isFolderShare, v2);
  swift_release();
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isFolderSubshare, v2);
  swift_release();
  swift_release();
  uint64_t v20 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__folderSharingStage;
  uint64_t v21 = sub_100006DC8(&qword_10007EE38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  uint64_t v22 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__shareSaveStatus;
  uint64_t v23 = sub_100006DC8(&qword_10007EE30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  swift_unknownObjectRelease();
  uint64_t v24 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharingOptionsAllowedFromSPI;
  uint64_t v25 = sub_100006DC8(&qword_10007EE28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  uint64_t v26 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__yourNameAndEmail;
  uint64_t v27 = sub_100006DC8(&qword_10007EE20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
  uint64_t v28 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sharedFileOrFolderURL;
  uint64_t v29 = sub_100006DC8(&qword_10007E350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  uint64_t v30 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__itemUTI;
  uint64_t v31 = sub_100006DC8((uint64_t *)&unk_10007EE10);
  int v32 = *(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8);
  v32(v30, v31);
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__isShareRoot, v2);
  uint64_t v33 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnail;
  uint64_t v34 = sub_100006DC8(&qword_10007EE08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
  uint64_t v35 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnailFromCloudKitSPI;
  uint64_t v36 = sub_100006DC8(&qword_10007EE00);
  unint64_t v37 = *(void (**)(uint64_t, uint64_t))(*(void *)(v36 - 8) + 8);
  v37(v35, v36);
  v37(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__thumbnailFromDocumentSPI, v36);
  uint64_t v38 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__itemTitle;
  uint64_t v39 = sub_100006DC8(&qword_10007EDF8);
  id v40 = *(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8);
  v40(v38, v39);
  v32(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sourceAppBundleID, v31);
  v40(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__sectionTitleForAuxiliaryToggles, v39);
  v40(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__primaryCheckboxTitle, v39);
  v40(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__secondaryCheckboxTitle, v39);
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__primaryCheckboxState, v2);
  v3(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__secondaryCheckboxState, v2);
  uint64_t v41 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__ckContainerIdentifier;
  uint64_t v42 = sub_100006DC8(&qword_10007EDF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8))(v41, v42);
  v40(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__helpAnchor, v39);
  uint64_t v43 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__participantDetails;
  uint64_t v44 = sub_100006DC8(&qword_10007EDE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8))(v43, v44);
  swift_release();

  return v0;
}

uint64_t sub_100047BA4()
{
  sub_1000473C8();

  return swift_deallocClassInstance();
}

void sub_100047BFC()
{
  NSString v0 = sub_1000646A0();
  id v1 = [self imageNamed:v0];

  if (!v1) {
    id v1 = [objc_allocWithZone((Class)UIImage) init];
  }
  qword_10007E840 = (uint64_t)v1;
}

uint64_t sub_100047C90(char a1)
{
  *(void *)(v2 + 184) = v1;
  *(unsigned char *)(v2 + 105) = a1;
  sub_100006DC8(&qword_10007EA00);
  *(void *)(v2 + 192) = swift_task_alloc();
  *(void *)(v2 + 200) = swift_task_alloc();
  *(void *)(v2 + 208) = swift_task_alloc();
  sub_100006DC8(&qword_10007E798);
  *(void *)(v2 + 216) = swift_task_alloc();
  uint64_t v3 = type metadata accessor for AlertViewModelButton(0);
  *(void *)(v2 + 224) = v3;
  *(void *)(v2 + 232) = *(void *)(v3 - 8);
  *(void *)(v2 + 240) = swift_task_alloc();
  *(void *)(v2 + 248) = swift_task_alloc();
  uint64_t v4 = sub_100064380();
  *(void *)(v2 + 256) = v4;
  *(void *)(v2 + 264) = *(void *)(v4 - 8);
  *(void *)(v2 + 272) = swift_task_alloc();
  *(void *)(v2 + 280) = swift_task_alloc();
  *(void *)(v2 + 288) = swift_task_alloc();
  *(void *)(v2 + 296) = swift_task_alloc();
  *(void *)(v2 + 304) = swift_task_alloc();
  *(void *)(v2 + 312) = swift_task_alloc();
  *(void *)(v2 + 320) = swift_task_alloc();
  sub_100006DC8(&qword_10007F3D0);
  *(void *)(v2 + 328) = swift_task_alloc();
  *(void *)(v2 + 336) = sub_100064870();
  *(void *)(v2 + 344) = sub_100064860();
  uint64_t v6 = sub_100064830();
  *(void *)(v2 + 352) = v6;
  *(void *)(v2 + 360) = v5;
  return _swift_task_switch(sub_100047EF0, v6, v5);
}

uint64_t sub_100047EF0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 57) & 1) != 0
    || (swift_getKeyPath(),
        swift_getKeyPath(),
        sub_100064480(),
        swift_release(),
        swift_release(),
        *(unsigned __int8 *)(v0 + 62) - 2 > 3))
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 328);
    uint64_t v2 = *(void *)(v0 + 184);
    sub_100064880();
    uint64_t v3 = sub_1000648A0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 0, 1, v3);
    swift_retain();
    uint64_t v4 = sub_100064860();
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = v4;
    v5[3] = &protocol witness table for MainActor;
    v5[4] = v2;
    uint64_t v6 = sub_100033164(v1, (uint64_t)&unk_10007F248, (uint64_t)v5);
    *(void *)(v0 + 368) = v6;
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 61) = 0;
    swift_retain();
    sub_100064490();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v7;
    uint64_t v8 = sub_100006DC8(&qword_10007DF80);
    *(void *)(v0 + 384) = v8;
    *uint64_t v7 = v0;
    v7[1] = sub_100048254;
    return Task.value.getter(v8, v6, (char *)&type metadata for () + 8, v8, &protocol self-conformance witness table for Error);
  }
}

uint64_t sub_100048254()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 360);
  uint64_t v4 = *(void *)(v2 + 352);
  if (v0) {
    uint64_t v5 = sub_100048504;
  }
  else {
    uint64_t v5 = sub_100048390;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100048390()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 63) = 2;
  swift_retain();
  sub_100064490();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100048504()
{
  uint64_t v161 = v0;
  *(void *)(v0 + 144) = *(void *)(v0 + 392);
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v1 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    *(void *)(v0 + 400) = v1;
    *(void *)(v0 + 408) = v2;
    uint64_t v4 = *(void **)(v0 + 32);
    uint64_t v3 = *(void *)(v0 + 40);
    *(void *)(v0 + 416) = v4;
    *(void *)(v0 + 424) = v3;
    uint64_t v5 = *(void *)(v0 + 48);
    *(void *)(v0 + 432) = v5;
    int v158 = *(unsigned __int8 *)(v0 + 56);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 60) = 2;
    swift_retain();
    int v6 = v158;
    uint64_t v7 = v1;
    sub_100064490();
    sub_100064360();
    sub_10001AA54(v1, v2, v4, v3, v5, v158);
    uint64_t v8 = v5;
    sub_10001AA54(v1, v2, v4, v3, v5, v158);
    uint64_t v9 = sub_100064370();
    os_log_type_t type = sub_100064910();
    BOOL v10 = os_log_type_enabled(v9, type);
    uint64_t v154 = v5;
    uint64_t v155 = *(void *)(v0 + 320);
    uint64_t v11 = *(void *)(v0 + 264);
    uint64_t v12 = *(void *)(v0 + 256);
    if (v10)
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v160 = swift_slowAlloc();
      buf = v13;
      *(_DWORD *)uint64_t v13 = 136315138;
      *(void *)(v0 + 64) = v7;
      *(void *)(v0 + 72) = v2;
      *(void *)(v0 + 80) = v4;
      *(void *)(v0 + 88) = v3;
      *(void *)(v0 + 96) = v8;
      *(unsigned char *)(v0 + 104) = v158;
      sub_10001AA54(v7, v2, v4, v3, v8, v158);
      uint64_t v14 = sub_1000646F0();
      *(void *)(v0 + 152) = sub_10004BEF0(v14, v15, &v160);
      sub_100064A90();
      int v6 = v158;
      swift_bridgeObjectRelease();
      sub_10001AAF4(v7, v2, v4, v3, v8, v158);
      sub_10001AAF4(v7, v2, v4, v3, v8, v158);
      _os_log_impl((void *)&_mh_execute_header, v9, type, "saveShareAndReportErrors error: %s", buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
      uint64_t result = v16(v155, v12);
      uint64_t v18 = v2;
      uint64_t v19 = v4;
      uint64_t v20 = v3;
      uint64_t v21 = v154;
    }
    else
    {
      sub_10001AAF4(v7, v2, v4, v3, v8, v158);
      sub_10001AAF4(v7, v2, v4, v3, v8, v158);

      uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
      uint64_t result = v16(v155, v12);
      uint64_t v18 = v2;
      uint64_t v19 = v4;
      uint64_t v20 = v3;
      uint64_t v21 = v8;
    }
    *(void *)(v0 + 440) = v16;
    if (v6 != 4)
    {
      swift_release();
LABEL_34:
      sub_10000700C();
      swift_allocError();
      *(void *)uint64_t v92 = v7;
      *(void *)(v92 + 8) = v18;
      *(void *)(v92 + 16) = v19;
      *(void *)(v92 + 24) = v20;
      *(void *)(v92 + 32) = v21;
      *(unsigned char *)(v92 + 40) = v6;
      sub_10001AA54(v7, v18, v19, v20, v21, v6);
      swift_willThrow();
      swift_release();
      uint64_t v93 = v7;
      uint64_t v94 = v18;
      uint64_t v95 = v19;
      uint64_t v96 = v20;
      uint64_t v97 = v21;
      unsigned __int8 v98 = v6;
LABEL_35:
      sub_10001AAF4(v93, v94, v95, v96, v97, v98);
      goto LABEL_36;
    }
    if (!v19)
    {
      __break(1u);
      return result;
    }
    sub_10001AA54(v7, v18, v19, v20, v21, 4u);
    id v22 = v19;
    char v23 = sub_10002AB30(22);

    if (v23)
    {
      uint64_t v149 = v20;
      v156 = v19;
      uint64_t v24 = v18;
      uint64_t v25 = v7;
      sub_100064360();
      uint64_t v26 = sub_100064370();
      os_log_type_t v27 = sub_100064910();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "saveShareAndReportErrors got batchRequestFailed, will retry once", v28, 2u);
        swift_slowDealloc();
      }
      uint64_t v29 = *(void *)(v0 + 312);
      uint64_t v30 = *(void *)(v0 + 256);
      uint64_t v31 = *(void *)(v0 + 264);
      int v32 = *(unsigned __int8 *)(v0 + 105);

      *(void *)(v0 + 448) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v16(v29, v30);
      if (v32 == 1)
      {
        uint64_t v33 = (void *)swift_task_alloc();
        *(void *)(v0 + 456) = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_100049930;
        return sub_100047C90(0);
      }

      uint64_t v18 = v24;
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v21 = v154;
      swift_bridgeObjectRelease();
      uint64_t v7 = v25;
      uint64_t v19 = v156;
      uint64_t v20 = v149;
      goto LABEL_33;
    }
    swift_release();
    id v34 = v22;
    char v35 = sub_10002AB30(14);

    if (v35)
    {
      uint64_t v159 = v34;
      os_log_t log = (os_log_t)v7;
      uint64_t v150 = v20;
      uint64_t v157 = v19;
      uint64_t v147 = v18;
      uint64_t v36 = (_OWORD *)(v0 + 112);
      sub_100064360();
      unint64_t v37 = sub_100064370();
      os_log_type_t v38 = sub_100064910();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "saveShareAndReportErrors got oplock error, will update share and show alert", v39, 2u);
        swift_slowDealloc();
      }
      uint64_t v40 = *(void *)(v0 + 304);
      uint64_t v41 = *(void *)(v0 + 256);

      v16(v40, v41);
      id v42 = [v159 userInfo];
      uint64_t v43 = sub_100064660();

      uint64_t v44 = sub_1000646E0();
      if (*(void *)(v43 + 16) && (unint64_t v46 = sub_10004C548(v44, v45), (v47 & 1) != 0))
      {
        sub_10004FF44(*(void *)(v43 + 56) + 32 * v46, (uint64_t)v36);
      }
      else
      {
        *uint64_t v36 = 0u;
        *(_OWORD *)(v0 + 128) = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 136))
      {
        sub_10000EF58(0, (unint64_t *)&qword_10007F260);
        if (swift_dynamicCast())
        {
          uint64_t v86 = *(void **)(v0 + 176);
          sub_100064360();
          id v87 = v86;
          uint64_t v88 = sub_100064370();
          os_log_type_t v89 = sub_100064900();
          uint64_t v139 = v0;
          if (os_log_type_enabled(v88, v89))
          {
            uint64_t v90 = (uint8_t *)swift_slowAlloc();
            bufb = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v90 = 138412290;
            *(void *)(v0 + 160) = v87;
            id v91 = v87;
            sub_100064A90();
            *(void *)bufb = v87;

            _os_log_impl((void *)&_mh_execute_header, v88, v89, "saveShareAndReportErrors oplock error server's updated share: %@", v90, 0xCu);
            sub_100006DC8(&qword_10007F1B0);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
          uint64_t v70 = *(void *)(v0 + 248);
          id v107 = *(int **)(v0 + 224);
          uint64_t v108 = *(void *)(v0 + 208);
          uint64_t v109 = *(void *)(v0 + 216);
          uint64_t v142 = *(void *)(v0 + 232);
          bufc = *(uint8_t **)(v0 + 200);
          v16(*(void *)(v0 + 296), *(void *)(v0 + 256));
          swift_getKeyPath();
          swift_getKeyPath();
          *(void *)(v0 + 168) = v87;
          id typeb = v87;
          swift_retain();
          sub_100064490();
          sub_1000645F0();
          LOWORD(v137._object) = 256;
          uint64_t v110 = sub_100064610();
          uint64_t v112 = v111;
          char v114 = v113;
          uint64_t v116 = v115;
          uint64_t v117 = sub_1000645A0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v109, 1, 1, v117);
          uint64_t v118 = swift_allocObject();
          swift_weakInit();
          sub_100064200();
          uint64_t v119 = v70 + v107[5];
          *(void *)uint64_t v119 = v110;
          *(void *)(v119 + 8) = v112;
          *(unsigned char *)(v119 + 16) = v114 & 1;
          *(void *)(v119 + 24) = v116;
          sub_10004FDB8(v109, v70 + v107[6], &qword_10007E798);
          v120 = (uint64_t (**)())(v70 + v107[7]);
          *v120 = sub_10004FF3C;
          v120[1] = (uint64_t (*)())v118;
          uint64_t v121 = self;
          uint64_t v122 = (objc_class *)objc_msgSend(v121, "mainBundle", 0);
          v137._countAndFlagsBits = 0x800000010006A3F0;
          v164._object = (void *)0x800000010006A3D0;
          v164._countAndFlagsBits = 0x1000000000000019;
          v167.value._countAndFlagsBits = 0;
          v167.value._object = 0;
          v123.super.Class isa = v122;
          v170._countAndFlagsBits = 0;
          v170._object = (void *)0xE000000000000000;
          uint64_t v124 = sub_100064020(v164, v167, v123, v170, v137);
          uint64_t v126 = v125;

          uint64_t v127 = (objc_class *)[v121 mainBundle];
          v138._countAndFlagsBits = 0x800000010006A440;
          v165._object = (void *)0x800000010006A420;
          v165._countAndFlagsBits = 0xD000000000000011;
          v168.value._countAndFlagsBits = 0;
          v168.value._object = 0;
          v128.super.Class isa = v127;
          v171._countAndFlagsBits = 0;
          v171._object = (void *)0xE000000000000000;
          uint64_t v129 = sub_100064020(v165, v168, v128, v171, v138);
          uint64_t v131 = v130;

          sub_100006DC8(&qword_10007F250);
          unint64_t v132 = (*(unsigned __int8 *)(v142 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
          uint64_t v133 = swift_allocObject();
          *(_OWORD *)(v133 + 16) = xmmword_100066020;
          sub_10004FE1C(v70, v133 + v132);
          sub_100064200();
          uint64_t v134 = (int *)type metadata accessor for AlertViewModel(0);
          uint64_t v135 = (uint64_t *)(v108 + v134[5]);
          *uint64_t v135 = v124;
          v135[1] = v126;
          v136 = (uint64_t *)(v108 + v134[6]);
          uint64_t *v136 = v129;
          v136[1] = v131;
          uint64_t v85 = v139;
          *(void *)(v108 + v134[7]) = v133;
          (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v134 - 1) + 56))(v108, 0, 1, v134);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100020E94(v108, (uint64_t)bufc, &qword_10007EA00);
          swift_retain();
          sub_100064490();
          sub_100009CA4(v108, &qword_10007EA00);
          swift_getKeyPath();
          swift_getKeyPath();
          *(unsigned char *)(v139 + 59) = 1;
          swift_retain();
          sub_100064490();
          swift_release();

          goto LABEL_46;
        }
      }
      else
      {
        sub_100009CA4((uint64_t)v36, &qword_10007F258);
      }
      sub_100064360();
      uint64_t v100 = sub_100064370();
      os_log_type_t v101 = sub_100064900();
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v102 = 0;
        _os_log_impl((void *)&_mh_execute_header, v100, v101, "saveShareAndReportErrors userInfo has no CKRecordChangedErrorServerRecordKey, so rethrow oplock", v102, 2u);
        swift_slowDealloc();
      }
      uint64_t v103 = *(void *)(v0 + 288);
      uint64_t v104 = *(void *)(v0 + 256);

      v16(v103, v104);
      sub_10000700C();
      swift_allocError();
      *(void *)uint64_t v105 = log;
      *(void *)(v105 + 8) = v18;
      *(void *)(v105 + 16) = v19;
      *(void *)(v105 + 24) = v20;
      *(void *)(v105 + 32) = v154;
      *(unsigned char *)(v105 + 40) = 4;
      swift_bridgeObjectRetain();
      id v106 = v159;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v93 = (uint64_t)log;
      uint64_t v94 = v18;
      uint64_t v95 = v19;
      uint64_t v96 = v20;
      uint64_t v97 = v154;
      unsigned __int8 v98 = 4;
      goto LABEL_35;
    }
    id v48 = v34;
    char v49 = sub_10002AE0C((id)0x7DB);

    if ((v49 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_33:
      LOBYTE(v6) = v158;
      goto LABEL_34;
    }
    uint64_t v159 = v34;
    os_log_t log = (os_log_t)v7;
    uint64_t v150 = v20;
    uint64_t v157 = v19;
    uint64_t v147 = v18;
    sub_100064360();
    unint64_t v50 = sub_100064370();
    os_log_type_t v51 = sub_100064900();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "saveShareAndReportErrors got rejected login error", v52, 2u);
      swift_slowDealloc();
    }
    uint64_t v53 = *(void *)(v0 + 280);
    uint64_t v54 = *(void *)(v0 + 256);
    uint64_t v55 = v0;
    unint64_t v56 = *(uint8_t **)(v0 + 232);
    uint64_t v57 = *(void *)(v0 + 240);
    unint64_t v58 = *(int **)(v0 + 224);
    uint64_t v141 = *(void *)(v55 + 216);
    uint64_t typea = *(void *)(v55 + 208);
    uint64_t v59 = *(void *)(v55 + 192);
    bufa = v56;

    v16(v53, v54);
    sub_1000645F0();
    LOWORD(v137._object) = 256;
    uint64_t v60 = sub_100064610();
    uint64_t v62 = v61;
    char v64 = v63;
    uint64_t v140 = v65;
    uint64_t v66 = sub_1000645A0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v141, 1, 1, v66);
    uint64_t v67 = swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_100064200();
    uint64_t v68 = v57 + v58[5];
    *(void *)uint64_t v68 = v60;
    *(void *)(v68 + 8) = v62;
    *(unsigned char *)(v68 + 16) = v64 & 1;
    *(void *)(v68 + 24) = v140;
    sub_10004FDB8(v141, v57 + v58[6], &qword_10007E798);
    swift_release();
    os_log_type_t v69 = (uint64_t (**)())(v57 + v58[7]);
    *os_log_type_t v69 = sub_10004FDB0;
    v69[1] = (uint64_t (*)())v67;
    uint64_t v70 = v57;
    unint64_t v71 = (objc_class *)objc_msgSend(self, "mainBundle", 0);
    v137._countAndFlagsBits = 0x800000010006A380;
    v163._countAndFlagsBits = 0x6E67695320746F4ELL;
    v163._object = (void *)0xED00006E49206465;
    v166.value._countAndFlagsBits = 0;
    v166.value._object = 0;
    v72.super.Class isa = v71;
    v169._countAndFlagsBits = 0;
    v169._object = (void *)0xE000000000000000;
    uint64_t v73 = sub_100064020(v163, v166, v72, v169, v137);
    uint64_t v75 = v74;

    unint64_t v76 = sub_10004E5F8();
    uint64_t v77 = sub_10004428C(v76);
    uint64_t v79 = v78;
    swift_bridgeObjectRelease();
    sub_100006DC8(&qword_10007F250);
    unint64_t v80 = (bufa[80] + 32) & ~(unint64_t)bufa[80];
    uint64_t v81 = swift_allocObject();
    *(_OWORD *)(v81 + 16) = xmmword_100066020;
    sub_10004FE1C(v57, v81 + v80);
    sub_100064200();
    uint64_t v82 = (int *)type metadata accessor for AlertViewModel(0);
    uint64_t v83 = (uint64_t *)(v59 + v82[5]);
    *uint64_t v83 = v73;
    v83[1] = v75;
    uint64_t v84 = (uint64_t *)(v59 + v82[6]);
    *uint64_t v84 = v77;
    v84[1] = v79;
    uint64_t v85 = v55;
    *(void *)(v59 + v82[7]) = v81;
    (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v82 - 1) + 56))(v59, 0, 1, v82);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100020E94(v59, typea, &qword_10007EA00);
    swift_retain();
    sub_100064490();
    sub_100009CA4(v59, &qword_10007EA00);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v55 + 58) = 1;
    swift_retain();
    sub_100064490();
    swift_release();
LABEL_46:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10001AAF4((uint64_t)log, v147, v157, v150, v154, 4u);
    sub_10004FEE0(v70);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v99 = *(uint64_t (**)(void))(v85 + 8);
    goto LABEL_37;
  }
  swift_release();
  swift_release();
LABEL_36:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v99 = *(uint64_t (**)(void))(v0 + 8);
LABEL_37:
  return v99();
}

uint64_t sub_100049930()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 360);
  uint64_t v4 = *(void *)(v2 + 352);
  if (v0) {
    uint64_t v5 = sub_100049BD8;
  }
  else {
    uint64_t v5 = sub_100049A6C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100049A6C()
{
  uint64_t v1 = v0[53];
  uint64_t v2 = v0[54];
  uint64_t v4 = v0[51];
  uint64_t v3 = (void *)v0[52];
  uint64_t v5 = v0[50];
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001AAF4(v5, v4, v3, v1, v2, 4u);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100049BD8()
{
  swift_release();
  sub_100064360();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "saveShareAndReportErrors retry failed, so rethrow batchRequestFailed", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v1;
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[55];
  uint64_t v6 = v0[54];
  uint64_t v8 = v0[51];
  uint64_t v7 = (void *)v0[52];
  uint64_t v13 = v0[50];
  uint64_t v14 = v0[53];
  uint64_t v9 = v0[34];
  uint64_t v10 = v0[32];

  v5(v9, v10);
  swift_willThrow();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10001AAF4(v13, v8, v7, v14, v6, 4u);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100049DEC()
{
  v0[2] = sub_100064870();
  v0[3] = sub_100064860();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_100049E98;
  return sub_1000316F4();
}

uint64_t sub_100049E98()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_100064830();
  if (v0) {
    uint64_t v4 = sub_10004A058;
  }
  else {
    uint64_t v4 = sub_100049FF4;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100049FF4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004A058()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004A0BC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_100064490();
  }
  return result;
}

uint64_t sub_10004A13C()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064490();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100046A60(6u, 0);
    return swift_release();
  }
  return result;
}

uint64_t sub_10004A1FC()
{
  uint64_t v1 = (uint64_t *)(*(void *)(v0
                             + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderURL)
                 + *(void *)(**(void **)(v0
                                           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderURL)
                             + 104));
  uint64_t v2 = *v1;
  uint64_t *v1 = (uint64_t)sub_10004D43C;
  v1[1] = v0;
  swift_retain();
  sub_100009C2C(v2);
  uint64_t v3 = (uint64_t *)(*(void *)(v0
                             + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderTitle)
                 + *(void *)(**(void **)(v0
                                           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__rootFolderTitle)
                             + 104));
  uint64_t v4 = *v3;
  *uint64_t v3 = (uint64_t)sub_10004D440;
  v3[1] = v0;
  swift_retain();
  sub_100009C2C(v4);
  uint64_t v5 = (uint64_t *)(*(void *)(v0
                             + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__ckFolderSubitemName)
                 + *(void *)(**(void **)(v0
                                           + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel__ckFolderSubitemName)
                             + 104));
  uint64_t v6 = *v5;
  *uint64_t v5 = (uint64_t)sub_10004D440;
  v5[1] = v0;
  swift_retain();

  return sub_100009C2C(v6);
}

uint64_t sub_10004A31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[10] = a4;
  uint64_t v5 = sub_100064380();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  sub_100006DC8(&qword_10007E520);
  v4[14] = swift_task_alloc();
  sub_100064870();
  v4[15] = sub_100064860();
  uint64_t v7 = sub_100064830();
  v4[16] = v7;
  v4[17] = v6;
  return _swift_task_switch(sub_10004A440, v7, v6);
}

uint64_t sub_10004A440()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  void *v1 = v0;
  v1[1] = sub_10004A52C;
  uint64_t v2 = *(void *)(v0 + 112);
  return sub_100032498(v2);
}

uint64_t sub_10004A52C()
{
  uint64_t v2 = *v1;
  (*v1)[19] = v0;
  swift_task_dealloc();
  sub_100009CA4(v2[14], &qword_10007E520);
  uint64_t v3 = v2[17];
  uint64_t v4 = v2[16];
  if (v0) {
    uint64_t v5 = sub_10004AAAC;
  }
  else {
    uint64_t v5 = sub_10004A688;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10004A688()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release();
  if (!*(void *)(v1 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12SharingModel_lastServicesData)) {
    goto LABEL_9;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(v0 + 72);
  if (!v2)
  {
    sub_10000700C();
    uint64_t v13 = swift_allocError();
    *(void *)uint64_t v14 = 0xD000000000000024;
    *(void *)(v14 + 8) = 0x800000010006A040;
    *(_OWORD *)(v14 + 16) = xmmword_100067390;
    *(void *)(v14 + 32) = 0x800000010006A070;
    *(unsigned char *)(v14 + 40) = 11;
    swift_willThrow();
    swift_unknownObjectRelease();
    *(void *)(v0 + 64) = v13;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_errorRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_11;
    }
    uint64_t result = swift_errorRelease();
    uint64_t v16 = *(void *)(v0 + 16);
    uint64_t v15 = *(void *)(v0 + 24);
    uint64_t v18 = *(void **)(v0 + 32);
    uint64_t v17 = *(void *)(v0 + 40);
    uint64_t v19 = *(void *)(v0 + 48);
    int v20 = *(unsigned __int8 *)(v0 + 56);
    if (v20 == 7)
    {
      if (!v18)
      {
LABEL_22:
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      id v21 = v18;
      swift_bridgeObjectRetain();
      sub_100046A60(1u, v18);
      sub_10001AAF4(v16, v15, v18, v17, v19, 7u);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000646E0();
      uint64_t v25 = v17;
      id v22 = objc_allocWithZone((Class)NSError);
      NSString v23 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v24 = [v22 initWithDomain:v23 code:46 userInfo:0];

      sub_100046A60(2u, v24);
      sub_10001AAF4(v16, v15, v18, v25, v19, v20);
    }
    swift_errorRelease();
    goto LABEL_10;
  }
  id v3 = [*(id *)(v0 + 72) _copyWithoutPersonalInfo];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectRelease();
  if (!Strong)
  {
    sub_100064360();
    uint64_t v5 = sub_100064370();
    os_log_type_t v6 = sub_100064930();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "ext computed property--extensionController is nil--will assert", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
    goto LABEL_22;
  }

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_9:
  sub_100046A60(5u, 0);
LABEL_10:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
LABEL_11:
  return v12();
}

uint64_t sub_10004AAAC()
{
  swift_release();
  *(void *)(v0 + 64) = *(void *)(v0 + 152);
  swift_errorRetain();
  sub_100006DC8(&qword_10007DF80);
  if (swift_dynamicCast())
  {
    uint64_t result = swift_errorRelease();
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v5 = *(void **)(v0 + 32);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 48);
    int v7 = *(unsigned __int8 *)(v0 + 56);
    if (v7 == 7)
    {
      if (!v5)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      id v8 = v5;
      swift_bridgeObjectRetain();
      sub_100046A60(1u, v5);
      sub_10001AAF4(v3, v2, v5, v4, v6, 7u);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000646E0();
      uint64_t v13 = v4;
      id v9 = objc_allocWithZone((Class)NSError);
      NSString v10 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithDomain:v10 code:46 userInfo:0];

      sub_100046A60(2u, v11);
      sub_10001AAF4(v3, v2, v5, v13, v6, v7);
    }
  }
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t shareStatus(url:)()
{
  uint64_t v0 = sub_1000641E0();
  v21[4] = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v1 = sub_100064380();
  v21[2] = *(void *)(v1 - 8);
  v21[3] = v1;
  __chkstk_darwin(v1);
  uint64_t v2 = sub_100064090();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006DC8(&qword_10007E530);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100066DD0;
  *(void *)(inited + 32) = NSURLUbiquitousItemIsSharedKey;
  *(void *)(inited + 40) = NSURLUbiquitousSharedItemCurrentUserRoleKey;
  int v7 = NSURLUbiquitousItemIsSharedKey;
  id v8 = NSURLUbiquitousSharedItemCurrentUserRoleKey;
  id v9 = sub_10004C990(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  URL.evictionSafeResourceValues(forKeys:)((uint64_t)v9, (uint64_t)v5);
  uint64_t v10 = v2;
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_100064060();
  uint64_t v12 = (NSString *)sub_100064070();
  if (!v12) {
    uint64_t v12 = NSURLUbiquitousSharedItemRoleParticipant;
  }
  uint64_t v13 = v12;
  uint64_t v14 = v3;
  uint64_t v15 = sub_1000646E0();
  uint64_t v17 = v16;
  int v19 = 256;
  if (v15 != sub_1000646E0() || v17 != v18)
  {
    if (sub_100064C10()) {
      int v19 = 256;
    }
    else {
      int v19 = 0;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v10);

  return v19 | (v11 & 1);
}

uint64_t sub_10004B23C()
{
  uint64_t v0 = sub_100064380();
  __chkstk_darwin(v0);
  uint64_t v1 = sub_100064090();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006DC8(&qword_10007E530);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100066020;
  *(void *)(inited + 32) = NSURLLocalizedNameKey;
  uint64_t v6 = NSURLLocalizedNameKey;
  int v7 = sub_10004C990(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  URL.evictionSafeResourceValues(forKeys:)((uint64_t)v7, (uint64_t)v4);
  swift_bridgeObjectRelease();
  uint64_t result = sub_100064040();
  if (v9)
  {
    uint64_t v10 = result;
    unint64_t v11 = v9;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v10 == sub_100064170() && v11 == v12)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_100064C10();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        return v10;
      }
    }
    v35._countAndFlagsBits = sub_100064160();
    uint64_t v31 = 46;
    unint64_t v32 = 0xE100000000000000;
    sub_100064760(v35);
    swift_bridgeObjectRelease();
    uint64_t v16 = v31;
    unint64_t v15 = v32;
    uint64_t v17 = HIBYTE(v32) & 0xF;
    if ((v32 & 0x2000000000000000) == 0) {
      uint64_t v17 = v31 & 0xFFFFFFFFFFFFLL;
    }
    if (!v17) {
      goto LABEL_14;
    }
    uint64_t v18 = sub_100064730();
    if (sub_100064730() >= v18) {
      goto LABEL_14;
    }
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_100064730();
    unint64_t v20 = sub_10004FAA8(v19, v10, v11);
    unint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    swift_bridgeObjectRelease();
    uint64_t v31 = v20;
    unint64_t v32 = v22;
    uint64_t v33 = v24;
    uint64_t v34 = v26;
    v30[2] = v16;
    v30[3] = v15;
    sub_10004FB64();
    sub_10004FBB8();
    uint64_t v27 = sub_100064AB0();
    swift_bridgeObjectRelease();
    if (v27)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      return v10;
    }
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_100064730();
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_100064730();
    swift_bridgeObjectRelease();
    uint64_t result = v28 - v29;
    if (!__OFSUB__(v28, v29))
    {
      sub_10004FC0C(result);
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100064710();
      goto LABEL_14;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10004B790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100006DC8(&qword_10007F108);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  uint64_t v13 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v13 - 8);
  unint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000648A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  sub_100020E94(a5, (uint64_t)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10007F108);
  unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a3;
  v18[5] = a4;
  sub_10004FDB8((uint64_t)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v18 + v17, &qword_10007F108);
  unint64_t v19 = (void *)((char *)v18 + ((v12 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *unint64_t v19 = a1;
  v19[1] = a2;
  swift_retain();
  swift_retain();
  sub_10000F1B0((uint64_t)v15, (uint64_t)&unk_10007F118, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_10004B978(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[3] = a7;
  v8[4] = a8;
  uint64_t v12 = (int *)((char *)a4 + *a4);
  uint64_t v10 = (void *)swift_task_alloc();
  v8[5] = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_10004BA68;
  return ((uint64_t (*)(void *, uint64_t))v12)(v8 + 2, a6);
}

uint64_t sub_10004BA68()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10004BB64, 0, 0);
}

uint64_t sub_10004BB64()
{
  int v7 = v0;
  uint64_t v1 = (void (*)(id *))v0[3];
  id v5 = (id)v0[2];
  char v6 = 0;
  id v2 = v5;
  v1(&v5);

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10004BBF0()
{
  return sub_10004BD3C();
}

uint64_t sub_10004BC04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10004BDB4(a1, a2, a3, a4, &qword_10007E520);
}

uint64_t sub_10004BC20@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004BC34()
{
  return sub_100009540();
}

uint64_t sub_10004BC48@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10004BCC8()
{
  return sub_100064490();
}

uint64_t sub_10004BD3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();

  return swift_release();
}

uint64_t sub_10004BDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = sub_100006DC8(a5);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v14 - v11;
  sub_100020E94(a1, (uint64_t)&v14 - v11, a5);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100020E94((uint64_t)v12, (uint64_t)v10, a5);
  swift_retain();
  sub_100064490();
  return sub_100009CA4((uint64_t)v12, a5);
}

uint64_t sub_10004BEC8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004BEDC()
{
  return sub_100009540();
}

uint64_t sub_10004BEF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10004BFC4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10004FF44((uint64_t)v12, *a3);
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
      sub_10004FF44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10004FFD8((uint64_t)v12);
  return v7;
}

uint64_t sub_10004BFC4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100064AA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10004C180(a5, a6);
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
  uint64_t v8 = sub_100064B30();
  if (!v8)
  {
    sub_100064B80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100064BC0();
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

uint64_t sub_10004C180(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10004C218(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10004C3F8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10004C3F8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10004C218(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10004C390(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100064B10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100064B80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100064770();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100064BC0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100064B80();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10004C390(uint64_t a1, uint64_t a2)
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
  sub_100006DC8(&qword_10007F298);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10004C3F8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006DC8(&qword_10007F298);
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
  uint64_t result = sub_100064BC0();
  __break(1u);
  return result;
}

unint64_t sub_10004C548(uint64_t a1, uint64_t a2)
{
  sub_100064C90();
  sub_100064720();
  Swift::Int v4 = sub_100064CB0();

  return sub_10004C648(a1, a2, v4);
}

unint64_t sub_10004C5C0(char a1)
{
  sub_100064C90();
  sub_100021C20(a1);
  sub_100064720();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100064CB0();

  return sub_10004C72C(a1, v2);
}

unint64_t sub_10004C648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100064C10() & 1) == 0)
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
      while (!v14 && (sub_100064C10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10004C72C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    uint64_t v7 = *(void *)&aFolder_2[v6 * 8];
    uint64_t v8 = qword_100067E18[v6];
    while (*(void *)&aFolder_2[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || qword_100067E18[*(char *)(*(void *)(v2 + 48) + v4)] != v8)
    {
      char v10 = sub_100064C10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_10004C840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_100006DC8(&qword_10007F108);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  sub_100020E94(a1, (uint64_t)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10007F108);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  sub_10004FDB8((uint64_t)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, &qword_10007F108);
  sub_100006DC8(&qword_10007F010);
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_100064440();
  *a4 = result;
  return result;
}

void *sub_10004C990(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100006DC8((uint64_t *)&unk_10007F2A0);
    uint64_t v3 = sub_100064AF0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_1000646E0();
      sub_100064C90();
      id v7 = v6;
      sub_100064720();
      Swift::Int v8 = sub_100064CB0();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_1000646E0();
        uint64_t v17 = v16;
        if (v15 == sub_1000646E0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_100064C10();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_1000646E0();
          uint64_t v24 = v23;
          if (v22 == sub_1000646E0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_100064C10();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_10004CBC0()
{
  return type metadata accessor for SharingModel();
}

uint64_t type metadata accessor for SharingModel()
{
  uint64_t result = qword_10007E9A0;
  if (!qword_10007E9A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10004CC14()
{
  sub_10000E508(319, &qword_10007E9B0);
  if (v0 <= 0x3F)
  {
    sub_10000E508(319, &qword_10007E9B8);
    if (v1 <= 0x3F)
    {
      sub_10000E508(319, &qword_10007E9C0);
      if (v2 <= 0x3F)
      {
        sub_10000E508(319, &qword_10007E9C8);
        if (v3 <= 0x3F)
        {
          sub_10000E550(319, &qword_10007E9D0, &qword_10007E9D8);
          if (v4 <= 0x3F)
          {
            sub_10000E508(319, &qword_10007E9E0);
            if (v5 <= 0x3F)
            {
              sub_10000E508(319, &qword_10007E9E8);
              if (v6 <= 0x3F)
              {
                sub_10000E508(319, &qword_10007E9F0);
                if (v7 <= 0x3F)
                {
                  sub_10000E550(319, &qword_10007E9F8, &qword_10007EA00);
                  if (v8 <= 0x3F)
                  {
                    sub_10000E550(319, &qword_10007EA08, &qword_10007EA10);
                    if (v9 <= 0x3F)
                    {
                      sub_10000E508(319, &qword_10007EA18);
                      if (v10 <= 0x3F)
                      {
                        sub_10000E508(319, &qword_10007EA20);
                        if (v11 <= 0x3F)
                        {
                          sub_10000E550(319, &qword_10007EA28, (uint64_t *)&unk_10007EA30);
                          if (v12 <= 0x3F)
                          {
                            sub_10000E550(319, &qword_10007E1E0, &qword_10007E520);
                            if (v13 <= 0x3F)
                            {
                              sub_10000E550(319, (unint64_t *)&qword_10007DE60, &qword_10007EA40);
                              if (v14 <= 0x3F)
                              {
                                sub_10004D2F0(319, &qword_10007EA48, &qword_10007EA50);
                                if (v15 <= 0x3F)
                                {
                                  sub_10000E550(319, &qword_10007EA58, &qword_10007EA60);
                                  if (v16 <= 0x3F)
                                  {
                                    sub_10000E508(319, &qword_10007EA68);
                                    if (v17 <= 0x3F)
                                    {
                                      sub_10004D2F0(319, (unint64_t *)&unk_10007EA70, &qword_10007E378);
                                      if (v18 <= 0x3F)
                                      {
                                        sub_10000E550(319, &qword_10007EA80, (uint64_t *)&unk_10007EA88);
                                        if (v19 <= 0x3F) {
                                          swift_updateClassMetadata2();
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_10004D2F0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_10000EF58(255, a3);
    unint64_t v4 = sub_1000644A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10004D350@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004D378()
{
  return sub_100009540();
}

uint64_t sub_10004D3A0()
{
  return sub_10004BD3C();
}

uint64_t sub_10004D3D4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004D3FC()
{
  return sub_100009540();
}

uint64_t sub_10004D454@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1000645B0();
  *a1 = v3;
  return result;
}

uint64_t sub_10004D480()
{
  return sub_1000645C0();
}

uint64_t sub_10004D4A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10004D4F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  return sub_10003BF78(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10004D4F8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004D530@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, void, void, void, void))(v2 + 16);
  unint64_t v6 = (int *)sub_100006DC8(&qword_10007F1F8);
  uint64_t result = v5(a1, *(void *)(a1 + v6[12]), *(void *)(a1 + v6[12] + 8), *(void *)(a1 + v6[16]), *(void *)(a1 + v6[16] + 8), *(unsigned __int8 *)(a1 + v6[20]));
  *a2 = result;
  return result;
}

unint64_t sub_10004D59C()
{
  unint64_t result = qword_10007EEF8;
  if (!qword_10007EEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EEF8);
  }
  return result;
}

uint64_t sub_10004D5F0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000EF58(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *sub_10004D634(unsigned char *result)
{
  return sub_10003CE58(result);
}

uint64_t sub_10004D63C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

_UNKNOWN **sub_10004D674(char a1, void *a2)
{
  return sub_10003CED8(a1, a2);
}

uint64_t sub_10004D67C@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *((void *)a1 + 1));
  *a2 = result;
  return result;
}

unint64_t sub_10004D6B4()
{
  unint64_t result = qword_10007EF50;
  if (!qword_10007EF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EF50);
  }
  return result;
}

unint64_t sub_10004D708()
{
  unint64_t result = qword_10007EF68;
  if (!qword_10007EF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EF68);
  }
  return result;
}

unint64_t sub_10004D75C()
{
  unint64_t result = qword_10007EF80;
  if (!qword_10007EF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EF80);
  }
  return result;
}

unint64_t sub_10004D7B0()
{
  unint64_t result = qword_10007EF90;
  if (!qword_10007EF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EF90);
  }
  return result;
}

uint64_t sub_10004D804()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004D844(int a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10003D30C(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10004D84C(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(v1 + 16))(*a1, a1[1], *((void *)a1 + 1), a1[16], a1[17], *((void *)a1 + 3));
}

void sub_10004D88C(void **a1)
{
}

uint64_t sub_10004D894(unsigned __int8 *a1)
{
  return sub_10003DC94(a1);
}

uint64_t sub_10004D89C(unsigned char *a1)
{
  return sub_10003DE98(a1);
}

uint64_t sub_10004D8A4(unsigned __int8 a1)
{
  return sub_10003FCB4(a1);
}

uint64_t sub_10004D8AC(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_10004D8D8(unsigned __int8 a1)
{
  return sub_100041900(a1);
}

uint64_t sub_10004D8E0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_10004D90C(unsigned __int8 a1)
{
  return sub_100041C28(a1);
}

uint64_t sub_10004D914(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_10004D940()
{
  unint64_t result = qword_10007EFD8;
  if (!qword_10007EFD8)
  {
    sub_100006174(&qword_10007EA60);
    sub_10004D5F0(&qword_10007EFE0, &qword_10007EA50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EFD8);
  }
  return result;
}

uint64_t sub_10004D9E0()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10004DA18(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *((void *)v4 + 2);
  double v11 = v4[3];
  double v12 = v4[4];
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v13;
  *unint64_t v13 = v5;
  v13[1] = sub_10004DAF8;
  return sub_100041D90(a1, a2, a3, a4, v10, v11, v12);
}

uint64_t sub_10004DAF8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10004DBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unint64_t v7 = v3;
  v7[1] = sub_10000F0B8;
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10007F000 + dword_10007F000);
  return v8(a1, a2, v6);
}

uint64_t sub_10004DCBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10004C840(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_10004DCC4()
{
  unint64_t result = qword_10007F050;
  if (!qword_10007F050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F050);
  }
  return result;
}

uint64_t sub_10004DD18(char *a1)
{
  return sub_100042B98(a1);
}

unint64_t sub_10004DD20(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100064BA0();
    unint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100006DC8(&qword_10007F0D0);
      unint64_t result = sub_100064AF0();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100064BA0();
      unint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  unint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    unint64_t result = sub_100064B20();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    sub_100064420();
    sub_10004D4A8(&qword_10007F0D8, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    unint64_t result = sub_100064670();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_10004D4A8((unint64_t *)&unk_10007F0E0, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        unint64_t result = sub_100064690();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      unint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  unint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10004DFD4()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004DFDC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_10000F1AC;
  return sub_100042EC0(a1, v4, v5, v6);
}

uint64_t sub_10004E090()
{
  return sub_10004BD3C();
}

uint64_t sub_10004E0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10004BDB4(a1, a2, a3, a4, &qword_10007E520);
}

uint64_t sub_10004E0E8()
{
  uint64_t v1 = sub_100006DC8(&qword_10007F108);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_1000641E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10004E238(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006DC8(&qword_10007F108) - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10004B790(a1, a2, v6, v7, v8);
}

uint64_t sub_10004E2C0()
{
  uint64_t v1 = sub_100006DC8(&qword_10007F108);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_1000641E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
  }

  swift_release();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_10004E430()
{
  uint64_t v2 = *(void *)(sub_100006DC8(&qword_10007F108) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(int **)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_10000F1AC;
  *(_OWORD *)(v7 + 24) = v8;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v7 + 40) = v9;
  *uint64_t v9 = v7;
  v9[1] = sub_10004BA68;
  return v11(v7 + 16, v6);
}

uint64_t sub_10004E5E0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10004E5EC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10004E5F8()
{
  sub_100006DC8(&qword_10007F268);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000673F0;
  *(unsigned char *)(inited + 32) = 7;
  uint64_t v1 = self;
  uint64_t v2 = (objc_class *)[v1 mainBundle];
  v68._countAndFlagsBits = 0x800000010006A4D0;
  v81._object = (void *)0x800000010006A470;
  v81._countAndFlagsBits = 0xD00000000000005DLL;
  v94.value._countAndFlagsBits = 0;
  v94.value._object = 0;
  v3.super.Class isa = v2;
  v107._countAndFlagsBits = 0;
  v107._object = (void *)0xE000000000000000;
  uint64_t v4 = sub_100064020(v81, v94, v3, v107, v68);
  uint64_t v6 = v5;

  *(void *)(inited + 40) = v4;
  *(void *)(inited + 48) = v6;
  *(unsigned char *)(inited + 56) = 8;
  uint64_t v7 = (objc_class *)[v1 mainBundle];
  v69._countAndFlagsBits = 0x800000010006A560;
  v82._countAndFlagsBits = 0xD00000000000005FLL;
  v82._object = (void *)0x800000010006A500;
  v95.value._countAndFlagsBits = 0;
  v95.value._object = 0;
  v8.super.Class isa = v7;
  v108._countAndFlagsBits = 0;
  v108._object = (void *)0xE000000000000000;
  uint64_t v9 = sub_100064020(v82, v95, v8, v108, v69);
  uint64_t v11 = v10;

  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = v11;
  *(unsigned char *)(inited + 80) = 9;
  uint64_t v12 = (objc_class *)[v1 mainBundle];
  v70._countAndFlagsBits = 0x800000010006A600;
  v83._object = (void *)0x800000010006A5A0;
  v83._countAndFlagsBits = 0xD00000000000005DLL;
  v96.value._countAndFlagsBits = 0;
  v96.value._object = 0;
  v13.super.Class isa = v12;
  v109._countAndFlagsBits = 0;
  v109._object = (void *)0xE000000000000000;
  uint64_t v14 = sub_100064020(v83, v96, v13, v109, v70);
  uint64_t v16 = v15;

  *(void *)(inited + 88) = v14;
  *(void *)(inited + 96) = v16;
  *(unsigned char *)(inited + 104) = 10;
  uint64_t v17 = (objc_class *)[v1 mainBundle];
  v84._countAndFlagsBits = 0xD000000000000062;
  v71._countAndFlagsBits = 0x800000010006A6A0;
  v84._object = (void *)0x800000010006A630;
  v97.value._countAndFlagsBits = 0;
  v97.value._object = 0;
  v18.super.Class isa = v17;
  v110._countAndFlagsBits = 0;
  v110._object = (void *)0xE000000000000000;
  uint64_t v19 = sub_100064020(v84, v97, v18, v110, v71);
  uint64_t v21 = v20;

  *(void *)(inited + 112) = v19;
  *(void *)(inited + 120) = v21;
  *(unsigned char *)(inited + 128) = 11;
  uint64_t v22 = (objc_class *)[v1 mainBundle];
  v72._countAndFlagsBits = 0x800000010006A740;
  v85._object = (void *)0x800000010006A6E0;
  v85._countAndFlagsBits = 0xD00000000000005ELL;
  v98.value._countAndFlagsBits = 0;
  v98.value._object = 0;
  v23.super.Class isa = v22;
  v111._countAndFlagsBits = 0;
  v111._object = (void *)0xE000000000000000;
  uint64_t v24 = sub_100064020(v85, v98, v23, v111, v72);
  uint64_t v26 = v25;

  *(void *)(inited + 136) = v24;
  *(void *)(inited + 144) = v26;
  *(unsigned char *)(inited + 152) = 0;
  char v27 = (objc_class *)[v1 mainBundle];
  v73._countAndFlagsBits = 0x800000010006A770;
  v86._countAndFlagsBits = 0xD00000000000005FLL;
  v86._object = (void *)0x800000010006A500;
  v99.value._countAndFlagsBits = 0;
  v99.value._object = 0;
  v28.super.Class isa = v27;
  v112._countAndFlagsBits = 0;
  v112._object = (void *)0xE000000000000000;
  uint64_t v29 = sub_100064020(v86, v99, v28, v112, v73);
  uint64_t v31 = v30;

  *(void *)(inited + 160) = v29;
  *(void *)(inited + 168) = v31;
  *(unsigned char *)(inited + 176) = 1;
  uint64_t v32 = (objc_class *)[v1 mainBundle];
  v87._countAndFlagsBits = 0xD000000000000061;
  v74._countAndFlagsBits = 0x800000010006A810;
  v87._object = (void *)0x800000010006A7A0;
  v100.value._countAndFlagsBits = 0;
  v100.value._object = 0;
  v33.super.Class isa = v32;
  v113._countAndFlagsBits = 0;
  v113._object = (void *)0xE000000000000000;
  uint64_t v34 = sub_100064020(v87, v100, v33, v113, v74);
  uint64_t v36 = v35;

  *(void *)(inited + 184) = v34;
  *(void *)(inited + 192) = v36;
  *(unsigned char *)(inited + 200) = 2;
  unint64_t v37 = (objc_class *)[v1 mainBundle];
  v88._countAndFlagsBits = 0xD000000000000064;
  v75._countAndFlagsBits = 0x800000010006A8B0;
  v88._object = (void *)0x800000010006A840;
  v101.value._countAndFlagsBits = 0;
  v101.value._object = 0;
  v38.super.Class isa = v37;
  v114._countAndFlagsBits = 0;
  v114._object = (void *)0xE000000000000000;
  uint64_t v39 = sub_100064020(v88, v101, v38, v114, v75);
  uint64_t v41 = v40;

  *(void *)(inited + 208) = v39;
  *(void *)(inited + 216) = v41;
  *(unsigned char *)(inited + 224) = 3;
  id v42 = (objc_class *)[v1 mainBundle];
  v89._countAndFlagsBits = 0xD000000000000065;
  v76._countAndFlagsBits = 0x800000010006A960;
  v89._object = (void *)0x800000010006A8F0;
  v102.value._countAndFlagsBits = 0;
  v102.value._object = 0;
  v43.super.Class isa = v42;
  v115._countAndFlagsBits = 0;
  v115._object = (void *)0xE000000000000000;
  uint64_t v44 = sub_100064020(v89, v102, v43, v115, v76);
  uint64_t v46 = v45;

  *(void *)(inited + 232) = v44;
  *(void *)(inited + 240) = v46;
  *(unsigned char *)(inited + 248) = 4;
  char v47 = (objc_class *)[v1 mainBundle];
  v77._countAndFlagsBits = 0x800000010006AA00;
  v90._object = (void *)0x800000010006A9A0;
  v90._countAndFlagsBits = 0xD00000000000005ELL;
  v103.value._countAndFlagsBits = 0;
  v103.value._object = 0;
  v48.super.Class isa = v47;
  v116._countAndFlagsBits = 0;
  v116._object = (void *)0xE000000000000000;
  uint64_t v49 = sub_100064020(v90, v103, v48, v116, v77);
  uint64_t v51 = v50;

  *(void *)(inited + 256) = v49;
  *(void *)(inited + 264) = v51;
  *(unsigned char *)(inited + 272) = 5;
  uint64_t v52 = (objc_class *)[v1 mainBundle];
  v78._countAndFlagsBits = 0x800000010006AA90;
  v91._object = (void *)0x800000010006AA30;
  v91._countAndFlagsBits = 0xD00000000000005ELL;
  v104.value._countAndFlagsBits = 0;
  v104.value._object = 0;
  v53.super.Class isa = v52;
  v117._countAndFlagsBits = 0;
  v117._object = (void *)0xE000000000000000;
  uint64_t v54 = sub_100064020(v91, v104, v53, v117, v78);
  uint64_t v56 = v55;

  *(void *)(inited + 280) = v54;
  *(void *)(inited + 288) = v56;
  *(unsigned char *)(inited + 296) = 6;
  uint64_t v57 = (objc_class *)[v1 mainBundle];
  v92._countAndFlagsBits = 0xD00000000000005CLL;
  v79._countAndFlagsBits = 0x800000010006AB20;
  v92._object = (void *)0x800000010006AAC0;
  v105.value._countAndFlagsBits = 0;
  v105.value._object = 0;
  v58.super.Class isa = v57;
  v118._countAndFlagsBits = 0;
  v118._object = (void *)0xE000000000000000;
  uint64_t v59 = sub_100064020(v92, v105, v58, v118, v79);
  uint64_t v61 = v60;

  *(void *)(inited + 304) = v59;
  *(void *)(inited + 312) = v61;
  *(unsigned char *)(inited + 320) = 13;
  uint64_t v62 = (objc_class *)[v1 mainBundle];
  v80._countAndFlagsBits = 0x800000010006ABB0;
  v93._object = (void *)0x800000010006AB50;
  v93._countAndFlagsBits = 0xD00000000000005DLL;
  v106.value._countAndFlagsBits = 0;
  v106.value._object = 0;
  v63.super.Class isa = v62;
  v119._countAndFlagsBits = 0;
  v119._object = (void *)0xE000000000000000;
  uint64_t v64 = sub_100064020(v93, v106, v63, v119, v80);
  uint64_t v66 = v65;

  *(void *)(inited + 328) = v64;
  *(void *)(inited + 336) = v66;
  return sub_10002F13C(inited);
}

uint64_t sub_10004ECB0(uint64_t a1, double a2, double a3, double a4)
{
  *(double *)(v4 + 160) = a3;
  *(double *)(v4 + 168) = a4;
  *(double *)(v4 + 152) = a2;
  *(void *)(v4 + 144) = a1;
  uint64_t v5 = sub_100064380();
  *(void *)(v4 + 176) = v5;
  *(void *)(v4 + 184) = *(void *)(v5 - 8);
  *(void *)(v4 + 192) = swift_task_alloc();
  sub_100064870();
  *(void *)(v4 + 200) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v4 + 208) = v7;
  *(void *)(v4 + 216) = v6;
  return _swift_task_switch(sub_10004EDAC, v7, v6);
}

uint64_t sub_10004EDAC()
{
  double v2 = *(double *)(v0 + 160);
  double v1 = *(double *)(v0 + 168);
  double v3 = *(double *)(v0 + 152);
  *(unsigned char *)(v0 + 248) = sub_1000641C0();
  id v4 = objc_allocWithZone((Class)QLThumbnailGenerationRequest);
  sub_100064180(v5);
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v4, "initWithFileAtURL:size:scale:representationTypes:", v6, -1, v3, v2, v1);
  *(void *)(v0 + 224) = v8;

  id v9 = [self sharedGenerator];
  *(void *)(v0 + 232) = v9;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_10004EF4C;
  uint64_t v10 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_1000438C4;
  *(void *)(v0 + 104) = &unk_10007AA58;
  *(void *)(v0 + 112) = v10;
  [v9 generateBestRepresentationForRequest:v8 completionHandler:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10004EF4C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 240) = v2;
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 208);
  if (v2) {
    uint64_t v5 = sub_10004F13C;
  }
  else {
    uint64_t v5 = sub_10004F07C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10004F07C()
{
  uint64_t v2 = *(void **)(v0 + 224);
  uint64_t v1 = *(void **)(v0 + 232);
  int v3 = *(unsigned __int8 *)(v0 + 248);
  swift_release();
  uint64_t v4 = *(void **)(v0 + 120);
  id v5 = [v4 UIImage];

  if (v3 == 1) {
    sub_1000641A0();
  }
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(id))(v0 + 8);
  return v6(v5);
}

uint64_t sub_10004F13C()
{
  uint64_t v20 = v0;
  swift_release();
  swift_willThrow();
  sub_100064360();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064910();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 240);
    uint64_t v15 = *(void **)(v0 + 232);
    uint64_t v16 = *(void **)(v0 + 224);
    uint64_t v4 = *(void *)(v0 + 184);
    uint64_t v17 = *(void *)(v0 + 176);
    uint64_t v18 = *(void *)(v0 + 192);
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)id v5 = 136315138;
    uint64_t v19 = v6;
    *(void *)(v0 + 128) = v3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007DF80);
    uint64_t v7 = sub_1000646F0();
    *(void *)(v0 + 136) = sub_10004BEF0(v7, v8, &v19);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "generateBestRepresentation throws error: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v18, v17);
  }
  else
  {
    id v9 = *(void **)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v10 = *(void *)(v0 + 192);
    uint64_t v12 = *(void *)(v0 + 176);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  if (*(unsigned char *)(v0 + 248)) {
    sub_1000641A0();
  }
  swift_task_dealloc();
  NSBundle v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13(0);
}

uint64_t sub_10004F3B8()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004F3C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000F1AC;
  return sub_10004A31C(a1, v4, v5, v6);
}

uint64_t sub_10004F474(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000F0B8;
  return sub_10001C648(a1, v4);
}

uint64_t sub_10004F514@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F53C()
{
  return sub_100009540();
}

uint64_t sub_10004F564()
{
  return sub_10004FCB0(41);
}

uint64_t sub_10004F56C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_10000F1AC;
  return sub_100041ABC(a1, v4, v5, v6, v7);
}

uint64_t sub_10004F630@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F658()
{
  return sub_100009540();
}

uint64_t sub_10004F680@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F6A8()
{
  return sub_100009540();
}

uint64_t sub_10004F6D0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F6F8()
{
  return sub_100009540();
}

uint64_t sub_10004F730()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10004F738()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10004F760@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F788()
{
  return sub_100009540();
}

uint64_t sub_10004F7B0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004F7D8()
{
  return sub_100009540();
}

uint64_t sub_10004F800()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004F808(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_10000F1AC;
  return sub_100040C90(a1, v4, v5, v6);
}

uint64_t sub_10004F8BC()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004F8C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000F1AC;
  return sub_10003FFC4();
}

uint64_t sub_10004F978()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004F980()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000F1AC;
  return sub_10003E060();
}

uint64_t sub_10004FA44@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10004FA6C()
{
  return sub_100009540();
}

uint64_t sub_10004FA94(uint64_t a1)
{
  return sub_1000052B8(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_10004FAA8(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = sub_100064750();
  if (v4) {
    uint64_t result = 15;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_12;
  }

  return sub_1000647C0();
}

unint64_t sub_10004FB64()
{
  unint64_t result = qword_10007F218;
  if (!qword_10007F218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F218);
  }
  return result;
}

unint64_t sub_10004FBB8()
{
  unint64_t result = qword_10007F220;
  if (!qword_10007F220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10007F220);
  }
  return result;
}

uint64_t sub_10004FC0C(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_100064750();
    return sub_1000647C0();
  }
  return result;
}

uint64_t sub_10004FCA8()
{
  return sub_10004FCB0(40);
}

uint64_t sub_10004FCB0(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_10004FCFC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000F1AC;
  return sub_100049DEC();
}

uint64_t sub_10004FDB0()
{
  return sub_10004A13C();
}

uint64_t sub_10004FDB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006DC8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004FE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004FE80()
{
  return sub_10004BD3C();
}

uint64_t sub_10004FEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10004BDB4(a1, a2, a3, a4, &qword_10007EA00);
}

uint64_t sub_10004FEE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004FF3C()
{
  return sub_10004A0BC();
}

uint64_t sub_10004FF44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10004FFA0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10004FFB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10004FFD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for ShareSaveStatus()
{
  return &type metadata for ShareSaveStatus;
}

ValueMetadata *type metadata accessor for FolderShareStage()
{
  return &type metadata for FolderShareStage;
}

uint64_t getEnumTagSinglePayload for SaveStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB)
  {
    unsigned int v2 = a2 + 5;
    if (a2 + 5 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 5;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 5;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10005012CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 5;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v8 = (v7 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v8 - 3;
  if (v8 <= 3) {
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SaveStage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 5;
  if (a3 + 5 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFB) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v7 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x100050214);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_10005023C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

unsigned char *sub_100050258(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SaveStage()
{
  return &type metadata for SaveStage;
}

uint64_t getEnumTagSinglePayload for AddAddressesStage(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AddAddressesStage(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000503DCLL);
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

ValueMetadata *type metadata accessor for AddAddressesStage()
{
  return &type metadata for AddAddressesStage;
}

uint64_t getEnumTagSinglePayload for CreateOrLoadStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CreateOrLoadStage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x100050570);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CreateOrLoadStage()
{
  return &type metadata for CreateOrLoadStage;
}

uint64_t destroy for ShareAddress()
{
  return sub_10004F738();
}

uint64_t _s40com_apple_CloudSharingUI_AddParticipants12ShareAddressOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10004F730();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ShareAddress(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10004F730();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10004F738();
  return a1;
}

__n128 initializeWithTake for ShareAddress(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShareAddress(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10004F738();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareAddress(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareAddress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100050748(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100050750(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareAddress()
{
  return &type metadata for ShareAddress;
}

uint64_t getEnumTagSinglePayload for SharingStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SharingStage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x1000508C8);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingStage()
{
  return &type metadata for SharingStage;
}

uint64_t getEnumTagSinglePayload for SharePermission(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s40com_apple_CloudSharingUI_AddParticipants13ExecutionModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x100050A5CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecutionMode()
{
  return &type metadata for ExecutionMode;
}

unint64_t sub_100050A94()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v0 = 0x10000000000;
  if (!v3) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = 0x1000000000000;
  if (!v3) {
    uint64_t v1 = 0;
  }
  return v3 | ((unint64_t)v3 << 8) | ((unint64_t)v3 << 16) | ((unint64_t)v3 << 24) | ((unint64_t)v3 << 32) | v0 | v1;
}

uint64_t sub_100050E04(unsigned char *a1, unsigned __int8 *a2)
{
  int v2 = *a2;
  switch(*a1)
  {
    case 2:
      if (v2 == 2) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if (v2 != 3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 4:
      if (v2 != 4) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 5:
      if (v2 != 5) {
        goto LABEL_11;
      }
LABEL_9:
      uint64_t result = 1;
      break;
    default:
      if ((v2 - 2) >= 4) {
        uint64_t result = (((*a1 & 1) == 0) ^ v2) & 1;
      }
      else {
LABEL_11:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_100050EB0()
{
  unint64_t result = qword_10007F2B0;
  if (!qword_10007F2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F2B0);
  }
  return result;
}

unint64_t sub_100050F08()
{
  unint64_t result = qword_10007F2B8;
  if (!qword_10007F2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F2B8);
  }
  return result;
}

unint64_t sub_100050F60()
{
  unint64_t result = qword_10007F2C0;
  if (!qword_10007F2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F2C0);
  }
  return result;
}

unint64_t sub_100050FB8()
{
  unint64_t result = qword_10007F2C8;
  if (!qword_10007F2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F2C8);
  }
  return result;
}

unint64_t sub_100051010()
{
  unint64_t result = qword_10007F2D0;
  if (!qword_10007F2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F2D0);
  }
  return result;
}

uint64_t sub_100051074@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100051088()
{
  return sub_100009540();
}

uint64_t sub_10005109C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10005111C()
{
  return sub_100064490();
}

uint64_t sub_100051198@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000511AC()
{
  return sub_100009540();
}

uint64_t sub_1000511C0@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000511D4()
{
  return sub_100009540();
}

uint64_t sub_100051200@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100051228()
{
  return sub_100009540();
}

uint64_t sub_100051250@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100051278()
{
  return sub_100009540();
}

uint64_t sub_1000512A8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_1000512D0()
{
  return sub_100009540();
}

void sub_100051380()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory);
  if (v1)
  {
    int v2 = *(void **)(v0
                  + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel);
    if (v2)
    {
      id v3 = v1;
      id v4 = v2;
      id v5 = [v4 supplementaryText];
      if (!v5) {
        goto LABEL_48;
      }
      unsigned int v6 = v5;
      uint64_t v7 = sub_1000646E0();
      unint64_t v9 = v8;

      if (!v9) {
        goto LABEL_48;
      }
      swift_bridgeObjectRelease();
      uint64_t v10 = HIBYTE(v9) & 0xF;
      if ((v9 & 0x2000000000000000) == 0) {
        uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
      }
      if (v10)
      {
        id v11 = [v4 supplementaryText];
        if (v11)
        {
          uint64_t v12 = v11;
          sub_1000646E0();
        }
      }
      else
      {
LABEL_48:
        if (*(void *)(v0
                       + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle
                       + 8))
        {
          uint64_t v13 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle);
          unint64_t v14 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle
                          + 8);
        }
        else
        {
          uint64_t v13 = 0;
          unint64_t v14 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        sub_100055318(v13, v14);
        swift_bridgeObjectRelease();
      }
      id v15 = [v4 userInfoText];
      if (!v15) {
        goto LABEL_49;
      }
      uint64_t v16 = v15;
      uint64_t v17 = sub_1000646E0();
      unint64_t v19 = v18;

      if (!v19) {
        goto LABEL_49;
      }
      swift_bridgeObjectRelease();
      uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
      if ((v19 & 0x2000000000000000) != 0) {
        uint64_t v20 = HIBYTE(v19) & 0xF;
      }
      if (v20)
      {
        id v21 = [v4 userInfoText];
        if (v21)
        {
          uint64_t v22 = v21;
          sub_1000646E0();
        }
      }
      else
      {
LABEL_49:
        if (*(void *)(v0
                       + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName
                       + 8))
        {
          uint64_t v23 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName);
          unint64_t v24 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName
                          + 8);
        }
        else
        {
          uint64_t v23 = 0;
          unint64_t v24 = 0xE000000000000000;
        }
        if (*(void *)(v0
                       + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail
                       + 8))
        {
          uint64_t v25 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail);
          unint64_t v26 = *(void *)(v0
                          + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail
                          + 8);
        }
        else
        {
          uint64_t v25 = 0;
          unint64_t v26 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1000554C0(v23, v24, v25, v26);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      id v27 = [v4 headerImageData];
      if (v27)
      {
        NSBundle v28 = v27;
        uint64_t v29 = sub_1000641F0();
        unint64_t v40 = v30;
      }
      else
      {
        uint64_t v29 = 0;
        unint64_t v40 = 0xF000000000000000;
      }
      id v31 = [v4 headerTitle];
      if (v31)
      {
        uint64_t v32 = v31;
        sub_1000646E0();
      }
      if (*(unsigned char *)(v0
                    + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading) == 1)
        swift_bridgeObjectRetain();
      id v33 = [v4 primaryButtonText];
      uint64_t v39 = v29;
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = v4;
        uint64_t v36 = v3;
        sub_1000646E0();
      }
      else
      {
        uint64_t v35 = v4;
        uint64_t v36 = v3;
      }
      id v37 = [v35 secondaryButtonText];
      if (v37)
      {
        NSBundle v38 = v37;
        sub_1000646E0();
      }
      sub_100064250();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100055818(v39, v40);
    }
  }
}

id sub_1000517DC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_collaborationOptionsGroups] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory] = 0;
  *(void *)&v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel] = 0;
  unsigned int v6 = &v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_fileURL];
  uint64_t v7 = sub_1000641E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)&v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo] = 0;
  v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading] = 0;
  unint64_t v8 = &v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName];
  *unint64_t v8 = 0;
  v8[1] = 0;
  unint64_t v9 = &v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail];
  *unint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = &v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle];
  *uint64_t v10 = 0;
  v10[1] = 0;
  id v11 = &v3[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_loadingText];
  void *v11 = 0;
  v11[1] = 0;
  if (a2)
  {
    NSString v12 = sub_1000646A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v3;
  v15.super_class = (Class)type metadata accessor for CSAddParticipantsServiceViewController();
  id v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_1000519B0(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_collaborationOptionsGroups] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory] = 0;
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel] = 0;
  id v3 = &v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_fileURL];
  uint64_t v4 = sub_1000641E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo] = 0;
  v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading] = 0;
  id v5 = &v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName];
  *id v5 = 0;
  v5[1] = 0;
  unsigned int v6 = &v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail];
  *unsigned int v6 = 0;
  v6[1] = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle];
  *uint64_t v7 = 0;
  v7[1] = 0;
  unint64_t v8 = &v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_loadingText];
  unint64_t v9 = (objc_class *)type metadata accessor for CSAddParticipantsServiceViewController();
  *unint64_t v8 = 0;
  v8[1] = 0;
  v12.receiver = v1;
  v12.super_class = v9;
  id v10 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);

  return v10;
}

id sub_100051B10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSAddParticipantsServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100051C24()
{
  return type metadata accessor for CSAddParticipantsServiceViewController();
}

uint64_t type metadata accessor for CSAddParticipantsServiceViewController()
{
  uint64_t result = qword_10007F350;
  if (!qword_10007F350) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100051C78()
{
  sub_100027134();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100051DFC(void *a1)
{
  uint64_t v2 = v1;
  id v3 = *(void **)(v1
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share);
  *(void *)(v1
            + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share) = a1;
  id v4 = a1;

  sub_100064A10();
  uint64_t v5 = sub_100064A30();
  swift_bridgeObjectRelease();
  if (v5)
  {
    sub_100006DC8(&qword_10007E538);
    int v6 = swift_dynamicCast();
    uint64_t v7 = v10;
    uint64_t v8 = v11;
    if (!v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = (void *)(v2
                + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle);
  *unint64_t v9 = v7;
  v9[1] = v8;
  swift_bridgeObjectRelease();
  sub_100051380();
}

id sub_100051FA0(void *a1)
{
  uint64_t v2 = v1;
  id v3 = *(void **)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel];
  *(void *)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewModel] = a1;
  id v4 = a1;

  uint64_t v85 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v84 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v7 = [v4 loadingText];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_1000646E0();
  unint64_t v11 = v10;

  if (!v11) {
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    id v13 = [v4 loadingText];
    if (v13)
    {
      unint64_t v14 = v13;
      uint64_t v15 = sub_1000646E0();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    unint64_t v24 = (uint64_t *)&v2[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_loadingText];
    uint64_t *v24 = v15;
    v24[1] = v17;
  }
  else
  {
LABEL_8:
    unint64_t v18 = (objc_class *)[self mainBundle];
    v78._countAndFlagsBits = 0x800000010006B1A0;
    v88._countAndFlagsBits = 0x6E69726170657250;
    v88._object = (void *)0xAC000000A680E267;
    v89.value._countAndFlagsBits = 0;
    v89.value._object = 0;
    v19.super.Class isa = v18;
    v90._countAndFlagsBits = 0;
    v90._object = (void *)0xE000000000000000;
    uint64_t v20 = sub_100064020(v88, v89, v19, v90, v78);
    uint64_t v22 = v21;

    uint64_t v23 = (uint64_t *)&v2[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_loadingText];
    *uint64_t v23 = v20;
    v23[1] = v22;
  }
  swift_bridgeObjectRelease();
  id v25 = [v4 headerImageData];
  if (v25)
  {
    unint64_t v26 = v25;
    sub_1000641F0();
  }
  id v27 = [v4 headerTitle];
  if (v27)
  {
    NSBundle v28 = v27;
    sub_1000646E0();
  }
  id v29 = [v4 supplementaryText];
  if (v29)
  {
    unint64_t v30 = v29;
    sub_1000646E0();
  }
  id v31 = [v4 userInfoText];
  uint64_t v86 = v6;
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = sub_1000646E0();
    uint64_t v81 = v34;
    uint64_t v82 = v33;
  }
  else
  {
    uint64_t v81 = 0;
    uint64_t v82 = 0;
  }
  uint64_t v83 = v5;
  id v35 = [v4 primaryButtonText];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = sub_1000646E0();
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  id v40 = [v4 secondaryButtonText];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = sub_1000646E0();
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
  }
  objc_allocWithZone((Class)sub_100064260());
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v80 = v42;
  uint64_t v79 = v37;
  uint64_t v45 = sub_100064240();
  uint64_t v46 = OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory;
  char v47 = *(void **)&v2[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory];
  *(void *)&v2[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_addressingViewFactory] = v45;

  NSBundle v48 = *(void **)&v2[v46];
  if (!v48) {
    goto LABEL_39;
  }
  id v49 = v48;
  uint64_t v50 = (void *)sub_100064230();

  objc_msgSend(v2, "addChildViewController:", v50, v82, v81, v79, v39, v80, v44, sub_100055A90, v85, sub_100055A98, v84, sub_100055AA8, v86, sub_100055AA0, v83);
  id result = [v50 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v52 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  id result = [v2 view];
  if (!result)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  NSBundle v53 = result;
  id result = [v50 view];
  if (!result)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v54 = result;
  [v53 addSubview:result];

  sub_100006DC8(&qword_10007F410);
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_100068440;
  id result = [v2 view];
  if (!result)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v56 = result;
  id v57 = [result leadingAnchor];

  id result = [v50 view];
  if (!result)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  NSBundle v58 = result;
  id v59 = [result leadingAnchor];

  id v60 = [v57 constraintEqualToAnchor:v59];
  *(void *)(v55 + 32) = v60;
  id result = [v2 view];
  if (!result)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v61 = result;
  id v62 = [result trailingAnchor];

  id result = [v50 view];
  if (!result)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  NSBundle v63 = result;
  id v64 = [result trailingAnchor];

  id v65 = [v62 constraintEqualToAnchor:v64];
  *(void *)(v55 + 40) = v65;
  id result = [v2 view];
  if (!result)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v66 = result;
  id v67 = [result topAnchor];

  id result = [v50 view];
  if (!result)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  Swift::String v68 = result;
  id v69 = [result topAnchor];

  id v70 = [v67 constraintEqualToAnchor:v69];
  *(void *)(v55 + 48) = v70;
  id result = [v2 view];
  if (!result)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  Swift::String v71 = result;
  id v72 = [result bottomAnchor];

  id result = [v50 view];
  if (!result)
  {
LABEL_52:
    __break(1u);
    return result;
  }
  Swift::String v73 = result;
  Swift::String v74 = self;
  id v75 = [v73 bottomAnchor];

  id v76 = [v72 constraintEqualToAnchor:v75];
  *(void *)(v55 + 56) = v76;
  sub_100064800();
  sub_10000EF58(0, &qword_10007F418);
  Class isa = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  [v74 activateConstraints:isa];

LABEL_39:
  swift_release();
  swift_release();
  swift_release();

  return (id)swift_release();
}

void sub_1000527F8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (void *)Strong;
    sub_100052854(a1);
  }
}

uint64_t sub_100052854(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_100006DC8(&qword_10007E520);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v33 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v32 - v5;
  uint64_t v7 = sub_1000641E0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading];
  v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading] = 1;
  if ((v11 & 1) == 0) {
    sub_100051380();
  }
  sub_10000EF58(0, &qword_10007F488);
  swift_bridgeObjectRetain();
  Class isa = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v13 = CKSharingAccessTypeFromOptionsGroups();

  swift_bridgeObjectRetain();
  Class v14 = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v15 = CKSharingPermissionTypeFromOptionsGroups();

  swift_bridgeObjectRetain();
  Class v16 = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  int v17 = CKSharingAllowOthersToInviteFromOptionsGroups();

  unint64_t v18 = *(void **)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_share];
  if (v18)
  {
    NSBundle v19 = *(void **)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_containerSetupInfo];
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v1;
    id v21 = v19;
    uint64_t v22 = v1;
    id v23 = v18;
    sub_10000F35C(v23, v19, v34, v13, v15, v17, (uint64_t)sub_100055AE8, v20);

    return swift_release();
  }
  else
  {
    uint64_t v25 = (uint64_t)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_fileURL];
    swift_beginAccess();
    sub_100009C3C(v25, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_10000EB0C((uint64_t)v6);
      uint64_t v26 = (uint64_t)v33;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v33, 1, 1, v7);
      sub_1000646E0();
      id v27 = objc_allocWithZone((Class)NSError);
      NSString v28 = sub_1000646A0();
      swift_bridgeObjectRelease();
      id v29 = [v27 initWithDomain:v28 code:12 userInfo:0];

      sub_100053CEC(v26, 0, v29);
      return sub_10000EB0C(v26);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v1;
      id v31 = v1;
      sub_100012944((uint64_t)v10, v34, v13, v15, v17, (uint64_t)sub_100055AB0, v30);
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
}

id sub_100052C9C()
{
  swift_beginAccess();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    id result = [result _remoteViewControllerProxy];
    if (result)
    {
      sub_100064AC0();
      swift_unknownObjectRelease();
      sub_10004FFA0(&v3, &v4);
      sub_100006DC8(&qword_10007F480);
      swift_dynamicCast();
      sub_100054760(v2);

      return (id)swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_100052D68()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong) {
}
  }

id sub_100052DB4()
{
  swift_beginAccess();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    id result = [result _remoteViewControllerProxy];
    if (result)
    {
      sub_100064AC0();
      swift_unknownObjectRelease();
      sub_10004FFA0(&v3, &v4);
      sub_100006DC8(&qword_10007F480);
      swift_dynamicCast();
      sub_1000548BC(v2, 0.0, 0.0, 0.0, 0.0);

      return (id)swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100052EF8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000641E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v9(v6, a1, v7);
  unint64_t v10 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v10(v6, 0, 1, v7);
  uint64_t v11 = (uint64_t)&v1[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_fileURL];
  swift_beginAccess();
  sub_10001AE4C((uint64_t)v6, v11);
  swift_endAccess();
  uint64_t v12 = sub_10004B23C();
  uint64_t v13 = (uint64_t *)&v2[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_sharedItemTitle];
  *uint64_t v13 = v12;
  v13[1] = v14;
  swift_bridgeObjectRelease();
  sub_100051380();
  v9(v6, a1, v7);
  v10(v6, 0, 1, v7);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v2;
  Class v16 = v2;
  sub_10001A01C((uint64_t)v6, 0, (uint64_t)sub_1000558D8, v15);
  swift_release();
  return sub_10000EB0C((uint64_t)v6);
}

uint64_t sub_1000530EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v13;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  sub_100064870();
  v8[8] = sub_100064860();
  uint64_t v10 = sub_100064830();
  return _swift_task_switch(sub_100053194, v10, v9);
}

uint64_t sub_100053194()
{
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  swift_release();
  sub_100053228(v5, v4, v3, v2, v1);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_100053228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v49 = a3;
  uint64_t v11 = sub_100064380();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  int v17 = (char *)&v41 - v16;
  sub_100064360();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100064370();
  os_log_type_t v19 = sub_100064930();
  int v45 = v19;
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v44 = a1;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v43 = v6;
    uint64_t v22 = v21;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v51 = a2;
    uint64_t v52 = v42;
    *(_DWORD *)uint64_t v22 = 136315650;
    uint64_t v47 = v12;
    uint64_t v50 = a1;
    swift_bridgeObjectRetain();
    sub_100006DC8(&qword_10007EA40);
    uint64_t v48 = v11;
    uint64_t v23 = sub_1000646F0();
    uint64_t v46 = v15;
    uint64_t v50 = sub_10004BEF0(v23, v24, &v52);
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v50 = a5;
    swift_errorRetain();
    sub_100006DC8(&qword_10007F3E8);
    uint64_t v25 = sub_1000646F0();
    uint64_t v50 = sub_10004BEF0(v25, v26, &v52);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v22 + 22) = 2080;
    uint64_t v50 = v49;
    uint64_t v51 = a4;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1000646F0();
    uint64_t v50 = sub_10004BEF0(v27, v28, &v52);
    uint64_t v15 = v46;
    uint64_t v12 = v47;
    sub_100064A90();
    swift_bridgeObjectRelease_n();
    uint64_t v11 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v45, "replyFromUserAndItemInfo name: %s, error: %s, email: %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v43;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    swift_bridgeObjectRelease_n();
  }
  id v29 = *(void (**)(char *, uint64_t))(v12 + 8);
  v29(v17, v11);
  if (a5)
  {
    swift_errorRetain();
    sub_100064360();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v30 = sub_100064370();
    os_log_type_t v31 = sub_100064910();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v48 = v11;
      uint64_t v33 = (uint8_t *)v32;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v46 = v15;
      uint64_t v50 = v34;
      uint64_t v47 = v12;
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v52 = a5;
      swift_errorRetain();
      sub_100006DC8(&qword_10007DF80);
      uint64_t v35 = sub_1000646F0();
      uint64_t v52 = sub_10004BEF0(v35, v36, &v50);
      sub_100064A90();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Error from replyFromUserAndItemInfo: %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      uint64_t v37 = v46;
      uint64_t v38 = v48;
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      uint64_t v37 = v15;
      uint64_t v38 = v11;
    }
    v29(v37, v38);
  }
  else
  {
    uint64_t v39 = (uint64_t *)(v6
                    + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userName);
    *uint64_t v39 = v44;
    v39[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v40 = (uint64_t *)(v6
                    + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_userEmail);
    uint64_t *v40 = v49;
    v40[1] = a4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_100051380();
  }
}

uint64_t sub_100053890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = a8;
  uint64_t v14 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000648A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_100064870();
  id v18 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v19 = sub_100064860();
  BOOL v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = v18;
  v20[5] = a1;
  v20[6] = a2;
  v20[7] = a3;
  v20[8] = a4;
  v20[9] = a5;
  sub_10000F1B0((uint64_t)v16, v23, (uint64_t)v20);
  return swift_release();
}

uint64_t sub_1000539F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v13;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  sub_100064870();
  v8[8] = sub_100064860();
  uint64_t v10 = sub_100064830();
  return _swift_task_switch(sub_100055F18, v10, v9);
}

uint64_t sub_100053BE0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100053C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100053890(a1, a2, a3, a4, a5, *(void **)(v5 + 16), (uint64_t)&unk_10007B048, (uint64_t)&unk_10007F3E0);
}

uint64_t sub_100053C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  sub_100064870();
  v7[6] = sub_100064860();
  uint64_t v9 = sub_100064830();
  return _swift_task_switch(sub_100055F14, v9, v8);
}

void sub_100053CEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100006DC8(&qword_10007E520);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v34 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v38 = sub_100064380();
  uint64_t v15 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  uint64_t v39 = a1;
  sub_100009C3C(a1, (uint64_t)v14);
  swift_errorRetain();
  id v18 = a2;
  swift_errorRetain();
  id v37 = v18;
  uint64_t v19 = sub_100064370();
  os_log_type_t v20 = sub_100064930();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    unint64_t v36 = a2;
    uint64_t v22 = v21;
    uint64_t v34 = swift_slowAlloc();
    *(void *)&v43[0] = v34;
    *(_DWORD *)uint64_t v22 = 136315650;
    uint64_t v35 = v9;
    sub_100009C3C((uint64_t)v14, (uint64_t)v12);
    uint64_t v23 = sub_1000646F0();
    *(void *)&long long v42 = sub_10004BEF0(v23, v24, (uint64_t *)v43);
    sub_100064A90();
    swift_bridgeObjectRelease();
    sub_10000EB0C((uint64_t)v14);
    *(_WORD *)(v22 + 12) = 2080;
    *(void *)&long long v42 = a3;
    swift_errorRetain();
    sub_100006DC8(&qword_10007F3E8);
    uint64_t v25 = sub_1000646F0();
    *(void *)&long long v42 = sub_10004BEF0(v25, v26, (uint64_t *)v43);
    sub_100064A90();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v22 + 22) = 2080;
    id v27 = v37;
    *(void *)&long long v42 = v36;
    id v28 = v37;
    sub_100006DC8((uint64_t *)&unk_10007F4B0);
    uint64_t v29 = sub_1000646F0();
    *(void *)&long long v42 = sub_10004BEF0(v29, v30, (uint64_t *)v43);
    sub_100064A90();

    uint64_t v9 = v35;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "replyFromSharing shareURL: %s, error: %s, share: %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v36;
    swift_slowDealloc();
  }
  else
  {
    sub_10000EB0C((uint64_t)v14);
    swift_errorRelease();
    swift_errorRelease();

    id v27 = v37;
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v38);
  os_log_type_t v31 = v40;
  int v32 = v40[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading];
  v40[OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants38CSAddParticipantsServiceViewController_isLoading] = 0;
  if (v32 == 1) {
    sub_100051380();
  }
  sub_100009C3C(v39, (uint64_t)v9);
  swift_errorRetain();
  id v33 = v27;
  if ([v31 _remoteViewControllerProxy])
  {
    sub_100064AC0();
    swift_unknownObjectRelease();
    sub_10004FFA0(&v42, v43);
    sub_100006DC8(&qword_10007F480);
    swift_dynamicCast();
    sub_1000544D8(v41, a3, (uint64_t)v9, (uint64_t)a2);
    swift_unknownObjectRelease();
    swift_errorRelease();
    sub_10000EB0C((uint64_t)v9);
  }
  else
  {
    swift_errorRelease();
    sub_10000EB0C((uint64_t)v9);

    __break(1u);
  }
}

uint64_t sub_1000541C0(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = a6;
  uint64_t v10 = sub_100006DC8(&qword_10007E520);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006DC8(&qword_10007F3D0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000648A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_100009C3C(a1, (uint64_t)v13);
  sub_100064870();
  id v18 = a4;
  id v19 = a2;
  swift_errorRetain();
  uint64_t v20 = sub_100064860();
  unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v20;
  v23[3] = &protocol witness table for MainActor;
  v23[4] = v18;
  sub_10001A5B8((uint64_t)v13, (uint64_t)v23 + v21);
  *(void *)((char *)v23 + v22) = a2;
  *(void *)((char *)v23 + ((v22 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  sub_10000F1B0((uint64_t)v16, v26, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_1000543BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  sub_100064870();
  v7[6] = sub_100064860();
  uint64_t v9 = sub_100064830();
  return _swift_task_switch(sub_100054458, v9, v8);
}

uint64_t sub_100054458()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = v0[3];
  uint64_t v2 = (void *)v0[4];
  swift_release();
  sub_100053CEC(v3, v2, v1);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_1000544D8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100006DC8(&qword_10007E520);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100064380();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  uint64_t v15 = sub_100064370();
  os_log_type_t v16 = sub_100064930();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    unint64_t v24 = a2;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Add Participants service dismissing after sharing", v17, 2u);
    a2 = v24;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (a2) {
    a2 = (void *)sub_100064140();
  }
  sub_100009C3C(a3, (uint64_t)v10);
  uint64_t v18 = sub_1000641E0();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v10, 1, v18) != 1)
  {
    sub_100064180(v20);
    unint64_t v21 = v22;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v18);
  }
  [a1 dismissViewControllerWithError:a2 shareURL:v21 ckShare:a4];
}

id sub_100054760(void *a1)
{
  uint64_t v2 = sub_100064380();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  uint64_t v6 = sub_100064370();
  os_log_type_t v7 = sub_100064930();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Add Participants service cancelled--dismissing", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return [a1 dismissViewControllerWithError:0 shareURL:0 ckShare:0];
}

void sub_1000548BC(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = sub_100064380();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100064360();
  uint64_t v14 = sub_100064370();
  os_log_type_t v15 = sub_100064930();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "User did tap showContactPicker", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  id v17 = objc_msgSend(self, "valueWithCGRect:", a2, a3, a4, a5);
  [a1 showContactPickerFromSourceRect:v17];
}

uint64_t sub_100054A6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_10000F1AC;
  return sub_1000539F0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100054B58()
{
  [self interfaceWithProtocol:&OBJC_PROTOCOL___CSAddParticipantsViewControllerService];
  sub_100006DC8((uint64_t *)&unk_10007F4C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100066020;
  uint64_t v1 = sub_10000EF58(0, (unint64_t *)&qword_10007F260);
  *(void *)(v0 + 56) = sub_100006DC8(&qword_10007F4D0);
  *(void *)(v0 + 32) = v1;
  id v2 = objc_allocWithZone((Class)NSSet);
  Class isa = sub_1000647E0().super.isa;
  swift_bridgeObjectRelease();
  [v2 initWithArray:isa];

  uint64_t result = sub_1000648E0();
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  __break(1u);
  return result;
}

uint64_t sub_100055318(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v5 = (objc_class *)[self mainBundle];
  if (v4)
  {
    v11._countAndFlagsBits = 0x800000010006B0D0;
    v12._object = (void *)0x800000010006B070;
    v12._countAndFlagsBits = 0x1000000000000050;
    v14.value._countAndFlagsBits = 0;
    v14.value._object = 0;
    v6.super.Class isa = v5;
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_100064020(v12, v14, v6, v16, v11);

    sub_100006DC8(&qword_10007F3F0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100066020;
    *(void *)(v7 + 56) = &type metadata for String;
    *(void *)(v7 + 64) = sub_100055884();
    *(void *)(v7 + 32) = a1;
    *(void *)(v7 + 40) = a2;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1000646B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13._countAndFlagsBits = 0x1000000000000051;
    v11._countAndFlagsBits = 0x800000010006B160;
    v13._object = (void *)0x800000010006B100;
    v15.value._countAndFlagsBits = 0;
    v15.value._object = 0;
    v9.super.Class isa = v5;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    uint64_t v8 = sub_100064020(v13, v15, v9, v17, v11);
  }
  return v8;
}

uint64_t sub_1000554C0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_100064380();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v12)
  {
    if ((a4 & 0x2000000000000000) != 0) {
      uint64_t v13 = HIBYTE(a4) & 0xF;
    }
    else {
      uint64_t v13 = a3 & 0xFFFFFFFFFFFFLL;
    }
    Swift::String_optional v14 = (objc_class *)[self mainBundle];
    if (v13)
    {
      v27._countAndFlagsBits = 0x1000000000000019;
      v25._countAndFlagsBits = 0x800000010006AFE0;
      v27._object = (void *)0x800000010006AFC0;
      v29.value._countAndFlagsBits = 0;
      v29.value._object = 0;
      v15.super.Class isa = v14;
      v31._countAndFlagsBits = 0;
      v31._object = (void *)0xE000000000000000;
      sub_100064020(v27, v29, v15, v31, v25);

      sub_100006DC8(&qword_10007F3F0);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_100066DD0;
      *(void *)(v16 + 56) = &type metadata for String;
      unint64_t v17 = sub_100055884();
      *(void *)(v16 + 32) = a1;
      *(void *)(v16 + 40) = a2;
      *(void *)(v16 + 96) = &type metadata for String;
      *(void *)(v16 + 104) = v17;
      *(void *)(v16 + 64) = v17;
      *(void *)(v16 + 72) = a3;
      *(void *)(v16 + 80) = a4;
      swift_bridgeObjectRetain();
    }
    else
    {
      v25._countAndFlagsBits = 0x800000010006B040;
      v28._object = (void *)0x800000010006B020;
      v28._countAndFlagsBits = 0x1000000000000014;
      v30.value._countAndFlagsBits = 0;
      v30.value._object = 0;
      v22.super.Class isa = v14;
      v32._countAndFlagsBits = 0;
      v32._object = (void *)0xE000000000000000;
      sub_100064020(v28, v30, v22, v32, v25);

      sub_100006DC8(&qword_10007F3F0);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_100066020;
      *(void *)(v23 + 56) = &type metadata for String;
      *(void *)(v23 + 64) = sub_100055884();
      *(void *)(v23 + 32) = a1;
      *(void *)(v23 + 40) = a2;
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000646B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100064360();
    uint64_t v18 = sub_100064370();
    os_log_type_t v19 = sub_100064930();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "userInfoText is missing name", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return 0;
  }
  return v21;
}

uint64_t sub_100055818(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10005582C(a1, a2);
  }
  return a1;
}

uint64_t sub_10005582C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_100055884()
{
  unint64_t result = qword_10007F3F8;
  if (!qword_10007F3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10007F3F8);
  }
  return result;
}

uint64_t sub_1000558D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100053890(a1, a2, a3, a4, a5, *(void **)(v5 + 16), (uint64_t)&unk_10007B098, (uint64_t)&unk_10007F408);
}

uint64_t sub_100055914()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_errorRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10005596C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  Swift::String v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_10000F0B8;
  return sub_1000530EC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100055A58()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100055A90(uint64_t a1)
{
}

id sub_100055A98()
{
  return sub_100052C9C();
}

void sub_100055AA0()
{
}

id sub_100055AA8()
{
  return sub_100052DB4();
}

uint64_t sub_100055AB0(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000541C0(a1, a2, a3, *(void **)(v3 + 16), (uint64_t)&unk_10007B160, (uint64_t)&unk_10007F4A8);
}

uint64_t sub_100055AE8(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_1000541C0(a1, a2, a3, *(void **)(v3 + 16), (uint64_t)&unk_10007B138, (uint64_t)&unk_10007F498);
}

uint64_t sub_100055B24(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_10000F1AC;
  return sub_100053C50(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_100055C70()
{
  uint64_t v1 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();

  uint64_t v5 = sub_1000641E0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_errorRelease();

  return _swift_deallocObject(v0, v8 + 8, v2 | 7);
}

uint64_t sub_100055DCC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006DC8(&qword_10007E520) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_10000F1AC;
  return sub_1000543BC(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t getEnumTagSinglePayload for SharingMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SharingMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100056084);
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

ValueMetadata *type metadata accessor for SharingMode()
{
  return &type metadata for SharingMode;
}

unsigned char *storeEnumTagSinglePayload for SharePermission(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100056188);
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

ValueMetadata *type metadata accessor for SharePermission()
{
  return &type metadata for SharePermission;
}

ValueMetadata *type metadata accessor for SharingOptions()
{
  return &type metadata for SharingOptions;
}

void *sub_1000561D0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1000561DC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000561E4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1000561F8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10005620C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100056220(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100056250@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10005627C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000562A0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000562B4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1000562C8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1000562DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1000562F0(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100056304(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100056318(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10005632C()
{
  return *v0 == 0;
}

uint64_t sub_10005633C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100056354(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_100056368@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100056504(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t sub_1000563B0()
{
  unint64_t result = qword_10007F540;
  if (!qword_10007F540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F540);
  }
  return result;
}

unint64_t sub_100056408()
{
  unint64_t result = qword_10007F548;
  if (!qword_10007F548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007F548);
  }
  return result;
}

unint64_t sub_100056460()
{
  unint64_t result = qword_10007F550[0];
  if (!qword_10007F550[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10007F550);
  }
  return result;
}

uint64_t sub_1000564BC()
{
  return *(void *)&aNone_2[8 * *v0];
}

uint64_t sub_1000564E0()
{
  return *(void *)&aNone_3[8 * *v0];
}

uint64_t sub_100056504(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t Publishers.CSCombineLatest6.init(_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(a9, a1, a7);
  uint64_t v16 = (int *)type metadata accessor for Publishers.CSCombineLatest6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(a9 + v16[29], a2, a8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a10 - 8) + 32))(a9 + v16[30], a3, a10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32))(a9 + v16[31], a4, a11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a12 - 8) + 32))(a9 + v16[32], a5, a12);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32))(a9 + v16[33], a6, a13);
}

uint64_t type metadata accessor for Publishers.CSCombineLatest6()
{
  return swift_getGenericMetadata();
}

uint64_t Publishers.CSCombineLatest5.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 100));
}

uint64_t Publishers.CSCombineLatest5.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8) + 16))(a2, v2 + *(int *)(a1 + 104));
}

uint64_t Publishers.CSCombineLatest5.d.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 40) - 8) + 16))(a2, v2 + *(int *)(a1 + 108));
}

uint64_t Publishers.CSCombineLatest5.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 48) - 8) + 16))(a2, v2 + *(int *)(a1 + 112));
}

uint64_t Publishers.CSCombineLatest5.init(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a9, a1, a6);
  unint64_t v17 = (int *)type metadata accessor for Publishers.CSCombineLatest5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(a9 + v17[25], a2, a7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(a9 + v17[26], a3, a8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a10 - 8) + 32))(a9 + v17[27], a4, a10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32))(a9 + v17[28], a5, a11);
}

uint64_t type metadata accessor for Publishers.CSCombineLatest5()
{
  return swift_getGenericMetadata();
}

uint64_t Publishers.CSCombineLatest5.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v86 = a4;
  uint64_t v85 = a3;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v87 = a1;
  uint64_t v88 = v5;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t AssociatedTypeWitness = v6;
  uint64_t v102 = v5;
  uint64_t v90 = v6;
  uint64_t v103 = v7;
  uint64_t v104 = v8;
  uint64_t v98 = v8;
  uint64_t v99 = v7;
  uint64_t v105 = v9;
  uint64_t v106 = v10;
  uint64_t v96 = v10;
  uint64_t v97 = v9;
  uint64_t v100 = sub_1000643A0();
  uint64_t v11 = *(void *)(a2 + 40);
  uint64_t v91 = *(void *)(a2 + 48);
  Swift::String v93 = (char *)&protocol conformance descriptor for Publishers.CombineLatest3<A, B, C>;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = *(void *)(a2 + 80);
  uint64_t v106 = *(void *)(a2 + 88);
  uint64_t v95 = v12;
  uint64_t v76 = v106;
  uint64_t v94 = sub_1000643A0();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = v88;
  uint64_t v102 = swift_getAssociatedTypeWitness();
  uint64_t v14 = v99;
  uint64_t v103 = swift_getAssociatedTypeWitness();
  uint64_t v89 = v11;
  uint64_t v104 = swift_getAssociatedTypeWitness();
  uint64_t v105 = swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v15 = v94;
  uint64_t v80 = swift_getWitnessTable();
  uint64_t v82 = sub_1000643F0();
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v16 = __chkstk_darwin(v82);
  Swift::String v78 = (char *)&v68 - v17;
  uint64_t v75 = *(void *)(v91 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  Swift::String v74 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  Swift::String v73 = (char *)&v68 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = *(void *)(v15 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  Swift::String v93 = (char *)&v68 - v23;
  uint64_t v24 = *(void *)(v14 - 8);
  uint64_t v25 = __chkstk_darwin(v22);
  Swift::String v27 = (char *)&v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v13;
  uint64_t v29 = *(void *)(v13 - 8);
  uint64_t v30 = __chkstk_darwin(v25);
  Swift::String v32 = (char *)&v68 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v30);
  uint64_t v35 = (char *)&v68 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = *(void *)(v100 - 8);
  uint64_t v36 = __chkstk_darwin(v33);
  id v70 = (char *)&v68 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v39 = (char *)&v68 - v38;
  uint64_t v41 = v79;
  uint64_t v43 = v42;
  (*(void (**)(char *, uint64_t))(v40 + 16))(v35, v79);
  uint64_t v69 = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v41 + *(int *)(a2 + 100), v28);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v27, v41 + *(int *)(a2 + 104), v99);
  id v72 = v39;
  uint64_t v44 = v43;
  sub_1000643B0();
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v70, v39, v100);
  uint64_t v45 = v69;
  uint64_t v46 = v89;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v73, v41 + *(int *)(v69 + 108), v89);
  uint64_t v47 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v41 + *(int *)(v45 + 112), v91);
  uint64_t v48 = v76;
  uint64_t v49 = v46;
  uint64_t v50 = v47;
  uint64_t v51 = v95;
  sub_1000643B0();
  uint64_t v52 = (void *)swift_allocObject();
  v52[2] = v44;
  v52[3] = v28;
  uint64_t v53 = v98;
  uint64_t v54 = v99;
  v52[4] = v99;
  v52[5] = v49;
  uint64_t v55 = v85;
  v52[6] = v50;
  v52[7] = v55;
  uint64_t v56 = v96;
  uint64_t v57 = v97;
  v52[8] = v53;
  v52[9] = v57;
  v52[10] = v56;
  v52[11] = v51;
  uint64_t v58 = v86;
  v52[12] = v48;
  v52[13] = v58;
  id v59 = (void *)swift_allocObject();
  uint64_t v60 = v88;
  v59[2] = v90;
  v59[3] = v60;
  uint64_t v61 = v89;
  v59[4] = v54;
  v59[5] = v61;
  v59[6] = v50;
  v59[7] = v55;
  v59[8] = v53;
  v59[9] = v57;
  uint64_t v62 = v95;
  v59[10] = v56;
  v59[11] = v62;
  v59[12] = v48;
  v59[13] = v58;
  v59[14] = sub_100057894;
  v59[15] = v52;
  NSBundle v63 = v78;
  id v65 = v93;
  uint64_t v64 = v94;
  sub_1000644C0();
  swift_release();
  uint64_t v66 = v82;
  sub_1000643E0();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v63, v66);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v65, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v72, v100);
}

uint64_t sub_1000572A4(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), char *a7, char *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  id v65 = a8;
  uint64_t v66 = a7;
  uint64_t v67 = a1;
  uint64_t v81 = a6;
  uint64_t v75 = a21;
  uint64_t v73 = a4;
  uint64_t v74 = a15;
  uint64_t v76 = a10;
  uint64_t v77 = a5;
  uint64_t v71 = a3;
  uint64_t v72 = a9;
  uint64_t v70 = a20;
  uint64_t v68 = a2;
  uint64_t v69 = a14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v22 = swift_getAssociatedTypeWitness();
  uint64_t v23 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v25 = TupleTypeMetadata3 - 8;
  uint64_t v26 = __chkstk_darwin(TupleTypeMetadata3);
  uint64_t v85 = (char *)&v58 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v84 = (char *)&v58 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v79 = (char *)&v58 - v31;
  __chkstk_darwin(v30);
  uint64_t v80 = (char *)&v58 + *(int *)(v25 + 56) - v32;
  uint64_t v33 = v80;
  Swift::String v78 = (char *)&v58 + *(int *)(v25 + 72) - v32;
  uint64_t v34 = v78;
  uint64_t v61 = AssociatedTypeWitness;
  uint64_t v86 = *(void **)(AssociatedTypeWitness - 8);
  uint64_t v82 = (void (*)(void))v86[2];
  uint64_t v83 = (char *)&v58 - v32;
  ((void (*)(char *, void, uint64_t))v82)((char *)&v58 - v32, v81, AssociatedTypeWitness);
  uint64_t v63 = *(void *)(v22 - 8);
  uint64_t v81 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  uint64_t v58 = v22;
  v81(v33, v66, v22);
  uint64_t v64 = *(void *)(v23 - 8);
  uint64_t v35 = *(void (**)(char *, char *))(v64 + 16);
  uint64_t v59 = v23;
  v35(v34, v65);
  uint64_t v60 = (void (*)(char *, char *, uint64_t))v35;
  uint64_t v66 = &v79[*(int *)(v25 + 56)];
  uint64_t v36 = v66;
  id v65 = &v79[*(int *)(v25 + 72)];
  uint64_t v37 = v65;
  uint64_t v38 = v61;
  v82();
  v81(v36, v80, v22);
  uint64_t v39 = v78;
  ((void (*)(char *, char *, uint64_t))v35)(v37, v78, v23);
  uint64_t v62 = (void (*)(void))v86[4];
  ((void (*)(uint64_t, char *, uint64_t))v62)(v67, v79, v38);
  uint64_t v40 = &v84[*(int *)(v25 + 56)];
  uint64_t v79 = &v84[*(int *)(v25 + 72)];
  uint64_t v41 = v79;
  v82();
  uint64_t v42 = v80;
  uint64_t v43 = v58;
  v81(v40, v80, v58);
  uint64_t v44 = v39;
  uint64_t v45 = v59;
  v60(v41, v44, v59);
  uint64_t v46 = v63;
  uint64_t v47 = *(void (**)(uint64_t, char *, uint64_t))(v63 + 32);
  v47(v68, v40, v43);
  uint64_t v48 = &v85[*(int *)(v25 + 56)];
  uint64_t v49 = &v85[*(int *)(v25 + 72)];
  v62();
  v47((uint64_t)v48, v42, v43);
  uint64_t v50 = v64;
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
  v51(v49, v78, v45);
  v51(v71, v49, v45);
  uint64_t v52 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 16))(v73, v72, v52);
  uint64_t v53 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 16))(v77, v76, v53);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
  v54(v48, v43);
  uint64_t v55 = (void (*)(char *, uint64_t))v86[1];
  v55(v85, v38);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v50 + 8);
  v56(v79, v45);
  v55(v84, v38);
  v56(v65, v45);
  return ((uint64_t (*)(char *, uint64_t))v54)(v66, v43);
}

uint64_t sub_100057884()
{
  return _swift_deallocObject(v0, 112, 7);
}

uint64_t sub_100057894(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), char *a7, char *a8, uint64_t a9, uint64_t a10)
{
  return sub_1000572A4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, v10[2], v10[3], v10[4], v10[5], v10[6], v10[7], v10[8], v10[9], v10[10],
           v10[11],
           v10[12]);
}

uint64_t sub_1000578DC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v12 = a1 + *(int *)(TupleTypeMetadata3 + 48);
  uint64_t v6 = a1 + *(int *)(TupleTypeMetadata3 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v7 = swift_getTupleTypeMetadata3();
  uint64_t v8 = a1 + *(int *)(v7 + 48);
  uint64_t v9 = a1 + *(int *)(v7 + 64);
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  return a2(a3, a3 + TupleTypeMetadata[12], a3 + TupleTypeMetadata[16], a3 + TupleTypeMetadata[20], a3 + TupleTypeMetadata[24], a1, v12, v6, v8, v9);
}

uint64_t sub_100057AA8()
{
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100057AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000578DC(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 112), a2);
}

uint64_t sub_100057B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.CSCombineLatest5.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t Publishers.CSCombineLatest6.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 116));
}

uint64_t Publishers.CSCombineLatest6.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8) + 16))(a2, v2 + *(int *)(a1 + 120));
}

uint64_t Publishers.CSCombineLatest6.d.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 40) - 8) + 16))(a2, v2 + *(int *)(a1 + 124));
}

uint64_t Publishers.CSCombineLatest6.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 48) - 8) + 16))(a2, v2 + *(int *)(a1 + 128));
}

uint64_t Publishers.CSCombineLatest6.f.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 56) - 8) + 16))(a2, v2 + *(int *)(a1 + 132));
}

uint64_t Publishers.CSCombineLatest6.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v90 = a4;
  uint64_t v89 = a3;
  uint64_t v91 = a1;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 64);
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v104 = *(void *)(a2 + 80);
  uint64_t v105 = v7;
  uint64_t AssociatedTypeWitness = v5;
  uint64_t v108 = v6;
  uint64_t v93 = v5;
  uint64_t v106 = v6;
  uint64_t v109 = v7;
  uint64_t v110 = v8;
  uint64_t v98 = v9;
  uint64_t v99 = v8;
  uint64_t v111 = v9;
  uint64_t v112 = v104;
  uint64_t v10 = sub_1000643A0();
  uint64_t v11 = *(void *)(a2 + 48);
  uint64_t v100 = *(void *)(a2 + 40);
  uint64_t v101 = v11;
  uint64_t v102 = *(void *)(a2 + 56);
  uint64_t v103 = v10;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = *(void *)(a2 + 96);
  uint64_t v13 = *(void *)(a2 + 104);
  uint64_t v82 = *(void *)(a2 + 88);
  uint64_t v113 = v12;
  uint64_t v114 = v13;
  uint64_t v96 = v13;
  uint64_t v97 = v12;
  uint64_t v95 = sub_1000643C0();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v108 = swift_getAssociatedTypeWitness();
  uint64_t v14 = v105;
  uint64_t v109 = swift_getAssociatedTypeWitness();
  uint64_t v15 = v100;
  uint64_t v110 = swift_getAssociatedTypeWitness();
  uint64_t v111 = swift_getAssociatedTypeWitness();
  uint64_t v112 = swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v16 = v95;
  uint64_t v84 = swift_getWitnessTable();
  uint64_t v86 = sub_1000643F0();
  uint64_t v87 = *(void *)(v86 - 8);
  uint64_t v17 = __chkstk_darwin(v86);
  uint64_t v81 = (char *)v71 - v18;
  uint64_t v79 = *(void *)(v102 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  Swift::String v78 = (char *)v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = *(void *)(v11 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v76 = (char *)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = *(void *)(v15 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v73 = (char *)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = *(void *)(v16 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v94 = (char *)v71 - v26;
  uint64_t v27 = *(void *)(v14 - 8);
  uint64_t v28 = __chkstk_darwin(v25);
  uint64_t v72 = (char *)v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = *(void *)(v106 - 8);
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v33 = (char *)v71 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = v93;
  uint64_t v35 = __chkstk_darwin(v31);
  uint64_t v37 = (char *)v71 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = *(void *)(v103 - 8);
  uint64_t v38 = __chkstk_darwin(v35);
  uint64_t v40 = (char *)v71 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71[1] = v40;
  __chkstk_darwin(v38);
  uint64_t v42 = (char *)v71 - v41;
  uint64_t v74 = (char *)v71 - v41;
  uint64_t v44 = v83;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v37, v83, v34);
  uint64_t v45 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v33, v44 + *(int *)(a2 + 116), v106);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v72, v44 + *(int *)(a2 + 120), v105);
  sub_1000643B0();
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v40, v42, v103);
  uint64_t v46 = v100;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v73, v44 + *(int *)(a2 + 124), v100);
  uint64_t v47 = v101;
  (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v76, v45 + *(int *)(a2 + 128), v101);
  uint64_t v48 = v102;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v45 + *(int *)(a2 + 132), v102);
  uint64_t v49 = v96;
  uint64_t v50 = v82;
  uint64_t v51 = v46;
  uint64_t v52 = v47;
  sub_1000643D0();
  uint64_t v53 = (void *)swift_allocObject();
  uint64_t v54 = v93;
  uint64_t v55 = v106;
  v53[2] = v93;
  v53[3] = v55;
  uint64_t v56 = v104;
  v53[4] = v105;
  v53[5] = v51;
  v53[6] = v52;
  v53[7] = v48;
  uint64_t v57 = v89;
  uint64_t v59 = v98;
  uint64_t v58 = v99;
  v53[8] = v89;
  v53[9] = v58;
  v53[10] = v59;
  v53[11] = v56;
  uint64_t v60 = v97;
  v53[12] = v50;
  v53[13] = v60;
  uint64_t v61 = v90;
  v53[14] = v49;
  v53[15] = v61;
  uint64_t v62 = (void *)swift_allocObject();
  uint64_t v63 = v106;
  v62[2] = v54;
  v62[3] = v63;
  uint64_t v64 = v100;
  v62[4] = v105;
  v62[5] = v64;
  uint64_t v65 = v102;
  v62[6] = v101;
  v62[7] = v65;
  v62[8] = v57;
  v62[9] = v58;
  v62[10] = v59;
  v62[11] = v56;
  v62[12] = v50;
  v62[13] = v60;
  uint64_t v66 = v95;
  v62[14] = v96;
  v62[15] = v61;
  v62[16] = sub_100058CE8;
  v62[17] = v53;
  uint64_t v67 = v81;
  uint64_t v68 = v94;
  sub_1000644C0();
  swift_release();
  uint64_t v69 = v86;
  sub_1000643E0();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v67, v69);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v68, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v92 + 8))(v74, v103);
}

uint64_t sub_100058630(char *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char *a8, char *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v77 = a8;
  uint64_t v96 = a7;
  uint64_t v91 = a6;
  uint64_t v89 = a5;
  uint64_t v85 = a4;
  uint64_t v81 = a3;
  uint64_t v78 = a2;
  uint64_t v76 = a1;
  uint64_t v90 = a12;
  uint64_t v88 = a25;
  uint64_t v86 = a11;
  uint64_t v87 = a18;
  uint64_t v83 = a17;
  uint64_t v84 = a24;
  uint64_t v82 = a10;
  uint64_t v75 = a9;
  uint64_t v80 = a23;
  uint64_t v79 = a16;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = swift_getAssociatedTypeWitness();
  uint64_t v27 = swift_getAssociatedTypeWitness();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v29 = TupleTypeMetadata3 - 8;
  uint64_t v30 = __chkstk_darwin(TupleTypeMetadata3);
  uint64_t v97 = (char *)&v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v98 = (char *)&v66 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v36 = (char *)&v66 - v35;
  __chkstk_darwin(v34);
  uint64_t v92 = (char *)&v66 + *(int *)(v29 + 56) - v37;
  uint64_t v38 = v92;
  uint64_t v93 = (char *)&v66 - v37;
  uint64_t v39 = (char *)&v66 + *(int *)(v29 + 72) - v37;
  uint64_t v99 = *(void **)(AssociatedTypeWitness - 8);
  uint64_t v100 = AssociatedTypeWitness;
  uint64_t v40 = v99 + 2;
  uint64_t v95 = (void (*)(void))v99[2];
  ((void (*)(char *, void *, uint64_t))v95)((char *)&v66 - v37, v96, AssociatedTypeWitness);
  uint64_t v69 = v40;
  uint64_t v96 = *(void **)(v26 - 8);
  uint64_t v94 = (void (*)(char *, char *, uint64_t))v96[2];
  uint64_t v70 = v26;
  v94(v38, v77, v26);
  uint64_t v68 = v27;
  uint64_t v74 = *(void *)(v27 - 8);
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v74 + 16);
  uint64_t v71 = v39;
  v41(v39, v75, v27);
  uint64_t v72 = v41;
  uint64_t v42 = *(int *)(v29 + 56);
  uint64_t v67 = v36;
  uint64_t v43 = &v36[v42];
  uint64_t v77 = &v36[v42];
  uint64_t v75 = &v36[*(int *)(v29 + 72)];
  uint64_t v44 = v75;
  ((void (*)(char *, char *, uint64_t))v95)(v36, v93, v100);
  uint64_t v45 = v43;
  uint64_t v46 = v92;
  v94(v45, v92, v26);
  uint64_t v47 = v68;
  v41(v44, v39, v68);
  uint64_t v73 = (void (*)(void))v99[4];
  ((void (*)(char *, char *, uint64_t))v73)(v76, v67, v100);
  uint64_t v67 = &v98[*(int *)(v29 + 56)];
  uint64_t v48 = v67;
  uint64_t v76 = &v98[*(int *)(v29 + 72)];
  uint64_t v49 = v76;
  v95();
  uint64_t v50 = v46;
  uint64_t v51 = v70;
  v94(v48, v50, v70);
  uint64_t v52 = v71;
  v72(v49, v71, v47);
  uint64_t v53 = (void (*)(uint64_t, char *, uint64_t))v96[4];
  v53(v78, v67, v51);
  uint64_t v54 = &v97[*(int *)(v29 + 56)];
  uint64_t v55 = &v97[*(int *)(v29 + 72)];
  v73();
  v53((uint64_t)v54, v92, v51);
  uint64_t v56 = v74;
  uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
  v57(v55, v52, v47);
  v57(v81, v55, v47);
  uint64_t v58 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 16))(v85, v82, v58);
  uint64_t v59 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v89, v86, v59);
  uint64_t v60 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 16))(v91, v90, v60);
  uint64_t v61 = (void (*)(char *, uint64_t))v96[1];
  v61(v54, v51);
  uint64_t v62 = v100;
  uint64_t v63 = (void (*)(char *, uint64_t))v99[1];
  v63(v97, v100);
  uint64_t v64 = *(void (**)(char *, uint64_t))(v56 + 8);
  v64(v76, v47);
  v63(v98, v62);
  v64(v75, v47);
  return ((uint64_t (*)(char *, uint64_t))v61)(v77, v51);
}

uint64_t sub_100058CD8()
{
  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100058CE8(char *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char *a8, char *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return sub_100058630(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v12[2], v12[3], v12[4], v12[5], v12[6], v12[7], v12[8],
           v12[9],
           v12[10],
           v12[11],
           v12[12],
           v12[13],
           v12[14]);
}

uint64_t sub_100058D38@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  uint64_t v13 = a1 + *(int *)(TupleTypeMetadata3 + 48);
  uint64_t v12 = a1 + *(int *)(TupleTypeMetadata3 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v7 = a1 + TupleTypeMetadata[12];
  uint64_t v8 = a1 + TupleTypeMetadata[16];
  uint64_t v9 = a1 + TupleTypeMetadata[20];
  uint64_t v10 = (int *)swift_getTupleTypeMetadata();
  return a2(a3, a3 + v10[12], a3 + v10[16], a3 + v10[20], a3 + v10[24], a3 + v10[28], a1, v13, v12, v7, v8, v9);
}

uint64_t sub_100058F50()
{
  swift_release();

  return _swift_deallocObject(v0, 144, 7);
}

uint64_t sub_100058F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100058D38(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 128), a2);
}

uint64_t sub_100058FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.CSCombineLatest6.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t _s7Combine10PublishersO40com_apple_CloudSharingUI_AddParticipantsE16CSCombineLatest7V1axvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Publishers.CSCombineLatest7.b.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 132));
}

uint64_t Publishers.CSCombineLatest7.c.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) - 8) + 16))(a2, v2 + *(int *)(a1 + 136));
}

uint64_t Publishers.CSCombineLatest7.d.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 40) - 8) + 16))(a2, v2 + *(int *)(a1 + 140));
}

uint64_t Publishers.CSCombineLatest7.e.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 48) - 8) + 16))(a2, v2 + *(int *)(a1 + 144));
}

uint64_t Publishers.CSCombineLatest7.f.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 56) - 8) + 16))(a2, v2 + *(int *)(a1 + 148));
}

uint64_t Publishers.CSCombineLatest7.g.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 64) - 8) + 16))(a2, v2 + *(int *)(a1 + 152));
}

uint64_t Publishers.CSCombineLatest7.init(_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(a9, a1, a8);
  uint64_t v17 = (int *)type metadata accessor for Publishers.CSCombineLatest7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a10 - 8) + 32))(a9 + v17[33], a2, a10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32))(a9 + v17[34], a3, a11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a12 - 8) + 32))(a9 + v17[35], a4, a12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32))(a9 + v17[36], a5, a13);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a14 - 8) + 32))(a9 + v17[37], a6, a14);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a15 - 8) + 32))(a9 + v17[38], a7, a15);
}

uint64_t type metadata accessor for Publishers.CSCombineLatest7()
{
  return swift_getGenericMetadata();
}

uint64_t Publishers.CSCombineLatest7.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v94 = a4;
  uint64_t v93 = a3;
  uint64_t v95 = a1;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v111 = *(void *)(a2 + 32);
  uint64_t v112 = v5;
  uint64_t v8 = *(void *)(a2 + 72);
  uint64_t v9 = *(void *)(a2 + 80);
  uint64_t v10 = *(void *)(a2 + 88);
  uint64_t v110 = *(void *)(a2 + 96);
  uint64_t v113 = v6;
  uint64_t AssociatedTypeWitness = v6;
  uint64_t v115 = v5;
  uint64_t v116 = v111;
  uint64_t v117 = v7;
  uint64_t v118 = v8;
  uint64_t v104 = v8;
  uint64_t v105 = v7;
  uint64_t v119 = v9;
  uint64_t v120 = v10;
  uint64_t v102 = v10;
  uint64_t v103 = v9;
  uint64_t v121 = v110;
  uint64_t v11 = sub_1000643C0();
  uint64_t v12 = *(void *)(a2 + 56);
  uint64_t v106 = *(void *)(a2 + 48);
  uint64_t v107 = v12;
  uint64_t v108 = *(void *)(a2 + 64);
  uint64_t v109 = v11;
  uint64_t v98 = (char *)&protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = *(void *)(a2 + 112);
  uint64_t v14 = *(void *)(a2 + 120);
  uint64_t v101 = *(void *)(a2 + 104);
  uint64_t v121 = v14;
  uint64_t v85 = v13;
  uint64_t v100 = v14;
  uint64_t v99 = sub_1000643C0();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v115 = swift_getAssociatedTypeWitness();
  uint64_t v15 = v111;
  uint64_t v116 = swift_getAssociatedTypeWitness();
  uint64_t v16 = v105;
  uint64_t v117 = swift_getAssociatedTypeWitness();
  uint64_t v17 = v106;
  uint64_t v118 = swift_getAssociatedTypeWitness();
  uint64_t v119 = swift_getAssociatedTypeWitness();
  uint64_t v120 = swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v18 = v99;
  uint64_t v88 = swift_getWitnessTable();
  uint64_t v90 = sub_1000643F0();
  uint64_t v91 = *(void *)(v90 - 8);
  uint64_t v19 = __chkstk_darwin(v90);
  uint64_t v86 = (char *)&v75 - v20;
  uint64_t v83 = *(void *)(v108 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v82 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = *(void *)(v12 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v80 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = *(void *)(v17 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v78 = (char *)&v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = *(void *)(v18 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v98 = (char *)&v75 - v28;
  uint64_t v75 = *(void *)(v16 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v76 = (char *)&v75 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = *(void *)(v15 - 8);
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v34 = (char *)&v75 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v112;
  uint64_t v36 = *(void *)(v112 - 8);
  uint64_t v37 = __chkstk_darwin(v32);
  uint64_t v39 = (char *)&v75 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v37);
  uint64_t v42 = (char *)&v75 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = *(void *)(v109 - 8);
  uint64_t v43 = __chkstk_darwin(v40);
  uint64_t v96 = (char *)&v75 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v43);
  uint64_t v46 = (char *)&v75 - v45;
  uint64_t v48 = v87;
  (*(void (**)(char *, uint64_t))(v47 + 16))(v42, v87);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v39, v48 + *(int *)(a2 + 132), v35);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v34, v48 + *(int *)(a2 + 136), v111);
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v76, v48 + *(int *)(a2 + 140), v105);
  uint64_t v77 = v46;
  sub_1000643D0();
  (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v96, v46, v109);
  uint64_t v49 = v106;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v48 + *(int *)(a2 + 144), v106);
  uint64_t v50 = v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v80, v48 + *(int *)(a2 + 148), v107);
  uint64_t v51 = v48 + *(int *)(a2 + 152);
  uint64_t v52 = v108;
  (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v82, v51, v108);
  uint64_t v53 = v100;
  uint64_t v54 = v85;
  uint64_t v55 = v101;
  uint64_t v56 = v50;
  uint64_t v57 = v52;
  sub_1000643D0();
  uint64_t v58 = (void *)swift_allocObject();
  uint64_t v59 = v112;
  v58[2] = v113;
  v58[3] = v59;
  uint64_t v60 = v105;
  v58[4] = v111;
  v58[5] = v60;
  v58[6] = v49;
  v58[7] = v56;
  uint64_t v61 = v93;
  v58[8] = v57;
  v58[9] = v61;
  uint64_t v63 = v103;
  uint64_t v62 = v104;
  v58[10] = v104;
  v58[11] = v63;
  uint64_t v64 = v102;
  uint64_t v65 = v110;
  v58[12] = v102;
  v58[13] = v65;
  v58[14] = v55;
  v58[15] = v54;
  uint64_t v66 = v94;
  v58[16] = v53;
  v58[17] = v66;
  uint64_t v67 = (void *)swift_allocObject();
  uint64_t v68 = v112;
  v67[2] = v113;
  v67[3] = v68;
  v67[4] = v111;
  v67[5] = v60;
  uint64_t v69 = v107;
  v67[6] = v106;
  v67[7] = v69;
  v67[8] = v108;
  v67[9] = v61;
  v67[10] = v62;
  v67[11] = v63;
  v67[12] = v64;
  v67[13] = v65;
  v67[14] = v101;
  v67[15] = v54;
  v67[16] = v100;
  v67[17] = v66;
  v67[18] = sub_10005A960;
  v67[19] = v58;
  uint64_t v70 = v86;
  uint64_t v71 = v99;
  uint64_t v72 = v98;
  sub_1000644C0();
  swift_release();
  uint64_t v73 = v90;
  sub_1000643E0();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v70, v73);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v72, v71);
  return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v77, v109);
}

uint64_t sub_100059EB0(char *a1, char *a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(char *, uint64_t), void (*a10)(char *, char *, uint64_t), char *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void (*a17)(char *, char *, uint64_t), uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void (*a24)(char *, uint64_t),uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v141 = a8;
  uint64_t v118 = a7;
  uint64_t v116 = a6;
  uint64_t v112 = a5;
  uint64_t v108 = a4;
  uint64_t v105 = a3;
  uint64_t v104 = a2;
  uint64_t v101 = a1;
  uint64_t v115 = a29;
  uint64_t v114 = a21;
  uint64_t v117 = a14;
  uint64_t v113 = a13;
  uint64_t v111 = a28;
  uint64_t v107 = a27;
  uint64_t v110 = a20;
  uint64_t v106 = a19;
  uint64_t v109 = a12;
  uint64_t v103 = a11;
  Swift::String v138 = a10;
  uint64_t v139 = a9;
  uint64_t v135 = a25;
  uint64_t v136 = a18;
  Swift::String v137 = a26;
  uint64_t v133 = a17;
  uint64_t v140 = a24;
  uint64_t v131 = a16;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v143 = swift_getAssociatedTypeWitness();
  uint64_t v144 = swift_getAssociatedTypeWitness();
  uint64_t v145 = swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  uint64_t v30 = (int *)(TupleTypeMetadata - 8);
  uint64_t v31 = __chkstk_darwin(TupleTypeMetadata);
  uint64_t v129 = (char *)v94 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v127 = (char *)v94 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  NSBundle v128 = (char *)v94 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v39 = (char *)v94 - v38;
  __chkstk_darwin(v37);
  uint64_t v41 = (char *)v94 - v40;
  uint64_t v120 = (char *)v94 + v30[14] - v40;
  uint64_t v42 = v120;
  uint64_t v43 = (char *)v94 + v30[18] - v40;
  uint64_t v124 = (char *)v94 + v30[22] - v40;
  uint64_t v134 = (char *)v94 - v40;
  uint64_t v44 = swift_getAssociatedTypeWitness();
  unint64_t v132 = *(void **)(v44 - 8);
  uint64_t v122 = (void (*)(void))v132[2];
  NSBundle v123 = v132 + 2;
  ((void (*)(char *, uint64_t, uint64_t))v122)(v41, v141, v44);
  uint64_t v141 = swift_getAssociatedTypeWitness();
  uint64_t v131 = *(void **)(v141 - 8);
  uint64_t v119 = (void (*)(char *, char *, uint64_t))v131[2];
  uint64_t v140 = (void (*)(char *, uint64_t))(v131 + 2);
  v119(v42, (char *)v139, v141);
  uint64_t v135 = swift_getAssociatedTypeWitness();
  uint64_t v126 = *(void **)(v135 - 8);
  uint64_t v133 = (void (*)(char *, char *, uint64_t))v126[2];
  uint64_t v139 = (uint64_t (*)(char *, uint64_t))(v126 + 2);
  uint64_t v45 = v43;
  uint64_t v121 = v43;
  v133(v43, (char *)v138, v135);
  uint64_t v46 = swift_getAssociatedTypeWitness();
  uint64_t v130 = *(void **)(v46 - 8);
  uint64_t v47 = (void (*)(char *, char *, uint64_t))v130[2];
  uint64_t v136 = v46;
  Swift::String v137 = v130 + 2;
  Swift::String v138 = v47;
  uint64_t v48 = v124;
  v47(v124, v103, v46);
  uint64_t v49 = v30[14];
  uint64_t v99 = v39;
  uint64_t v50 = &v39[v49];
  uint64_t v103 = &v39[v49];
  uint64_t v102 = &v39[v30[18]];
  uint64_t v51 = v102;
  uint64_t v100 = &v39[v30[22]];
  uint64_t v52 = v100;
  uint64_t v53 = v39;
  uint64_t v125 = v44;
  uint64_t v54 = v122;
  ((void (*)(char *, char *, uint64_t))v122)(v53, v134, v44);
  uint64_t v55 = v50;
  uint64_t v56 = v119;
  v119(v55, v120, v141);
  v133(v51, v45, v135);
  uint64_t v57 = v52;
  uint64_t v58 = v48;
  v138(v57, v48, v136);
  uint64_t v59 = (void (*)(void))v132[4];
  uint64_t v96 = v132 + 4;
  uint64_t v97 = v59;
  ((void (*)(char *, char *, uint64_t))v59)(v101, v99, v44);
  uint64_t v60 = &v128[v30[14]];
  uint64_t v101 = &v128[v30[18]];
  uint64_t v61 = v101;
  uint64_t v99 = &v128[v30[22]];
  uint64_t v62 = v99;
  v54();
  uint64_t v63 = v60;
  uint64_t v64 = v60;
  uint64_t v65 = v120;
  uint64_t v66 = v141;
  v56(v63, v120, v141);
  uint64_t v67 = v135;
  v133(v61, v121, v135);
  uint64_t v68 = v136;
  v138(v62, v58, v136);
  uint64_t v69 = (void (*)(char *, char *, uint64_t))v131[4];
  v94[1] = v131 + 4;
  uint64_t v95 = v69;
  uint64_t v70 = v66;
  v69(v104, v64, v66);
  uint64_t v104 = &v127[v30[14]];
  uint64_t v71 = v104;
  uint64_t v72 = &v127[v30[18]];
  uint64_t v98 = &v127[v30[22]];
  uint64_t v73 = v98;
  v122();
  v119(v71, v65, v70);
  uint64_t v74 = v121;
  v133(v72, v121, v67);
  v138(v73, v58, v68);
  uint64_t v75 = (void (*)(uint64_t, char *, uint64_t))v126[4];
  v75(v105, v72, v67);
  uint64_t v76 = &v129[v30[14]];
  uint64_t v77 = &v129[v30[18]];
  uint64_t v78 = &v129[v30[22]];
  v97();
  uint64_t v79 = v65;
  uint64_t v80 = v141;
  v95(v76, v79, v141);
  v75((uint64_t)v77, v74, v67);
  uint64_t v81 = (void (*)(char *, char *, uint64_t))v130[4];
  v81(v78, v124, v68);
  v81(v108, v78, v68);
  uint64_t v82 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 16))(v112, v109, v82);
  uint64_t v83 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 16))(v116, v113, v83);
  uint64_t v84 = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 16))(v118, v117, v84);
  uint64_t v140 = (void (*)(char *, uint64_t))v126[1];
  v140(v77, v67);
  uint64_t v85 = (void (*)(char *, uint64_t))v131[1];
  uint64_t v86 = v80;
  v85(v76, v80);
  uint64_t v139 = (uint64_t (*)(char *, uint64_t))v85;
  uint64_t v87 = (void (*)(char *, uint64_t))v132[1];
  uint64_t v88 = v125;
  v87(v129, v125);
  uint64_t v89 = (void (*)(char *, uint64_t))v130[1];
  uint64_t v90 = v136;
  v89(v98, v136);
  v85(v104, v86);
  v87(v127, v88);
  v89(v99, v90);
  uint64_t v91 = v135;
  uint64_t v92 = v140;
  v140(v101, v135);
  v87(v128, v88);
  v89(v100, v90);
  v92(v102, v91);
  return v139(v103, v141);
}

uint64_t sub_10005A950()
{
  return _swift_deallocObject(v0, 144, 7);
}

uint64_t sub_10005A960(char *a1, char *a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(char *, uint64_t), void (*a10)(char *, char *, uint64_t), char *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return sub_100059EB0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, *(void *)(v14 + 16), *(void **)(v14 + 24), *(void (**)(char *, char *, uint64_t))(v14 + 32), *(void *)(v14 + 40), *(void *)(v14 + 48),
           *(void *)(v14 + 56),
           *(void *)(v14 + 64),
           *(void *)(v14 + 72),
           *(void *)(v14 + 80),
           *(void (**)(char *, uint64_t))(v14 + 88),
           *(void *)(v14 + 96),
           *(void **)(v14 + 104),
           *(void *)(v14 + 112),
           *(void *)(v14 + 120),
           *(void *)(v14 + 128));
}

uint64_t sub_10005A9B8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v14 = a1 + TupleTypeMetadata[12];
  uint64_t v13 = a1 + TupleTypeMetadata[16];
  uint64_t v12 = a1 + TupleTypeMetadata[20];
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v6 = (int *)swift_getTupleTypeMetadata();
  uint64_t v7 = a1 + v6[12];
  uint64_t v8 = a1 + v6[16];
  uint64_t v9 = a1 + v6[20];
  uint64_t v10 = (int *)swift_getTupleTypeMetadata();
  return a2(a3, a3 + v10[12], a3 + v10[16], a3 + v10[20], a3 + v10[24], a3 + v10[28], a3 + v10[32], a1, v14, v13, v12, v7, v8, v9);
}

uint64_t sub_10005AC28()
{
  swift_release();

  return _swift_deallocObject(v0, 160, 7);
}

uint64_t sub_10005AC60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10005A9B8(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 144), a2);
}

uint64_t sub_10005ACB8(uint64_t a1, uint64_t a2)
{
  return _swift_getAssociatedConformanceWitness(*(void *)(a2 + 56), *(void *)(a2 + 16), a1, &protocol requirements base descriptor for Publisher, &associated conformance descriptor for Publisher.Publisher.Failure: Error);
}

uint64_t sub_10005ACD8(uint64_t a1, uint64_t a2)
{
  return _swift_getAssociatedConformanceWitness(*(void *)(a2 + 64), *(void *)(a2 + 16), a1, &protocol requirements base descriptor for Publisher, &associated conformance descriptor for Publisher.Publisher.Failure: Error);
}

uint64_t sub_10005ACF8(uint64_t a1, uint64_t a2)
{
  return _swift_getAssociatedConformanceWitness(*(void *)(a2 + 72), *(void *)(a2 + 16), a1, &protocol requirements base descriptor for Publisher, &associated conformance descriptor for Publisher.Publisher.Failure: Error);
}

uint64_t sub_10005AD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Publishers.CSCombineLatest7.receive<A>(subscriber:)(a1, a4, a2, a3);
}

uint64_t sub_10005AD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 104);
}

uint64_t sub_10005AD34()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          uint64_t result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            swift_initStructMetadata();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10005AEC4(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = (v5 + v7) & ~v7;
  uint64_t v10 = *(void *)(a3[4] - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  uint64_t v46 = *(void *)(v6 + 64) + v11;
  uint64_t v12 = v46 + v9;
  uint64_t v13 = *(void *)(v10 + 64);
  uint64_t v14 = a3[6];
  uint64_t v15 = v12 & ~v11;
  uint64_t v16 = *(void *)(a3[5] - 8);
  uint64_t v17 = *(_DWORD *)(v16 + 80);
  uint64_t v18 = v13 + v17;
  uint64_t v19 = *(void *)(v16 + 64);
  uint64_t v20 = *(void *)(v14 - 8);
  uint64_t v21 = *(_DWORD *)(v20 + 80);
  uint64_t v22 = v19 + v21;
  unint64_t v23 = ((v19 + v21 + ((v13 + v17 + v15) & ~v17)) & ~v21) + *(void *)(v20 + 64);
  uint64_t v24 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v10 + 80) | *(unsigned char *)(v16 + 80) | *(unsigned char *)(v20 + 80));
  if (v24 <= 7
    && v23 <= 0x18
    && ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v10 + 80) | *(_DWORD *)(v16 + 80) | *(_DWORD *)(v20 + 80)) & 0x100000) == 0)
  {
    uint64_t v44 = a3[5];
    uint64_t v29 = ~v7;
    uint64_t v40 = a3[4];
    uint64_t v41 = ~v11;
    uint64_t v42 = ~v17;
    uint64_t v43 = ~v21;
    uint64_t v39 = a3[3];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    uint64_t v45 = a1;
    unint64_t v31 = ((unint64_t)a1 + v8) & v29;
    unint64_t v32 = ((unint64_t)a2 + v8) & v29;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v31, v32, v39);
    uint64_t v33 = v31 + v46;
    uint64_t v28 = v45;
    uint64_t v34 = v33 & v41;
    unint64_t v35 = (v32 + v46) & v41;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v10 + 16))(v33 & v41, v35, v40);
    uint64_t v36 = (v34 + v18) & v42;
    unint64_t v37 = (v35 + v18) & v42;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v36, v37, v44);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))((v36 + v22) & v43, (v37 + v22) & v43, v14);
  }
  else
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    uint64_t v28 = (uint64_t *)(v27 + ((v24 + 16) & ~v24));
    swift_retain();
  }
  return v28;
}

uint64_t sub_10005B208(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = *(void *)(a2[5] - 8);
  uint64_t v15 = v14 + 8;
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t))(v14 + 8))(v16);
  uint64_t v17 = *(void *)(a2[6] - 8);
  uint64_t v18 = *(uint64_t (**)(unint64_t))(v17 + 8);
  unint64_t v19 = (v16 + *(void *)(v15 + 56) + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);

  return v18(v19);
}

uint64_t sub_10005B378(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 16))((*(void *)(v22 + 48) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 48) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_10005B518(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 24))((*(void *)(v22 + 40) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 40) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_10005B6B8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 32))((*(void *)(v22 + 32) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 32) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_10005B858(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  uint64_t v27 = *(void *)(a3[6] - 8);
  (*(void (**)(unint64_t, unint64_t))(v27 + 40))((*(void *)(v22 + 24) + *(unsigned __int8 *)(v27 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80), (*(void *)(v22 + 24) + *(unsigned __int8 *)(v27 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
  return a1;
}

uint64_t sub_10005B9F8(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v44 = *(void *)(a3[2] - 8);
  unsigned int v5 = *(_DWORD *)(v44 + 84);
  uint64_t v6 = *(void *)(a3[3] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v44 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = *(void *)(a3[4] - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(v9 - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v12) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v16 = *(void *)(a3[6] - 8);
  uint64_t v17 = *(unsigned int *)(v16 + 84);
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v20 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v21 = *(void *)(*(void *)(a3[4] - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v23 = *(unsigned __int8 *)(v16 + 80);
  if (v17 <= v15) {
    unsigned int v24 = v15;
  }
  else {
    unsigned int v24 = *(_DWORD *)(v16 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v25 = *(void *)(*(void *)(a3[2] - 8) + 64) + v18;
  uint64_t v26 = *(void *)(*(void *)(v9 - 8) + 64) + v23;
  int v27 = a2 - v24;
  if (a2 <= v24) {
    goto LABEL_33;
  }
  uint64_t v28 = ((v26 + ((v21 + v22 + ((v19 + v20 + (v25 & ~v18)) & ~v20)) & ~v22)) & ~v23)
      + *(void *)(*(void *)(a3[6] - 8) + 64);
  char v29 = 8 * v28;
  if (v28 > 3) {
    goto LABEL_16;
  }
  unsigned int v31 = ((v27 + ~(-1 << v29)) >> v29) + 1;
  if (HIWORD(v31))
  {
    int v30 = *(_DWORD *)((char *)a1 + v28);
    if (!v30) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v31 > 0xFF)
  {
    int v30 = *(unsigned __int16 *)((char *)a1 + v28);
    if (!*(unsigned __int16 *)((char *)a1 + v28)) {
      goto LABEL_33;
    }
    goto LABEL_23;
  }
  if (v31 >= 2)
  {
LABEL_16:
    int v30 = *((unsigned __int8 *)a1 + v28);
    if (!*((unsigned char *)a1 + v28)) {
      goto LABEL_33;
    }
LABEL_23:
    int v32 = (v30 - 1) << v29;
    if (v28 > 3) {
      int v32 = 0;
    }
    if (v28)
    {
      if (v28 <= 3) {
        int v33 = ((v26 + ((v21 + v22 + ((v19 + v20 + (v25 & ~v18)) & ~v20)) & ~v22)) & ~v23)
      }
            + *(_DWORD *)(*(void *)(a3[6] - 8) + 64);
      else {
        int v33 = 4;
      }
      switch(v33)
      {
        case 2:
          int v34 = *a1;
          break;
        case 3:
          int v34 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v34 = *(_DWORD *)a1;
          break;
        default:
          int v34 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v34 = 0;
    }
    return v24 + (v34 | v32) + 1;
  }
LABEL_33:
  if (!v24) {
    return 0;
  }
  if (v5 == v24)
  {
    unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v44 + 48);
    uint64_t v36 = a1;
    uint64_t v37 = *(unsigned int *)(v44 + 84);
    uint64_t v38 = a3[2];
    return v35(v36, v37, v38);
  }
  unint64_t v40 = ((unint64_t)a1 + v25) & ~v18;
  if (v7 == v24)
  {
    uint64_t v41 = *(uint64_t (**)(unint64_t))(v6 + 48);
    return v41(((unint64_t)a1 + v25) & ~v18);
  }
  else
  {
    if (v11 == v24)
    {
      unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v10 + 48);
      uint64_t v36 = (unsigned __int16 *)((v40 + v19 + v20) & ~v20);
      uint64_t v37 = *(unsigned int *)(v10 + 84);
      uint64_t v38 = a3[4];
      return v35(v36, v37, v38);
    }
    uint64_t v36 = (unsigned __int16 *)((((v40 + v19 + v20) & ~v20) + v21 + v22) & ~v22);
    if (v14 == v24)
    {
      unint64_t v35 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v13 + 48);
      uint64_t v37 = *(unsigned int *)(v13 + 84);
      uint64_t v38 = a3[5];
      return v35(v36, v37, v38);
    }
    unint64_t v42 = ((unint64_t)v36 + v26) & ~v23;
    uint64_t v43 = *(uint64_t (**)(unint64_t, uint64_t))(v16 + 48);
    return v43(v42, v17);
  }
}

void sub_10005BECC(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v39 = *(void *)(a4[2] - 8);
  unsigned int v6 = *(_DWORD *)(v39 + 84);
  uint64_t v7 = *(void *)(a4[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(void *)(a4[4] - 8);
  if (v8 <= v6) {
    unsigned int v10 = *(_DWORD *)(v39 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v11 = *(void *)(a4[4] - 8);
  unsigned int v12 = *(_DWORD *)(v9 + 84);
  if (v12 <= v10) {
    unsigned int v13 = v10;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v14 = a4[6];
  uint64_t v38 = a4[5];
  uint64_t v15 = *(void *)(v38 - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  if (v16 <= v13) {
    unsigned int v17 = v13;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v15 + 84);
  }
  uint64_t v18 = *(void *)(v14 - 8);
  uint64_t v19 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v20 = *(void *)(*(void *)(a4[3] - 8) + 64);
  uint64_t v21 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = *(void *)(v9 + 64);
  uint64_t v23 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v24 = *(unsigned __int8 *)(v18 + 80);
  if (*(_DWORD *)(v18 + 84) <= v17) {
    unsigned int v25 = v17;
  }
  else {
    unsigned int v25 = *(_DWORD *)(v18 + 84);
  }
  uint64_t v26 = *(void *)(*(void *)(a4[2] - 8) + 64) + v19;
  uint64_t v27 = *(void *)(*(void *)(v38 - 8) + 64) + v24;
  size_t v28 = ((v27 + ((v22 + v23 + ((v20 + v21 + (v26 & ~v19)) & ~v21)) & ~v23)) & ~v24)
      + *(void *)(*(void *)(v14 - 8) + 64);
  if (a3 <= v25)
  {
    int v29 = 0;
  }
  else if (v28 <= 3)
  {
    unsigned int v34 = ((a3 - v25 + ~(-1 << (8 * v28))) >> (8 * v28)) + 1;
    if (HIWORD(v34))
    {
      int v29 = 4;
    }
    else if (v34 >= 0x100)
    {
      int v29 = 2;
    }
    else
    {
      int v29 = v34 > 1;
    }
  }
  else
  {
    int v29 = 1;
  }
  if (v25 < a2)
  {
    unsigned int v30 = ~v25 + a2;
    if (v28 < 4)
    {
      int v31 = (v30 >> (8 * v28)) + 1;
      if (v28)
      {
        int v35 = v30 & ~(-1 << (8 * v28));
        bzero(a1, v28);
        if (v28 == 3)
        {
          *(_WORD *)a1 = v35;
          a1[2] = BYTE2(v35);
        }
        else if (v28 == 2)
        {
          *(_WORD *)a1 = v35;
        }
        else
        {
          *a1 = v35;
        }
      }
    }
    else
    {
      bzero(a1, v28);
      *(_DWORD *)a1 = v30;
      int v31 = 1;
    }
    switch(v29)
    {
      case 1:
        a1[v28] = v31;
        return;
      case 2:
        *(_WORD *)&a1[v28] = v31;
        return;
      case 3:
        goto LABEL_62;
      case 4:
        *(_DWORD *)&a1[v28] = v31;
        return;
      default:
        return;
    }
  }
  uint64_t v32 = ~v19;
  uint64_t v33 = ~v24;
  switch(v29)
  {
    case 1:
      a1[v28] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v28] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_62:
      __break(1u);
      JUMPOUT(0x10005C404);
    case 4:
      *(_DWORD *)&a1[v28] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v6 == v25)
        {
          uint64_t v36 = *(void (**)(char *))(v39 + 56);
          uint64_t v37 = a1;
        }
        else
        {
          uint64_t v37 = (char *)((unint64_t)&a1[v26] & v32);
          if (v8 == v25)
          {
            uint64_t v36 = *(void (**)(char *))(v7 + 56);
          }
          else
          {
            uint64_t v37 = (char *)((unint64_t)&v37[v20 + v21] & ~v21);
            if (v12 == v25)
            {
              uint64_t v36 = *(void (**)(char *))(v11 + 56);
            }
            else
            {
              uint64_t v37 = (char *)((unint64_t)&v37[v22 + v23] & ~v23);
              if (v16 == v25)
              {
                uint64_t v36 = *(void (**)(char *))(v15 + 56);
              }
              else
              {
                uint64_t v37 = (char *)((unint64_t)&v37[v27] & v33);
                uint64_t v36 = *(void (**)(char *))(v18 + 56);
              }
            }
          }
        }
        v36(v37);
      }
      return;
  }
}

uint64_t sub_10005C42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 120);
}

uint64_t sub_10005C434()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          uint64_t result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            uint64_t result = swift_checkMetadataState();
            if (v6 <= 0x3F)
            {
              swift_initStructMetadata();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10005C604(uint64_t *a1, uint64_t *a2, void *a3)
{
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = a3[3];
  uint64_t v7 = a3[4];
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v54 = v5 + v9;
  uint64_t v10 = (v5 + v9) & ~v9;
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = *(void *)(v7 - 8);
  uint64_t v13 = *(_DWORD *)(v12 + 80);
  uint64_t v53 = v11 + v13;
  uint64_t v14 = (v11 + v13 + v10) & ~v13;
  uint64_t v15 = *(void *)(v12 + 64);
  uint64_t v55 = *(void *)(a3[5] - 8);
  uint64_t v16 = *(_DWORD *)(v55 + 80);
  uint64_t v52 = v15 + v16;
  uint64_t v17 = (v15 + v16 + v14) & ~v16;
  uint64_t v18 = *(void *)(v55 + 64);
  uint64_t v19 = *(void *)(a3[6] - 8);
  uint64_t v20 = *(_DWORD *)(v19 + 80);
  uint64_t v51 = v18 + v20;
  uint64_t v21 = *(void *)(v19 + 64);
  uint64_t v22 = a3[7];
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(_DWORD *)(v23 + 80);
  uint64_t v25 = v21 + v24;
  unint64_t v26 = ((v21 + v24 + ((v18 + v20 + v17) & ~v20)) & ~v24) + *(void *)(v23 + 64);
  uint64_t v27 = (*(unsigned char *)(v8 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v12 + 80) | *(unsigned char *)(v55 + 80) | *(unsigned char *)(v19 + 80) | *(unsigned char *)(v23 + 80));
  if (v27 <= 7
    && v26 <= 0x18
    && ((*(_DWORD *)(v8 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v12 + 80) | *(_DWORD *)(v55 + 80) | *(_DWORD *)(v19 + 80) | *(_DWORD *)(v23 + 80)) & 0x100000) == 0)
  {
    uint64_t v50 = a3[6];
    uint64_t v32 = *(void *)(v7 - 8);
    uint64_t v33 = ~v9;
    uint64_t v48 = a3[5];
    uint64_t v34 = ~v13;
    uint64_t v45 = a3[4];
    uint64_t v46 = ~v16;
    uint64_t v47 = ~v20;
    uint64_t v49 = ~v24;
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    uint64_t v36 = v6;
    int v31 = a1;
    unint64_t v37 = ((unint64_t)a1 + v54) & v33;
    unint64_t v38 = ((unint64_t)a2 + v54) & v33;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v37, v38, v36);
    unint64_t v39 = (v38 + v53) & v34;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v32 + 16))((v37 + v53) & v34, v39, v45);
    unint64_t v40 = (((v37 + v53) & v34) + v52) & v46;
    unint64_t v41 = (v39 + v52) & v46;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v55 + 16))(v40, v41, v48);
    unint64_t v42 = (v40 + v51) & v47;
    uint64_t v43 = (v41 + v51) & v47;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 16))(v42, v43, v50);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 16))((v42 + v25) & v49, (v43 + v25) & v49, v22);
  }
  else
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    int v31 = (uint64_t *)(v30 + ((v27 + 16) & ~v27));
    swift_retain();
  }
  return v31;
}

uint64_t sub_10005C9F4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = *(void *)(a2[5] - 8);
  uint64_t v15 = v14 + 8;
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t))(v14 + 8))(v16);
  uint64_t v17 = *(void *)(v15 + 56);
  uint64_t v18 = *(void *)(a2[6] - 8);
  uint64_t v19 = v18 + 8;
  unint64_t v20 = (v16 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  (*(void (**)(unint64_t))(v18 + 8))(v20);
  uint64_t v21 = *(void *)(a2[7] - 8);
  uint64_t v22 = *(uint64_t (**)(unint64_t))(v21 + 8);
  unint64_t v23 = (v20 + *(void *)(v19 + 56) + *(unsigned __int8 *)(v21 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);

  return v22(v23);
}

uint64_t sub_10005CBA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 48);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 16;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v32, v33);
  uint64_t v34 = *(void *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v34 + 16))((*(void *)(v29 + 48) + *(unsigned __int8 *)(v34 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80), (*(void *)(v29 + 48) + *(unsigned __int8 *)(v34 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
  return a1;
}

uint64_t sub_10005CD98(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 40);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 24;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 24))(v32, v33);
  uint64_t v34 = *(void *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v34 + 24))((*(void *)(v29 + 40) + *(unsigned __int8 *)(v34 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80), (*(void *)(v29 + 40) + *(unsigned __int8 *)(v34 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
  return a1;
}

uint64_t sub_10005CF88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 32);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 32;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 32))(v32, v33);
  uint64_t v34 = *(void *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v34 + 32))((*(void *)(v29 + 32) + *(unsigned __int8 *)(v34 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80), (*(void *)(v29 + 32) + *(unsigned __int8 *)(v34 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
  return a1;
}

uint64_t sub_10005D178(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 24);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 40;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 40))(v32, v33);
  uint64_t v34 = *(void *)(a3[7] - 8);
  (*(void (**)(unint64_t, unint64_t))(v34 + 40))((*(void *)(v29 + 24) + *(unsigned __int8 *)(v34 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80), (*(void *)(v29 + 24) + *(unsigned __int8 *)(v34 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
  return a1;
}

uint64_t sub_10005D368(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v55 = a3[2];
  uint64_t v54 = *(void *)(v55 - 8);
  unsigned int v5 = *(_DWORD *)(v54 + 84);
  uint64_t v6 = *(void *)(a3[3] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = a3[5];
  uint64_t v52 = v8;
  uint64_t v53 = a3[4];
  uint64_t v9 = *(void *)(v53 - 8);
  if (v7 <= v5) {
    unsigned int v10 = *(_DWORD *)(v54 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v11 = *(unsigned int *)(v9 + 84);
  if (v11 <= v10) {
    unsigned int v12 = v10;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v13 = *(void *)(v8 - 8);
  unsigned int v14 = *(_DWORD *)(v13 + 84);
  if (v14 <= v12) {
    unsigned int v15 = v12;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v50 = a3[7];
  uint64_t v51 = a3[6];
  uint64_t v16 = *(void *)(v51 - 8);
  unsigned int v17 = *(_DWORD *)(v16 + 84);
  uint64_t v18 = *(void *)(v50 - 8);
  if (v17 <= v15) {
    unsigned int v19 = v15;
  }
  else {
    unsigned int v19 = *(_DWORD *)(v16 + 84);
  }
  uint64_t v20 = *(unsigned int *)(v18 + 84);
  uint64_t v21 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v56 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v23 = *(void *)(v9 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v25 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v26 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v27 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v28 = *(void *)(v18 + 64);
  if (v20 > v19) {
    unsigned int v19 = *(_DWORD *)(v18 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v29 = *(void *)(*(void *)(v55 - 8) + 64) + v21;
  uint64_t v30 = v25 + v26;
  uint64_t v31 = *(void *)(*(void *)(v51 - 8) + 64) + v27;
  int v32 = a2 - v19;
  if (a2 <= v19) {
    goto LABEL_35;
  }
  uint64_t v33 = (v31 + ((v30 + ((v23 + v24 + ((v56 + v22 + (v29 & ~v21)) & ~v22)) & ~v24)) & ~v26)) & ~v27;
  uint64_t v34 = v33 + v28;
  char v35 = 8 * (v33 + v28);
  if (v34 > 3) {
    goto LABEL_18;
  }
  unsigned int v37 = ((v32 + ~(-1 << v35)) >> v35) + 1;
  if (HIWORD(v37))
  {
    int v36 = *(_DWORD *)((char *)a1 + v34);
    if (!v36) {
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  if (v37 > 0xFF)
  {
    int v36 = *(unsigned __int16 *)((char *)a1 + v34);
    if (!*(unsigned __int16 *)((char *)a1 + v34)) {
      goto LABEL_35;
    }
    goto LABEL_25;
  }
  if (v37 >= 2)
  {
LABEL_18:
    int v36 = *((unsigned __int8 *)a1 + v34);
    if (!*((unsigned char *)a1 + v34)) {
      goto LABEL_35;
    }
LABEL_25:
    int v38 = (v36 - 1) << v35;
    if (v34 > 3) {
      int v38 = 0;
    }
    if (v34)
    {
      if (v34 <= 3) {
        int v39 = v34;
      }
      else {
        int v39 = 4;
      }
      switch(v39)
      {
        case 2:
          int v40 = *a1;
          break;
        case 3:
          int v40 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v40 = *(_DWORD *)a1;
          break;
        default:
          int v40 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v40 = 0;
    }
    return v19 + (v40 | v38) + 1;
  }
LABEL_35:
  if (!v19) {
    return 0;
  }
  if (v5 == v19)
  {
    uint64_t v41 = v55;
    unint64_t v42 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v43 = a1;
    uint64_t v44 = *(unsigned int *)(v54 + 84);
    return v42(v43, v44, v41);
  }
  unint64_t v46 = ((unint64_t)a1 + v29) & ~v21;
  if (v7 == v19)
  {
    uint64_t v47 = *(uint64_t (**)(unint64_t))(v6 + 48);
    return v47(((unint64_t)a1 + v29) & ~v21);
  }
  else
  {
    if (v11 == v19)
    {
      unint64_t v42 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 48);
      uint64_t v43 = (unsigned __int16 *)((v46 + v56 + v22) & ~v22);
      uint64_t v44 = v11;
      uint64_t v41 = v53;
      return v42(v43, v44, v41);
    }
    uint64_t v43 = (unsigned __int16 *)((((v46 + v56 + v22) & ~v22) + v23 + v24) & ~v24);
    if (v14 == v19)
    {
      unint64_t v42 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v13 + 48);
      uint64_t v44 = *(unsigned int *)(v13 + 84);
      uint64_t v41 = v52;
      return v42(v43, v44, v41);
    }
    uint64_t v43 = (unsigned __int16 *)(((unint64_t)v43 + v30) & ~v26);
    if (v17 == v19)
    {
      unint64_t v42 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v16 + 48);
      uint64_t v44 = *(unsigned int *)(v16 + 84);
      uint64_t v41 = v51;
      return v42(v43, v44, v41);
    }
    unint64_t v48 = ((unint64_t)v43 + v31) & ~v27;
    uint64_t v49 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 48);
    return v49(v48, v20, v50);
  }
}

void sub_10005D8FC(unsigned char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  uint64_t v52 = v6;
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(a4[3] - 8);
  uint64_t v9 = v8;
  unsigned int v10 = *(_DWORD *)(v8 + 84);
  if (v10 <= v7) {
    unsigned int v11 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v11 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v51 = a4[4];
  uint64_t v12 = *(void *)(v51 - 8);
  unsigned int v13 = *(_DWORD *)(v12 + 84);
  uint64_t v14 = *(void *)(a4[5] - 8);
  if (v13 <= v11) {
    unsigned int v15 = v11;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v12 + 84);
  }
  uint64_t v16 = *(void *)(a4[5] - 8);
  unsigned int v50 = *(_DWORD *)(v14 + 84);
  if (v50 <= v15) {
    unsigned int v17 = v15;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v14 + 84);
  }
  uint64_t v18 = *(void *)(a4[6] - 8);
  uint64_t v19 = v18;
  unsigned int v20 = *(_DWORD *)(v18 + 84);
  unsigned int v49 = v20;
  if (v20 <= v17) {
    unsigned int v20 = v17;
  }
  uint64_t v21 = *(void *)(a4[7] - 8);
  uint64_t v22 = *(void *)(v6 + 64);
  uint64_t v23 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = *(void *)(v8 + 64);
  uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = *(void *)(*(void *)(v51 - 8) + 64);
  uint64_t v27 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v28 = *(void *)(v14 + 64);
  uint64_t v29 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v30 = *(void *)(v18 + 64);
  uint64_t v31 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v32 = v22 + v23;
  uint64_t v33 = v28 + v29;
  uint64_t v34 = v30 + v31;
  size_t v35 = ((v34 + ((v28 + v29 + ((v26 + v27 + ((v24 + v25 + ((v22 + v23) & ~v23)) & ~v25)) & ~v27)) & ~v29)) & ~v31)
      + *(void *)(v21 + 64);
  if (*(_DWORD *)(v21 + 84) <= v20) {
    unsigned int v36 = v20;
  }
  else {
    unsigned int v36 = *(_DWORD *)(v21 + 84);
  }
  if (a3 <= v36)
  {
    int v37 = 0;
  }
  else if (v35 <= 3)
  {
    unsigned int v43 = ((a3 - v36 + ~(-1 << (8 * v35))) >> (8 * v35)) + 1;
    if (HIWORD(v43))
    {
      int v37 = 4;
    }
    else if (v43 >= 0x100)
    {
      int v37 = 2;
    }
    else
    {
      int v37 = v43 > 1;
    }
  }
  else
  {
    int v37 = 1;
  }
  if (v36 < a2)
  {
    unsigned int v38 = ~v36 + a2;
    if (v35 < 4)
    {
      int v39 = (v38 >> (8 * v35)) + 1;
      if (v35)
      {
        int v44 = v38 & ~(-1 << (8 * v35));
        bzero(a1, v35);
        if (v35 == 3)
        {
          *(_WORD *)a1 = v44;
          a1[2] = BYTE2(v44);
        }
        else if (v35 == 2)
        {
          *(_WORD *)a1 = v44;
        }
        else
        {
          *a1 = v44;
        }
      }
    }
    else
    {
      bzero(a1, v35);
      *(_DWORD *)a1 = v38;
      int v39 = 1;
    }
    switch(v37)
    {
      case 1:
        a1[v35] = v39;
        return;
      case 2:
        *(_WORD *)&a1[v35] = v39;
        return;
      case 3:
        goto LABEL_65;
      case 4:
        *(_DWORD *)&a1[v35] = v39;
        return;
      default:
        return;
    }
  }
  uint64_t v40 = ~v23;
  uint64_t v41 = ~v29;
  uint64_t v42 = ~v31;
  switch(v37)
  {
    case 1:
      a1[v35] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v35] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_65:
      __break(1u);
      JUMPOUT(0x10005DEBCLL);
    case 4:
      *(_DWORD *)&a1[v35] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (!a2) {
        return;
      }
LABEL_35:
      if (v7 == v36)
      {
        uint64_t v45 = *(void (**)(unsigned char *))(v52 + 56);
        unint64_t v46 = a1;
        goto LABEL_37;
      }
      unint64_t v46 = (unsigned char *)((unint64_t)&a1[v32] & v40);
      if (v10 == v36)
      {
        uint64_t v45 = *(void (**)(unsigned char *))(v9 + 56);
        goto LABEL_61;
      }
      unint64_t v46 = (unsigned char *)((unint64_t)&v46[v24 + v25] & ~v25);
      if (v13 == v36)
      {
        uint64_t v45 = *(void (**)(unsigned char *))(v12 + 56);
        goto LABEL_37;
      }
      unint64_t v46 = (unsigned char *)((unint64_t)&v46[v26 + v27] & ~v27);
      if (v50 == v36)
      {
        uint64_t v45 = *(void (**)(unsigned char *))(v16 + 56);
LABEL_37:
LABEL_61:
        v45(v46);
        return;
      }
      unint64_t v46 = (unsigned char *)((unint64_t)&v46[v33] & v41);
      if (v49 == v36)
      {
        uint64_t v45 = *(void (**)(unsigned char *))(v19 + 56);
        goto LABEL_61;
      }
      unint64_t v47 = (unint64_t)&v46[v34] & v42;
      unint64_t v48 = *(void (**)(unint64_t))(v21 + 56);
      v48(v47);
      return;
  }
}

uint64_t sub_10005DEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 144);
}

uint64_t sub_10005DEEC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        uint64_t result = swift_checkMetadataState();
        if (v4 <= 0x3F)
        {
          uint64_t result = swift_checkMetadataState();
          if (v5 <= 0x3F)
          {
            uint64_t result = swift_checkMetadataState();
            if (v6 <= 0x3F)
            {
              uint64_t result = swift_checkMetadataState();
              if (v7 <= 0x3F)
              {
                swift_initStructMetadata();
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10005E0FC(uint64_t *a1, uint64_t *a2, void *a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(a3[3] - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v47 = *(void *)(a3[4] - 8);
  uint64_t v7 = a3[5];
  uint64_t v45 = *(void *)(v7 - 8);
  int v8 = *(_DWORD *)(v45 + 80);
  uint64_t v46 = a3[6];
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = a3[7];
  uint64_t v41 = *(void *)(v44 - 8);
  int v9 = *(_DWORD *)(v41 + 80);
  uint64_t v42 = a3[8];
  uint64_t v39 = *(void *)(v42 - 8);
  int v10 = *(_DWORD *)(v39 + 80);
  uint64_t v11 = *(void *)(v5 + 64) + *(_DWORD *)(v47 + 80);
  uint64_t v40 = *(void *)(v4 + 64) + v6;
  uint64_t v12 = *(void *)(v47 + 64) + v8;
  uint64_t v13 = *(void *)(v45 + 64) + *(_DWORD *)(v43 + 80);
  uint64_t v14 = *(void *)(v43 + 64) + v9;
  uint64_t v15 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v4 + 80) | *(unsigned char *)(v47 + 80) | v8 | *(unsigned char *)(v43 + 80) | v9 | v10);
  if (v15 <= 7
    && ((*(void *)(*(void *)(v44 - 8) + 64)
       + *(_DWORD *)(v39 + 80)
       + ((v14
         + ((v13
           + ((v12 + ((v11 + (v40 & ~v6)) & ~(unint64_t)*(_DWORD *)(v47 + 80))) & ~(unint64_t)*(_DWORD *)(v45 + 80))) & ~(unint64_t)*(_DWORD *)(v43 + 80))) & ~(unint64_t)*(_DWORD *)(v41 + 80))) & ~(unint64_t)*(_DWORD *)(v39 + 80))
     + *(void *)(*(void *)(v42 - 8) + 64) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v47 + 80) | v8 | *(_DWORD *)(v43 + 80) | v9 | v10) & 0x100000) == 0)
  {
    uint64_t v19 = ~v6;
    unint64_t v32 = ~(unint64_t)*(_DWORD *)(v47 + 80);
    unint64_t v33 = ~(unint64_t)v8;
    uint64_t v34 = a3[4];
    unint64_t v35 = ~(unint64_t)*(_DWORD *)(v43 + 80);
    uint64_t v36 = *(void *)(*(void *)(v44 - 8) + 64) + *(_DWORD *)(v39 + 80);
    unint64_t v37 = ~(unint64_t)v9;
    unint64_t v38 = ~(unint64_t)*(_DWORD *)(v39 + 80);
    uint64_t v20 = a3[3];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    unint64_t v22 = ((unint64_t)v3 + v40) & v19;
    unint64_t v23 = ((unint64_t)a2 + v40) & v19;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v22, v23, v20);
    unint64_t v24 = (v23 + v11) & v32;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v47 + 16))((v22 + v11) & v32, v24, v34);
    unint64_t v25 = (((v22 + v11) & v32) + v12) & v33;
    unint64_t v26 = (v24 + v12) & v33;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v45 + 16))(v25, v26, v7);
    unint64_t v27 = (v25 + v13) & v35;
    unint64_t v28 = (v26 + v13) & v35;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v43 + 16))(v27, v28, v46);
    unint64_t v29 = (v27 + v14) & v37;
    unint64_t v30 = (v28 + v14) & v37;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v41 + 16))(v29, v30, v44);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v39 + 16))((v29 + v36) & v38, (v30 + v36) & v38, v42);
  }
  else
  {
    uint64_t v18 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v18 + ((v15 + 16) & ~v15));
    swift_retain();
  }
  return v3;
}

uint64_t sub_10005E58C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(v7 + 56);
  uint64_t v10 = *(void *)(a2[4] - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t))(v10 + 8))(v12);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = *(void *)(a2[5] - 8);
  uint64_t v15 = v14 + 8;
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  (*(void (**)(unint64_t))(v14 + 8))(v16);
  uint64_t v17 = *(void *)(v15 + 56);
  uint64_t v18 = *(void *)(a2[6] - 8);
  uint64_t v19 = v18 + 8;
  unint64_t v20 = (v16 + v17 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  (*(void (**)(unint64_t))(v18 + 8))(v20);
  uint64_t v21 = *(void *)(v19 + 56);
  uint64_t v22 = *(void *)(a2[7] - 8);
  uint64_t v23 = v22 + 8;
  unint64_t v24 = (v20 + v21 + *(unsigned __int8 *)(v22 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  (*(void (**)(unint64_t))(v22 + 8))(v24);
  uint64_t v25 = *(void *)(a2[8] - 8);
  unint64_t v26 = *(uint64_t (**)(unint64_t))(v25 + 8);
  unint64_t v27 = (v24 + *(void *)(v23 + 56) + *(unsigned __int8 *)(v25 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);

  return v26(v27);
}

uint64_t sub_10005E784(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 16;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 48);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 16;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v32, v33);
  uint64_t v34 = *(void *)(v29 + 48);
  uint64_t v35 = *(void *)(a3[7] - 8);
  uint64_t v36 = v35 + 16;
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = v34 + v37;
  uint64_t v39 = (v38 + v32) & ~v37;
  uint64_t v40 = (v38 + v33) & ~v37;
  (*(void (**)(uint64_t, uint64_t))(v35 + 16))(v39, v40);
  uint64_t v41 = *(void *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v41 + 16))((*(void *)(v36 + 48) + *(unsigned __int8 *)(v41 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80), (*(void *)(v36 + 48) + *(unsigned __int8 *)(v41 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
  return a1;
}

uint64_t sub_10005E9C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 24;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 40);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 24;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 24))(v32, v33);
  uint64_t v34 = *(void *)(v29 + 40);
  uint64_t v35 = *(void *)(a3[7] - 8);
  uint64_t v36 = v35 + 24;
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = v34 + v37;
  uint64_t v39 = (v38 + v32) & ~v37;
  uint64_t v40 = (v38 + v33) & ~v37;
  (*(void (**)(uint64_t, uint64_t))(v35 + 24))(v39, v40);
  uint64_t v41 = *(void *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v41 + 24))((*(void *)(v36 + 40) + *(unsigned __int8 *)(v41 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80), (*(void *)(v36 + 40) + *(unsigned __int8 *)(v41 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
  return a1;
}

uint64_t sub_10005EC04(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 32);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 32;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 32);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 32;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 32))(v32, v33);
  uint64_t v34 = *(void *)(v29 + 32);
  uint64_t v35 = *(void *)(a3[7] - 8);
  uint64_t v36 = v35 + 32;
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = v34 + v37;
  uint64_t v39 = (v38 + v32) & ~v37;
  uint64_t v40 = (v38 + v33) & ~v37;
  (*(void (**)(uint64_t, uint64_t))(v35 + 32))(v39, v40);
  uint64_t v41 = *(void *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v41 + 32))((*(void *)(v36 + 32) + *(unsigned __int8 *)(v41 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80), (*(void *)(v36 + 32) + *(unsigned __int8 *)(v41 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
  return a1;
}

uint64_t sub_10005EE44(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 24);
  uint64_t v21 = *(void *)(a3[5] - 8);
  uint64_t v22 = v21 + 40;
  uint64_t v23 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v24 = v20 + v23;
  uint64_t v25 = (v24 + v18) & ~v23;
  uint64_t v26 = (v24 + v19) & ~v23;
  (*(void (**)(uint64_t, uint64_t))(v21 + 40))(v25, v26);
  uint64_t v27 = *(void *)(v22 + 24);
  uint64_t v28 = *(void *)(a3[6] - 8);
  uint64_t v29 = v28 + 40;
  uint64_t v30 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = v27 + v30;
  uint64_t v32 = (v31 + v25) & ~v30;
  uint64_t v33 = (v31 + v26) & ~v30;
  (*(void (**)(uint64_t, uint64_t))(v28 + 40))(v32, v33);
  uint64_t v34 = *(void *)(v29 + 24);
  uint64_t v35 = *(void *)(a3[7] - 8);
  uint64_t v36 = v35 + 40;
  uint64_t v37 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v38 = v34 + v37;
  uint64_t v39 = (v38 + v32) & ~v37;
  uint64_t v40 = (v38 + v33) & ~v37;
  (*(void (**)(uint64_t, uint64_t))(v35 + 40))(v39, v40);
  uint64_t v41 = *(void *)(a3[8] - 8);
  (*(void (**)(unint64_t, unint64_t))(v41 + 40))((*(void *)(v36 + 24) + *(unsigned __int8 *)(v41 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80), (*(void *)(v36 + 24) + *(unsigned __int8 *)(v41 + 80) + v40) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
  return a1;
}

uint64_t sub_10005F084(unsigned __int16 *a1, unsigned int a2, void *a3)
{
  uint64_t v58 = a3[2];
  uint64_t v56 = a3[3];
  uint64_t v57 = *(void *)(v58 - 8);
  unsigned int v5 = *(_DWORD *)(v57 + 84);
  uint64_t v6 = *(void *)(v56 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= v5) {
    unsigned int v8 = *(_DWORD *)(v57 + 84);
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = a3[5];
  uint64_t v54 = a3[4];
  uint64_t v10 = *(void *)(v54 - 8);
  unsigned int v55 = *(_DWORD *)(v10 + 84);
  if (v55 > v8) {
    unsigned int v8 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v11 = *(void *)(v9 - 8);
  unsigned int v53 = *(_DWORD *)(v11 + 84);
  if (v53 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v13 = *(void *)(a3[6] - 8);
  unsigned int v52 = *(_DWORD *)(v13 + 84);
  if (v52 <= v12) {
    unsigned int v14 = v12;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v49 = a3[8];
  uint64_t v50 = a3[7];
  uint64_t v15 = *(void *)(v50 - 8);
  unsigned int v16 = *(_DWORD *)(v15 + 84);
  unsigned int v51 = v16;
  if (v16 <= v14) {
    unsigned int v16 = v14;
  }
  uint64_t v17 = *(void *)(a3[8] - 8);
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v20 = v13;
  uint64_t v21 = *(void *)(*(void *)(v54 - 8) + 64);
  uint64_t v22 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = *(void *)(v13 + 64);
  uint64_t v25 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v26 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v27 = *(void *)(v17 + 64);
  if (*(_DWORD *)(v17 + 84) <= v16) {
    unsigned int v28 = v16;
  }
  else {
    unsigned int v28 = *(_DWORD *)(v17 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v29 = *(void *)(*(void *)(v56 - 8) + 64);
  uint64_t v30 = *(void *)(*(void *)(v58 - 8) + 64) + v18;
  uint64_t v31 = *(void *)(*(void *)(v9 - 8) + 64) + v23;
  uint64_t v32 = v24 + v25;
  uint64_t v33 = *(void *)(*(void *)(v50 - 8) + 64) + v26;
  unsigned int v34 = a2 - v28;
  if (a2 <= v28) {
    goto LABEL_37;
  }
  uint64_t v35 = (v33 + ((v32 + ((v31 + ((v21 + v22 + ((v29 + v19 + (v30 & ~v18)) & ~v19)) & ~v22)) & ~v23)) & ~v25)) & ~v26;
  uint64_t v36 = v35 + v27;
  char v37 = 8 * (v35 + v27);
  if (v36 > 3) {
    goto LABEL_20;
  }
  unsigned int v39 = ((v34 + ~(-1 << v37)) >> v37) + 1;
  if (HIWORD(v39))
  {
    int v38 = *(_DWORD *)((char *)a1 + v36);
    if (!v38) {
      goto LABEL_37;
    }
    goto LABEL_27;
  }
  if (v39 > 0xFF)
  {
    int v38 = *(unsigned __int16 *)((char *)a1 + v36);
    if (!*(unsigned __int16 *)((char *)a1 + v36)) {
      goto LABEL_37;
    }
    goto LABEL_27;
  }
  if (v39 >= 2)
  {
LABEL_20:
    int v38 = *((unsigned __int8 *)a1 + v36);
    if (!*((unsigned char *)a1 + v36)) {
      goto LABEL_37;
    }
LABEL_27:
    int v40 = (v38 - 1) << v37;
    if (v36 > 3) {
      int v40 = 0;
    }
    if (v36)
    {
      if (v36 <= 3) {
        int v41 = v36;
      }
      else {
        int v41 = 4;
      }
      switch(v41)
      {
        case 2:
          int v42 = *a1;
          break;
        case 3:
          int v42 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v42 = *(_DWORD *)a1;
          break;
        default:
          int v42 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v42 = 0;
    }
    return v28 + (v42 | v40) + 1;
  }
LABEL_37:
  if (!v28) {
    return 0;
  }
  if (v5 == v28)
  {
    uint64_t v43 = v58;
    uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v57 + 48);
    uint64_t v7 = *(unsigned int *)(v57 + 84);
    goto LABEL_57;
  }
  unint64_t v46 = ((unint64_t)a1 + v30) & ~v18;
  if (v7 == v28)
  {
    uint64_t v43 = v56;
    uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(*(void *)(v56 - 8) + 48);
    a1 = (unsigned __int16 *)(((unint64_t)a1 + v30) & ~v18);
    goto LABEL_57;
  }
  uint64_t v7 = v55;
  if (v55 == v28)
  {
    uint64_t v43 = v54;
    uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(*(void *)(v54 - 8) + 48);
    a1 = (unsigned __int16 *)((v46 + v29 + v19) & ~v19);
    goto LABEL_57;
  }
  a1 = (unsigned __int16 *)((((v46 + v29 + v19) & ~v19) + v21 + v22) & ~v22);
  uint64_t v7 = v53;
  if (v53 == v28)
  {
    uint64_t v43 = v9;
    uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    goto LABEL_57;
  }
  unint64_t v47 = ((unint64_t)a1 + v31) & ~v23;
  if (v52 != v28)
  {
    a1 = (unsigned __int16 *)((v32 + v47) & ~v25);
    uint64_t v7 = v51;
    if (v51 != v28)
    {
      a1 = (unsigned __int16 *)(((unint64_t)a1 + v33) & ~v26);
      uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v17 + 48);
      uint64_t v7 = *(unsigned int *)(v17 + 84);
      uint64_t v43 = v49;
      return v44(a1, v7, v43);
    }
    uint64_t v44 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v15 + 48);
    uint64_t v43 = v50;
LABEL_57:
    return v44(a1, v7, v43);
  }
  unint64_t v48 = *(uint64_t (**)(unint64_t))(v20 + 48);
  return v48(v47);
}

void sub_10005F620(unsigned char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v56 = *(void *)(a4[2] - 8);
  unsigned int v5 = *(_DWORD *)(v56 + 84);
  uint64_t v6 = *(void *)(a4[3] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v55 = v7;
  if (v7 <= v5) {
    unsigned int v7 = *(_DWORD *)(v56 + 84);
  }
  uint64_t v52 = a4[4];
  uint64_t v8 = *(void *)(v52 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  unsigned int v54 = v9;
  if (v9 <= v7) {
    unsigned int v9 = v7;
  }
  uint64_t v49 = a4[5];
  uint64_t v10 = *(void *)(v49 - 8);
  uint64_t v11 = *(void *)(a4[6] - 8);
  unsigned int v50 = *(_DWORD *)(v10 + 84);
  if (v50 > v9) {
    unsigned int v9 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v12 = *(void *)(a4[6] - 8);
  unsigned int v48 = *(_DWORD *)(v11 + 84);
  if (v48 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v11 + 84);
  }
  uint64_t v46 = a4[7];
  uint64_t v14 = *(void *)(v46 - 8);
  unsigned int v47 = *(_DWORD *)(v14 + 84);
  if (v47 <= v13) {
    unsigned int v15 = v13;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v14 + 84);
  }
  uint64_t v16 = *(void *)(a4[8] - 8);
  uint64_t v17 = *(void *)(*(void *)(a4[2] - 8) + 64);
  uint64_t v53 = *(void *)(a4[3] - 8);
  uint64_t v18 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = *(void *)(v53 + 64);
  uint64_t v51 = *(void *)(v52 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v21 = *(void *)(v51 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v23 = *(void *)(*(void *)(v49 - 8) + 64);
  uint64_t v24 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v25 = *(void *)(v11 + 64);
  uint64_t v26 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v27 = *(void *)(*(void *)(v46 - 8) + 64);
  uint64_t v28 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v29 = v17 + v18;
  uint64_t v30 = v23 + v24;
  uint64_t v31 = v25 + v26;
  size_t v32 = ((v27
        + v28
        + ((v25 + v26 + ((v23 + v24 + ((v21 + v22 + ((v19 + v20 + ((v17 + v18) & ~v18)) & ~v20)) & ~v22)) & ~v24)) & ~v26)) & ~v28)
      + *(void *)(v16 + 64);
  if (*(_DWORD *)(v16 + 84) <= v15) {
    unsigned int v33 = v15;
  }
  else {
    unsigned int v33 = *(_DWORD *)(v16 + 84);
  }
  if (a3 <= v33)
  {
    int v34 = 0;
  }
  else if (v32 <= 3)
  {
    unsigned int v39 = ((a3 - v33 + ~(-1 << (8 * v32))) >> (8 * v32)) + 1;
    if (HIWORD(v39))
    {
      int v34 = 4;
    }
    else if (v39 >= 0x100)
    {
      int v34 = 2;
    }
    else
    {
      int v34 = v39 > 1;
    }
  }
  else
  {
    int v34 = 1;
  }
  if (v33 < a2)
  {
    unsigned int v35 = ~v33 + a2;
    if (v32 < 4)
    {
      int v36 = (v35 >> (8 * v32)) + 1;
      if (v32)
      {
        int v40 = v35 & ~(-1 << (8 * v32));
        bzero(a1, v32);
        if (v32 == 3)
        {
          *(_WORD *)a1 = v40;
          a1[2] = BYTE2(v40);
        }
        else if (v32 == 2)
        {
          *(_WORD *)a1 = v40;
        }
        else
        {
          *a1 = v40;
        }
      }
    }
    else
    {
      bzero(a1, v32);
      *(_DWORD *)a1 = v35;
      int v36 = 1;
    }
    switch(v34)
    {
      case 1:
        a1[v32] = v36;
        return;
      case 2:
        *(_WORD *)&a1[v32] = v36;
        return;
      case 3:
        goto LABEL_67;
      case 4:
        *(_DWORD *)&a1[v32] = v36;
        return;
      default:
        return;
    }
  }
  uint64_t v37 = ~v18;
  uint64_t v38 = ~v26;
  switch(v34)
  {
    case 1:
      a1[v32] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 2:
      *(_WORD *)&a1[v32] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_36;
    case 3:
LABEL_67:
      __break(1u);
      JUMPOUT(0x10005FC58);
    case 4:
      *(_DWORD *)&a1[v32] = 0;
      goto LABEL_35;
    default:
LABEL_35:
      if (!a2) {
        return;
      }
LABEL_36:
      if (v5 == v33)
      {
        int v41 = *(void (**)(unsigned char *))(v56 + 56);
        int v42 = a1;
        goto LABEL_55;
      }
      int v42 = (unsigned char *)((unint64_t)&a1[v29] & v37);
      if (v55 == v33)
      {
        int v41 = *(void (**)(unsigned char *))(v53 + 56);
        goto LABEL_55;
      }
      int v42 = (unsigned char *)((unint64_t)&v42[v19 + v20] & ~v20);
      if (v54 == v33)
      {
        uint64_t v43 = v51;
LABEL_54:
        int v41 = *(void (**)(unsigned char *))(v43 + 56);
        goto LABEL_55;
      }
      int v42 = (unsigned char *)((unint64_t)&v42[v21 + v22] & ~v22);
      if (v50 == v33)
      {
        uint64_t v43 = v10;
        goto LABEL_54;
      }
      unint64_t v44 = (unint64_t)&v42[v30] & ~v24;
      if (v48 != v33)
      {
        int v42 = (unsigned char *)((v31 + v44) & v38);
        if (v47 != v33)
        {
          int v42 = (unsigned char *)((unint64_t)&v42[v27 + v28] & ~v28);
          int v41 = *(void (**)(unsigned char *))(v16 + 56);
          goto LABEL_57;
        }
        int v41 = *(void (**)(unsigned char *))(v14 + 56);
LABEL_55:
LABEL_57:
        v41(v42);
        return;
      }
      uint64_t v45 = *(void (**)(unint64_t))(v12 + 56);
      v45(v44);
      return;
  }
}

uint64_t sub_10005FC80()
{
  return sub_100043B48();
}

uint64_t sub_10005FC94()
{
  v1[2] = v0;
  uint64_t v2 = sub_100064380();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  sub_100064870();
  v1[6] = sub_100064860();
  uint64_t v4 = sub_100064830();
  v1[7] = v4;
  v1[8] = v3;
  return _swift_task_switch(sub_10005FD88, v4, v3);
}

uint64_t sub_10005FD88()
{
  *(void *)(v0 + 72) = 10;
  sub_100064360();
  swift_retain_n();
  unint64_t v1 = sub_100064370();
  os_log_type_t v2 = sub_100064930();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109376;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    int v4 = *(unsigned __int8 *)(v0 + 89);
    swift_release();
    *(_DWORD *)(v3 + 4) = v4 != 2;
    swift_release();
    *(_WORD *)(v3 + 8) = 2048;
    *(void *)(v3 + 10) = 10;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "waitForCurrentUserInvitingFromShare completed: %{BOOL}d, retriesLeft: %ld", (uint8_t *)v3, 0x12u);
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(void, void))(*(void *)(v0 + 32) + 8))(*(void *)(v0 + 40), *(void *)(v0 + 24));
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 88) == 2)
  {
    return _swift_task_switch(sub_10005FFE0, 0, 0);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    unsigned int v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_10005FFE0()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  void *v1 = v0;
  v1[1] = sub_100060078;
  return static Task<>.sleep(nanoseconds:)(10000000);
}

uint64_t sub_100060078()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v4 = *(void *)(v2 + 64);
    unsigned int v5 = sub_10006401C;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 56);
    uint64_t v4 = *(void *)(v2 + 64);
    unsigned int v5 = sub_10006019C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10006019C(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 72);
  uint64_t v5 = v4 - 1;
  if (v4 == 1)
  {
    swift_release();
    sub_10000700C();
    swift_allocError();
    *(void *)uint64_t v12 = 0xD000000000000026;
    *(void *)(v12 + 8) = 0x800000010006B370;
    *(_OWORD *)(v12 + 16) = xmmword_1000689F0;
    *(void *)(v12 + 32) = 0x800000010006B3A0;
    *(unsigned char *)(v12 + 40) = 11;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v3 + 8);
  }
  else
  {
    if (v4 < 2)
    {
      __break(1u);
      return _swift_task_switch(a1, a2, a3);
    }
    *(void *)(v3 + 72) = v5;
    sub_100064360();
    swift_retain_n();
    uint64_t v6 = sub_100064370();
    os_log_type_t v7 = sub_100064930();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109376;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      int v9 = *(unsigned __int8 *)(v3 + 89);
      swift_release();
      *(_DWORD *)(v8 + 4) = v9 != 2;
      swift_release();
      *(_WORD *)(v8 + 8) = 2048;
      *(void *)(v8 + 10) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "waitForCurrentUserInvitingFromShare completed: %{BOOL}d, retriesLeft: %ld", (uint8_t *)v8, 0x12u);
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(void, void))(*(void *)(v3 + 32) + 8))(*(void *)(v3 + 40), *(void *)(v3 + 24));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v3 + 88) == 2)
    {
      a1 = sub_10005FFE0;
      a2 = 0;
      a3 = 0;
      return _swift_task_switch(a1, a2, a3);
    }
    swift_release();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v3 + 8);
  }
  return v10();
}

uint64_t sub_10006049C(char a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v4 + 187) = a3;
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = v3;
  *(unsigned char *)(v4 + 186) = a1;
  uint64_t v5 = sub_100064380();
  *(void *)(v4 + 104) = v5;
  *(void *)(v4 + 112) = *(void *)(v5 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  sub_100064870();
  *(void *)(v4 + 128) = sub_100064860();
  uint64_t v7 = sub_100064830();
  *(void *)(v4 + 136) = v7;
  *(void *)(v4 + 144) = v6;
  return _swift_task_switch(sub_100060598, v7, v6);
}

uint64_t sub_100060598()
{
  uint64_t v33 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 186);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned __int8 *)(v0 + 180) != v1)
  {
    char v2 = *(unsigned char *)(v0 + 186);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    uint64_t v3 = *(char *)(v0 + 184);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 183) = v2;
    swift_retain();
    sub_100064490();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064480();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v4 = *(void **)(v0 + 56);
    *(void *)(v0 + 152) = v4;
    if (v4)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100064480();
      swift_release();
      swift_release();
      swift_release();
      if ((*(unsigned char *)(v0 + 182) & 1) == 0)
      {
        swift_release();

        goto LABEL_7;
      }
      uint64_t v30 = v3;
      int v5 = *(unsigned __int8 *)(v0 + 186);
      uint64_t v6 = (char *)[v4 publicPermission];
      if (v5 == 2)
      {
        uint64_t v7 = 1;
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        if (*(unsigned char *)(v0 + 181) != 3)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          sub_100064480();
          swift_release();
          swift_release();
          uint64_t v7 = 1;
          switch(*(unsigned char *)(v0 + 185))
          {
            case 1:
              break;
            case 2:
              uint64_t v7 = 2;
              goto LABEL_13;
            case 3:
              return sub_100064B90();
            default:
              goto LABEL_13;
          }
        }
        uint64_t v7 = 3;
      }
LABEL_13:
      uint64_t v10 = (id *)(v0 + 72);
      *(void *)(v0 + 72) = v7;
      sub_100064360();
      uint64_t v11 = sub_100064370();
      os_log_type_t v12 = sub_100064930();
      if (os_log_type_enabled(v11, v12))
      {
        os_log_type_t v27 = v12;
        uint64_t v28 = v7;
        os_log_t log = v11;
        uint64_t v13 = *(char *)(v0 + 186);
        uint64_t v14 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        uint64_t v15 = *(void *)&aNone_4[8 * v13];
        *(_DWORD *)uint64_t v14 = 136316162;
        *(void *)(v0 + 80) = sub_10004BEF0(v15, *(void *)&aPublicmPrivate_0[8 * v13 + 16], &v32);
        sub_100064A90();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 2080;
        *(void *)(v0 + 64) = sub_10004BEF0(*(void *)&aNone_4[8 * v30], *(void *)&aPublicmPrivate_0[8 * v30 + 16], &v32);
        sub_100064A90();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 22) = 2080;
        if ((unint64_t)(v6 - 1) > 2) {
          return sub_100064B90();
        }
        *(void *)(v0 + 48) = sub_10004BEF0(*(void *)&aNone_5[8 * (void)(v6 - 1)], *(void *)&aReadonlReadwri[8 * (void)(v6 - 1) + 16], &v32);
        sub_100064A90();
        swift_bridgeObjectRelease();
        uint64_t v16 = 8 * v28 - 8;
        uint64_t v17 = *(void *)&aNone_5[v16];
        unint64_t v18 = *(void *)&aReadonlReadwri[v16 + 16];
        *(_WORD *)(v14 + 32) = 2080;
        uint64_t v19 = *(void *)(v0 + 112);
        uint64_t v31 = *(void *)(v0 + 120);
        uint64_t v20 = *(void *)(v0 + 104);
        int v21 = *(unsigned __int8 *)(v0 + 187);
        *(void *)(v0 + 40) = sub_10004BEF0(v17, v18, &v32);
        sub_100064A90();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 42) = 1024;
        *(_DWORD *)(v0 + 176) = v21;
        sub_100064A90();
        _os_log_impl((void *)&_mh_execute_header, log, v27, "changeAccessSetting 4 newAccess: %s, oldAccess: %s oldSharePermission: %s,\nnewSharePermission: %s, saveShare: %{BOOL}d", (uint8_t *)v14, 0x30u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v31, v20);
        uint64_t v10 = (id *)(v0 + 72);
      }
      else
      {
        uint64_t v23 = *(void *)(v0 + 112);
        uint64_t v22 = *(void *)(v0 + 120);
        uint64_t v24 = *(void *)(v0 + 104);

        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
      }
      swift_beginAccess();
      if (*v10 != v6)
      {
        int v25 = *(unsigned __int8 *)(v0 + 187);
        objc_msgSend(v4, "setPublicPermission:");
        if (v25 == 1)
        {
          uint64_t v26 = (void *)swift_task_alloc();
          *(void *)(v0 + 160) = v26;
          *uint64_t v26 = v0;
          v26[1] = sub_100060D18;
          return sub_100047C90(1);
        }
      }
    }
  }
  swift_release();
LABEL_7:
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100060D18()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 136);
  if (v0) {
    int v5 = sub_100060EC8;
  }
  else {
    int v5 = sub_100060E54;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100060E54()
{
  int v1 = *(void **)(v0 + 152);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100060EC8()
{
  int v1 = *(void **)(v0 + 152);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100060F3C(char a1, uint64_t a2, char a3, char a4)
{
  *(unsigned char *)(v5 + 142) = a4;
  *(unsigned char *)(v5 + 141) = a3;
  *(void *)(v5 + 40) = a2;
  *(void *)(v5 + 48) = v4;
  *(unsigned char *)(v5 + 140) = a1;
  uint64_t v6 = sub_100064380();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = *(void *)(v6 - 8);
  *(void *)(v5 + 72) = swift_task_alloc();
  sub_100064870();
  *(void *)(v5 + 80) = sub_100064860();
  uint64_t v8 = sub_100064830();
  *(void *)(v5 + 88) = v8;
  *(void *)(v5 + 96) = v7;
  return _swift_task_switch(sub_10006103C, v8, v7);
}

uint64_t sub_10006103C()
{
  uint64_t v36 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 140);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  if (*(unsigned __int8 *)(v0 + 136) == v1) {
    goto LABEL_6;
  }
  char v2 = *(unsigned char *)(v0 + 140);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 138) = v2;
  swift_retain();
  sub_100064490();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 16);
  *(void *)(v0 + 104) = v3;
  if (!v3) {
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_100064480();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 137) & 1) == 0)
  {
    swift_release();

    goto LABEL_7;
  }
  swift_retain();
  id v4 = v3;
  sub_10000E5A0(v3);
  unsigned __int8 v6 = v5;

  swift_release();
  sub_100064360();
  uint64_t v7 = sub_100064370();
  os_log_type_t v8 = sub_100064930();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t type = v8;
    uint64_t v9 = *(char *)(v0 + 140);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v11 = *(void *)&aNone_6[8 * v9];
    *(_DWORD *)uint64_t v10 = 136315906;
    *(void *)(v0 + 32) = sub_10004BEF0(v11, qword_100068CE0[v9], &v35);
    sub_100064A90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v12 = (char)v6;
    uint64_t v30 = *(void *)(v0 + 64);
    uint64_t v31 = *(void *)(v0 + 56);
    uint64_t v32 = *(void *)(v0 + 72);
    unsigned __int8 v13 = v6;
    int v14 = *(unsigned __int8 *)(v0 + 142);
    id v34 = v4;
    int v15 = *(unsigned __int8 *)(v0 + 141);
    *(void *)(v0 + 24) = sub_10004BEF0(*(void *)&aNone_6[v12 * 8], qword_100068CE0[v12], &v35);
    sub_100064A90();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 1024;
    *(_DWORD *)(v0 + 132) = v14;
    unsigned __int8 v6 = v13;
    sub_100064A90();
    *(_WORD *)(v10 + 28) = 1024;
    *(_DWORD *)(v0 + 128) = v15;
    id v4 = v34;
    sub_100064A90();
    _os_log_impl((void *)&_mh_execute_header, v7, type, "changeReadWritePermission newPermission: %s, oldSharePermission: %s,\nupdateExistingParticipants: %{BOOL}d, saveShare: %{BOOL}d", (uint8_t *)v10, 0x22u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
  }
  else
  {
    uint64_t v19 = *(void *)(v0 + 64);
    uint64_t v18 = *(void *)(v0 + 72);
    uint64_t v20 = *(void *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  if (*(unsigned __int8 *)(v0 + 140) == v6)
  {
LABEL_38:

LABEL_6:
    swift_release();
LABEL_7:
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  uint64_t v21 = 1;
  int v22 = 0;
  switch(*(unsigned char *)(v0 + 140))
  {
    case 1:
      int v22 = 0;
      uint64_t v21 = 3;
      goto LABEL_16;
    case 2:
      int v22 = 1;
      uint64_t v21 = 2;
      goto LABEL_16;
    case 3:
      return sub_100064B90();
    default:
LABEL_16:
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 139) == 1) {
        [v4 setPublicPermission:v21];
      }
      if (*(unsigned char *)(v0 + 142) != 1 || [v4 publicPermission] != (id)1) {
        goto LABEL_34;
      }
      id v23 = [v4 participants];
      sub_10000EF58(0, (unint64_t *)&qword_10007F1F0);
      unint64_t v24 = sub_1000647F0();

      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_100064BA0();
        swift_bridgeObjectRelease();
        if (!v25) {
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v25) {
          goto LABEL_33;
        }
      }
      if (v25 < 1)
      {
        __break(1u);
        JUMPOUT(0x1000617ACLL);
      }
      for (uint64_t i = 0; i != v25; ++i)
      {
        if ((v24 & 0xC000000000000001) != 0) {
          id v27 = (id)sub_100064B20();
        }
        else {
          id v27 = *(id *)(v24 + 8 * i + 32);
        }
        uint64_t v28 = v27;
        if ([v27 role] != (id)1)
        {
          [v28 setPermission:v21];
          if (v22) {
            [v28 setRole:3];
          }
        }
      }
LABEL_33:
      swift_bridgeObjectRelease();
LABEL_34:
      if (*(unsigned char *)(v0 + 141) != 1) {
        goto LABEL_38;
      }
      uint64_t v29 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v29;
      void *v29 = v0;
      v29[1] = sub_1000617BC;
      uint64_t result = sub_100047C90(1);
      break;
  }
  return result;
}

uint64_t sub_1000617BC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    unsigned __int8 v5 = sub_10006196C;
  }
  else {
    unsigned __int8 v5 = sub_1000618F8;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000618F8()
{
  int v1 = *(void **)(v0 + 104);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10006196C()
{
  int v1 = *(void **)(v0 + 104);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000619E0()
{
  return sub_100043B48();
}

uint64_t sub_1000619F4()
{
  return sub_100043B48();
}

NSObject *sub_100061A08(uint64_t a1)
{
  uint64_t v2 = sub_100064380();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned __int8 v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  BOOL v6 = sub_10001AEF0(v24, a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v6)
  {
    sub_100064360();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    os_log_type_t v8 = sub_100064370();
    os_log_type_t v9 = sub_100064930();
    if (!os_log_type_enabled(v8, v9))
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
LABEL_23:
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_getKeyPath();
      swift_getKeyPath();
      BOOL v24 = a1;
      swift_bridgeObjectRetain();
      swift_retain();
      return sub_100064490();
    }
    uint64_t v10 = swift_slowAlloc();
    uint64_t result = swift_slowAlloc();
    BOOL v24 = (BOOL)result;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = *(void *)(a1 + 16);
    if (!v11)
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    int v12 = *(unsigned __int8 *)(a1 + 32);
    v22[1] = result;
    if (v12 == 1)
    {
      if (v11 == 1)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (*(unsigned char *)(a1 + 33))
      {
        uint64_t v13 = 7237422;
        unint64_t v14 = 0xE300000000000000;
        goto LABEL_13;
      }
    }
    else
    {
      if (v11 == 1)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (v12 == *(unsigned __int8 *)(a1 + 33))
      {
        uint64_t v13 = 1717989166;
        unint64_t v14 = 0xE400000000000000;
LABEL_13:
        uint64_t v23 = sub_10004BEF0(v13, v14, (uint64_t *)&v24);
        sub_100064A90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v10 + 12) = 2080;
        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064480();
        swift_release();
        swift_release();
        uint64_t result = v23;
        uint64_t v15 = *(void *)(v23 + 16);
        if (v15)
        {
          int v16 = *(unsigned __int8 *)(v23 + 32);
          v22[0] = v8;
          if (v16 == 1)
          {
            if (v15 != 1)
            {
              if (*(unsigned char *)(v23 + 33))
              {
                os_log_type_t v17 = v9;
                uint64_t v18 = 7237422;
                unint64_t v19 = 0xE300000000000000;
LABEL_22:
                swift_bridgeObjectRelease();
                uint64_t v23 = sub_10004BEF0(v18, v19, (uint64_t *)&v24);
                sub_100064A90();
                swift_release_n();
                swift_bridgeObjectRelease();
                os_log_type_t v20 = v17;
                os_log_t v21 = v22[0];
                _os_log_impl((void *)&_mh_execute_header, v22[0], v20, "changeNewParticipantsCanBeCoOwners 4 newState: %s, oldState: %s", (uint8_t *)v10, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                goto LABEL_23;
              }
LABEL_20:
              os_log_type_t v17 = v9;
              unint64_t v19 = 0xE600000000000000;
              uint64_t v18 = 0x646578696D2ELL;
              goto LABEL_22;
            }
LABEL_30:
            __break(1u);
            return result;
          }
          if (v15 != 1)
          {
            if (v16 == *(unsigned __int8 *)(v23 + 33))
            {
              os_log_type_t v17 = v9;
              uint64_t v18 = 1717989166;
              unint64_t v19 = 0xE400000000000000;
              goto LABEL_22;
            }
            goto LABEL_20;
          }
          goto LABEL_28;
        }
        goto LABEL_26;
      }
    }
    unint64_t v14 = 0xE600000000000000;
    uint64_t v13 = 0x646578696D2ELL;
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_100061E58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  uint64_t result = v3;
  uint64_t v1 = *(void *)(v3 + 16);
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned char *)(v3 + 32) != 1)
  {
    if (v1 != 1)
    {
      uint64_t v2 = 0;
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (v1 != 1)
  {
    uint64_t v2 = *(unsigned __int8 *)(v3 + 33);
LABEL_7:
    swift_bridgeObjectRelease();
    return v2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_100061F10(unsigned __int8 a1)
{
  uint64_t v2 = sub_100064380();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned __int8 v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  if (v15 != a1)
  {
    sub_100064360();
    swift_retain_n();
    uint64_t v7 = sub_100064370();
    os_log_type_t v8 = sub_100064930();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      uint64_t v10 = 8 * (char)a1;
      uint64_t v11 = *(void *)&aNone_4[v10];
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v14 = sub_10004BEF0(v11, *(void *)&aPublicmPrivate_0[v10 + 16], &v15);
      sub_100064A90();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v14 = sub_10004BEF0(*(void *)&aNone_4[8 * (char)v14], *(void *)&aPublicmPrivate_0[8 * (char)v14 + 16], &v15);
      sub_100064A90();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "updateAccessModeOnly 4 newAccess: %s, oldAccess: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v15) = a1;
    swift_retain();
    return sub_100064490();
  }
  return result;
}

uint64_t sub_100062254(unsigned __int8 a1)
{
  uint64_t v2 = sub_100064380();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned __int8 v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  uint64_t result = swift_release();
  if (v15 != a1)
  {
    sub_100064360();
    swift_retain_n();
    uint64_t v7 = sub_100064370();
    os_log_type_t v8 = sub_100064930();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v15 = v13;
      uint64_t v10 = (char)a1;
      uint64_t v11 = *(void *)&aNone_6[v10 * 8];
      *(_DWORD *)uint64_t v9 = 136315394;
      uint64_t v14 = sub_10004BEF0(v11, qword_100068CE0[v10], &v15);
      sub_100064A90();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_100064480();
      swift_release();
      swift_release();
      uint64_t v14 = sub_10004BEF0(*(void *)&aNone_6[8 * (char)v14], qword_100068CE0[(char)v14], &v15);
      sub_100064A90();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "updatePermissionsOnly newAccess: %s, oldAccess: %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v15) = a1;
    swift_retain();
    return sub_100064490();
  }
  return result;
}

uint64_t sub_100062598()
{
  return sub_100043B48();
}

uint64_t sub_1000625AC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100062620@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100062634()
{
  return sub_100009540();
}

uint64_t sub_100062648@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_10006265C()
{
  return sub_100009540();
}

uint64_t sub_100062670()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100064480();
  swift_release();
  swift_release();
  return v1;
}

void *sub_1000626E4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v84 = *v1;
  uint64_t v85 = a1;
  uint64_t v3 = sub_100006DC8(&qword_10007ECA8);
  uint64_t v76 = *(void *)(v3 - 8);
  uint64_t v77 = v3;
  __chkstk_darwin(v3);
  uint64_t v75 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006DC8(&qword_10007ECB0);
  uint64_t v79 = *(void *)(v5 - 8);
  uint64_t v80 = v5;
  __chkstk_darwin(v5);
  uint64_t v78 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006DC8(&qword_10007F830);
  uint64_t v82 = *(void *)(v7 - 8);
  uint64_t v83 = v7;
  __chkstk_darwin(v7);
  uint64_t v81 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006DC8(&qword_10007ED80);
  __chkstk_darwin(v9 - 8);
  uint64_t v74 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100006DC8(&qword_10007E320);
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v70 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006DC8(&qword_10007ED18);
  uint64_t v72 = *(void *)(v12 - 8);
  uint64_t v73 = v12;
  __chkstk_darwin(v12);
  uint64_t v71 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = (void *)sub_100006DC8(&qword_10007F828);
  uint64_t v68 = (void (**)(void, void, void))*(v69 - 1);
  __chkstk_darwin(v69);
  uint64_t v67 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_100006DC8(&qword_10007E348);
  uint64_t v65 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v64 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v63 = sub_100006DC8(&qword_10007EE80);
  uint64_t v16 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100006DC8(&qword_10007EF70);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  int v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100006DC8(&qword_10007EF58);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = (char *)v2 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__readWritePermission;
  LOBYTE(v87) = 1;
  sub_100064450();
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v27, v26, v23);
  uint64_t v28 = (char *)v2 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__sharingMode;
  LOBYTE(v87) = 0;
  sub_100064450();
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v28, v22, v19);
  uint64_t v29 = (char *)v2 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__allowCoOwnersEditing;
  LOBYTE(v87) = 0;
  sub_100064450();
  uint64_t v30 = *(void (**)(char *, char *, unint64_t))(v16 + 32);
  unint64_t v31 = v63;
  v30(v29, v18, v63);
  uint64_t v32 = (char *)v2
      + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__newParticipantsCanBeCoOwners;
  uint64_t v87 = &off_1000797A8;
  uint64_t v33 = v64;
  sub_100064450();
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v32, v33, v66);
  id v34 = (char *)v2
      + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__participantsAreAlwaysCoOwners;
  LOBYTE(v87) = 0;
  sub_100064450();
  v30(v34, v18, v31);
  uint64_t v35 = (char *)v2
      + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__currentUserCanInvitePublisher;
  LOBYTE(v87) = 2;
  sub_100006DC8((uint64_t *)&unk_10007F768);
  uint64_t v36 = v67;
  sub_100064450();
  ((void (**)(char *, char *, void *))v68)[4](v35, v36, v69);
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100064BA0()) {
    uint64_t v37 = (void *)sub_10004DD20((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v37 = &_swiftEmptySetSingleton;
  }
  uint64_t v38 = v61;
  uint64_t v39 = v60;
  uint64_t v62 = v2;
  uint64_t v69 = (void *)((char *)v2 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel_store);
  *uint64_t v69 = v37;
  uint64_t v40 = v85;
  *(void *)((char *)v2 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel_ckShareModel) = v85;
  swift_beginAccess();
  uint64_t v86 = 15;
  swift_retain();
  sub_100064450();
  swift_endAccess();
  swift_beginAccess();
  sub_100006DC8((uint64_t *)&unk_10007EF20);
  int v41 = v70;
  sub_100064460();
  swift_endAccess();
  uint64_t v68 = (void (**)(void, void, void))self;
  uint64_t v87 = (_UNKNOWN **)[v68 mainRunLoop];
  uint64_t v66 = sub_100064A60();
  uint64_t v42 = *(void *)(v66 - 8);
  uint64_t v65 = *(void *)(v42 + 56);
  uint64_t v67 = (char *)(v42 + 56);
  uint64_t v43 = (uint64_t)v74;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v65)(v74, 1, 1, v66);
  uint64_t v64 = (char *)sub_10000EF58(0, &qword_10007EF00);
  sub_10000EDB4(&qword_10007E358, &qword_10007E320);
  unint64_t v63 = sub_100063E84();
  unint64_t v44 = v71;
  sub_1000644E0();
  sub_100063EEC(v43);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
  uint64_t v45 = swift_allocObject();
  uint64_t v46 = v62;
  swift_weakInit();
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v45;
  *(void *)(v47 + 24) = v40;
  sub_10000EDB4(&qword_10007EFA8, &qword_10007ED18);
  swift_retain();
  uint64_t v48 = v73;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v44, v48);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  sub_100006DC8(&qword_10007EE28);
  uint64_t v49 = v75;
  sub_100064460();
  swift_endAccess();
  sub_10000EDB4(&qword_10007F048, &qword_10007ECA8);
  sub_10004DCC4();
  uint64_t v51 = v77;
  unsigned int v50 = v78;
  sub_1000644F0();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v49, v51);
  uint64_t v87 = (_UNKNOWN **)[v68 mainRunLoop];
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v65)(v43, 1, 1, v66);
  sub_10000EDB4(&qword_10007F088, &qword_10007ECB0);
  uint64_t v52 = v80;
  uint64_t v53 = v81;
  sub_1000644E0();
  sub_100063EEC(v43);

  (*(void (**)(char *, uint64_t))(v79 + 8))(v50, v52);
  uint64_t v54 = swift_allocObject();
  swift_weakInit();
  uint64_t v55 = swift_allocObject();
  uint64_t v56 = v84;
  *(void *)(v55 + 16) = v54;
  *(void *)(v55 + 24) = v56;
  sub_10000EDB4(&qword_10007F838, &qword_10007F830);
  uint64_t v57 = v83;
  sub_100064500();
  swift_release();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v53, v57);
  swift_beginAccess();
  sub_100064410();
  swift_endAccess();
  swift_release();
  swift_release();
  return v46;
}

void sub_1000633F0(void **a1)
{
  unsigned __int8 v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (v1)
    {
      id v2 = v1;
      [v2 publicPermission];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100064490();
      id v3 = v2;
      sub_10000E5A0(v1);

      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_100064490();
      id v4 = [v3 currentUserParticipant];
      if (v4)
      {
        uint64_t v5 = v4;
        [v4 role];
        sub_100064990();
        sub_10000EF58(0, &qword_10007F120);
        id v6 = [v3 owner];
        sub_100064A40();

        swift_getKeyPath();
        swift_getKeyPath();
        sub_100064490();

        return;
      }
    }
    swift_release();
  }
}

uint64_t sub_1000635F8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    char v3 = sub_100063774(v4, v1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_100064490();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_100064480();
    swift_release();
    swift_release();
    sub_100063820(v3, v1);
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_100064490();
  }
  return result;
}

uint64_t sub_100063774(unsigned __int8 a1, uint64_t a2)
{
  int v2 = a1;
  uint64_t v3 = a2 & 0xC;
  uint64_t result = (a2 >> 3) & 1;
  while (2)
  {
    switch(v2)
    {
      case 1:
        int v2 = 2;
        if ((a2 & 8) == 0) {
          continue;
        }
        break;
      case 2:
        int v2 = 1;
        if (v3 == 8) {
          continue;
        }
        uint64_t result = (a2 >> 1) & 2;
        break;
      case 3:
        if (v3 != 12) {
          goto LABEL_9;
        }
        uint64_t result = 3;
        break;
      default:
        if (a2)
        {
LABEL_9:
          if ((a2 & 8) != 0)
          {
            BOOL v5 = v2 == 1;
            int v2 = 1;
            if (!v5) {
              continue;
            }
          }
          else
          {
            BOOL v5 = v2 == 2;
            int v2 = 2;
            if (!v5) {
              continue;
            }
          }
        }
        uint64_t result = 0;
        break;
    }
    return result;
  }
}

uint64_t sub_100063820(char a1, uint64_t a2)
{
  if ((a2 & 2) != 0) {
    char v3 = 2;
  }
  else {
    char v3 = 1;
  }
  if ((a2 & 1u) <= (a2 == 0)) {
    uint64_t result = a2 == 0;
  }
  else {
    uint64_t result = a2 & 1;
  }
  do
  {
    while (a1)
    {
      if (a1 == 1)
      {
        a1 = 2;
        if ((a2 & 3) != 2) {
          return result;
        }
      }
      else
      {
        a1 = 1;
        if (a2 == 0 || (a2 & 2) != 0) {
          return 2;
        }
      }
    }
    a1 = v3;
  }
  while (a2);
  return 0;
}

uint64_t sub_100063894()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__readWritePermission;
  uint64_t v2 = sub_100006DC8(&qword_10007EF58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__sharingMode;
  uint64_t v4 = sub_100006DC8(&qword_10007EF70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__sharingOptionsAllowed;
  uint64_t v6 = sub_100006DC8(&qword_10007EE28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__allowCoOwnersEditing;
  uint64_t v8 = sub_100006DC8(&qword_10007EE80);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__newParticipantsCanBeCoOwners;
  uint64_t v11 = sub_100006DC8(&qword_10007E348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v9(v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__participantsAreAlwaysCoOwners, v8);
  uint64_t v12 = v0 + OBJC_IVAR____TtC40com_apple_CloudSharingUI_AddParticipants12OptionsModel__currentUserCanInvitePublisher;
  uint64_t v13 = sub_100006DC8(&qword_10007F828);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_100063AF0()
{
  return type metadata accessor for OptionsModel();
}

uint64_t type metadata accessor for OptionsModel()
{
  uint64_t result = qword_10007F740;
  if (!qword_10007F740) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100063B44()
{
  sub_10000E508(319, &qword_10007F750);
  if (v0 <= 0x3F)
  {
    sub_10000E508(319, &qword_10007F758);
    if (v1 <= 0x3F)
    {
      sub_10000E508(319, &qword_10007EA20);
      if (v2 <= 0x3F)
      {
        sub_10000E508(319, &qword_10007E9B0);
        if (v3 <= 0x3F)
        {
          sub_10000E508(319, &qword_10007E1E8);
          if (v4 <= 0x3F)
          {
            sub_100063D68();
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_100063D68()
{
  if (!qword_10007F760)
  {
    sub_100006174((uint64_t *)&unk_10007F768);
    unint64_t v0 = sub_1000644A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007F760);
    }
  }
}

uint64_t sub_100063DC4@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100063DEC()
{
  return sub_100009540();
}

uint64_t sub_100063E14@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000094B0(a1);
}

uint64_t sub_100063E3C()
{
  return sub_100009540();
}

unint64_t sub_100063E84()
{
  unint64_t result = qword_10007EF10;
  if (!qword_10007EF10)
  {
    sub_10000EF58(255, &qword_10007EF00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007EF10);
  }
  return result;
}

uint64_t sub_100063EEC(uint64_t a1)
{
  uint64_t v2 = sub_100006DC8(&qword_10007ED80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100063F4C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100063F84()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100063FC4(void **a1)
{
}

uint64_t sub_100063FCC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100064004(uint64_t *a1)
{
  return sub_1000635F8(a1);
}

uint64_t sub_100064020(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100064030()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t sub_100064040()
{
  return URLResourceValues.localizedName.getter();
}

uint64_t sub_100064050()
{
  return URLResourceValues.typeIdentifier.getter();
}

uint64_t sub_100064060()
{
  return URLResourceValues.ubiquitousItemIsShared.getter();
}

uint64_t sub_100064070()
{
  return URLResourceValues.ubiquitousSharedItemCurrentUserRole.getter();
}

uint64_t sub_100064080()
{
  return URLResourceValues.isPackage.getter();
}

uint64_t sub_100064090()
{
  return type metadata accessor for URLResourceValues();
}

Class sub_1000640A0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_1000640B0()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000640C0()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_100064110()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_100064130()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t sub_100064140()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100064150()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100064160()
{
  return URL.pathExtension.getter();
}

uint64_t sub_100064170()
{
  return URL.lastPathComponent.getter();
}

void sub_100064180(NSURL *retstr@<X8>)
{
}

uint64_t sub_100064190()
{
  return URL.promisedItemResourceValues(forKeys:)();
}

void sub_1000641A0()
{
}

uint64_t sub_1000641B0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

BOOL sub_1000641C0()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t sub_1000641D0()
{
  return URL.scheme.getter();
}

uint64_t sub_1000641E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000641F0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100064200()
{
  return UUID.init()();
}

uint64_t sub_100064210()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100064220()
{
  return dispatch thunk of AddressingViewFactory.addAddress(from:contactProperty:)();
}

uint64_t sub_100064230()
{
  return AddressingViewFactory.viewController.getter();
}

uint64_t sub_100064240()
{
  return AddressingViewFactory.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)();
}

uint64_t sub_100064250()
{
  return dispatch thunk of AddressingViewFactory.update(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:)();
}

uint64_t sub_100064260()
{
  return type metadata accessor for AddressingViewFactory();
}

uint64_t sub_100064270()
{
  return static UTTagClass.filenameExtension.getter();
}

uint64_t sub_100064280()
{
  return type metadata accessor for UTTagClass();
}

uint64_t sub_100064290()
{
  return UTType.identifier.getter();
}

uint64_t sub_1000642A0()
{
  return static UTType.spreadsheet.getter();
}

uint64_t sub_1000642B0()
{
  return static UTType.presentation.getter();
}

uint64_t sub_1000642C0()
{
  return static UTType.pdf.getter();
}

uint64_t sub_1000642D0()
{
  return UTType.init(tag:tagClass:conformingTo:)();
}

uint64_t sub_1000642E0()
{
  return static UTType.item.getter();
}

uint64_t sub_1000642F0()
{
  return static UTType.image.getter();
}

uint64_t sub_100064300()
{
  return static UTType.movie.getter();
}

uint64_t sub_100064310()
{
  return static UTType.folder.getter();
}

uint64_t sub_100064320()
{
  return UTType.conforms(to:)();
}

uint64_t sub_100064330()
{
  return UTType.isSubtype(of:)();
}

uint64_t sub_100064340()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100064350()
{
  return UTType.init(_:)();
}

uint64_t sub_100064360()
{
  return static Logger.general.getter();
}

uint64_t sub_100064370()
{
  return Logger.logObject.getter();
}

uint64_t sub_100064380()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100064390()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t sub_1000643A0()
{
  return type metadata accessor for Publishers.CombineLatest3();
}

uint64_t sub_1000643B0()
{
  return Publishers.CombineLatest3.init(_:_:_:)();
}

uint64_t sub_1000643C0()
{
  return type metadata accessor for Publishers.CombineLatest4();
}

uint64_t sub_1000643D0()
{
  return Publishers.CombineLatest4.init(_:_:_:_:)();
}

uint64_t sub_1000643E0()
{
  return Publishers.Map.receive<A>(subscriber:)();
}

uint64_t sub_1000643F0()
{
  return type metadata accessor for Publishers.Map();
}

uint64_t sub_100064400()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t sub_100064410()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_100064420()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_100064430()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_100064440()
{
  return Future.init(_:)();
}

uint64_t sub_100064450()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100064460()
{
  return Published.projectedValue.getter();
}

uint64_t sub_100064470()
{
  return Published.projectedValue.setter();
}

uint64_t sub_100064480()
{
  return static Published.subscript.getter();
}

uint64_t sub_100064490()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000644A0()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000644B0()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_1000644C0()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_1000644D0()
{
  return Publisher.flatMap<A, B>(maxPublishers:_:)();
}

uint64_t sub_1000644E0()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1000644F0()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t sub_100064500()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_100064510()
{
  return Publisher<>.assign(to:)();
}

uint64_t sub_100064520()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t sub_100064530()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t sub_100064540()
{
  return NWPathMonitor.init()();
}

uint64_t sub_100064550()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t sub_100064560()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t sub_100064570()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t sub_100064580()
{
  return NWPath.status.getter();
}

uint64_t sub_100064590()
{
  return type metadata accessor for NWPath();
}

uint64_t sub_1000645A0()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_1000645B0()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000645C0()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000645D0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000645E0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000645F0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100064600()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100064610()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100064620()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100064630()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100064640()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100064650()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100064660()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100064670()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100064680()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100064690()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000646A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000646B0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_1000646C0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000646D0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000646E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000646F0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100064700()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100064710()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100064720()
{
  return String.hash(into:)();
}

uint64_t sub_100064730()
{
  return String.count.getter();
}

uint64_t sub_100064740()
{
  return String.index(after:)();
}

uint64_t sub_100064750()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_100064760(Swift::String a1)
{
}

Swift::Int sub_100064770()
{
  return String.UTF8View._foreignCount()();
}

Swift::Int sub_100064780()
{
  return String.UTF16View._foreignCount()();
}

uint64_t sub_100064790()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

BOOL sub_1000647A0(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_1000647B0()
{
  return String.subscript.getter();
}

uint64_t sub_1000647C0()
{
  return String.subscript.getter();
}

uint64_t sub_1000647D0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000647E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000647F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100064800()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100064810()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100064820()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100064830()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100064840()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100064850()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100064860()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100064870()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100064880()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_100064890()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000648A0()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_1000648D0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000648E0()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000648F0()
{
  return Range<>.init(_:in:)();
}

uint64_t sub_100064900()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100064910()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100064920()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100064930()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100064940()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100064950()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100064960()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100064970()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100064980()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100064990()
{
  return static CKShareParticipantRole.administrator.getter();
}

uint64_t sub_1000649A0()
{
  return CKModifyRecordsOperation.modifyRecordsResultBlock.setter();
}

CKModifyRecordsOperation sub_1000649B0(Swift::OpaquePointer_optional recordsToSave, Swift::OpaquePointer_optional recordIDsToDelete)
{
  return CKModifyRecordsOperation.init(recordsToSave:recordIDsToDelete:)(recordsToSave, recordIDsToDelete);
}

uint64_t sub_1000649C0()
{
  return CKModifyRecordsOperation.perRecordSaveBlock.setter();
}

uint64_t sub_1000649D0()
{
  return CKModifyRecordsOperation.perRecordDeleteBlock.setter();
}

uint64_t sub_1000649E0()
{
  return CKSystemSharingUIObserver.systemSharingUIDidSaveShareBlock.setter();
}

uint64_t sub_1000649F0()
{
  return CKSystemSharingUIObserver.systemSharingUIDidStopSharingBlock.setter();
}

uint64_t sub_100064A00()
{
  return CKFetchShareMetadataOperation.perShareMetadataResultBlock.setter();
}

uint64_t sub_100064A10()
{
  return static CKShare.SystemFieldKey.title.getter();
}

uint64_t sub_100064A20()
{
  return static CKShare.SystemFieldKey.shareType.getter();
}

uint64_t sub_100064A30()
{
  return CKRecord.subscript.getter();
}

uint64_t sub_100064A40()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100064A50()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100064A60()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_100064A70()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_100064A80()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100064A90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100064AA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100064AB0()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_100064AC0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100064AE0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100064AF0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100064B00(Swift::Int a1)
{
}

uint64_t sub_100064B10()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100064B20()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100064B30()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100064B40()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100064B50()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100064B60()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100064B70()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100064B80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100064B90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100064BA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100064BB0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100064BC0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100064BE0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100064BF0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100064C10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100064C50()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100064C60()
{
  return Error._code.getter();
}

uint64_t sub_100064C70()
{
  return Error._domain.getter();
}

uint64_t sub_100064C80()
{
  return Error._userInfo.getter();
}

uint64_t sub_100064C90()
{
  return Hasher.init(_seed:)();
}

void sub_100064CA0(Swift::UInt a1)
{
}

Swift::Int sub_100064CB0()
{
  return Hasher._finalize()();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandle()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandle();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandleForURL()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandleForURL();
}

uint64_t BRSharingCreateShareForItemAtURL()
{
  return _BRSharingCreateShareForItemAtURL();
}

uint64_t CKErrorCodeForUnderlyingErrorCode()
{
  return _CKErrorCodeForUnderlyingErrorCode();
}

uint64_t CKSharingAccessTypeFromOptionsGroups()
{
  return _CKSharingAccessTypeFromOptionsGroups();
}

uint64_t CKSharingAllowOthersToInviteFromOptionsGroups()
{
  return _CKSharingAllowOthersToInviteFromOptionsGroups();
}

uint64_t CKSharingPermissionTypeFromOptionsGroups()
{
  return _CKSharingPermissionTypeFromOptionsGroups();
}

uint64_t CKXPCSuitableError()
{
  return _CKXPCSuitableError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
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

void bzero(void *a1, size_t a2)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:zoneID:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_publicPermission(void *a1, const char *a2, ...)
{
  return _[a1 publicPermission];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_setAllParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllParticipants:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return _[a1 userIdentity];
}

id objc_msgSend_userRecordID(void *a1, const char *a2, ...)
{
  return _[a1 userRecordID];
}