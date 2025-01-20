uint64_t sub_100002DAC(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v5;

  v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v3;
  *v3 = v1;
  v3[1] = sub_100002E54;
  return sub_100003338(v1 + 16, a1);
}

uint64_t sub_100002E54()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100002F50, 0, 0);
}

uint64_t sub_100002F50()
{
  uint64_t v1 = v0[2];
  v0[3] = v1;
  v0[5] = v1;
  v4 = (uint64_t (*)(void *))((char *)&dword_10001C350 + dword_10001C350);
  v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  void *v2 = v0;
  v2[1] = sub_100003004;
  return v4(v0 + 3);
}

uint64_t sub_100003004(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100003288;
  }
  else
  {
    uint64_t v6 = *(void *)(v4 + 40);
    *(unsigned char *)(v4 + 64) = a1 & 1;
    sub_100005238(v6);
    uint64_t v5 = sub_100003138;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100003138()
{
  if (*(unsigned char *)(v0 + 64) == 1)
  {
    objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v1 = sub_1000142A0();
  }
  else
  {
    if (qword_10001C1C0 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for InternalLogger();
    sub_100005518(v2, (uint64_t)qword_10001C508);
    v3._countAndFlagsBits = 0xD000000000000023;
    v4._countAndFlagsBits = 0xD000000000000067;
    v3._object = (void *)0x8000000100015B20;
    v4._object = (void *)0x8000000100015A00;
    v5._object = (void *)0x8000000100015B50;
    v5._countAndFlagsBits = 0xD000000000000013;
    InternalLogger.info(_:fromFile:fromFunction:)(v3, v4, v5);
    sub_100005EF8();
    objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v1 = sub_100014290();
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v1);
}

uint64_t sub_100003288()
{
  sub_100005238(*(void *)(v0 + 40));
  sub_100005EF8();
  id v1 = objc_allocWithZone((Class)sub_1000142B0());
  uint64_t v2 = sub_100014290();
  swift_errorRelease();
  Swift::String v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100003338(uint64_t a1, uint64_t a2)
{
  v3[7] = a1;
  v3[8] = v2;
  uint64_t v5 = *v2;
  v3[9] = type metadata accessor for InternalLogger();
  v3[10] = swift_task_alloc();
  sub_100005248(&qword_10001C310);
  uint64_t v6 = swift_task_alloc();
  v3[11] = v6;
  v3[4] = v2;
  v7 = (void *)swift_task_alloc();
  v3[12] = v7;
  uint64_t v8 = sub_100005248(&qword_10001C318);
  uint64_t v10 = sub_100004DFC(&qword_10001C2E8, v9, (void (*)(uint64_t))type metadata accessor for RepackagingWorker);
  uint64_t v11 = sub_1000053F4(&qword_10001C320, (void (*)(void))sub_1000053A0);
  uint64_t v12 = sub_1000053F4(&qword_10001C330, (void (*)(void))sub_100005464);
  void *v7 = v3;
  v7[1] = sub_100003554;
  return MLHostExtension.loadConfig<A>(context:)(v6, a2, v5, v8, v10, v11, v12);
}

uint64_t sub_100003554()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003650, 0, 0);
}

uint64_t sub_100003650()
{
  uint64_t v16 = v0;
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_100005248(&qword_10001C340);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_1000054B8(v1);
    uint64_t v4 = 2;
  }
  else
  {
    sub_1000142E0();
    uint64_t v4 = *(void *)(v0 + 40);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    if (v4 != 2)
    {
      sub_100005560(v4);
      if (qword_10001C1C0 != -1) {
        swift_once();
      }
      uint64_t v5 = *(void *)(v0 + 80);
      uint64_t v6 = sub_100005518(*(void *)(v0 + 72), (uint64_t)qword_10001C508);
      sub_100005570(v6, v5);
      v15[0] = 0;
      v15[1] = 0xE000000000000000;
      sub_1000144B0(18);
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0xE000000000000000;
      v18._object = (void *)0x80000001000159E0;
      v18._countAndFlagsBits = 0xD000000000000010;
      sub_1000143C0(v18);
      *(void *)(v0 + 48) = v4;
      sub_100014500();
      sub_100005550(v4);
      v7._countAndFlagsBits = 0xD000000000000067;
      v7._object = (void *)0x8000000100015A00;
      v8._countAndFlagsBits = 0x6963655264616F6CLL;
      v8._object = (void *)0xEE00293A5F286570;
      InternalLogger.debug(_:fromFile:fromFunction:)(*(Swift::String *)(v0 + 16), v7, v8);
      swift_bridgeObjectRelease();
      sub_1000055D4(v5);
    }
  }
  sub_100003F28(v15);
  uint64_t v9 = v15[0];
  if (v15[0] == 2)
  {
    if (v4 == 2)
    {
      if (qword_10001C1C0 != -1) {
        swift_once();
      }
      sub_100005518(*(void *)(v0 + 72), (uint64_t)qword_10001C508);
      v10._countAndFlagsBits = 0xD000000000000011;
      v11._countAndFlagsBits = 0xD000000000000065;
      v10._object = (void *)0x8000000100015950;
      v11._object = (void *)0x8000000100015970;
      v12._countAndFlagsBits = 0x52746C7561666564;
      v12._object = (void *)0xED00006570696365;
      InternalLogger.info(_:fromFile:fromFunction:)(v10, v11, v12);
      uint64_t v4 = 1;
    }
  }
  else
  {
    sub_100005550(v4);
    uint64_t v4 = v9;
  }
  **(void **)(v0 + 56) = v4;
  swift_task_dealloc();
  swift_task_dealloc();
  v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_100003980(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 176) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003A28;
  return sub_100003338(v1 + 152, a1);
}

uint64_t sub_100003A28()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100003B24, 0, 0);
}

uint64_t sub_100003B24()
{
  uint64_t v1 = v0[19];
  v0[23] = v1;
  id v2 = [self sharedLoggerWithPersistenceConfiguration:1];
  v0[24] = v2;
  id v3 = [objc_allocWithZone((Class)SiriAnalyticsInternalTelemetry) init];
  v0[25] = v3;
  v0[17] = v2;
  v0[18] = v3;
  v0[20] = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[26] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100003C24;
  return SessionBuilderExtension.package(with:)(v0 + 20);
}

uint64_t sub_100003C24(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 216) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100003DBC;
  }
  else
  {
    uint64_t v6 = *(void *)(v4 + 184);
    *(void *)(v4 + 224) = a1;
    sub_100005238(v6);
    uint64_t v5 = sub_100003D54;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100003D54()
{
  uint64_t v1 = *(void **)(v0 + 200);

  uint64_t v2 = *(void *)(v0 + 224);
  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100003DBC()
{
  uint64_t v1 = *(void *)(v0 + 216);
  sub_100005238(*(void *)(v0 + 184));
  *(void *)(v0 + 168) = v1;
  swift_errorRetain();
  sub_100005248(&qword_10001C300);
  sub_100005248(&qword_10001C308);
  if (swift_dynamicCast())
  {
    id v3 = *(void **)(v0 + 192);
    uint64_t v2 = *(void **)(v0 + 200);
    swift_errorRelease();
    sub_10000528C((long long *)(v0 + 96), v0 + 56);
    sub_1000052A4(v0 + 56, v0 + 16);
    id v4 = objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v5 = sub_100014290();

    sub_100005308(v0 + 56);
    swift_errorRelease();
  }
  else
  {
    Swift::String v7 = *(void **)(v0 + 192);
    uint64_t v6 = *(void **)(v0 + 200);
    swift_errorRelease();
    id v8 = objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v5 = sub_1000142A0();
    swift_errorRelease();
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v5);
}

void sub_100003F28(uint64_t *a1@<X8>)
{
  id v3 = *(void **)(v1 + 16);
  if (v3)
  {
    id v4 = v3;
    NSString v5 = sub_100014360();
    unsigned int v6 = [v4 BOOLForKey:v5];

    if (v6)
    {
      if (qword_10001C1C0 != -1) {
        swift_once();
      }
      uint64_t v7 = type metadata accessor for InternalLogger();
      sub_100005518(v7, (uint64_t)qword_10001C508);
      unint64_t v8 = 0xD000000000000023;
      uint64_t v9 = "Bypass flag found, using nil recipe";
LABEL_10:
      unint64_t v11 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      v12._object = (void *)0x8000000100015A00;
      v12._countAndFlagsBits = 0xD000000000000067;
      v13._countAndFlagsBits = 0x6552737361707962;
      v13._object = (void *)0xEE00292865706963;
      InternalLogger.debug(_:fromFile:fromFunction:)(*(Swift::String *)&v8, v12, v13);
      uint64_t v14 = 1;
      goto LABEL_14;
    }
  }
  if (os_variant_has_internal_content())
  {
    if (qword_10001C1C0 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for InternalLogger();
    sub_100005518(v10, (uint64_t)qword_10001C508);
    unint64_t v8 = 0xD000000000000020;
    uint64_t v9 = "internal build, using nil recipe";
    goto LABEL_10;
  }
  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for InternalLogger();
  sub_100005518(v15, (uint64_t)qword_10001C508);
  v16._countAndFlagsBits = 0xD00000000000001BLL;
  v16._object = (void *)0x8000000100015AA0;
  v17._object = (void *)0x8000000100015A00;
  v17._countAndFlagsBits = 0xD000000000000067;
  v18._countAndFlagsBits = 0x6552737361707962;
  v18._object = (void *)0xEE00292865706963;
  InternalLogger.debug(_:fromFile:fromFunction:)(v16, v17, v18);
  uint64_t v14 = 2;
LABEL_14:
  *a1 = v14;
}

uint64_t sub_100004150(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005248(&qword_10001C300);
    uint64_t v5 = swift_allocError();
    *unsigned int v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v8 = 0;
    if (a2)
    {
      sub_100006008();
      uint64_t v8 = sub_100014410();
    }
    uint64_t v10 = v8;
    sub_100005FA0((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100004228()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100004260(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100006358;
  return sub_100002DAC(a1);
}

uint64_t sub_1000042F8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100004390;
  return sub_100003980(a1);
}

uint64_t sub_100004390(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_10000448C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100004570;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100004570()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004664(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100004DFC(&qword_10001C2E8, a2, (void (*)(uint64_t))type metadata accessor for RepackagingWorker);

  return MLHostExtension.configuration.getter(a1, v3);
}

unint64_t sub_1000046E0(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x6C706D6153746F6ELL;
      break;
    case 3:
      unint64_t result = 0x64657070696B73;
      break;
    default:
      return result;
  }
  return result;
}

id sub_10000477C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  id result = sub_100012DB0();
  *(void *)(v2 + 16) = result;
  *a1 = v2;
  return result;
}

uint64_t sub_1000047BC(unsigned __int8 *a1, char *a2)
{
  return sub_10000DCB0(*a1, *a2);
}

Swift::Int sub_1000047C8()
{
  return sub_10000DE40();
}

uint64_t sub_1000047D0()
{
  return sub_10000E144();
}

Swift::Int sub_1000047D8()
{
  return sub_10000E214();
}

uint64_t sub_1000047E0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000630C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100004810@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000046E0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for RepackagingWorker();
  sub_100004DFC(&qword_10001C1D0, v3, (void (*)(uint64_t))type metadata accessor for RepackagingWorker);
  sub_100014210();
  return 0;
}

uint64_t type metadata accessor for RepackagingWorker()
{
  return self;
}

void type metadata accessor for FLError(uint64_t a1)
{
}

id sub_100004910()
{
  return *v0;
}

uint64_t sub_100004918@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100004920(uint64_t a1)
{
  uint64_t v2 = sub_100004DFC(&qword_10001C290, 255, type metadata accessor for FLError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100004990(uint64_t a1)
{
  uint64_t v2 = sub_100004DFC(&qword_10001C290, 255, type metadata accessor for FLError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100004A00(uint64_t a1)
{
  uint64_t v2 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100004A70()
{
  return sub_100014370();
}

uint64_t sub_100004A80(uint64_t a1)
{
  uint64_t v2 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004AF0(uint64_t a1)
{
  uint64_t v2 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004B60(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100004BF4()
{
  id v1 = *v0;
  uint64_t v2 = sub_100014460();

  return v2;
}

uint64_t sub_100004C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004CAC()
{
  return sub_100014690();
}

void *sub_100004D0C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100004D1C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100004DB0()
{
  return sub_100004DFC(&qword_10001C280, 255, type metadata accessor for FLError);
}

uint64_t sub_100004DFC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100004E44()
{
  return sub_100004DFC(&qword_10001C288, 255, type metadata accessor for FLError);
}

uint64_t sub_100004E90()
{
  return sub_100004DFC(&qword_10001C290, 255, type metadata accessor for FLError);
}

uint64_t sub_100004EDC()
{
  return sub_100004DFC(&qword_10001C298, 255, type metadata accessor for FLError);
}

uint64_t sub_100004F28()
{
  return sub_100004DFC(&qword_10001C2A0, 255, type metadata accessor for FLError);
}

uint64_t sub_100004F74()
{
  return sub_100004DFC(&qword_10001C2A8, 255, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100004FD4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000501C()
{
  return sub_100004DFC(&qword_10001C2B0, 255, type metadata accessor for Code);
}

unint64_t sub_10000506C()
{
  unint64_t result = qword_10001C2B8;
  if (!qword_10001C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2B8);
  }
  return result;
}

uint64_t sub_1000050C0()
{
  return sub_100004DFC(&qword_10001C2C0, 255, type metadata accessor for Code);
}

uint64_t sub_10000510C()
{
  return sub_100004DFC(qword_10001C2C8, 255, type metadata accessor for FLError);
}

BOOL sub_100005158(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000516C(uint64_t a1, uint64_t a2)
{
  return sub_100004DFC(&qword_10001C1D0, a2, (void (*)(uint64_t))type metadata accessor for RepackagingWorker);
}

uint64_t sub_1000051B4(uint64_t a1, uint64_t a2)
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005238(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100005248(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000528C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000052A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005308(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005358(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000053A0()
{
  unint64_t result = qword_10001C328;
  if (!qword_10001C328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C328);
  }
  return result;
}

uint64_t sub_1000053F4(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005358(&qword_10001C318);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100005464()
{
  unint64_t result = qword_10001C338;
  if (!qword_10001C338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C338);
  }
  return result;
}

uint64_t sub_1000054B8(uint64_t a1)
{
  uint64_t v2 = sub_100005248(&qword_10001C310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005518(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005550(uint64_t result)
{
  if (result != 2) {
    return sub_100005238(result);
  }
  return result;
}

uint64_t sub_100005560(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100005570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000055D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005630(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
LABEL_3:
    uint64_t v5 = 0;
    unint64_t v6 = v3 & 0xC000000000000001;
    uint64_t v17 = v3 + 32;
    unint64_t v18 = v3 & 0xC000000000000001;
    unint64_t v21 = v3;
    uint64_t v22 = a2 + 48;
    uint64_t v7 = &RepackagingWorker;
    uint64_t v19 = v4;
    uint64_t v20 = a2;
    while (1)
    {
      if (v6)
      {
        id v8 = (id)sub_1000144D0();
        BOOL v9 = __OFADD__(v5++, 1);
        if (v9) {
          goto LABEL_25;
        }
      }
      else
      {
        id v8 = *(id *)(v17 + 8 * v5);
        BOOL v9 = __OFADD__(v5++, 1);
        if (v9)
        {
LABEL_25:
          __break(1u);
LABEL_26:
          swift_bridgeObjectRetain();
          uint64_t v4 = sub_100014520();
          if (!v4) {
            break;
          }
          goto LABEL_3;
        }
      }
      v23 = v8;
      id v10 = objc_msgSend(v8, (SEL)v7[3].ivar_lyt, v17);
      if (v10)
      {
        unint64_t v11 = v10;
        sub_100014370();

        if (!a2 || (uint64_t v12 = *(void *)(a2 + 16)) == 0)
        {

          swift_bridgeObjectRelease();
          uint64_t v4 = 1;
          break;
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = v22;
        while (1)
        {
          uint64_t v14 = *(void *)(v13 - 16);
          if (v14 < 0) {
            break;
          }
          swift_bridgeObjectRetain();
          if (v14 >= sub_1000143A0())
          {
            swift_bridgeObjectRelease();
            a2 = v20;
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          sub_1000143B0();
          sub_1000143F0();
          BOOL v15 = sub_100008B98();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v15) {
            break;
          }
          v13 += 24;
          if (!--v12)
          {

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v4 = 1;
            goto LABEL_24;
          }
        }
        swift_bridgeObjectRelease();
        a2 = v20;
LABEL_5:
        swift_bridgeObjectRelease();
        unint64_t v3 = v21;
        unint64_t v6 = v18;
        uint64_t v4 = v19;
        uint64_t v7 = &RepackagingWorker;
      }

      if (v5 == v4)
      {
        uint64_t v4 = 0;
        break;
      }
    }
  }
LABEL_24:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000588C(void *a1)
{
  *(void *)(v1 + 128) = *a1;
  return _swift_task_switch(sub_1000058B0, 0, 0);
}

uint64_t sub_1000058B0()
{
  if (v0[16] == 1)
  {
    uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v2 = 1;
LABEL_10:
    return v1(v2);
  }
  id v3 = [self defaultContext];
  id v4 = [objc_allocWithZone((Class)AFSettingsConnection) initWithInstanceContext:v3];
  v0[17] = v4;

  if (!v4)
  {
    if (qword_10001C1C0 != -1) {
      swift_once();
    }
    unint64_t v6 = (void *)v0[17];
    uint64_t v7 = type metadata accessor for InternalLogger();
    sub_100005518(v7, (uint64_t)qword_10001C508);
    v8._countAndFlagsBits = 0xD000000000000021;
    v9._countAndFlagsBits = 0xD000000000000067;
    v10._object = (void *)0x8000000100015B70;
    v9._object = (void *)0x8000000100015A00;
    v8._object = (void *)0x8000000100015B90;
    v10._countAndFlagsBits = 0xD000000000000019;
    InternalLogger.error(_:fromFile:fromFunction:)(v10, v9, v8);
    sub_100005F4C();
    swift_allocError();
    *unint64_t v11 = 0;
    swift_willThrow();

    uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v2 = 0;
    goto LABEL_10;
  }
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100005B18;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100004150;
  v0[13] = &unk_100018C70;
  v0[14] = v5;
  [v4 fetchAccountsWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100005B18()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_100005DB4;
  }
  else {
    uint64_t v2 = sub_100005C28;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005C28()
{
  unint64_t v1 = *(void *)(v0 + 120);

  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 128);
    id v3 = *(void **)(v0 + 136);
    swift_bridgeObjectRetain();
    char v4 = sub_100005630(v1, v2);
    sub_100005238(v2);

    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v6 = v4 & 1;
  }
  else
  {
    if (qword_10001C1C0 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void **)(v0 + 136);
    uint64_t v8 = type metadata accessor for InternalLogger();
    sub_100005518(v8, (uint64_t)qword_10001C508);
    v9._countAndFlagsBits = 0xD000000000000021;
    v10._countAndFlagsBits = 0xD000000000000067;
    v11._object = (void *)0x8000000100015B70;
    v10._object = (void *)0x8000000100015A00;
    v9._object = (void *)0x8000000100015B90;
    v11._countAndFlagsBits = 0xD000000000000019;
    InternalLogger.error(_:fromFile:fromFunction:)(v11, v10, v9);
    sub_100005F4C();
    swift_allocError();
    *uint64_t v12 = 0;
    swift_willThrow();

    uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v6 = 0;
  }
  return v5(v6);
}

uint64_t sub_100005DB4()
{
  unint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();
  swift_errorRelease();

  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v3 = type metadata accessor for InternalLogger();
  sub_100005518(v3, (uint64_t)qword_10001C508);
  v4._countAndFlagsBits = 0xD000000000000021;
  v5._countAndFlagsBits = 0xD000000000000067;
  v6._object = (void *)0x8000000100015B70;
  v5._object = (void *)0x8000000100015A00;
  v4._object = (void *)0x8000000100015B90;
  v6._countAndFlagsBits = 0xD000000000000019;
  InternalLogger.error(_:fromFile:fromFunction:)(v6, v5, v4);
  sub_100005F4C();
  swift_allocError();
  unsigned char *v7 = 0;
  swift_willThrow();

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8(0);
}

unint64_t sub_100005EF8()
{
  unint64_t result = qword_10001C358;
  if (!qword_10001C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C358);
  }
  return result;
}

unint64_t sub_100005F4C()
{
  unint64_t result = qword_10001C360;
  if (!qword_10001C360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C360);
  }
  return result;
}

uint64_t sub_100005FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005248(&qword_10001C368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100006008()
{
  unint64_t result = qword_10001C370;
  if (!qword_10001C370)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001C370);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for RepackagingError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RepackagingError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RepackagingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000061B4);
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

uint64_t sub_1000061DC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000061E8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RepackagingError()
{
  return &type metadata for RepackagingError;
}

unint64_t sub_100006204()
{
  unint64_t result = qword_10001C380;
  if (!qword_10001C380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C380);
  }
  return result;
}

unint64_t sub_100006260()
{
  unint64_t result = qword_10001C388;
  if (!qword_10001C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C388);
  }
  return result;
}

unint64_t sub_1000062B8()
{
  unint64_t result = qword_10001C390;
  if (!qword_10001C390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C390);
  }
  return result;
}

uint64_t sub_10000630C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018B30;
  v6._object = a2;
  unint64_t v4 = sub_100014570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_10000635C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100014190();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v53 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005248(&qword_10001C3A0);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  int v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v46 - v9;
  unint64_t v58 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_100006E54(*(void *)(a2 + 16));
  sub_100014420();
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v48 = a2 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  uint64_t v50 = v4 + 16;
  uint64_t v51 = v4;
  v54 = (uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  v55 = (void (**)(char *))(v4 + 32);
  int64_t v49 = (unint64_t)(v12 + 63) >> 6;
  int64_t v47 = v49 - 1;
  uint64_t v52 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v56 = 0;
  Swift::String v16 = (uint64_t *)&unk_10001C3A8;
  if (!v14) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v17 = __clz(__rbit64(v14));
  uint64_t v18 = (v14 - 1) & v14;
  unint64_t v19 = v17 | (v56 << 6);
  while (2)
  {
    uint64_t v20 = v52;
    (*(void (**)(char *, unint64_t, uint64_t))(v51 + 16))(v8, *(void *)(v52 + 48) + *(void *)(v51 + 72) * v19, v3);
    uint64_t v21 = *(void *)(v20 + 56) + 32 * v19;
    uint64_t v22 = sub_100005248(v16);
    v23 = &v8[*(int *)(v22 + 48)];
    char v24 = *(unsigned char *)(v21 + 16);
    char v25 = *(unsigned char *)(v21 + 17);
    v26 = *(void **)(v21 + 24);
    *(_OWORD *)v23 = *(_OWORD *)v21;
    v23[16] = v24;
    v23[17] = v25;
    *((void *)v23 + 3) = v26;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 0, 1, v22);
    id v27 = v26;
    while (1)
    {
      sub_100006F14((uint64_t)v8, (uint64_t)v10);
      uint64_t v32 = sub_100005248(v16);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v10, 1, v32) == 1)
      {
        swift_release();
        return v58;
      }
      unint64_t v57 = v18;
      v33 = v16;
      v34 = &v10[*(int *)(v32 + 48)];
      uint64_t v35 = *(void *)v34;
      uint64_t v36 = *((void *)v34 + 1);
      v37 = v10;
      uint64_t v38 = v3;
      __int16 v39 = v34[16];
      int v40 = v34[17];
      v41 = (void *)*((void *)v34 + 3);
      uint64_t v42 = (uint64_t)v53;
      v43 = v37;
      (*v55)(v53);
      if (v40) {
        __int16 v44 = 256;
      }
      else {
        __int16 v44 = 0;
      }
      id v45 = sub_100006858(v42, v35, v36, v44 | v39, v41);
      sub_100014400();
      if (*(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v58 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100014430();
      }
      sub_100014440();
      sub_100014420();

      uint64_t result = (*v54)(v42, v38);
      Swift::String v16 = v33;
      uint64_t v3 = v38;
      uint64_t v10 = v43;
      unint64_t v14 = v57;
      if (v57) {
        goto LABEL_4;
      }
LABEL_6:
      int64_t v28 = v56 + 1;
      if (__OFADD__(v56, 1))
      {
        __break(1u);
        goto LABEL_34;
      }
      if (v28 < v49)
      {
        unint64_t v29 = *(void *)(v48 + 8 * v28);
        if (v29) {
          goto LABEL_9;
        }
        int64_t v30 = v56 + 2;
        ++v56;
        if (v28 + 1 < v49)
        {
          unint64_t v29 = *(void *)(v48 + 8 * v30);
          if (v29) {
            goto LABEL_12;
          }
          int64_t v56 = v28 + 1;
          if (v28 + 2 < v49)
          {
            unint64_t v29 = *(void *)(v48 + 8 * (v28 + 2));
            if (v29)
            {
              v28 += 2;
              goto LABEL_9;
            }
            int64_t v30 = v28 + 3;
            int64_t v56 = v28 + 2;
            if (v28 + 3 < v49) {
              break;
            }
          }
        }
      }
LABEL_23:
      uint64_t v31 = sub_100005248(v16);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 1, 1, v31);
      uint64_t v18 = 0;
    }
    unint64_t v29 = *(void *)(v48 + 8 * v30);
    if (v29)
    {
LABEL_12:
      int64_t v28 = v30;
LABEL_9:
      uint64_t v18 = (v29 - 1) & v29;
      unint64_t v19 = __clz(__rbit64(v29)) + (v28 << 6);
      int64_t v56 = v28;
      continue;
    }
    break;
  }
  while (1)
  {
    int64_t v28 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v28 >= v49)
    {
      int64_t v56 = v47;
      goto LABEL_23;
    }
    unint64_t v29 = *(void *)(v48 + 8 * v28);
    ++v30;
    if (v29) {
      goto LABEL_9;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

id sub_100006858(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, void *a5)
{
  id v49 = a5;
  uint64_t v8 = sub_100014170();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &RepackagingWorker;
  id result = [objc_allocWithZone((Class)PFARepackagingExecution) init];
  if (!result) {
    goto LABEL_35;
  }
  unint64_t v14 = result;
  __int16 v15 = a4;
  id v16 = objc_allocWithZone((Class)SISchemaUUID);
  Class isa = sub_100014180().super.isa;
  id v18 = [v16 initWithNSUUID:isa];

  [v14 setClockIdentifier:v18];
  id v19 = [objc_allocWithZone((Class)PFARepackagingExecutionResult) init];
  [v14 setResult:v19];

  uint64_t v20 = &RepackagingWorker;
  if (v15)
  {
    id v26 = [v14 result];
    if (!v26) {
      goto LABEL_9;
    }
    id v25 = v26;
    [v26 setSamplingResult:2];
  }
  else
  {
    id v21 = [v14 result];
    if (v21)
    {
      uint64_t v22 = v21;
      [v21 setSamplingResult:1];
    }
    id v23 = [objc_allocWithZone((Class)PFAClockEnvelopeStatistics) init];
    [v14 setEnvelopeStatistics:v23];

    id v24 = [v14 envelopeStatistics];
    [v24 setMessageCount:a2];

    id v25 = [v14 envelopeStatistics];
    [v25 setTotalBytes:a3];
    uint64_t v20 = &RepackagingWorker;
  }

LABEL_9:
  id v27 = [v14 (SEL)v20[3].ivars];
  int64_t v28 = v27;
  if ((v15 & 0x100) != 0)
  {
    if (v27)
    {
      [v27 setSuccess:1];
    }
  }
  else
  {
    if (v27)
    {
      id v29 = [objc_allocWithZone((Class)PFARepackagingExecutionFailure) init];
      [v28 setFailure:v29];
    }
    if (v49)
    {
      id v30 = v49;
      id v31 = [v14 (SEL)v20[3].ivars];
      if (v31)
      {
        uint64_t v32 = v31;
        id v33 = [v31 failure];

        if (v33)
        {
          id v34 = [objc_allocWithZone((Class)PFARepackagingExecutionFBFFailure) init];
          [v33 setFbfFailure:v34];
        }
      }
      id v35 = [v14 (SEL)v20[3].ivars];
      if (v35)
      {
        uint64_t v36 = v35;
        id v37 = [v35 failure];

        if (v37)
        {
          id v38 = [v37 fbfFailure];

          if (v38)
          {
            id v50 = v30;
            type metadata accessor for FLError(0);
            sub_100006DFC();
            sub_1000140C0();
            [v38 setFlErrorCode:v51];
          }
        }
      }

      uint64_t v12 = &RepackagingWorker;
    }
  }
  id result = [objc_allocWithZone((Class)PFAPFAClientEvent) (SEL)v12[2].ivars];
  if (!result) {
    goto LABEL_36;
  }
  __int16 v39 = result;
  id v40 = [result eventMetadata];
  if (v40)
  {
    v41 = v40;
    sub_100006DBC();
    uint64_t v42 = (void *)sub_100014450();
    [v41 setDeviceDimensions:v42];
  }
  id v43 = [v39 eventMetadata];
  if (!v43) {
    goto LABEL_31;
  }
  __int16 v44 = v43;
  sub_100014160();
  sub_100014150();
  double v46 = v45;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v47 = v46 * 1000.0;
  if ((~COERCE__INT64(v46 * 1000.0) & 0x7FF0000000000000) != 0)
  {
    if (v47 > -9.22337204e18)
    {
      if (v47 < 9.22337204e18)
      {
        [v44 setEventTimestampInMsSince1970:(uint64_t)v47];

LABEL_31:
        [v39 setRepackagingExecution:v14];

        return v39;
      }
      goto LABEL_34;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_100006DBC()
{
  unint64_t result = qword_10001C398;
  if (!qword_10001C398)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001C398);
  }
  return result;
}

unint64_t sub_100006DFC()
{
  unint64_t result = qword_10001C2C8[0];
  if (!qword_10001C2C8[0])
  {
    type metadata accessor for FLError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C2C8);
  }
  return result;
}

uint64_t sub_100006E54(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_100014520();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_1000144E0();
    *unint64_t v1 = result;
  }
  return result;
}

uint64_t sub_100006F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005248(&qword_10001C3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for InstrumentationUploader(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for InstrumentationUploader(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for InstrumentationUploader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 initializeWithTake for InstrumentationUploader(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for InstrumentationUploader(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for InstrumentationUploader(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InstrumentationUploader(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InstrumentationUploader()
{
  return &type metadata for InstrumentationUploader;
}

uint64_t sub_100007124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a3;
  v4[18] = a4;
  v4[15] = a1;
  v4[16] = a2;
  return _swift_task_switch(sub_100007148, 0, 0);
}

uint64_t sub_100007148()
{
  unint64_t v1 = (void *)v0[17];
  uint64_t v2 = v0[15];
  sub_1000141A0();
  NSString v3 = sub_100014360();
  v0[19] = v3;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_100007270;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000748C;
  v0[13] = &unk_100018DB8;
  v0[14] = v4;
  [v1 reportSiriInstrumentationEvent:v2 forBundleID:v3 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100007270()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_1000073E4;
  }
  else {
    uint64_t v2 = sub_100007380;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100007380()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000073E4()
{
  uint64_t v2 = (void *)v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = (void *)v0[18];
  uint64_t v4 = (void *)v0[15];
  swift_willThrow();

  sub_10000796C(v1, v4, v3);
  swift_willThrow();
  swift_errorRelease();
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000748C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_100005248(&qword_10001C300);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

void sub_100007524(uint64_t a1, uint64_t a2, void *a3, void *a4, void (*a5)(id))
{
  if (a1)
  {
    swift_errorRetain();
    id v10 = (id)sub_10000796C(a1, a4, a3);
    swift_errorRelease();
    id v9 = v10;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = 0;
  if (a5)
  {
LABEL_3:
    id v11 = v9;
    swift_retain();
    a5(v11);
    sub_100007BA0((uint64_t)a5);
    id v9 = v11;
  }
LABEL_4:
}

uint64_t sub_1000075E0(void *a1)
{
  type metadata accessor for FLError(0);
  sub_100006DFC();
  sub_1000140C0();

  uint64_t result = 1;
  switch(v3)
  {
    case -10:
      uint64_t result = 40;
      break;
    case -9:
      uint64_t result = 39;
      break;
    case -8:
      uint64_t result = 38;
      break;
    case -7:
      uint64_t result = 7;
      break;
    case -6:
      uint64_t result = 6;
      break;
    case -5:
      uint64_t result = 5;
      break;
    case -4:
      uint64_t result = 4;
      break;
    case -3:
      uint64_t result = 3;
      break;
    case -2:
      uint64_t result = 2;
      break;
    case -1:
      return result;
    case 1:
      uint64_t result = 8;
      break;
    case 2:
      uint64_t result = 9;
      break;
    case 3:
      uint64_t result = 10;
      break;
    case 4:
      uint64_t result = 11;
      break;
    case 5:
      uint64_t result = 12;
      break;
    case 6:
      uint64_t result = 13;
      break;
    case 7:
      uint64_t result = 14;
      break;
    case 8:
      uint64_t result = 15;
      break;
    case 9:
      uint64_t result = 16;
      break;
    case 10:
      uint64_t result = 17;
      break;
    case 11:
      uint64_t result = 18;
      break;
    case 12:
      uint64_t result = 19;
      break;
    case 13:
      uint64_t result = 20;
      break;
    case 14:
      uint64_t result = 21;
      break;
    case 15:
      uint64_t result = 22;
      break;
    case 16:
      uint64_t result = 23;
      break;
    case 17:
      uint64_t result = 24;
      break;
    case 18:
      uint64_t result = 25;
      break;
    case 19:
      uint64_t result = 26;
      break;
    case 20:
      uint64_t result = 27;
      break;
    case 21:
      uint64_t result = 28;
      break;
    case 22:
      uint64_t result = 29;
      break;
    case 23:
      uint64_t result = 30;
      break;
    case 24:
      uint64_t result = 31;
      break;
    case 25:
      uint64_t result = 32;
      break;
    case 26:
      uint64_t result = 33;
      break;
    case 27:
      uint64_t result = 34;
      break;
    case 28:
      uint64_t result = 35;
      break;
    case 100:
      uint64_t result = 36;
      break;
    case 101:
      uint64_t result = 37;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_10000796C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = sub_1000140F0();
  id v6 = (id)sub_1000140F0();
  unsigned __int8 v7 = sub_1000075E0(v6);
  Class isa = (Class)[a2 data];
  if (isa)
  {
    uint64_t v9 = sub_100014140();
    unint64_t v11 = v10;

    Class isa = sub_100014130().super.isa;
    sub_100007B48(v9, v11);
  }
  [a3 trackFBFError:v7 forEventData:isa];

  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for InternalLogger();
  sub_100005518(v12, (uint64_t)qword_10001C508);
  sub_1000144B0(33);
  v17._countAndFlagsBits = 0xD00000000000001FLL;
  v17._object = (void *)0x8000000100015C00;
  sub_1000143C0(v17);
  sub_100005248(&qword_10001C300);
  sub_100014500();
  v13._countAndFlagsBits = 0;
  v14._countAndFlagsBits = 0xD00000000000006DLL;
  v14._object = (void *)0x8000000100015C20;
  v15._object = (void *)0x8000000100015C90;
  v13._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  InternalLogger.error(_:fromFile:fromFunction:)(v13, v14, v15);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007B48(uint64_t a1, unint64_t a2)
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

uint64_t sub_100007BA0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

Swift::Bool __swiftcall ExtensionSampling.isSampleIncluded(assistantId:)(Swift::String_optional assistantId)
{
  if (!assistantId.value._object) {
    return 0;
  }
  uint64_t v2 = *v1;
  if (!*v1) {
    return 1;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 1;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i = v2 + 48; ; i += 24)
  {
    uint64_t v5 = *(void *)(i - 16);
    if (v5 < 0) {
      break;
    }
    swift_bridgeObjectRetain();
    if (v5 >= sub_1000143A0())
    {
      swift_bridgeObjectRelease();
      break;
    }
    sub_1000143B0();
    sub_1000143F0();
    BOOL v6 = sub_100008B98();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v6) {
      break;
    }
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *ExtensionRecipe.init(sampling:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ExtensionRecipe.sampling.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  return sub_100005560(v2);
}

uint64_t sub_100007CF8()
{
  return 1;
}

void sub_100007D04()
{
}

uint64_t sub_100007D34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009AAC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100007D60()
{
  return 0;
}

void sub_100007D6C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100007D78(uint64_t a1)
{
  unint64_t v2 = sub_100008CEC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007DB4(uint64_t a1)
{
  unint64_t v2 = sub_100008CEC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtensionRecipe.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100005248(&qword_10001C3B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  BOOL v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  sub_100008CA8(a1, a1[3]);
  sub_100008CEC();
  sub_1000146B0();
  v9[1] = v7;
  sub_100008D40();
  sub_1000145B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExtensionRecipe.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100005248(&qword_10001C3D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CA8(a1, a1[3]);
  sub_100008CEC();
  sub_1000146A0();
  if (!v2)
  {
    sub_100008D94();
    sub_100014580();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return sub_100005308((uint64_t)a1);
}

uint64_t sub_1000080A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ExtensionRecipe.init(from:)(a1, a2);
}

uint64_t sub_1000080B8(void *a1)
{
  return ExtensionRecipe.encode(to:)(a1);
}

void *ExtensionSampling.init(assistantIdentifier:andIdentifiers:)@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = result[2];
  if (a2)
  {
    uint64_t v5 = a2;
    uint64_t result = (void *)swift_bridgeObjectRelease();
  }
  else if (v4)
  {
    uint64_t v6 = *result;
    uint64_t v7 = result[1];
    sub_100005248(&qword_10001C3E0);
    uint64_t result = (void *)swift_allocObject();
    uint64_t v5 = result;
    *((_OWORD *)result + 1) = xmmword_100015170;
    result[4] = v6;
    result[5] = v7;
    result[6] = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a3 = v5;
  return result;
}

Swift::Bool __swiftcall SampleByAssistantIdentifier.matchesData(assistantId:)(Swift::String assistantId)
{
  if (*v1 < 0) {
    return 0;
  }
  uint64_t v2 = *v1;
  if (v2 >= sub_1000143A0())
  {
    return 0;
  }
  else
  {
    sub_1000143B0();
    sub_1000143F0();
    BOOL v3 = sub_100008B98();
    swift_bridgeObjectRelease();
  }
  return v3;
}

Swift::Int sub_100008204()
{
  return sub_100014690();
}

Swift::Int sub_100008248()
{
  return sub_100014690();
}

uint64_t sub_10000828C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009B4C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000082B8(uint64_t a1)
{
  unint64_t v2 = sub_100008DE8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000082F4(uint64_t a1)
{
  unint64_t v2 = sub_100008DE8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ExtensionSampling.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100005248(&qword_10001C3E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  sub_100008CA8(a1, a1[3]);
  sub_100008DE8();
  sub_1000146B0();
  v9[1] = v7;
  sub_100005248(&qword_10001C3F8);
  sub_100008E90(&qword_10001C400, (void (*)(void))sub_100008E3C);
  sub_1000145B0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ExtensionSampling.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100005248(&qword_10001C410);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CA8(a1, a1[3]);
  sub_100008DE8();
  sub_1000146A0();
  if (!v2)
  {
    sub_100005248(&qword_10001C3F8);
    sub_100008E90(&qword_10001C418, (void (*)(void))sub_100008F00);
    sub_100014580();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return sub_100005308((uint64_t)a1);
}

uint64_t sub_100008658@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return ExtensionSampling.init(from:)(a1, a2);
}

uint64_t sub_100008670(void *a1)
{
  return ExtensionSampling.encode(to:)(a1);
}

RepackagingWorker::SampleByAssistantIdentifier __swiftcall SampleByAssistantIdentifier.init(position:characters:)(Swift::Int position, Swift::String characters)
{
  *(void *)uint64_t v2 = position;
  *(Swift::String *)(v2 + 8) = characters;
  result.characters = characters;
  result.position = position;
  return result;
}

uint64_t sub_100008694(char a1)
{
  if (a1) {
    return 0x6574636172616863;
  }
  else {
    return 0x6E6F697469736F70;
  }
}

BOOL sub_1000086D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000086E8()
{
  Swift::UInt v1 = *v0;
  sub_100014670();
  sub_100014680(v1);
  return sub_100014690();
}

void sub_100008730()
{
  sub_100014680(*v0);
}

Swift::Int sub_10000875C()
{
  Swift::UInt v1 = *v0;
  sub_100014670();
  sub_100014680(v1);
  return sub_100014690();
}

uint64_t sub_1000087A0()
{
  return sub_100008694(*v0);
}

uint64_t sub_1000087A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100009C04(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000087D0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000087DC(uint64_t a1)
{
  unint64_t v2 = sub_100008F54();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008818(uint64_t a1)
{
  unint64_t v2 = sub_100008F54();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t SampleByAssistantIdentifier.encode(to:)(void *a1)
{
  uint64_t v4 = sub_100005248(&qword_10001C428);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  v10[0] = *(void *)(v1 + 16);
  v10[1] = v8;
  sub_100008CA8(a1, a1[3]);
  sub_100008F54();
  sub_1000146B0();
  char v12 = 0;
  sub_1000145D0();
  if (!v2)
  {
    char v11 = 1;
    sub_1000145C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t SampleByAssistantIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005248(&qword_10001C438);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008CA8(a1, a1[3]);
  sub_100008F54();
  sub_1000146A0();
  if (!v2)
  {
    char v16 = 0;
    uint64_t v9 = sub_1000145A0();
    char v15 = 1;
    uint64_t v11 = sub_100014590();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v13;
  }
  return sub_100005308((uint64_t)a1);
}

uint64_t sub_100008B68@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SampleByAssistantIdentifier.init(from:)(a1, a2);
}

uint64_t sub_100008B80(void *a1)
{
  return SampleByAssistantIdentifier.encode(to:)(a1);
}

BOOL sub_100008B98()
{
  swift_bridgeObjectRetain();
  do
  {
    sub_1000143D0();
    uint64_t v2 = v1;
    if (!v1) {
      break;
    }
    uint64_t v3 = sub_100014340();
    uint64_t v5 = v4;
    if (v3 == sub_100014340() && v5 == v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      break;
    }
    char v0 = sub_1000145F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  while ((v0 & 1) == 0);
  swift_bridgeObjectRelease();
  return v2 != 0;
}

void *sub_100008CA8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100008CEC()
{
  unint64_t result = qword_10001C3C0;
  if (!qword_10001C3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3C0);
  }
  return result;
}

unint64_t sub_100008D40()
{
  unint64_t result = qword_10001C3C8;
  if (!qword_10001C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3C8);
  }
  return result;
}

unint64_t sub_100008D94()
{
  unint64_t result = qword_10001C3D8;
  if (!qword_10001C3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3D8);
  }
  return result;
}

unint64_t sub_100008DE8()
{
  unint64_t result = qword_10001C3F0;
  if (!qword_10001C3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3F0);
  }
  return result;
}

unint64_t sub_100008E3C()
{
  unint64_t result = qword_10001C408;
  if (!qword_10001C408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C408);
  }
  return result;
}

uint64_t sub_100008E90(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005358(&qword_10001C3F8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008F00()
{
  unint64_t result = qword_10001C420;
  if (!qword_10001C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C420);
  }
  return result;
}

unint64_t sub_100008F54()
{
  unint64_t result = qword_10001C430;
  if (!qword_10001C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C430);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2 != 1) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

uint64_t destroy for ExtensionRecipe(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  if (v3 == 1)
  {
    if (v4 != 1)
    {
      *a1 = v4;
      swift_bridgeObjectRetain();
      return a1;
    }
    uint64_t v5 = 1;
  }
  else
  {
    if (v4 != 1)
    {
      *a1 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_10000907C((uint64_t)a1);
    uint64_t v5 = *a2;
  }
  *a1 = v5;
  return a1;
}

uint64_t sub_10000907C(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for ExtensionSampling(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t *assignWithTake for ExtensionRecipe(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a1 != 1)
  {
    if (v3 != 1)
    {
      *a1 = v3;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_10000907C((uint64_t)a1);
    uint64_t v3 = 1;
  }
  *a1 = v3;
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtensionRecipe(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtensionRecipe(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionRecipe()
{
  return &type metadata for ExtensionRecipe;
}

void *initializeBufferWithCopyOfBuffer for ExtensionSampling(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExtensionSampling()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ExtensionSampling(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ExtensionSampling(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtensionSampling(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtensionSampling(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionSampling()
{
  return &type metadata for ExtensionSampling;
}

uint64_t initializeBufferWithCopyOfBuffer for SampleByAssistantIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SampleByAssistantIdentifier()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SampleByAssistantIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SampleByAssistantIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SampleByAssistantIdentifier(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SampleByAssistantIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SampleByAssistantIdentifier(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleByAssistantIdentifier()
{
  return &type metadata for SampleByAssistantIdentifier;
}

uint64_t getEnumTagSinglePayload for SampleByAssistantIdentifier.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SampleByAssistantIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x100009608);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_100009630(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SampleByAssistantIdentifier.CodingKeys()
{
  return &type metadata for SampleByAssistantIdentifier.CodingKeys;
}

uint64_t sub_100009658()
{
  return 0;
}

ValueMetadata *type metadata accessor for ExtensionSampling.CodingKeys()
{
  return &type metadata for ExtensionSampling.CodingKeys;
}

uint64_t _s17RepackagingWorker17ExtensionSamplingV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s17RepackagingWorker17ExtensionSamplingV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000975CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionRecipe.CodingKeys()
{
  return &type metadata for ExtensionRecipe.CodingKeys;
}

unint64_t sub_100009798()
{
  unint64_t result = qword_10001C440;
  if (!qword_10001C440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C440);
  }
  return result;
}

unint64_t sub_1000097F0()
{
  unint64_t result = qword_10001C448;
  if (!qword_10001C448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C448);
  }
  return result;
}

unint64_t sub_100009848()
{
  unint64_t result = qword_10001C450;
  if (!qword_10001C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C450);
  }
  return result;
}

unint64_t sub_1000098A0()
{
  unint64_t result = qword_10001C458;
  if (!qword_10001C458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C458);
  }
  return result;
}

unint64_t sub_1000098F8()
{
  unint64_t result = qword_10001C460;
  if (!qword_10001C460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C460);
  }
  return result;
}

unint64_t sub_100009950()
{
  unint64_t result = qword_10001C468;
  if (!qword_10001C468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C468);
  }
  return result;
}

unint64_t sub_1000099A8()
{
  unint64_t result = qword_10001C470;
  if (!qword_10001C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C470);
  }
  return result;
}

unint64_t sub_100009A00()
{
  unint64_t result = qword_10001C478;
  if (!qword_10001C478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C478);
  }
  return result;
}

unint64_t sub_100009A58()
{
  unint64_t result = qword_10001C480;
  if (!qword_10001C480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C480);
  }
  return result;
}

uint64_t sub_100009AAC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x676E696C706D6173 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000145F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100009B34()
{
  return 0x676E696C706D6173;
}

uint64_t sub_100009B4C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEB00000000737265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000145F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100009BE4()
{
  return 0x696669746E656469;
}

uint64_t sub_100009C04(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F697469736F70 && a2 == 0xE800000000000000;
  if (v3 || (sub_1000145F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574636172616863 && a2 == 0xEA00000000007372)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1000145F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

id SessionBuilderExtension.init()@<X0>(void *a1@<X8>)
{
  id v2 = [self sharedLoggerWithPersistenceConfiguration:1];
  id result = [objc_allocWithZone((Class)SiriAnalyticsInternalTelemetry) init];
  *a1 = v2;
  a1[1] = result;
  return result;
}

uint64_t SessionBuilderExtension.package(with:)(void *a1)
{
  uint64_t v4 = sub_1000141B0();
  *(void *)(v2 + 504) = v4;
  *(void *)(v2 + 512) = *(void *)(v4 - 8);
  *(void *)(v2 + 520) = swift_task_alloc();
  *(void *)(v2 + 528) = swift_task_alloc();
  uint64_t v5 = sub_100014190();
  *(void *)(v2 + 536) = v5;
  *(void *)(v2 + 544) = *(void *)(v5 - 8);
  *(void *)(v2 + 552) = swift_task_alloc();
  *(void *)(v2 + 560) = swift_task_alloc();
  *(void *)(v2 + 568) = swift_task_alloc();
  sub_100005248(&qword_10001C490);
  *(void *)(v2 + 576) = swift_task_alloc();
  *(void *)(v2 + 584) = swift_task_alloc();
  uint64_t v6 = sub_100014280();
  *(void *)(v2 + 592) = v6;
  *(void *)(v2 + 600) = *(void *)(v6 - 8);
  *(void *)(v2 + 608) = swift_task_alloc();
  *(void *)(v2 + 616) = type metadata accessor for InternalLogger();
  *(void *)(v2 + 624) = swift_task_alloc();
  *(void *)(v2 + 632) = swift_task_alloc();
  *(void *)(v2 + 640) = swift_task_alloc();
  *(void *)(v2 + 648) = swift_task_alloc();
  *(void *)(v2 + 656) = swift_task_alloc();
  *(void *)(v2 + 664) = swift_task_alloc();
  *(void *)(v2 + 672) = swift_task_alloc();
  *(void *)(v2 + 680) = swift_task_alloc();
  *(void *)(v2 + 688) = swift_task_alloc();
  *(void *)(v2 + 696) = *a1;
  *(_OWORD *)(v2 + 704) = *v1;
  return _swift_task_switch(sub_100009FFC, 0, 0);
}

uint64_t sub_100009FFC()
{
  sub_100014200();
  swift_allocObject();
  v0[90] = sub_1000141F0();
  v0[91] = swift_allocObject();
  BOOL v3 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of PluginStateService.fetch()
                         + async function pointer to dispatch thunk of PluginStateService.fetch());
  uint64_t v1 = (void *)swift_task_alloc();
  v0[92] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000A0D8;
  return v3();
}

uint64_t sub_10000A0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 744) = a1;
  *(void *)(v3 + 752) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000A1DC, 0, 0);
}

uint64_t sub_10000A1DC()
{
  *(_OWORD *)(*(void *)(v0 + 728) + 16) = *(_OWORD *)(v0 + 744);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 760) = v1;
  unint64_t v2 = sub_10000E47C((uint64_t)&_swiftEmptyArrayStorage);
  *(_DWORD *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 688);
  uint64_t v5 = sub_100005518(*(void *)(v0 + 616), (uint64_t)qword_10001C508);
  *(void *)(v0 + 768) = v5;
  sub_100005570(v5, v4);
  *(void *)(v0 + 488) = v3;
  sub_100005560(v3);
  v12._countAndFlagsBits = sub_100014380();
  sub_1000143C0(v12);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x203A657069636552;
  v7._object = (void *)0x8000000100015CB0;
  v6._object = (void *)0xE800000000000000;
  v7._countAndFlagsBits = 0xD00000000000006DLL;
  v8._countAndFlagsBits = 0x286567616B636170;
  v8._object = (void *)0xEE00293A68746977;
  InternalLogger.info(_:fromFile:fromFunction:)(v6, v7, v8);
  swift_bridgeObjectRelease();
  sub_1000055D4(v4);
  sub_1000141E0();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 776) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000A3B8;
  return static MessageStoreReader.vend()();
}

uint64_t sub_10000A3B8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 784) = a1;
  *(void *)(v3 + 792) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10000C978;
  }
  else {
    uint64_t v4 = sub_10000A4D0;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000A4D0()
{
  if (!*(void *)(v0 + 784))
  {
    uint64_t v11 = *(void *)(v0 + 760);
    sub_1000105E4();
    swift_allocError();
    *Swift::String v12 = 2;
    swift_willThrow();
    swift_beginAccess();
    uint64_t v13 = *(unsigned int *)(v11 + 16);
    uint64_t v14 = *(void *)(v11 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v13, v14);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
  uint64_t v1 = *(void *)(v0 + 696);
  uint64_t v2 = swift_allocBox();
  uint64_t v128 = v3;
  uint64_t v127 = v2;
  *(void *)(v0 + 800) = v2;
  uint64_t v4 = *(void *)(v0 + 768);
  if (v1 == 1)
  {
    uint64_t v5 = *(void *)(v0 + 608);
    uint64_t v6 = *(void *)(v0 + 600);
    uint64_t v7 = *(void *)(v0 + 592);
    swift_retain();
    sub_100014240();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v128, v5, v7);
    v8._countAndFlagsBits = 0xD000000000000017;
    v8._object = (void *)0x8000000100015D50;
    v9._object = (void *)0x8000000100015CB0;
    v9._countAndFlagsBits = 0xD00000000000006DLL;
    v10._countAndFlagsBits = 0x286567616B636170;
    v10._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v8, v9, v10);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 696);
    uint64_t v18 = *(void *)(v0 + 680);
    uint64_t v19 = *(void *)(v0 + 608);
    uint64_t v20 = *(void *)(v0 + 600);
    uint64_t v21 = *(void *)(v0 + 592);
    *(void *)(swift_allocObject() + 16) = v17;
    sub_100005560(v17);
    sub_100005560(v17);
    swift_retain();
    sub_100014240();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v128, v19, v21);
    sub_100005570(v4, v18);
    sub_1000144B0(22);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 496) = v17;
    v131._countAndFlagsBits = sub_100014380();
    sub_1000143C0(v131);
    swift_bridgeObjectRelease();
    v22._countAndFlagsBits = 0xD000000000000014;
    v23._object = (void *)0x8000000100015CB0;
    v22._object = (void *)0x8000000100015EA0;
    v23._countAndFlagsBits = 0xD00000000000006DLL;
    v24._countAndFlagsBits = 0x286567616B636170;
    v24._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v22, v23, v24);
    swift_bridgeObjectRelease();
    sub_1000055D4(v18);
  }
  uint64_t v25 = *(void *)(v0 + 760);
  uint64_t v26 = *(void *)(v0 + 728);
  uint64_t v27 = *(void *)(v0 + 608);
  uint64_t v28 = *(void *)(v0 + 600);
  uint64_t v125 = *(void *)(v0 + 592);
  swift_beginAccess();
  uint64_t v30 = *(void *)(v26 + 16);
  unint64_t v29 = *(void *)(v26 + 24);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v25;
  *(void *)(v31 + 24) = v127;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v26;
  *(void *)(v32 + 24) = v127;
  swift_retain_n();
  sub_100010690(v30, v29);
  swift_retain();
  swift_retain();
  sub_1000141D0();
  swift_release();
  swift_release();
  sub_1000106FC(v30, v29);
  swift_beginAccess();
  id v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
  v33(v27, v128, v125);
  uint64_t v34 = sub_100014270();
  id v35 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
  v35(v27, v125);
  uint64_t v36 = *(void *)(v0 + 760);
  if (!v34)
  {
    v61._countAndFlagsBits = 0xD000000000000011;
    v61._object = (void *)0x8000000100015E80;
    v62._object = (void *)0x8000000100015CB0;
    v62._countAndFlagsBits = 0xD00000000000006DLL;
    v63._countAndFlagsBits = 0x286567616B636170;
    v63._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v61, v62, v63);
    sub_100011730();
    id v64 = objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v123 = sub_100014290();
    swift_release_n();
    swift_release();
    swift_beginAccess();
    uint64_t v65 = *(unsigned int *)(v36 + 16);
    uint64_t v66 = *(void *)(v36 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v65, v66);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
LABEL_28:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v100 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v100(v123);
  }
  v126 = v33;
  swift_beginAccess();
  uint64_t v37 = sub_100014250();
  swift_endAccess();
  id v38 = sub_10000F008(v37);
  uint64_t v39 = sub_10000F7F4((uint64_t)v38);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v36 + 24) = v39;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 456) = 0;
  id v40 = (uint64_t *)(v0 + 456);
  uint64_t v41 = sub_10000FCC0(v37, (void *)(v0 + 456));
  *(void *)(v0 + 808) = v41;
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void *)(v0 + 768);
  if (!*(void *)(v41 + 16))
  {
    uint64_t v122 = *(void *)(v0 + 760);
    uint64_t v67 = *(void *)(v0 + 672);
    uint64_t v68 = *(void *)(v0 + 608);
    uint64_t v69 = *(void *)(v0 + 592);
    swift_bridgeObjectRelease();
    sub_100005570(v42, v67);
    sub_1000144B0(79);
    v134._countAndFlagsBits = 0xD00000000000001DLL;
    v134._object = (void *)0x8000000100015E30;
    sub_1000143C0(v134);
    v126(v68, v128, v69);
    uint64_t v70 = sub_100014270();
    v35(v68, v69);
    *(void *)(v0 + 472) = v70;
    v135._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v135);
    swift_bridgeObjectRelease();
    v136._countAndFlagsBits = 0xD00000000000002ELL;
    v136._object = (void *)0x8000000100015E50;
    sub_1000143C0(v136);
    v126(v68, v128, v69);
    uint64_t v71 = sub_100014230();
    v35(v68, v69);
    *(void *)(v0 + 480) = v71;
    v137._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v137);
    swift_bridgeObjectRelease();
    v72._countAndFlagsBits = 0;
    v73._object = (void *)0x8000000100015CB0;
    v72._object = (void *)0xE000000000000000;
    v73._countAndFlagsBits = 0xD00000000000006DLL;
    v74._countAndFlagsBits = 0x286567616B636170;
    v74._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v72, v73, v74);
    swift_bridgeObjectRelease();
    sub_1000055D4(v67);
    sub_100011730();
    id v75 = objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v123 = sub_100014290();
    swift_release_n();
    swift_release();
    uint64_t v76 = *(unsigned int *)(v122 + 16);
    uint64_t v77 = *(void *)(v122 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v76, v77);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    goto LABEL_28;
  }
  uint64_t v43 = *(void *)(v0 + 664);
  sub_100005570(*(void *)(v0 + 768), v43);
  sub_1000144B0(29);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 448) = *(void *)(v41 + 16);
  v132._countAndFlagsBits = sub_1000145E0();
  sub_1000143C0(v132);
  swift_bridgeObjectRelease();
  v133._countAndFlagsBits = 0xD000000000000010;
  v133._object = (void *)0x8000000100015D70;
  sub_1000143C0(v133);
  v44._countAndFlagsBits = 0x6974736973726550;
  v45._object = (void *)0x8000000100015CB0;
  v44._object = (void *)0xEB0000000020676ELL;
  v45._countAndFlagsBits = 0xD00000000000006DLL;
  v46._countAndFlagsBits = 0x286567616B636170;
  v46._object = (void *)0xEE00293A68746977;
  InternalLogger.info(_:fromFile:fromFunction:)(v44, v45, v46);
  swift_bridgeObjectRelease();
  sub_1000055D4(v43);
  char v47 = *(unsigned char *)(v41 + 32);
  *(unsigned char *)(v0 + 968) = v47;
  uint64_t v48 = -1;
  uint64_t v49 = -1 << v47;
  uint64_t v50 = *(void *)(v41 + 64);
  if (-v49 < 64) {
    uint64_t v48 = ~(-1 << -(char)v49);
  }
  *(_DWORD *)(v0 + 960) = enum case for OffDeviceTopic.orderedJoined(_:);
  *(_DWORD *)(v0 + 964) = enum case for OffDeviceTopic.telemetry(_:);
  *(void *)(v0 + 816) = 0;
  unint64_t v51 = v48 & v50;
  if (v51)
  {
    uint64_t v52 = 0;
    unint64_t v53 = __clz(__rbit64(v51));
    uint64_t v54 = (v51 - 1) & v51;
    v55 = *(void **)(v0 + 808);
LABEL_14:
    uint64_t v56 = *(void *)(v0 + 576);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16))(v56, v55[6] + *(void *)(*(void *)(v0 + 544) + 72) * v53, *(void *)(v0 + 536));
    uint64_t v57 = v55[7];
    uint64_t v58 = sub_100005248(&qword_10001C4A0);
    v59 = *(void **)(v57 + 8 * v53);
    *(void *)(v56 + *(int *)(v58 + 48)) = v59;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v56, 0, 1, v58);
    id v60 = v59;
    goto LABEL_23;
  }
  unint64_t v78 = 63 - v49;
  if ((unint64_t)(63 - v49) <= 0x7F)
  {
    uint64_t v52 = 0;
  }
  else
  {
    v55 = *(void **)(v0 + 808);
    unint64_t v79 = v55[9];
    if (v79)
    {
      uint64_t v52 = 1;
LABEL_20:
      uint64_t v54 = (v79 - 1) & v79;
      unint64_t v53 = __clz(__rbit64(v79)) + (v52 << 6);
      goto LABEL_14;
    }
    if (v78 < 0xC0)
    {
      uint64_t v52 = 1;
    }
    else
    {
      unint64_t v79 = v55[10];
      if (v79)
      {
        uint64_t v52 = 2;
        goto LABEL_20;
      }
      if (v78 < 0x100)
      {
        uint64_t v52 = 2;
      }
      else
      {
        unint64_t v79 = v55[11];
        if (v79)
        {
          uint64_t v52 = 3;
          goto LABEL_20;
        }
        if (v78 < 0x140)
        {
          uint64_t v52 = 3;
        }
        else
        {
          unint64_t v79 = v55[12];
          if (v79)
          {
            uint64_t v52 = 4;
            goto LABEL_20;
          }
          uint64_t v118 = 0;
          uint64_t v119 = v78 >> 6;
          uint64_t v120 = 5;
          if (v119 > 5) {
            uint64_t v120 = v119;
          }
          uint64_t v121 = v120 - 5;
          while (v121 != v118)
          {
            unint64_t v79 = v55[v118++ + 13];
            if (v79)
            {
              uint64_t v52 = v118 + 4;
              goto LABEL_20;
            }
          }
          uint64_t v52 = v119 - 1;
        }
      }
    }
  }
  uint64_t v80 = *(void *)(v0 + 576);
  uint64_t v81 = sub_100005248(&qword_10001C4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v80, 1, 1, v81);
  uint64_t v54 = 0;
LABEL_23:
  *(void *)(v0 + 832) = v54;
  *(void *)(v0 + 824) = v52;
  uint64_t v82 = *(void *)(v0 + 584);
  sub_100012728(*(void *)(v0 + 576), v82, &qword_10001C490);
  uint64_t v83 = sub_100005248(&qword_10001C4A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v83 - 8) + 48))(v82, 1, v83) == 1)
  {
    uint64_t v84 = *(void *)(v0 + 768);
    uint64_t v85 = *(void *)(v0 + 728);
    uint64_t v86 = *(void *)(v0 + 648);
    swift_release();
    sub_100005570(v84, v86);
    sub_1000144B0(24);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 440) = 0;
    v138._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v138);
    swift_bridgeObjectRelease();
    v87._countAndFlagsBits = 0xD000000000000016;
    v87._object = (void *)0x8000000100015D90;
    v88._countAndFlagsBits = 0xD00000000000006DLL;
    v88._object = (void *)0x8000000100015CB0;
    v89._countAndFlagsBits = 0x286567616B636170;
    v89._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v87, v88, v89);
    swift_bridgeObjectRelease();
    sub_1000055D4(v86);
    unint64_t v90 = *(void *)(v85 + 24);
    *(void *)(v0 + 936) = v90;
    if (v90 >> 60 == 15)
    {
      uint64_t v91 = *v40;
      if (*v40 >= 1)
      {
        uint64_t v92 = *(void *)(v0 + 640);
        sub_100005570(*(void *)(v0 + 768), v92);
        sub_1000144B0(49);
        swift_bridgeObjectRelease();
        *(void *)(v0 + 432) = v91;
        v139._countAndFlagsBits = sub_1000145E0();
        sub_1000143C0(v139);
        swift_bridgeObjectRelease();
        v93._countAndFlagsBits = 0xD00000000000002FLL;
        v94._object = (void *)0x8000000100015CB0;
        v93._object = (void *)0x8000000100015DB0;
        v94._countAndFlagsBits = 0xD00000000000006DLL;
        v95._countAndFlagsBits = 0x286567616B636170;
        v95._object = (void *)0xEE00293A68746977;
        InternalLogger.fault(_:fromFile:fromFunction:)(v93, v94, v95);
        swift_bridgeObjectRelease();
        sub_1000055D4(v92);
      }
      uint64_t v96 = *(void *)(v0 + 760);
      id v97 = objc_allocWithZone((Class)sub_1000142B0());
      uint64_t v123 = sub_1000142A0();
      swift_release_n();
      swift_release();
      uint64_t v98 = *(unsigned int *)(v96 + 16);
      uint64_t v99 = *(void *)(v96 + 24);
      swift_bridgeObjectRetain();
      sub_10000E688(v98, v99);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      goto LABEL_28;
    }
    uint64_t v113 = *(void *)(*(void *)(v0 + 728) + 16);
    *(void *)(v0 + 944) = v113;
    sub_100010690(v113, v90);
    v114._object = (void *)0x8000000100015DE0;
    v114._countAndFlagsBits = 0xD000000000000016;
    v115._countAndFlagsBits = 0xD00000000000006DLL;
    v115._object = (void *)0x8000000100015CB0;
    v116._countAndFlagsBits = 0x286567616B636170;
    v116._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v114, v115, v116);
    v129 = (uint64_t (*)(uint64_t, unint64_t))((char *)&async function pointer to dispatch thunk of PluginStateService.save(_:)
                                                             + async function pointer to dispatch thunk of PluginStateService.save(_:));
    v117 = (void *)swift_task_alloc();
    *(void *)(v0 + 952) = v117;
    void *v117 = v0;
    v117[1] = sub_10000C5A4;
    return v129(v113, v90);
  }
  else
  {
    uint64_t v101 = *(unsigned int *)(v0 + 960);
    uint64_t v102 = *(void *)(v0 + 568);
    uint64_t v103 = *(void *)(v0 + 544);
    uint64_t v104 = *(void *)(v0 + 528);
    uint64_t v105 = *(void *)(v0 + 504);
    uint64_t v106 = *(void *)(v0 + 512);
    uint64_t v107 = *(void *)(*(void *)(v0 + 584) + *(int *)(v83 + 48));
    *(void *)(v0 + 840) = v107;
    (*(void (**)(uint64_t))(v103 + 32))(v102);
    v108 = *(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 104);
    *(void *)(v0 + 848) = v108;
    *(void *)(v0 + 856) = (v106 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v108(v104, v101, v105);
    v109 = (void *)swift_task_alloc();
    *(void *)(v0 + 864) = v109;
    void *v109 = v0;
    v109[1] = sub_10000B798;
    uint64_t v110 = *(void *)(v0 + 712);
    uint64_t v111 = *(void *)(v0 + 704);
    uint64_t v112 = *(void *)(v0 + 528);
    return sub_100007124(v107, v112, v111, v110);
  }
}

uint64_t sub_10000B798()
{
  uint64_t v2 = (void *)*v1;
  v2[109] = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[66];
  uint64_t v4 = v2[64];
  uint64_t v5 = v2[63];
  Swift::String v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v6 = v4 + 8;
  uint64_t v7 = v8;
  if (v0)
  {
    v7(v3, v5);
    Swift::String v9 = sub_10000CC64;
  }
  else
  {
    v2[110] = v7;
    v2[111] = v6 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v7(v3, v5);
    Swift::String v9 = sub_10000B91C;
  }
  return _swift_task_switch(v9, 0, 0);
}

void sub_10000B91C()
{
  uint64_t v1 = *(void *)(v0 + 816);
  *(void *)(v0 + 896) = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 544) + 16))(*(void *)(v0 + 560), *(void *)(v0 + 568), *(void *)(v0 + 536));
  swift_beginAccess();
  uint64_t v3 = sub_100010330((void *)(v0 + 48));
  if (*(void *)(v2 + 24) != 1) {
    *(unsigned char *)(v2 + 17) = 1;
  }
  ((void (*)(uint64_t, void))v3)(v0 + 48, 0);
  uint64_t v4 = *(void *)(v0 + 768);
  uint64_t v5 = *(void *)(v0 + 760);
  uint64_t v6 = *(void *)(v0 + 656);
  uint64_t v7 = *(void *)(v0 + 560);
  uint64_t v8 = *(void *)(v0 + 544);
  uint64_t v9 = *(void *)(v0 + 536);
  swift_endAccess();
  Swift::String v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v0 + 904) = v10;
  *(void *)(v0 + 912) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v7, v9);
  sub_100005570(v4, v6);
  *(void *)(v0 + 392) = 0;
  *(void *)(v0 + 400) = 0xE000000000000000;
  sub_1000144B0(38);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 376) = 0xD000000000000024;
  *(void *)(v0 + 384) = 0x8000000100015E00;
  sub_10001266C(&qword_10001C4A8);
  v85._countAndFlagsBits = sub_1000145E0();
  sub_1000143C0(v85);
  swift_bridgeObjectRelease();
  v11._object = (void *)0x8000000100015CB0;
  v11._countAndFlagsBits = 0xD00000000000006DLL;
  v12._countAndFlagsBits = 0x286567616B636170;
  v12._object = (void *)0xEE00293A68746977;
  InternalLogger.debug(_:fromFile:fromFunction:)(*(Swift::String *)(v0 + 376), v11, v12);
  swift_bridgeObjectRelease();
  sub_1000055D4(v6);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v5 + 24);
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_100011560(*(void *)(v0 + 568)), (v15 & 1) != 0))
  {
    uint64_t v16 = *(void *)(v0 + 568);
    uint64_t v17 = *(void *)(v13 + 56) + 32 * v14;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    __int16 v20 = *(unsigned __int8 *)(v17 + 16);
    int v21 = *(unsigned __int8 *)(v17 + 17);
    Swift::String v22 = *(void **)(v17 + 24);
    swift_endAccess();
    id v23 = v22;
    if (v21) {
      __int16 v24 = 256;
    }
    else {
      __int16 v24 = 0;
    }
    id v25 = sub_100006858(v16, v18, v19, v24 | v20, v22);

    id v26 = [v25 wrapAsAnyEvent];
    *(void *)(v0 + 920) = v26;

    if (v26)
    {
      (*(void (**)(void, void, void))(v0 + 848))(*(void *)(v0 + 520), *(unsigned int *)(v0 + 964), *(void *)(v0 + 504));
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 928) = v27;
      *uint64_t v27 = v0;
      v27[1] = sub_10000C410;
      uint64_t v28 = *(void *)(v0 + 712);
      uint64_t v29 = *(void *)(v0 + 704);
      uint64_t v30 = *(void *)(v0 + 520);
LABEL_42:
      sub_100007124((uint64_t)v26, v30, v29, v28);
      return;
    }
    uint64_t v31 = *(void **)(v0 + 840);
  }
  else
  {
    uint64_t v31 = *(void **)(v0 + 840);
    swift_endAccess();
  }

  (*(void (**)(void, void))(v0 + 904))(*(void *)(v0 + 568), *(void *)(v0 + 536));
  uint64_t v32 = *(void *)(v0 + 896);
  unint64_t v33 = *(void *)(v0 + 832);
  int64_t v34 = *(void *)(v0 + 824);
  *(void *)(v0 + 816) = v32;
  if (v33)
  {
    uint64_t v35 = (v33 - 1) & v33;
    unint64_t v36 = __clz(__rbit64(v33)) | (v34 << 6);
    uint64_t v37 = *(void *)(v0 + 808);
LABEL_14:
    uint64_t v38 = *(void *)(v0 + 576);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16))(v38, *(void *)(v37 + 48) + *(void *)(*(void *)(v0 + 544) + 72) * v36, *(void *)(v0 + 536));
    uint64_t v39 = *(void *)(v37 + 56);
    uint64_t v40 = sub_100005248(&qword_10001C4A0);
    uint64_t v41 = *(void **)(v39 + 8 * v36);
    *(void *)(v38 + *(int *)(v40 + 48)) = v41;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v38, 0, 1, v40);
    id v42 = v41;
    goto LABEL_34;
  }
  int64_t v43 = v34 + 1;
  if (__OFADD__(v34, 1)) {
    goto LABEL_49;
  }
  int64_t v44 = (unint64_t)((1 << *(unsigned char *)(v0 + 968)) + 63) >> 6;
  if (v43 < v44)
  {
    uint64_t v37 = *(void *)(v0 + 808);
    uint64_t v45 = v37 + 64;
    unint64_t v46 = *(void *)(v37 + 64 + 8 * v43);
    if (v46)
    {
LABEL_18:
      uint64_t v35 = (v46 - 1) & v46;
      unint64_t v36 = __clz(__rbit64(v46)) + (v43 << 6);
      int64_t v34 = v43;
      goto LABEL_14;
    }
    int64_t v47 = v34 + 2;
    ++v34;
    if (v43 + 1 < v44)
    {
      unint64_t v46 = *(void *)(v45 + 8 * v47);
      if (v46)
      {
LABEL_22:
        int64_t v43 = v47;
        goto LABEL_18;
      }
      int64_t v34 = v43 + 1;
      if (v43 + 2 < v44)
      {
        unint64_t v46 = *(void *)(v45 + 8 * (v43 + 2));
        if (v46)
        {
          v43 += 2;
          goto LABEL_18;
        }
        int64_t v47 = v43 + 3;
        int64_t v34 = v43 + 2;
        if (v43 + 3 < v44)
        {
          unint64_t v46 = *(void *)(v45 + 8 * v47);
          if (v46) {
            goto LABEL_22;
          }
          while (1)
          {
            int64_t v43 = v47 + 1;
            if (__OFADD__(v47, 1)) {
              break;
            }
            if (v43 >= v44)
            {
              int64_t v34 = v44 - 1;
              goto LABEL_33;
            }
            unint64_t v46 = *(void *)(v45 + 8 * v43);
            ++v47;
            if (v46) {
              goto LABEL_18;
            }
          }
LABEL_50:
          __break(1u);
          return;
        }
      }
    }
  }
LABEL_33:
  uint64_t v48 = *(void *)(v0 + 576);
  uint64_t v49 = sub_100005248(&qword_10001C4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 1, 1, v49);
  uint64_t v35 = 0;
LABEL_34:
  *(void *)(v0 + 832) = v35;
  *(void *)(v0 + 824) = v34;
  uint64_t v50 = *(void *)(v0 + 584);
  sub_100012728(*(void *)(v0 + 576), v50, &qword_10001C490);
  uint64_t v51 = sub_100005248(&qword_10001C4A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 1, v51) != 1)
  {
    uint64_t v69 = *(unsigned int *)(v0 + 960);
    uint64_t v70 = *(void *)(v0 + 568);
    uint64_t v71 = *(void *)(v0 + 544);
    uint64_t v72 = *(void *)(v0 + 528);
    uint64_t v73 = *(void *)(v0 + 504);
    uint64_t v74 = *(void *)(v0 + 512);
    id v26 = *(id *)(*(void *)(v0 + 584) + *(int *)(v51 + 48));
    *(void *)(v0 + 840) = v26;
    (*(void (**)(uint64_t))(v71 + 32))(v70);
    id v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 104);
    *(void *)(v0 + 848) = v75;
    *(void *)(v0 + 856) = (v74 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v75(v72, v69, v73);
    uint64_t v76 = (void *)swift_task_alloc();
    *(void *)(v0 + 864) = v76;
    *uint64_t v76 = v0;
    v76[1] = sub_10000B798;
    uint64_t v28 = *(void *)(v0 + 712);
    uint64_t v29 = *(void *)(v0 + 704);
    uint64_t v30 = *(void *)(v0 + 528);
    goto LABEL_42;
  }
  uint64_t v52 = *(void *)(v0 + 768);
  uint64_t v53 = *(void *)(v0 + 728);
  uint64_t v54 = *(void *)(v0 + 648);
  swift_release();
  sub_100005570(v52, v54);
  sub_1000144B0(24);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 440) = v32;
  v86._countAndFlagsBits = sub_1000145E0();
  sub_1000143C0(v86);
  swift_bridgeObjectRelease();
  v55._countAndFlagsBits = 0xD000000000000016;
  v55._object = (void *)0x8000000100015D90;
  v56._countAndFlagsBits = 0xD00000000000006DLL;
  v56._object = (void *)0x8000000100015CB0;
  v57._countAndFlagsBits = 0x286567616B636170;
  v57._object = (void *)0xEE00293A68746977;
  InternalLogger.info(_:fromFile:fromFunction:)(v55, v56, v57);
  swift_bridgeObjectRelease();
  sub_1000055D4(v54);
  unint64_t v58 = *(void *)(v53 + 24);
  *(void *)(v0 + 936) = v58;
  if (v58 >> 60 == 15)
  {
    uint64_t v59 = *(void *)(v0 + 456);
    if (v59 >= 1)
    {
      uint64_t v60 = *(void *)(v0 + 640);
      sub_100005570(*(void *)(v0 + 768), v60);
      sub_1000144B0(49);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 432) = v59;
      v87._countAndFlagsBits = sub_1000145E0();
      sub_1000143C0(v87);
      swift_bridgeObjectRelease();
      v61._countAndFlagsBits = 0xD00000000000002FLL;
      v62._object = (void *)0x8000000100015CB0;
      v61._object = (void *)0x8000000100015DB0;
      v62._countAndFlagsBits = 0xD00000000000006DLL;
      v63._countAndFlagsBits = 0x286567616B636170;
      v63._object = (void *)0xEE00293A68746977;
      InternalLogger.fault(_:fromFile:fromFunction:)(v61, v62, v63);
      swift_bridgeObjectRelease();
      sub_1000055D4(v60);
    }
    uint64_t v64 = *(void *)(v0 + 760);
    id v65 = objc_allocWithZone((Class)sub_1000142B0());
    uint64_t v82 = sub_1000142A0();
    swift_release_n();
    swift_release();
    uint64_t v66 = *(unsigned int *)(v64 + 16);
    uint64_t v67 = *(void *)(v64 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v66, v67);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v68 = *(void (**)(uint64_t))(v0 + 8);
    v68(v82);
  }
  else
  {
    uint64_t v77 = *(void *)(*(void *)(v0 + 728) + 16);
    *(void *)(v0 + 944) = v77;
    sub_100010690(v77, v58);
    v78._object = (void *)0x8000000100015DE0;
    v78._countAndFlagsBits = 0xD000000000000016;
    v79._countAndFlagsBits = 0xD00000000000006DLL;
    v79._object = (void *)0x8000000100015CB0;
    v80._countAndFlagsBits = 0x286567616B636170;
    v80._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v78, v79, v80);
    uint64_t v83 = (void (*)(uint64_t, unint64_t))((char *)&async function pointer to dispatch thunk of PluginStateService.save(_:)
                                                         + async function pointer to dispatch thunk of PluginStateService.save(_:));
    uint64_t v81 = (void *)swift_task_alloc();
    *(void *)(v0 + 952) = v81;
    *uint64_t v81 = v0;
    v81[1] = sub_10000C5A4;
    v83(v77, v58);
  }
}

uint64_t sub_10000C410()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[110];
  uint64_t v4 = v2[65];
  uint64_t v5 = v2[63];
  if (v0)
  {
    swift_errorRelease();
    v3(v4, v5);
    uint64_t v6 = sub_10000D1E4;
  }
  else
  {
    v3(v4, v5);
    uint64_t v6 = sub_100012D98;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10000C5A4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000C6A0, 0, 0);
}

uint64_t sub_10000C6A0()
{
  sub_1000106FC(v0[118], v0[117]);
  uint64_t v1 = v0[57];
  if (v1 >= 1)
  {
    uint64_t v2 = v0[80];
    sub_100005570(v0[96], v2);
    sub_1000144B0(49);
    swift_bridgeObjectRelease();
    v0[54] = v1;
    v14._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v14);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = 0xD00000000000002FLL;
    v4._countAndFlagsBits = 0xD00000000000006DLL;
    v4._object = (void *)0x8000000100015CB0;
    v3._object = (void *)0x8000000100015DB0;
    v5._countAndFlagsBits = 0x286567616B636170;
    v5._object = (void *)0xEE00293A68746977;
    InternalLogger.fault(_:fromFile:fromFunction:)(v3, v4, v5);
    swift_bridgeObjectRelease();
    sub_1000055D4(v2);
  }
  uint64_t v6 = v0[95];
  id v7 = objc_allocWithZone((Class)sub_1000142B0());
  uint64_t v12 = sub_1000142A0();
  swift_release_n();
  swift_release();
  uint64_t v8 = *(unsigned int *)(v6 + 16);
  uint64_t v9 = *(void *)(v6 + 24);
  swift_bridgeObjectRetain();
  sub_10000E688(v8, v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v10 = (uint64_t (*)(uint64_t))v0[1];
  return v10(v12);
}

uint64_t sub_10000C978()
{
  uint64_t v1 = *(void *)(v0 + 792);
  uint64_t v2 = *(void *)(v0 + 760);
  uint64_t v3 = *(void *)(v0 + 632);
  sub_100005570(*(void *)(v0 + 768), v3);
  sub_1000144B0(39);
  *(void *)(v0 + 344) = 0;
  *(void *)(v0 + 352) = 0xE000000000000000;
  v12._object = (void *)0x8000000100015D20;
  v12._countAndFlagsBits = 0xD000000000000025;
  sub_1000143C0(v12);
  *(void *)(v0 + 464) = v1;
  sub_100005248(&qword_10001C300);
  sub_100014500();
  v4._countAndFlagsBits = 0xD00000000000006DLL;
  v4._object = (void *)0x8000000100015CB0;
  v5._countAndFlagsBits = 0x286567616B636170;
  v5._object = (void *)0xEE00293A68746977;
  InternalLogger.error(_:fromFile:fromFunction:)(*(Swift::String *)(v0 + 344), v4, v5);
  swift_bridgeObjectRelease();
  sub_1000055D4(v3);
  sub_1000105E4();
  swift_allocError();
  *uint64_t v6 = 0;
  swift_willThrow();
  swift_errorRelease();
  swift_beginAccess();
  uint64_t v7 = *(unsigned int *)(v2 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  sub_10000E688(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_10000CC64()
{
  *(void *)(v0 + 424) = *(void *)(v0 + 872);
  swift_errorRetain();
  sub_100005248(&qword_10001C300);
  type metadata accessor for FLError(0);
  if (swift_dynamicCast())
  {
    uint64_t v1 = *(void *)(v0 + 568);
    uint64_t v2 = *(void *)(v0 + 552);
    uint64_t v3 = *(void *)(v0 + 544);
    uint64_t v4 = *(void *)(v0 + 536);
    swift_errorRelease();
    uint64_t v31 = *(void **)(v0 + 408);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
    swift_beginAccess();
    uint64_t v6 = sub_100010330((void *)(v0 + 16));
    uint64_t v7 = *(void **)(v5 + 24);
    if (v7 != (void *)1)
    {
      *(void *)(v5 + 24) = v31;
      id v8 = v31;
    }
    ((void (*)(uint64_t, void))v6)(v0 + 16, 0);
    uint64_t v9 = *(void *)(v0 + 768);
    uint64_t v29 = *(void *)(v0 + 760);
    uint64_t v30 = *(void **)(v0 + 840);
    uint64_t v10 = *(void *)(v0 + 624);
    uint64_t v11 = *(void *)(v0 + 568);
    uint64_t v12 = *(void *)(v0 + 552);
    uint64_t v13 = *(void *)(v0 + 544);
    uint64_t v14 = *(void *)(v0 + 536);
    swift_endAccess();
    char v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v15(v12, v14);
    sub_100005570(v9, v10);
    sub_1000144B0(48);
    *(void *)(v0 + 360) = 0;
    *(void *)(v0 + 368) = 0xE000000000000000;
    v33._object = (void *)0x8000000100015C00;
    v33._countAndFlagsBits = 0xD00000000000001FLL;
    sub_1000143C0(v33);
    *(void *)(v0 + 416) = v31;
    sub_100014500();
    v34._countAndFlagsBits = 0x6F6973736573202CLL;
    v34._object = (void *)0xED00003D64695F6ELL;
    sub_1000143C0(v34);
    sub_10001266C(&qword_10001C4A8);
    v35._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v35);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 0xD00000000000006DLL;
    v16._object = (void *)0x8000000100015CB0;
    v17._countAndFlagsBits = 0x286567616B636170;
    v17._object = (void *)0xEE00293A68746977;
    InternalLogger.error(_:fromFile:fromFunction:)(*(Swift::String *)(v0 + 360), v16, v17);
    swift_bridgeObjectRelease();
    sub_1000055D4(v10);
    sub_1000105E4();
    swift_allocError();
    *uint64_t v18 = 1;
    swift_willThrow();
    swift_release_n();

    v15(v11, v14);
    swift_release();
    swift_errorRelease();
    swift_release();
    uint64_t v19 = *(unsigned int *)(v29 + 16);
    uint64_t v20 = *(void *)(v29 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v19, v20);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 760);
    uint64_t v22 = *(void *)(v0 + 568);
    uint64_t v23 = *(void *)(v0 + 544);
    uint64_t v24 = *(void *)(v0 + 536);

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    swift_release();
    swift_errorRelease();
    swift_release();
    uint64_t v25 = *(unsigned int *)(v21 + 16);
    uint64_t v26 = *(void *)(v21 + 24);
    swift_bridgeObjectRetain();
    sub_10000E688(v25, v26);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
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
  swift_task_dealloc();
  uint64_t v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_10000D1E4()
{
  uint64_t v1 = *(void **)(v0 + 920);
  uint64_t v2 = *(void **)(v0 + 840);
  uint64_t v3 = *(void *)(v0 + 568);
  swift_beginAccess();
  uint64_t v4 = sub_1000115E4(v3);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  swift_endAccess();

  sub_100011720(v4, v6, v8, v10);
  uint64_t result = (*(uint64_t (**)(void, void))(v0 + 904))(*(void *)(v0 + 568), *(void *)(v0 + 536));
  uint64_t v12 = *(void *)(v0 + 896);
  unint64_t v13 = *(void *)(v0 + 832);
  int64_t v14 = *(void *)(v0 + 824);
  *(void *)(v0 + 816) = v12;
  if (v13)
  {
    uint64_t v15 = (v13 - 1) & v13;
    unint64_t v16 = __clz(__rbit64(v13)) | (v14 << 6);
    uint64_t v17 = *(void *)(v0 + 808);
LABEL_3:
    uint64_t v18 = *(void *)(v0 + 576);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 544) + 16))(v18, *(void *)(v17 + 48) + *(void *)(*(void *)(v0 + 544) + 72) * v16, *(void *)(v0 + 536));
    uint64_t v19 = *(void *)(v17 + 56);
    uint64_t v20 = sub_100005248(&qword_10001C4A0);
    uint64_t v21 = *(void **)(v19 + 8 * v16);
    *(void *)(v18 + *(int *)(v20 + 48)) = v21;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 0, 1, v20);
    id v22 = v21;
    goto LABEL_22;
  }
  int64_t v23 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  int64_t v24 = (unint64_t)((1 << *(unsigned char *)(v0 + 968)) + 63) >> 6;
  if (v23 < v24)
  {
    uint64_t v17 = *(void *)(v0 + 808);
    uint64_t v25 = v17 + 64;
    unint64_t v26 = *(void *)(v17 + 64 + 8 * v23);
    if (v26)
    {
LABEL_7:
      uint64_t v15 = (v26 - 1) & v26;
      unint64_t v16 = __clz(__rbit64(v26)) + (v23 << 6);
      int64_t v14 = v23;
      goto LABEL_3;
    }
    int64_t v27 = v14 + 2;
    ++v14;
    if (v23 + 1 < v24)
    {
      unint64_t v26 = *(void *)(v25 + 8 * v27);
      if (v26)
      {
LABEL_10:
        int64_t v23 = v27;
        goto LABEL_7;
      }
      int64_t v14 = v23 + 1;
      if (v23 + 2 < v24)
      {
        unint64_t v26 = *(void *)(v25 + 8 * (v23 + 2));
        if (v26)
        {
          v23 += 2;
          goto LABEL_7;
        }
        int64_t v27 = v23 + 3;
        int64_t v14 = v23 + 2;
        if (v23 + 3 < v24)
        {
          unint64_t v26 = *(void *)(v25 + 8 * v27);
          if (v26) {
            goto LABEL_10;
          }
          while (1)
          {
            int64_t v23 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              break;
            }
            if (v23 >= v24)
            {
              int64_t v14 = v24 - 1;
              goto LABEL_21;
            }
            unint64_t v26 = *(void *)(v25 + 8 * v23);
            ++v27;
            if (v26) {
              goto LABEL_7;
            }
          }
LABEL_36:
          __break(1u);
          return result;
        }
      }
    }
  }
LABEL_21:
  uint64_t v28 = *(void *)(v0 + 576);
  uint64_t v29 = sub_100005248(&qword_10001C4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 1, 1, v29);
  uint64_t v15 = 0;
LABEL_22:
  *(void *)(v0 + 832) = v15;
  *(void *)(v0 + 824) = v14;
  uint64_t v30 = *(void *)(v0 + 584);
  sub_100012728(*(void *)(v0 + 576), v30, &qword_10001C490);
  uint64_t v31 = sub_100005248(&qword_10001C4A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v30, 1, v31) == 1)
  {
    uint64_t v32 = *(void *)(v0 + 768);
    uint64_t v33 = *(void *)(v0 + 728);
    uint64_t v34 = *(void *)(v0 + 648);
    swift_release();
    sub_100005570(v32, v34);
    sub_1000144B0(24);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 440) = v12;
    v69._countAndFlagsBits = sub_1000145E0();
    sub_1000143C0(v69);
    swift_bridgeObjectRelease();
    v35._countAndFlagsBits = 0xD000000000000016;
    v35._object = (void *)0x8000000100015D90;
    v36._countAndFlagsBits = 0xD00000000000006DLL;
    v36._object = (void *)0x8000000100015CB0;
    v37._countAndFlagsBits = 0x286567616B636170;
    v37._object = (void *)0xEE00293A68746977;
    InternalLogger.info(_:fromFile:fromFunction:)(v35, v36, v37);
    swift_bridgeObjectRelease();
    sub_1000055D4(v34);
    unint64_t v38 = *(void *)(v33 + 24);
    *(void *)(v0 + 936) = v38;
    if (v38 >> 60 == 15)
    {
      uint64_t v39 = *(void *)(v0 + 456);
      if (v39 >= 1)
      {
        uint64_t v40 = *(void *)(v0 + 640);
        sub_100005570(*(void *)(v0 + 768), v40);
        sub_1000144B0(49);
        swift_bridgeObjectRelease();
        *(void *)(v0 + 432) = v39;
        v70._countAndFlagsBits = sub_1000145E0();
        sub_1000143C0(v70);
        swift_bridgeObjectRelease();
        v41._countAndFlagsBits = 0xD00000000000002FLL;
        v42._object = (void *)0x8000000100015CB0;
        v41._object = (void *)0x8000000100015DB0;
        v42._countAndFlagsBits = 0xD00000000000006DLL;
        v43._countAndFlagsBits = 0x286567616B636170;
        v43._object = (void *)0xEE00293A68746977;
        InternalLogger.fault(_:fromFile:fromFunction:)(v41, v42, v43);
        swift_bridgeObjectRelease();
        sub_1000055D4(v40);
      }
      uint64_t v44 = *(void *)(v0 + 760);
      id v45 = objc_allocWithZone((Class)sub_1000142B0());
      uint64_t v66 = sub_1000142A0();
      swift_release_n();
      swift_release();
      uint64_t v46 = *(unsigned int *)(v44 + 16);
      uint64_t v47 = *(void *)(v44 + 24);
      swift_bridgeObjectRetain();
      sub_10000E688(v46, v47);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
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
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v48 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v48(v66);
    }
    else
    {
      uint64_t v61 = *(void *)(*(void *)(v0 + 728) + 16);
      *(void *)(v0 + 944) = v61;
      sub_100010690(v61, v38);
      v62._object = (void *)0x8000000100015DE0;
      v62._countAndFlagsBits = 0xD000000000000016;
      v63._countAndFlagsBits = 0xD00000000000006DLL;
      v63._object = (void *)0x8000000100015CB0;
      v64._countAndFlagsBits = 0x286567616B636170;
      v64._object = (void *)0xEE00293A68746977;
      InternalLogger.info(_:fromFile:fromFunction:)(v62, v63, v64);
      uint64_t v67 = (uint64_t (*)(uint64_t, unint64_t))((char *)&async function pointer to dispatch thunk of PluginStateService.save(_:)
                                                              + async function pointer to dispatch thunk of PluginStateService.save(_:));
      id v65 = (void *)swift_task_alloc();
      *(void *)(v0 + 952) = v65;
      *id v65 = v0;
      v65[1] = sub_10000C5A4;
      return v67(v61, v38);
    }
  }
  else
  {
    uint64_t v49 = *(unsigned int *)(v0 + 960);
    uint64_t v50 = *(void *)(v0 + 568);
    uint64_t v51 = *(void *)(v0 + 544);
    uint64_t v52 = *(void *)(v0 + 528);
    uint64_t v53 = *(void *)(v0 + 504);
    uint64_t v54 = *(void *)(v0 + 512);
    uint64_t v55 = *(void *)(*(void *)(v0 + 584) + *(int *)(v31 + 48));
    *(void *)(v0 + 840) = v55;
    (*(void (**)(uint64_t))(v51 + 32))(v50);
    Swift::String v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 104);
    *(void *)(v0 + 848) = v56;
    *(void *)(v0 + 856) = (v54 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v56(v52, v49, v53);
    Swift::String v57 = (void *)swift_task_alloc();
    *(void *)(v0 + 864) = v57;
    *Swift::String v57 = v0;
    v57[1] = sub_10000B798;
    uint64_t v58 = *(void *)(v0 + 712);
    uint64_t v59 = *(void *)(v0 + 704);
    uint64_t v60 = *(void *)(v0 + 528);
    return sub_100007124(v55, v60, v59, v58);
  }
}

uint64_t sub_10000DA40()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_100007B48(*(void *)(v0 + 16), v1);
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DA88()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DAC0(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001ELL;
  unint64_t v4 = 0x8000000100015890;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x726F727245666266;
      break;
    case 2:
      unint64_t v4 = 0x80000001000158C0;
      unint64_t v3 = 0xD000000000000015;
      break;
    case 3:
      unint64_t v4 = 0xEA00000000007365;
      unint64_t v3 = 0x67617373654D6F6ELL;
      break;
    case 4:
      unint64_t v4 = 0xEF646E756F46736ELL;
      unint64_t v3 = 0x6F69737365536F6ELL;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xD00000000000001ELL;
  unint64_t v6 = 0x8000000100015890;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v3 == 0x726F727245666266) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0x80000001000158C0;
      if (v3 != 0xD000000000000015) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xEA00000000007365;
      unint64_t v5 = 0x67617373654D6F6ELL;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xEF646E756F46736ELL;
      if (v3 != 0x6F69737365536F6ELL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v3 != v5) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_1000145F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10000DCB0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x8000000100015840;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000012;
      unint64_t v3 = 0x8000000100015860;
      break;
    case 2:
      unint64_t v3 = 0xEA00000000006465;
      unint64_t v5 = 0x6C706D6153746F6ELL;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x64657070696B73;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x8000000100015840;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x8000000100015860;
      if (v5 == 0xD000000000000012) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xEA00000000006465;
      unint64_t v2 = 0x6C706D6153746F6ELL;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      if (v5 == 0x64657070696B73) {
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
        char v7 = sub_1000145F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_10000DE40()
{
  return sub_100014690();
}

Swift::Int sub_10000DF30()
{
  return sub_100014690();
}

uint64_t sub_10000E044()
{
  sub_100014390();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E144()
{
  sub_100014390();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E214()
{
  return sub_100014690();
}

Swift::Int sub_10000E300()
{
  return sub_100014690();
}

void sub_10000E410(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

unint64_t sub_10000E47C(uint64_t a1)
{
  uint64_t v2 = sub_100005248(&qword_10001C500);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005248(&qword_10001C4D0);
  uint64_t v6 = sub_100014550();
  char v7 = (void *)v6;
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
  v26[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10001280C(v12, (uint64_t)v5);
    unint64_t result = sub_100011560((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100014190();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    uint64_t v19 = v7[7] + 32 * v16;
    char v20 = v9[16];
    char v21 = v9[17];
    uint64_t v22 = *((void *)v9 + 3);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v9;
    *(unsigned char *)(v19 + 16) = v20;
    *(unsigned char *)(v19 + 17) = v21;
    *(void *)(v19 + 24) = v22;
    uint64_t v23 = v7[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v7[2] = v25;
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

unint64_t sub_10000E688(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = type metadata accessor for InternalLogger();
  __chkstk_darwin(v41);
  uint64_t v40 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_1000141B0();
  uint64_t v6 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v48 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  uint64_t v49 = v2[1];
  uint64_t v50 = v8;
  unint64_t result = sub_10000635C(a1, a2);
  unint64_t v10 = result;
  if (!(result >> 62))
  {
    uint64_t v11 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11) {
      goto LABEL_3;
    }
LABEL_16:
    return swift_bridgeObjectRelease();
  }
  unint64_t result = sub_100014520();
  uint64_t v11 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    unint64_t v52 = v10 & 0xC000000000000001;
    unsigned int v45 = enum case for OffDeviceTopic.telemetry(_:);
    Swift::String v43 = v54;
    uint64_t v44 = (void (**)(char *, void, uint64_t))(v6 + 104);
    Swift::String v42 = (void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v39 = (void *)0x8000000100015EC0;
    unint64_t v38 = (void *)0x8000000100015CB0;
    Swift::String v37 = (void *)0x8000000100015EF0;
    uint64_t v46 = v11;
    unint64_t v47 = v10;
    do
    {
      if (v52) {
        id v25 = (id)sub_1000144D0();
      }
      else {
        id v25 = *(id *)(v10 + 8 * v12 + 32);
      }
      unint64_t v26 = v25;
      id v27 = [v25 wrapAsAnyEvent];
      if (v27)
      {
        uint64_t v13 = v27;
        int64_t v14 = v48;
        uint64_t v15 = v51;
        (*v44)(v48, v45, v51);
        sub_1000141A0();
        NSString v16 = sub_100014360();
        swift_bridgeObjectRelease();
        uint64_t v17 = (void *)swift_allocObject();
        uint64_t v18 = v49;
        uint64_t v19 = v50;
        v17[2] = v50;
        v17[3] = v18;
        v17[5] = 0;
        v17[6] = 0;
        v17[4] = v13;
        v54[2] = sub_1000127E4;
        v54[3] = v17;
        aBlock._countAndFlagsBits = (uint64_t)_NSConcreteStackBlock;
        aBlock._object = (void *)1107296256;
        v54[0] = sub_10000E410;
        v54[1] = &unk_100019300;
        char v20 = _Block_copy(&aBlock);
        id v21 = v19;
        id v22 = v18;
        id v23 = v13;
        swift_release();
        [v21 reportSiriInstrumentationEvent:v23 forBundleID:v16 completion:v20];
        _Block_release(v20);

        uint64_t v24 = v15;
        uint64_t v11 = v46;
        unint64_t v10 = v47;
        (*v42)(v14, v24);
      }
      else
      {
        if (qword_10001C1C0 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_100005518(v41, (uint64_t)qword_10001C508);
        uint64_t v29 = v40;
        sub_100005570(v28, v40);
        aBlock._countAndFlagsBits = 0;
        aBlock._object = (void *)0xE000000000000000;
        sub_1000144B0(37);
        swift_bridgeObjectRelease();
        aBlock._countAndFlagsBits = 0xD000000000000023;
        aBlock._object = v39;
        id v30 = [v26 description];
        uint64_t v31 = sub_100014370();
        uint64_t v33 = v32;

        v56._countAndFlagsBits = v31;
        v56._object = v33;
        sub_1000143C0(v56);
        swift_bridgeObjectRelease();
        v34._countAndFlagsBits = 0xD00000000000006DLL;
        v34._object = v38;
        v35._countAndFlagsBits = 0xD00000000000001ELL;
        v35._object = v37;
        InternalLogger.error(_:fromFile:fromFunction:)(aBlock, v34, v35);

        swift_bridgeObjectRelease();
        sub_1000055D4(v29);
      }
      ++v12;
    }
    while (v11 != v12);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000EB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 16))
  {
    sub_100011560(a1);
    if (v4)
    {
      if (!a3) {
        return 1;
      }
      uint64_t v5 = *(void *)(a3 + 16);
      if (!v5) {
        return 1;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = a3 + 48; ; i += 24)
      {
        uint64_t v7 = *(void *)(i - 16);
        if (v7 < 0)
        {
LABEL_12:
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
        swift_bridgeObjectRetain();
        if (v7 >= sub_1000143A0()) {
          break;
        }
        sub_1000143B0();
        sub_1000143F0();
        BOOL v8 = sub_100008B98();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (!v8) {
          goto LABEL_12;
        }
        if (!--v5)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 1;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_10000ECA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (_DWORD *)(a2 + 16);
  sub_100014280();
  swift_projectBox();
  uint64_t result = swift_beginAccess();
  int v5 = *(_DWORD *)(a2 + 16);
  BOOL v6 = __CFADD__(v5, 1);
  int v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *uint64_t v3 = v7;
    swift_beginAccess();
    sub_100014260();
    swift_endAccess();
    return 1;
  }
  return result;
}

uint64_t sub_10000ED40(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v23[0] = sub_100014280();
  uint64_t v7 = *(void *)(v23[0] - 8);
  __chkstk_darwin(v23[0]);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for InternalLogger();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_projectBox();
  swift_beginAccess();
  uint64_t v14 = *(void *)(a4 + 16);
  unint64_t v15 = *(void *)(a4 + 24);
  *(void *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_100010690(a1, a2);
  sub_1000106FC(v14, v15);
  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100005518(v10, (uint64_t)qword_10001C508);
  sub_100005570(v16, (uint64_t)v12);
  v23[2] = 0;
  v23[3] = 0xE000000000000000;
  sub_1000144B0(17);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 0x736567617373654DLL;
  v24._object = (void *)0xEF203A6461657220;
  swift_beginAccess();
  uint64_t v17 = v13;
  uint64_t v18 = v23[0];
  (*(void (**)(char *, uint64_t, void))(v7 + 16))(v9, v17, v23[0]);
  uint64_t v19 = sub_100014270();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  v23[1] = v19;
  v25._countAndFlagsBits = sub_1000145E0();
  sub_1000143C0(v25);
  swift_bridgeObjectRelease();
  v20._object = (void *)0x8000000100015CB0;
  v20._countAndFlagsBits = 0xD00000000000006DLL;
  v21._countAndFlagsBits = 0x286567616B636170;
  v21._object = (void *)0xEE00293A68746977;
  InternalLogger.info(_:fromFile:fromFunction:)(v24, v20, v21);
  swift_bridgeObjectRelease();
  return sub_1000055D4((uint64_t)v12);
}

void *sub_10000F008(uint64_t a1)
{
  uint64_t v2 = sub_100014220();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int v5 = (char *)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_100005248(&qword_10001C4E0);
  uint64_t v6 = __chkstk_darwin(v88);
  uint64_t v84 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v66 - v9;
  __chkstk_darwin(v8);
  uint64_t v76 = (char *)v66 - v11;
  unint64_t v90 = &_swiftEmptyDictionarySingleton;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v70 = a1 + 64;
  uint64_t v13 = -1 << *(unsigned char *)(a1 + 32);
  if (-v13 < 64) {
    uint64_t v14 = ~(-1 << -(char)v13);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v12;
  v66[0] = -1 << *(unsigned char *)(a1 + 32);
  int64_t v69 = (unint64_t)(63 - v13) >> 6;
  uint64_t v74 = v3 + 88;
  uint64_t v75 = v3 + 16;
  int v87 = enum case for EnvelopeResult.included(_:);
  uint64_t v68 = (void (**)(char *, uint64_t))(v3 + 96);
  int v67 = enum case for EnvelopeResult.notIncluded(_:);
  uint64_t v77 = v3;
  uint64_t v78 = a1;
  uint64_t v72 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  uint64_t v73 = (void (**)(char *, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain();
  uint64_t v79 = v2;
  int64_t v80 = 0;
  uint64_t v71 = v5;
  if (v15) {
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v31 = v80 + 1;
    if (__OFADD__(v80, 1)) {
      goto LABEL_55;
    }
    if (v31 >= v69) {
      break;
    }
    unint64_t v32 = *(void *)(v70 + 8 * v31);
    int64_t v33 = v80 + 1;
    if (v32) {
      goto LABEL_33;
    }
    int64_t v33 = v80 + 2;
    if (v80 + 2 >= v69) {
      break;
    }
    unint64_t v32 = *(void *)(v70 + 8 * v33);
    if (v32) {
      goto LABEL_33;
    }
    int64_t v33 = v80 + 3;
    if (v80 + 3 >= v69) {
      break;
    }
    unint64_t v32 = *(void *)(v70 + 8 * v33);
    if (v32) {
      goto LABEL_33;
    }
    int64_t v33 = v80 + 4;
    if (v80 + 4 >= v69) {
      break;
    }
    unint64_t v32 = *(void *)(v70 + 8 * v33);
    if (v32) {
      goto LABEL_33;
    }
    int64_t v34 = v80 + 5;
    if (v80 + 5 >= v69) {
      break;
    }
    unint64_t v32 = *(void *)(v70 + 8 * v34);
    if (!v32)
    {
      while (1)
      {
        int64_t v33 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_58;
        }
        if (v33 >= v69) {
          goto LABEL_54;
        }
        unint64_t v32 = *(void *)(v70 + 8 * v33);
        ++v34;
        if (v32) {
          goto LABEL_33;
        }
      }
    }
    int64_t v33 = v80 + 5;
LABEL_33:
    uint64_t v25 = (uint64_t)v10;
    uint64_t v89 = (v32 - 1) & v32;
    unint64_t v26 = __clz(__rbit64(v32)) + (v33 << 6);
    int64_t v80 = v33;
LABEL_34:
    uint64_t v35 = v78;
    uint64_t v36 = *(void *)(v78 + 48);
    uint64_t v37 = sub_100014190();
    uint64_t v86 = *(void *)(v37 - 8);
    uint64_t v85 = *(void *)(v86 + 72);
    unint64_t v38 = v76;
    uint64_t v39 = v37;
    (*(void (**)(char *, unint64_t))(v86 + 16))(v76, v36 + v85 * v26);
    uint64_t v40 = *(void *)(v35 + 56);
    uint64_t v41 = v77;
    uint64_t v42 = v40 + *(void *)(v77 + 72) * v26;
    uint64_t v43 = v88;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 16);
    v44(&v38[*(int *)(v88 + 48)], v42, v2);
    uint64_t v45 = (uint64_t)v38;
    uint64_t v10 = (char *)v25;
    sub_100012728(v45, v25, &qword_10001C4E0);
    uint64_t v46 = v25 + *(int *)(v43 + 48);
    v44(v5, v46, v2);
    int v47 = (*(uint64_t (**)(char *, uint64_t))(v41 + 88))(v5, v2);
    int v48 = v47;
    if (v47 == v87)
    {
      (*v68)(v5, v2);
      uint64_t v49 = *(void **)v5;
      uint64_t v82 = *((unsigned int *)v5 + 2);
      int v83 = v48;
      if (v49)
      {
        id v50 = [v49 payload];
        uint64_t v51 = v86;
        uint64_t v52 = v39;
        if (v50)
        {
          uint64_t v53 = v50;
          uint64_t v54 = sub_100014140();
          unint64_t v56 = v55;

          uint64_t v2 = v79;
          switch(v56 >> 62)
          {
            case 1uLL:

              sub_100007B48(v54, v56);
              LODWORD(v57) = HIDWORD(v54) - v54;
              if (__OFSUB__(HIDWORD(v54), v54)) {
                goto LABEL_56;
              }
              uint64_t v57 = (int)v57;
LABEL_47:
              uint64_t v81 = v57;
              break;
            case 2uLL:
              uint64_t v60 = *(void *)(v54 + 16);
              uint64_t v59 = *(void *)(v54 + 24);

              sub_100007B48(v54, v56);
              if (__OFSUB__(v59, v60)) {
                goto LABEL_57;
              }
              uint64_t v81 = v59 - v60;
              uint64_t v2 = v79;
              break;
            case 3uLL:

              sub_100007B48(v54, v56);
              uint64_t v81 = 0;
              break;
            default:

              sub_100007B48(v54, v56);
              uint64_t v57 = BYTE6(v56);
              goto LABEL_47;
          }
        }
        else
        {

          uint64_t v81 = 0;
          uint64_t v2 = v79;
        }
        uint64_t v58 = v84;
        goto LABEL_52;
      }
    }
    else
    {
      if (v47 != v67)
      {
        (*v73)(v5, v2);
        sub_1000126C0(v25);
        unint64_t v15 = v89;
        if (v89) {
          goto LABEL_9;
        }
        continue;
      }
      int v83 = v47;
      uint64_t v82 = 0;
    }
    uint64_t v81 = 0;
    uint64_t v58 = v84;
    uint64_t v51 = v86;
    uint64_t v52 = v39;
LABEL_52:
    uint64_t v61 = &v58[*(int *)(v88 + 48)];
    Swift::String v62 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
    v62(v58, v10, v52);
    (*v72)(v61, v46, v2);
    Swift::String v63 = v90;
    unint64_t v64 = v90[2];
    if (v90[3] <= v64)
    {
      sub_100010F78(v64 + 1, 1);
      Swift::String v63 = v90;
    }
    sub_10001266C(&qword_10001C4C8);
    uint64_t v16 = sub_100014320();
    uint64_t v17 = v63 + 8;
    uint64_t v18 = -1 << *((unsigned char *)v63 + 32);
    unint64_t v19 = v16 & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~v63[(v19 >> 6) + 8]) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~v63[(v19 >> 6) + 8])) | v19 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v27 = 0;
    unint64_t v28 = (unint64_t)(63 - v18) >> 6;
    do
    {
      if (++v20 == v28 && (v27 & 1) != 0)
      {
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
        JUMPOUT(0x10000F7E4);
      }
      BOOL v29 = v20 == v28;
      if (v20 == v28) {
        unint64_t v20 = 0;
      }
      v27 |= v29;
      uint64_t v30 = v17[v20];
    }
    while (v30 == -1);
    unint64_t v21 = __clz(__rbit64(~v30)) + (v20 << 6);
LABEL_8:
    BOOL v22 = v83 != v87;
    *(void *)((char *)v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v62((char *)(v63[6] + v21 * v85), v84, v52);
    uint64_t v23 = v63[7] + 24 * v21;
    uint64_t v24 = v81;
    *(void *)uint64_t v23 = v82;
    *(void *)(v23 + 8) = v24;
    *(unsigned char *)(v23 + 16) = v22;
    ++v63[2];
    uint64_t v2 = v79;
    (*v73)(v61, v79);
    int v5 = v71;
    unint64_t v15 = v89;
    if (v89)
    {
LABEL_9:
      uint64_t v25 = (uint64_t)v10;
      uint64_t v89 = (v15 - 1) & v15;
      unint64_t v26 = __clz(__rbit64(v15)) | (v80 << 6);
      goto LABEL_34;
    }
  }
LABEL_54:
  sub_100012720();
  return v90;
}

uint64_t sub_10000F7F4(uint64_t a1)
{
  uint64_t v52 = sub_100005248(&qword_10001C4F0);
  uint64_t v2 = __chkstk_darwin(v52);
  uint64_t v58 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v51 = (char *)v47 - v5;
  __chkstk_darwin(v4);
  id v50 = (char *)v47 - v6;
  uint64_t v7 = &_swiftEmptyDictionarySingleton;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v49 = a1 + 64;
  uint64_t v59 = &_swiftEmptyDictionarySingleton;
  uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
  if (-v9 < 64) {
    uint64_t v10 = ~(-1 << -(char)v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v8;
  v47[1] = -1 << *(unsigned char *)(a1 + 32);
  int64_t v48 = (unint64_t)(63 - v9) >> 6;
  uint64_t v53 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v54 = 0;
  uint64_t v13 = (uint64_t)v51;
  while (1)
  {
    if (v11)
    {
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v22 = v21 | (v54 << 6);
      goto LABEL_34;
    }
    int64_t v23 = v54 + 1;
    if (__OFADD__(v54, 1))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v23 >= v48) {
      goto LABEL_36;
    }
    unint64_t v24 = *(void *)(v49 + 8 * v23);
    int64_t v25 = v54 + 1;
    if (!v24)
    {
      int64_t v25 = v54 + 2;
      if (v54 + 2 >= v48) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v49 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v54 + 3;
        if (v54 + 3 >= v48) {
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v49 + 8 * v25);
        if (!v24)
        {
          int64_t v25 = v54 + 4;
          if (v54 + 4 >= v48) {
            goto LABEL_36;
          }
          unint64_t v24 = *(void *)(v49 + 8 * v25);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
    int64_t v54 = v25;
LABEL_34:
    uint64_t v31 = v53;
    uint64_t v32 = *(void *)(v53 + 48);
    uint64_t v33 = sub_100014190();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)(v34 + 72);
    uint64_t v37 = v32 + v36 * v22;
    uint64_t v38 = (uint64_t)v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v50, v37, v33);
    uint64_t v39 = *(void *)(v31 + 56) + 24 * v22;
    char v40 = *(unsigned char *)(v39 + 16);
    uint64_t v41 = v52;
    uint64_t v42 = v38 + *(int *)(v52 + 48);
    *(_OWORD *)uint64_t v42 = *(_OWORD *)v39;
    *(unsigned char *)(v42 + 16) = v40;
    sub_100012728(v38, v13, &qword_10001C4F0);
    uint64_t v43 = v13 + *(int *)(v41 + 48);
    uint64_t v44 = *(void *)v43;
    uint64_t v56 = *(void *)(v43 + 8);
    uint64_t v57 = v44;
    int v55 = *(unsigned __int8 *)(v43 + 16);
    uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 32);
    v45(v58, v13, v33);
    unint64_t v46 = v7[2];
    if (v7[3] <= v46) {
      sub_100010710(v46 + 1, 1);
    }
    uint64_t v7 = v59;
    sub_10001266C(&qword_10001C4C8);
    uint64_t result = sub_100014320();
    uint64_t v14 = (char *)(v7 + 8);
    uint64_t v15 = -1 << *((unsigned char *)v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~v7[(v16 >> 6) + 8]) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~v7[(v16 >> 6) + 8])) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }
        BOOL v29 = v17 == v28;
        if (v17 == v28) {
          unint64_t v17 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)&v14[8 * v17];
      }
      while (v30 == -1);
      unint64_t v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(void *)&v14[(v18 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v18;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v45)(v7[6] + v18 * v36, v58, v33);
    uint64_t v19 = v7[7] + 32 * v18;
    uint64_t v20 = v56;
    *(void *)uint64_t v19 = v57;
    *(void *)(v19 + 8) = v20;
    *(_WORD *)(v19 + 16) = v55;
    *(void *)(v19 + 24) = 0;
    ++v7[2];
  }
  int64_t v26 = v54 + 5;
  if (v54 + 5 >= v48)
  {
LABEL_36:
    sub_100012720();
    return (uint64_t)v7;
  }
  unint64_t v24 = *(void *)(v49 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v54 + 5;
    goto LABEL_33;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v48) {
      goto LABEL_36;
    }
    unint64_t v24 = *(void *)(v49 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_33;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000FCC0(uint64_t a1, void *a2)
{
  int v55 = a2;
  uint64_t v3 = sub_100014220();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  int v67 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100005248(&qword_10001C4E0);
  uint64_t v6 = __chkstk_darwin(v70);
  uint64_t v58 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v73 = (uint64_t)&v54 - v9;
  __chkstk_darwin(v8);
  uint64_t v66 = (char *)&v54 - v10;
  uint64_t v74 = &_swiftEmptyDictionarySingleton;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v60 = a1 + 64;
  uint64_t v12 = -1 << *(unsigned char *)(a1 + 32);
  if (-v12 < 64) {
    uint64_t v13 = ~(-1 << -(char)v12);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v11;
  uint64_t v54 = -1 << *(unsigned char *)(a1 + 32);
  int64_t v59 = (unint64_t)(63 - v12) >> 6;
  uint64_t v64 = v4 + 88;
  uint64_t v65 = v4 + 16;
  int v63 = enum case for EnvelopeResult.included(_:);
  Swift::String v62 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v68 = v4;
  uint64_t v69 = a1;
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  uint64_t v57 = (uint64_t (**)(uint64_t *, uint64_t))(v4 + 96);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v71 = 0;
  if (v14) {
    goto LABEL_8;
  }
LABEL_9:
  while (2)
  {
    int64_t v17 = v71 + 1;
    if (!__OFADD__(v71, 1))
    {
      if (v17 < v59)
      {
        unint64_t v18 = *(void *)(v60 + 8 * v17);
        int64_t v19 = v71 + 1;
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = v71 + 2;
        if (v71 + 2 >= v59) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v60 + 8 * v19);
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = v71 + 3;
        if (v71 + 3 >= v59) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v60 + 8 * v19);
        if (v18) {
          goto LABEL_24;
        }
        int64_t v19 = v71 + 4;
        if (v71 + 4 >= v59) {
          goto LABEL_43;
        }
        unint64_t v18 = *(void *)(v60 + 8 * v19);
        if (v18)
        {
LABEL_24:
          int64_t v71 = v19;
          uint64_t v72 = (v18 - 1) & v18;
          for (unint64_t i = __clz(__rbit64(v18)) + (v19 << 6); ; unint64_t i = __clz(__rbit64(v14)) | (v71 << 6))
          {
            uint64_t v21 = v69;
            uint64_t v22 = *(void *)(v69 + 48);
            uint64_t v23 = sub_100014190();
            uint64_t v24 = *(void *)(v23 - 8);
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)(v24 + 72);
            uint64_t v27 = v22 + v26 * i;
            unint64_t v28 = v66;
            (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v66, v27, v23);
            uint64_t v29 = v68;
            unint64_t v30 = *(void *)(v21 + 56) + *(void *)(v68 + 72) * i;
            uint64_t v31 = v70;
            uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v68 + 16);
            v32(&v28[*(int *)(v70 + 48)], v30, v3);
            uint64_t v33 = (uint64_t)v28;
            uint64_t v34 = v73;
            sub_100012728(v33, v73, &qword_10001C4E0);
            uint64_t v35 = v34 + *(int *)(v31 + 48);
            uint64_t v36 = (uint64_t *)v67;
            v32(v67, v35, v3);
            int v37 = (*(uint64_t (**)(uint64_t *, uint64_t))(v29 + 88))(v36, v3);
            if (v37 != v63) {
              break;
            }
            uint64_t v61 = v26;
            uint64_t result = (*v57)(v36, v3);
            uint64_t v38 = *v36;
            if (!v38)
            {
              if (__OFADD__(*v55, 1)) {
                goto LABEL_45;
              }
              ++*v55;
              goto LABEL_7;
            }
            uint64_t v39 = &v58[*(int *)(v70 + 48)];
            char v40 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
            v40(v58, v73, v23);
            (*v56)(v39, v35, v3);
            uint64_t v41 = v74;
            unint64_t v42 = v74[2];
            if (v74[3] <= v42)
            {
              sub_100010B68(v42 + 1, 1);
              uint64_t v41 = v74;
            }
            sub_10001266C(&qword_10001C4C8);
            uint64_t result = sub_100014320();
            uint64_t v43 = v41 + 8;
            uint64_t v44 = -1 << *((unsigned char *)v41 + 32);
            unint64_t v45 = result & ~v44;
            unint64_t v46 = v45 >> 6;
            if (((-1 << v45) & ~v41[(v45 >> 6) + 8]) != 0)
            {
              unint64_t v47 = __clz(__rbit64((-1 << v45) & ~v41[(v45 >> 6) + 8])) | v45 & 0x7FFFFFFFFFFFFFC0;
            }
            else
            {
              char v48 = 0;
              unint64_t v49 = (unint64_t)(63 - v44) >> 6;
              do
              {
                if (++v46 == v49 && (v48 & 1) != 0)
                {
                  __break(1u);
                  goto LABEL_44;
                }
                BOOL v50 = v46 == v49;
                if (v46 == v49) {
                  unint64_t v46 = 0;
                }
                v48 |= v50;
                uint64_t v51 = v43[v46];
              }
              while (v51 == -1);
              unint64_t v47 = __clz(__rbit64(~v51)) + (v46 << 6);
            }
            uint64_t v52 = v58;
            uint64_t v53 = v61;
            *(void *)((char *)v43 + ((v47 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v47;
            v40((char *)(v41[6] + v47 * v53), (uint64_t)v52, v23);
            *(void *)(v41[7] + 8 * v47) = v38;
            ++v41[2];
            uint64_t result = (*v62)(v39, v3);
            unint64_t v14 = v72;
            if (!v72) {
              goto LABEL_9;
            }
LABEL_8:
            uint64_t v72 = (v14 - 1) & v14;
          }
          (*v62)((char *)v36, v3);
LABEL_7:
          unint64_t v14 = v72;
          uint64_t result = sub_1000126C0(v73);
          if (!v14) {
            continue;
          }
          goto LABEL_8;
        }
        int64_t v20 = v71 + 5;
        if (v71 + 5 < v59)
        {
          unint64_t v18 = *(void *)(v60 + 8 * v20);
          if (v18)
          {
            int64_t v19 = v71 + 5;
            goto LABEL_24;
          }
          while (1)
          {
            int64_t v19 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_46;
            }
            if (v19 >= v59) {
              break;
            }
            unint64_t v18 = *(void *)(v60 + 8 * v19);
            ++v20;
            if (v18) {
              goto LABEL_24;
            }
          }
        }
      }
LABEL_43:
      sub_100012720();
      return (uint64_t)v74;
    }
    break;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

void (*sub_100010330(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *a1 = v2;
  uint64_t v3 = sub_100014190();
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  v2[5] = v4;
  uint64_t v6 = malloc(*(void *)(v4 + 64));
  v2[6] = v6;
  (*(void (**)(void))(v5 + 16))();
  v2[7] = sub_1000113A8(v2, (uint64_t)v6);
  return sub_100010420;
}

void sub_100010420(void *a1)
{
  unint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 48);
  uint64_t v3 = *(void *)(*a1 + 32);
  uint64_t v4 = *(void *)(*a1 + 40);
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  (*(void (**)(void *, uint64_t))(v4 + 8))(v2, v3);
  free(v2);

  free(v1);
}

unint64_t sub_100010498(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x726F727245666266;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0x67617373654D6F6ELL;
      break;
    case 4:
      unint64_t result = 0x6F69737365536F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100010564(char *a1, char *a2)
{
  return sub_10000DAC0(*a1, *a2);
}

Swift::Int sub_100010570()
{
  return sub_10000DF30();
}

uint64_t sub_100010578()
{
  return sub_10000E044();
}

Swift::Int sub_100010580()
{
  return sub_10000E300();
}

uint64_t sub_100010588@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100012620(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000105B8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100010498(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000105E4()
{
  unint64_t result = qword_10001C498;
  if (!qword_10001C498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C498);
  }
  return result;
}

uint64_t sub_10001063C(uint64_t a1)
{
  return sub_10000ECA0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100010648()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010688(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10000ED40(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100010690(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000106A4(a1, a2);
  }
  return a1;
}

uint64_t sub_1000106A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1000106FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007B48(a1, a2);
  }
  return a1;
}

uint64_t sub_100010710(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100014190();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100005248(&qword_10001C4D0);
  int v51 = a2;
  uint64_t v10 = sub_100014540();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    unint64_t v45 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    unint64_t v47 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v46 = (unint64_t)(v12 + 63) >> 6;
    char v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v52 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v49 = v6;
    uint64_t v50 = v9;
    uint64_t v56 = v8;
    uint64_t v57 = v5;
    while (1)
    {
      if (v15)
      {
        unint64_t v22 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v23 = v22 | (v18 << 6);
      }
      else
      {
        int64_t v24 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v46) {
          goto LABEL_34;
        }
        unint64_t v25 = v47[v24];
        ++v18;
        if (!v25)
        {
          int64_t v18 = v24 + 1;
          if (v24 + 1 >= v46) {
            goto LABEL_34;
          }
          unint64_t v25 = v47[v18];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v46)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v45;
              if (v51)
              {
                uint64_t v43 = 1 << *(unsigned char *)(v9 + 32);
                if (v43 >= 64) {
                  bzero(v47, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v47 = -1 << v43;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v25 = v47[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v18 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v46) {
                  goto LABEL_34;
                }
                unint64_t v25 = v47[v18];
                ++v26;
                if (v25) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v26;
          }
        }
LABEL_21:
        unint64_t v15 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v18 << 6);
      }
      uint64_t v27 = *(void *)(v6 + 72);
      unint64_t v28 = *(void *)(v9 + 48) + v27 * v23;
      if (v51)
      {
        (*v52)(v56, v28, v57);
        uint64_t v29 = *(void *)(v9 + 56) + 32 * v23;
        uint64_t v30 = *(void *)v29;
        uint64_t v54 = *(void *)(v29 + 8);
        uint64_t v55 = v30;
        int v53 = *(unsigned __int8 *)(v29 + 16);
        char v31 = *(unsigned char *)(v29 + 17);
        uint64_t v32 = *(void **)(v29 + 24);
      }
      else
      {
        (*v48)(v56, v28, v57);
        uint64_t v33 = *(void *)(v9 + 56) + 32 * v23;
        uint64_t v34 = *(void *)v33;
        uint64_t v54 = *(void *)(v33 + 8);
        uint64_t v55 = v34;
        int v53 = *(unsigned __int8 *)(v33 + 16);
        char v31 = *(unsigned char *)(v33 + 17);
        uint64_t v32 = *(void **)(v33 + 24);
        id v35 = v32;
      }
      sub_10001266C(&qword_10001C4C8);
      uint64_t result = sub_100014320();
      uint64_t v36 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v37 = result & ~v36;
      unint64_t v38 = v37 >> 6;
      if (((-1 << v37) & ~*(void *)(v16 + 8 * (v37 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v37) & ~*(void *)(v16 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v39 = 0;
        unint64_t v40 = (unint64_t)(63 - v36) >> 6;
        do
        {
          if (++v38 == v40 && (v39 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v41 = v38 == v40;
          if (v38 == v40) {
            unint64_t v38 = 0;
          }
          v39 |= v41;
          uint64_t v42 = *(void *)(v16 + 8 * v38);
        }
        while (v42 == -1);
        unint64_t v19 = __clz(__rbit64(~v42)) + (v38 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v52)(*(void *)(v11 + 48) + v27 * v19, v56, v57);
      uint64_t v20 = *(void *)(v11 + 56) + 32 * v19;
      uint64_t v21 = v54;
      *(void *)uint64_t v20 = v55;
      *(void *)(v20 + 8) = v21;
      *(unsigned char *)(v20 + 16) = v53;
      *(unsigned char *)(v20 + 17) = v31;
      *(void *)(v20 + 24) = v32;
      ++*(void *)(v11 + 16);
      uint64_t v6 = v49;
      uint64_t v9 = v50;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_100010B68(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100014190();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100005248(&qword_10001C4E8);
  int v46 = a2;
  uint64_t v10 = sub_100014540();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  unint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  int64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    unint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_10001266C(&qword_10001C4C8);
    uint64_t result = sub_100014320();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  unint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_100010F78(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100014190();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v47 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100005248(&qword_10001C4F8);
  int v46 = a2;
  uint64_t v9 = sub_100014540();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    unint64_t v40 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v42 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v41 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    char v48 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v50 = v5;
    uint64_t v44 = v6;
    uint64_t v45 = v8;
    uint64_t v18 = v47;
    while (1)
    {
      if (v14)
      {
        unint64_t v21 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v22 = v21 | (v17 << 6);
      }
      else
      {
        int64_t v23 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v41) {
          goto LABEL_34;
        }
        unint64_t v24 = v42[v23];
        ++v17;
        if (!v24)
        {
          int64_t v17 = v23 + 1;
          if (v23 + 1 >= v41) {
            goto LABEL_34;
          }
          unint64_t v24 = v42[v17];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v41)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v40;
              if (v46)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v8 + 32);
                if (v38 >= 64) {
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v42 = -1 << v38;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v42[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v17 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v41) {
                  goto LABEL_34;
                }
                unint64_t v24 = v42[v17];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v25;
          }
        }
LABEL_21:
        unint64_t v14 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v17 << 6);
      }
      uint64_t v26 = *(void *)(v6 + 72);
      unint64_t v27 = *(void *)(v8 + 48) + v26 * v22;
      if (v46) {
        (*v48)(v18, v27, v50);
      }
      else {
        (*v43)(v18, v27, v50);
      }
      uint64_t v28 = *(void *)(v8 + 56) + 24 * v22;
      int v49 = *(unsigned __int8 *)(v28 + 16);
      uint64_t v30 = *(void *)v28;
      uint64_t v29 = *(void *)(v28 + 8);
      sub_10001266C(&qword_10001C4C8);
      uint64_t result = sub_100014320();
      uint64_t v31 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v32) & ~*(void *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
        uint64_t v18 = v47;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        uint64_t v18 = v47;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v15 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v48)(*(void *)(v10 + 48) + v26 * v19, v18, v50);
      uint64_t v20 = *(void *)(v10 + 56) + 24 * v19;
      *(void *)uint64_t v20 = v30;
      *(void *)(v20 + 8) = v29;
      *(unsigned char *)(v20 + 16) = v49;
      ++*(void *)(v10 + 16);
      uint64_t v6 = v44;
      uint64_t v8 = v45;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

void (*sub_1000113A8(void *a1, uint64_t a2))(uint64_t a1)
{
  unint64_t v4 = malloc(0x68uLL);
  *a1 = v4;
  uint64_t v5 = sub_100014190();
  v4[8] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  v4[9] = v6;
  uint64_t v8 = malloc(*(void *)(v6 + 64));
  v4[10] = v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v8, a2, v5);
  v4[11] = sub_10001236C(v4);
  v4[12] = sub_1000121BC(v4 + 4, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
  return sub_1000114C8;
}

void sub_1000114C8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 88);
  uint64_t v4 = *(void *)(*(void *)a1 + 72);
  uint64_t v3 = *(void **)(*(void *)a1 + 80);
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 96))();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v5);
  v2(v1, 0);
  free(v3);

  free(v1);
}

unint64_t sub_100011560(uint64_t a1)
{
  sub_100014190();
  sub_10001266C(&qword_10001C4C8);
  uint64_t v2 = sub_100014320();

  return sub_100011D00(a1, v2);
}

uint64_t sub_1000115E4(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100011560(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100011EAC();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_100014190();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 32 * v4);
  sub_100011A1C(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100011720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1) {
    return _objc_release_x3();
  }
  return result;
}

unint64_t sub_100011730()
{
  unint64_t result = qword_10001C4B0;
  if (!qword_10001C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B0);
  }
  return result;
}

uint64_t sub_100011784()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000117BC(uint64_t a1, uint64_t a2)
{
  return sub_10000EB4C(a1, a2, *(void *)(v2 + 16));
}

ValueMetadata *type metadata accessor for SessionBuilderExtension()
{
  return &type metadata for SessionBuilderExtension;
}

uint64_t getEnumTagSinglePayload for SessionBuilderError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SessionBuilderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x100011930);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionBuilderError()
{
  return &type metadata for SessionBuilderError;
}

unint64_t sub_10001196C()
{
  unint64_t result = qword_10001C4B8;
  if (!qword_10001C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B8);
  }
  return result;
}

unint64_t sub_1000119C8()
{
  unint64_t result = qword_10001C4C0;
  if (!qword_10001C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C0);
  }
  return result;
}

unint64_t sub_100011A1C(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014190();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  int v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v35 = a2 + 64;
    unint64_t result = sub_1000144A0();
    uint64_t v12 = v35;
    if ((*(void *)(v35 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v32 = (result + 1) & v11;
      unint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v34 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v33(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_10001266C(&qword_10001C4C8);
        uint64_t v17 = sub_100014320();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 >= v32 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            int64_t v23 = (_OWORD *)(v22 + 32 * a1);
            unint64_t v24 = (_OWORD *)(v22 + 32 * v10);
            uint64_t v12 = v35;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 2))
            {
              long long v25 = v24[1];
              _OWORD *v23 = *v24;
              v23[1] = v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v32 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v35;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v26 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  uint64_t *v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100011D00(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100014190();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10001266C(&qword_10001C4D8);
      char v15 = sub_100014350();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

char *sub_100011EAC()
{
  uint64_t v40 = sub_100014190();
  uint64_t v42 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v39 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005248(&qword_10001C4D0);
  uint64_t v34 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100014530();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v43 = v3;
  if (!v4)
  {
    unint64_t result = (char *)swift_release();
    uint64_t v32 = v43;
    uint64_t v31 = v34;
LABEL_25:
    *uint64_t v31 = v32;
    return result;
  }
  uint64_t v5 = v3;
  unint64_t result = (char *)(v3 + 64);
  uint64_t v7 = (char *)(v2 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  uint64_t v35 = v2 + 64;
  if (v5 != v2 || result >= &v7[8 * v8])
  {
    unint64_t result = (char *)memmove(result, v7, 8 * v8);
    uint64_t v5 = v43;
  }
  int64_t v9 = 0;
  *(void *)(v5 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v41 = v2;
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  uint64_t v13 = v43;
  uint64_t v38 = v42 + 16;
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v37 = v42 + 32;
  uint64_t v14 = v42;
  int64_t v16 = v39;
  uint64_t v15 = v40;
  while (1)
  {
    if (v12)
    {
      uint64_t v44 = (v12 - 1) & v12;
      int64_t v45 = v9;
      unint64_t v17 = __clz(__rbit64(v12)) | (v9 << 6);
      uint64_t v18 = v41;
      goto LABEL_9;
    }
    int64_t v27 = v9 + 1;
    uint64_t v18 = v41;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v36) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v35 + 8 * v27);
    int64_t v29 = v9 + 1;
    if (!v28)
    {
      int64_t v29 = v9 + 2;
      if (v9 + 2 >= v36) {
        goto LABEL_23;
      }
      unint64_t v28 = *(void *)(v35 + 8 * v29);
      if (!v28) {
        break;
      }
    }
LABEL_22:
    uint64_t v44 = (v28 - 1) & v28;
    int64_t v45 = v29;
    unint64_t v17 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v14 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v16, *(void *)(v18 + 48) + v19, v15);
    uint64_t v20 = 32 * v17;
    uint64_t v21 = *(void *)(v18 + 56) + v20;
    uint64_t v23 = *(void *)v21;
    uint64_t v22 = *(void *)(v21 + 8);
    int v46 = *(unsigned __int8 *)(v21 + 16);
    char v24 = *(unsigned char *)(v21 + 17);
    long long v25 = *(void **)(v21 + 24);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v13 + 48) + v19, v16, v15);
    uint64_t v26 = *(void *)(v13 + 56) + v20;
    *(void *)uint64_t v26 = v23;
    *(void *)(v26 + 8) = v22;
    *(unsigned char *)(v26 + 16) = v46;
    *(unsigned char *)(v26 + 17) = v24;
    *(void *)(v26 + 24) = v25;
    unint64_t result = v25;
    unint64_t v12 = v44;
    int64_t v9 = v45;
  }
  uint64_t v30 = v9 + 3;
  if (v9 + 3 >= v36)
  {
LABEL_23:
    unint64_t result = (char *)swift_release();
    uint64_t v31 = v34;
    uint64_t v32 = v43;
    goto LABEL_25;
  }
  unint64_t v28 = *(void *)(v35 + 8 * v30);
  if (v28)
  {
    int64_t v29 = v9 + 3;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v29 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v29 >= v36) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v35 + 8 * v29);
    ++v30;
    if (v28) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void (*sub_1000121BC(void *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  unint64_t v8 = malloc(0x40uLL);
  *a1 = v8;
  v8[4] = a2;
  v8[5] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_100011560(a2);
  *((unsigned char *)v8 + 56) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[6] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*v4 + 56) + 32 * v11;
        long long v18 = *(_OWORD *)v17;
        uint64_t v19 = *(unsigned __int8 *)(v17 + 16);
        int v20 = *(unsigned __int8 *)(v17 + 17);
        uint64_t v21 = *(void *)(v17 + 24);
        BOOL v22 = v20 == 0;
        uint64_t v23 = 256;
        if (v22) {
          uint64_t v23 = 0;
        }
        uint64_t v24 = v23 | v19;
        goto LABEL_15;
      }
LABEL_14:
      uint64_t v24 = 0;
      long long v18 = 0uLL;
      uint64_t v21 = 1;
LABEL_15:
      *(_OWORD *)unint64_t v8 = v18;
      v8[2] = v24;
      v8[3] = v21;
      return sub_100012318;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_100011EAC();
      goto LABEL_7;
    }
    sub_100010710(v14, a3 & 1);
    unint64_t v25 = sub_100011560(a2);
    if ((v15 & 1) == (v26 & 1))
    {
      unint64_t v11 = v25;
      v8[6] = v25;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  sub_100014190();
  unint64_t result = (void (*)(uint64_t **))sub_100014600();
  __break(1u);
  return result;
}

void sub_100012318(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_1000123A8(*a1, *((unsigned char *)*a1 + 56), (uint64_t *)(*a1)[5], (*a1)[6], (*a1)[4]);
  sub_100011720(*v1, v1[1], v1[2], v1[3]);

  free(v1);
}

uint64_t (*sub_10001236C(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_10001239C;
}

uint64_t sub_10001239C(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_1000123A8(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100014190();
  __chkstk_darwin(v10);
  BOOL v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  uint64_t v16 = a1[2];
  uint64_t v17 = a1[3];
  if (v17 == 1)
  {
    if (a2)
    {
      swift_arrayDestroy();
      sub_100011A1C(a4, *a3);
    }
  }
  else
  {
    long long v18 = (void *)*a3;
    if (a2)
    {
      uint64_t v19 = v18[7] + 32 * a4;
      *(void *)uint64_t v19 = v14;
      *(void *)(v19 + 8) = v15;
      *(unsigned char *)(v19 + 16) = v16 & 1;
      *(unsigned char *)(v19 + 17) = BYTE1(v16) & 1;
      *(void *)(v19 + 24) = v17;
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v11 + 16))(v13, a5);
      v21[8] = v16 & 1;
      sub_10001253C(a4, (uint64_t)v13, v14, v15, v16 & 0x101, v17, v18);
    }
  }
  return sub_1000126B0(v14, v15, v16, v17);
}

uint64_t sub_10001253C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6, void *a7)
{
  a7[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v14 = a7[6];
  uint64_t v15 = sub_100014190();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v14 + *(void *)(*(void *)(v15 - 8) + 72) * a1, a2, v15);
  uint64_t v17 = a7[7] + 32 * a1;
  *(void *)uint64_t v17 = a3;
  *(void *)(v17 + 8) = a4;
  *(unsigned char *)(v17 + 16) = a5 & 1;
  *(unsigned char *)(v17 + 17) = HIBYTE(a5) & 1;
  *(void *)(v17 + 24) = a6;
  uint64_t v18 = a7[2];
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    a7[2] = v20;
  }
  return result;
}

uint64_t sub_100012620(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018BB0;
  v6._object = a2;
  unint64_t v4 = sub_100014570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_10001266C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014190();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000126B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1) {
    return _objc_retain_x3();
  }
  return result;
}

uint64_t sub_1000126C0(uint64_t a1)
{
  uint64_t v2 = sub_100005248(&qword_10001C4E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012720()
{
  return swift_release();
}

uint64_t sub_100012728(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005248(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001278C()
{
  if (*(void *)(v0 + 40)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000127E4(uint64_t a1)
{
  sub_100007524(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_1000127F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012804()
{
  return swift_release();
}

uint64_t sub_10001280C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005248(&qword_10001C500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

__n128 initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults.MappingResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults.MappingResult(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults.MappingResult(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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
  *(unsigned char *)(result + 17) = v3;
  return result;
}

uint64_t sub_1000128D8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000128F4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 1;
  }
  else
  {
    *(unsigned char *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults.MappingResult()
{
  return &type metadata for ExecutionStatistics.ActionResults.MappingResult;
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExecutionStatistics()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ExecutionStatistics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ExecutionStatistics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ExecutionStatistics()
{
  return &type metadata for ExecutionStatistics;
}

uint64_t initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ExecutionStatistics.ActionResults(uint64_t a1)
{
}

uint64_t initializeWithCopy for ExecutionStatistics.ActionResults(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ExecutionStatistics.ActionResults(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  id v4 = (void *)*((void *)a2 + 3);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for ExecutionStatistics.ActionResults(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for ExecutionStatistics.ActionResults(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  long long v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults()
{
  return &type metadata for ExecutionStatistics.ActionResults;
}

void **initializeBufferWithCopyOfBuffer for ExecutionStatistics.ActionResults.ExecutionFailure(void **a1, void **a2)
{
  unint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for ExecutionStatistics.ActionResults.ExecutionFailure(id *a1)
{
}

void **assignWithCopy for ExecutionStatistics.ActionResults.ExecutionFailure(void **a1, void **a2)
{
  unint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void **assignWithTake for ExecutionStatistics.ActionResults.ExecutionFailure(void **a1, void **a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionStatistics.ActionResults.ExecutionFailure(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionStatistics.ActionResults.ExecutionFailure(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecutionStatistics.ActionResults.ExecutionFailure()
{
  return &type metadata for ExecutionStatistics.ActionResults.ExecutionFailure;
}

ValueMetadata *type metadata accessor for ExtensionPreferences()
{
  return &type metadata for ExtensionPreferences;
}

id sub_100012DB0()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_100014360();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    if (qword_10001C1C0 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for InternalLogger();
    sub_100005518(v3, (uint64_t)qword_10001C508);
    v4._countAndFlagsBits = 0xD00000000000006ALL;
    v5._object = (void *)0x8000000100015F50;
    v4._object = (void *)0x8000000100015F80;
    v5._countAndFlagsBits = 0xD000000000000023;
    v6._countAndFlagsBits = 0x292874696E69;
    v6._object = (void *)0xE600000000000000;
    InternalLogger.error(_:fromFile:fromFunction:)(v5, v4, v6);
    return 0;
  }
  return v2;
}

Swift::Void __swiftcall InternalLogger.info(_:fromFile:fromFunction:)(Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.debug(_:fromFile:fromFunction:)(Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.error(_:fromFile:fromFunction:)(Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

Swift::Void __swiftcall InternalLogger.fault(_:fromFile:fromFunction:)(Swift::String _, Swift::String fromFile, Swift::String fromFunction)
{
}

uint64_t sub_100012F1C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v34 = a5;
  uint64_t v35 = a1;
  uint64_t v31 = a3;
  uint64_t v11 = sub_100014120();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  __chkstk_darwin();
  BOOL v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100014300();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_1000142F0();
  os_log_type_t v19 = a7();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    unint64_t v28 = a2;
    uint64_t v22 = v21;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = v30;
    *(_DWORD *)uint64_t v22 = 136315650;
    sub_100014100();
    int v29 = v20;
    uint64_t v23 = sub_100014110();
    uint64_t v31 = v14;
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v33);
    uint64_t v36 = sub_1000134D8(v23, v25, &v37);
    sub_100014480();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1000134D8(v34, a6, &v37);
    sub_100014480();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    unint64_t v26 = v28;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_1000134D8(v35, v26, &v37);
    sub_100014480();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v29, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_1000132D0()
{
  uint64_t v0 = sub_100014300();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InternalLogger();
  sub_100013F7C(v4, qword_10001C508);
  uint64_t v5 = sub_100005518(v4, (uint64_t)qword_10001C508);
  if (qword_10001C1C8 != -1) {
    swift_once();
  }
  id v6 = (id)qword_10001DAC0;
  sub_100014310();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
}

uint64_t static Logging.plugin.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C1C0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for InternalLogger();
  uint64_t v3 = sub_100005518(v2, (uint64_t)qword_10001C508);

  return sub_100005570(v3, a1);
}

uint64_t sub_10001347C()
{
  sub_100013FE0();
  uint64_t result = sub_100014470();
  qword_10001DAC0 = result;
  return result;
}

uint64_t sub_1000134D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000135AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100014020((uint64_t)v12, *a3);
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
      sub_100014020((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005308((uint64_t)v12);
  return v7;
}

uint64_t sub_1000135AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100014490();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100013768(a5, a6);
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
  uint64_t v8 = sub_1000144F0();
  if (!v8)
  {
    sub_100014510();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100014560();
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

uint64_t sub_100013768(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100013800(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000139E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000139E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100013800(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100013978(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000144C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100014510();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000143E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100014560();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100014510();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100013978(uint64_t a1, uint64_t a2)
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
  sub_100005248(&qword_10001C5B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000139E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005248(&qword_10001C5B8);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_100014560();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result = qword_10001C578;
  if (!qword_10001C578) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t initializeBufferWithCopyOfBuffer for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  size_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for InternalLogger(uint64_t a1)
{
  uint64_t v2 = sub_100014300();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for InternalLogger(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InternalLogger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013E00);
}

uint64_t sub_100013E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for InternalLogger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013E80);
}

uint64_t sub_100013E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014300();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100013EF0()
{
  uint64_t result = sub_100014300();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100013F7C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100013FE0()
{
  unint64_t result = qword_10001C5B0;
  if (!qword_10001C5B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001C5B0);
  }
  return result;
}

uint64_t sub_100014020(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000140C0()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_1000140F0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100014100()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_100014110()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_100014120()
{
  return type metadata accessor for URL();
}

NSData sub_100014130()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100014140()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014150()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_100014160()
{
  return static Date.now.getter();
}

uint64_t sub_100014170()
{
  return type metadata accessor for Date();
}

NSUUID sub_100014180()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100014190()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000141A0()
{
  return OffDeviceTopic.rawValue.getter();
}

uint64_t sub_1000141B0()
{
  return type metadata accessor for OffDeviceTopic();
}

uint64_t sub_1000141D0()
{
  return dispatch thunk of MessageStoreReader.fetch(sinceBookmark:receiveMessage:completion:)();
}

uint64_t sub_1000141E0()
{
  return type metadata accessor for MessageStoreReader();
}

uint64_t sub_1000141F0()
{
  return PluginStateService.init()();
}

uint64_t sub_100014200()
{
  return type metadata accessor for PluginStateService();
}

uint64_t sub_100014210()
{
  return static AppExtension.main()();
}

uint64_t sub_100014220()
{
  return type metadata accessor for EnvelopeResult();
}

uint64_t sub_100014230()
{
  return SessionBuilder.notSampled.getter();
}

uint64_t sub_100014240()
{
  return SessionBuilder.init(shouldInclude:)();
}

uint64_t sub_100014250()
{
  return SessionBuilder.buildAllWithStatistics()();
}

uint64_t sub_100014260()
{
  return SessionBuilder.add(_:)();
}

uint64_t sub_100014270()
{
  return SessionBuilder.count.getter();
}

uint64_t sub_100014280()
{
  return type metadata accessor for SessionBuilder();
}

uint64_t sub_100014290()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_1000142A0()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_1000142B0()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_1000142E0()
{
  return MLHostParameters.taskParameters.getter();
}

uint64_t sub_1000142F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100014300()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100014310()
{
  return Logger.init(_:)();
}

uint64_t sub_100014320()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100014330()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100014340()
{
  return Character.lowercased()()._countAndFlagsBits;
}

uint64_t sub_100014350()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100014360()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100014370()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014380()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100014390()
{
  return String.hash(into:)();
}

uint64_t sub_1000143A0()
{
  return String.count.getter();
}

uint64_t sub_1000143B0()
{
  return String.index(_:offsetBy:)();
}

void sub_1000143C0(Swift::String a1)
{
}

uint64_t sub_1000143D0()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_1000143E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000143F0()
{
  return String.subscript.getter();
}

uint64_t sub_100014400()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100014410()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014420()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100014430()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100014440()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100014450()
{
  return static PFAPFADeviceDimensions.current()();
}

uint64_t sub_100014460()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100014470()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100014480()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100014490()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000144A0()
{
  return _HashTable.previousHole(before:)();
}

void sub_1000144B0(Swift::Int a1)
{
}

uint64_t sub_1000144C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000144D0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000144E0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000144F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100014500()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100014510()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100014520()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100014530()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100014540()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100014550()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100014560()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100014570(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100014580()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_100014590()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000145A0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_1000145B0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_1000145C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000145D0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000145E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000145F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100014600()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100014630()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100014640()
{
  return Error._code.getter();
}

uint64_t sub_100014650()
{
  return Error._domain.getter();
}

uint64_t sub_100014660()
{
  return Error._userInfo.getter();
}

uint64_t sub_100014670()
{
  return Hasher.init(_seed:)();
}

void sub_100014680(Swift::UInt a1)
{
}

Swift::Int sub_100014690()
{
  return Hasher._finalize()();
}

uint64_t sub_1000146A0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000146B0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

{
}

{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}