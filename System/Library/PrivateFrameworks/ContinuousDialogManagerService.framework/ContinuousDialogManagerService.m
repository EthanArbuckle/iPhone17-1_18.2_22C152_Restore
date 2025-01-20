void sub_1000027F0()
{
  id v0;
  uint64_t vars8;

  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  v0 = sub_100003B30();
  os_log(_:dso:log:_:_:)();
}

id sub_100002880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  *(void *)&v3[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0;
  *(void *)&v3[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0;
  if (a3)
  {
    v5 = v3;
    id v6 = sub_100002DCC();
  }
  else
  {
    id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v8 = v4;
    id v6 = [v7 init];
  }
  *(void *)&v4[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = v6;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for CDMXPCService();
  return objc_msgSendSuper2(&v10, "init");
}

uint64_t type metadata accessor for CDMXPCService()
{
  return self;
}

uint64_t sub_100002960(uint64_t a1, void (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t v3 = sub_1000029C0();
  a2(v3);
  return sub_1000029C0();
}

uint64_t sub_1000029C0()
{
  return v0;
}

uint64_t sub_1000029CC()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000029F4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100002A3C()
{
  sub_100003B8C(0, (unint64_t *)&unk_100011140);
  Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  char v1 = sub_100002EA0(0xD00000000000001ELL, 0x800000010000A7C0, isa);

  return v1 & 1;
}

void sub_100002ABC(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0 && a1 && a3)
  {
    uint64_t v4 = v3;
    static os_log_type_t.info.getter();
    sub_100003B8C(0, (unint64_t *)&qword_100011030);
    id v5 = sub_100003B30();
    os_log(_:dso:log:_:_:)();

    uint64_t v6 = *(void *)(v4 + 32);
    BOOL v7 = __OFADD__(v6, 1);
    uint64_t v8 = v6 + 1;
    if (v7) {
      __break(1u);
    }
    else {
      *(void *)(v4 + 32) = v8;
    }
  }
}

uint64_t sub_100002B60(void *a1)
{
  id v1 = [a1 serviceName];
  if (!v1) {
    return 0;
  }
  v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void sub_100002BC4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100002C30()
{
  [v0 auditToken];
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    static os_log_type_t.debug.getter();
    sub_100003B8C(0, (unint64_t *)&qword_100011030);
    id v1 = sub_100003B30();
    os_log(_:dso:log:_:_:)();
  }
  return 0;
}

id sub_100002DCC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithCallingBundleId:v1];

  return v2;
}

uint64_t sub_100002EA0(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v3 valueForEntitlement:v5];

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_100003CF4((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_100004E38((uint64_t)v12);
    goto LABEL_9;
  }
  sub_100003B8C(0, &qword_100011138);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v8 = 0;
    return v8 & 1;
  }
  if (a3)
  {
    id v7 = a3;
    char v8 = static NSObject.== infix(_:_:)();
  }
  else
  {

    char v8 = 1;
  }
  return v8 & 1;
}

void sub_100002FBC(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = *(void *)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction);
  _Block_copy(a3);
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  v9 = sub_100003B30();
  objc_super v10 = v9;
  if (v7)
  {
    os_log(_:dso:log:_:_:)();
  }
  else
  {
    if (os_log_type_enabled(v9, v8))
    {
      id v11 = a1;
      v12 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      uint64_t v13 = sub_100007450(v11, (SEL *)&selRef_invocationSource);
      if (v14)
      {
        unint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0x74657320746F6E28;
        unint64_t v15 = 0xE900000000000029;
      }
      sub_1000043FC(v13, v15, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v8, "Creating cdm_xpc_service_setup transaction. invocationSource:%s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v16 = os_transaction_create();
    sub_100003F30(v16);
  }
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v17 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  sub_100003E58(a1);
  v18 = *(void **)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  aBlock[4] = (uint64_t)sub_100003D5C;
  aBlock[5] = v6;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100002BC4;
  aBlock[3] = (uint64_t)&unk_10000CA08;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v18 setup:a1 completionHandler:v19];
  _Block_release(v19);
  swift_release();
  _Block_release(a3);
}

uint64_t sub_100003354(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  uint64_t v6 = sub_100003B30();
  id v7 = a2;
  if (os_log_type_enabled(v6, v5))
  {
    id v8 = v7;
    uint64_t v3 = swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315650;
    uint64_t v9 = sub_100002B60(v8);
    if (v10)
    {
      unint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v11 = 0xE000000000000000;
    }
    uint64_t v58 = sub_1000043FC(v9, v11, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 1024;
    unsigned int v12 = [v8 processIdentifier];

    LODWORD(v58) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v3 + 18) = 2080;
    uint64_t v13 = sub_100002C30();
    if (v14)
    {
      unint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      unint64_t v15 = 0xE000000000000000;
    }
    uint64_t v58 = sub_1000043FC(v13, v15, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "Incoming connection to service \"%s\" from \"%d\" and bundle \"%s\"", (uint8_t *)v3, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    sub_100004DD4();
  }
  else
  {
  }
  uint64_t v16 = sub_100002B60(v7);
  uint64_t v18 = v17;
  type metadata accessor for CDMXPCDefines();
  uint64_t v19 = dispatch thunk of static CDMXPCDefines.machServiceName()();
  if (v18)
  {
    if (v16 == v19 && v18 == v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t v23 = swift_bridgeObjectRelease();
      if ((v22 & 1) == 0) {
        goto LABEL_20;
      }
    }
    uint64_t v23 = sub_100002A3C();
    if (v23) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  uint64_t v23 = swift_bridgeObjectRelease();
LABEL_20:
  if (((*(uint64_t (**)(uint64_t))((swift_isaMask & *(void *)v3) + 0xC0))(v23) & 1) == 0
    || (sub_100002B60(v7), uint64_t v25 = v24, swift_bridgeObjectRelease(), v25))
  {
    os_log_type_t v26 = static os_log_type_t.error.getter();
    v27 = sub_100003B30();
    os_log_type_t v28 = v26;
    if (os_log_type_enabled(v27, v26))
    {
      id v29 = v7;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v3 = swift_slowAlloc();
      uint64_t aBlock = v3;
      *(_DWORD *)uint64_t v30 = 67109378;
      LODWORD(v58) = [v29 processIdentifier];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v30 + 8) = 2080;
      v31 = (uint64_t *)sub_100004E2C();
      uint64_t v32 = *v31;
      unint64_t v33 = v31[1];
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_1000043FC(v32, v33, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Rejected connection from %d. Check if calling process has '%s' entitlement", (uint8_t *)v30, 0x12u);
      swift_arrayDestroy();
      sub_100004DD4();
      swift_slowDealloc();
    }

    id v34 = 0;
    uint64_t v35 = 0;
    goto LABEL_28;
  }
LABEL_25:
  type metadata accessor for CDMXPCService();
  sub_100002C30();
  sub_100003B8C(0, &qword_100011038);
  id v34 = sub_100003E10();
  v36 = self;
  id v37 = v34;
  id v51 = [v36 interfaceWithProtocol:&OBJC_PROTOCOL___CDMXPCProtocol];
  objc_msgSend(v7, "setExportedInterface:");
  [v7 setExportedObject:v37];

  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v3;
  *(void *)(v38 + 24) = v7;
  v56 = sub_100004BF4;
  uint64_t v57 = v38;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v53 = 1107296256;
  v54 = sub_1000042DC;
  v55 = &unk_10000C5D0;
  v39 = _Block_copy(&aBlock);
  id v40 = v7;
  id v41 = (id)v3;
  swift_release();
  [v40 setInvalidationHandler:v39];
  _Block_release(v39);
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v41;
  *(void *)(v42 + 24) = v40;
  v56 = sub_100004C84;
  uint64_t v57 = v42;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v53 = 1107296256;
  v54 = sub_1000042DC;
  v55 = &unk_10000C620;
  v43 = _Block_copy(&aBlock);
  id v44 = v40;
  v41;
  swift_release();
  [v44 setInterruptionHandler:v43];
  _Block_release(v43);
  os_log_type_t v45 = static os_log_type_t.debug.getter();
  v46 = sub_100003B30();
  if (os_log_type_enabled(v46, v45))
  {
    id v47 = v44;
    uint64_t v3 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 67109120;
    LODWORD(aBlock) = [v47 processIdentifier];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v46, v45, "Accepted connection from %d", (uint8_t *)v3, 8u);
    sub_100004DD4();
  }

  [v44 resume];
  uint64_t v35 = 1;
LABEL_28:
  v48 = (void (*)(id, uint64_t, id))(*(uint64_t (**)(void))((swift_isaMask & *(void *)v3) + 0x78))();
  if (v48)
  {
    uint64_t v49 = (uint64_t)v48;
    v48(v7, v35, v34);

    sub_100003DE0(v49);
  }
  else
  {
  }
  return v35;
}

id sub_100003B30()
{
  if (qword_100011730 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100011738;
  return v0;
}

uint64_t sub_100003B8C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100003BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003C08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003C1C()
{
  return swift_release();
}

uint64_t sub_100003C24()
{
  return swift_release();
}

uint64_t sub_100003C2C()
{
  return swift_release();
}

uint64_t sub_100003C34()
{
  return swift_release();
}

uint64_t sub_100003C3C()
{
  return swift_release();
}

uint64_t sub_100003C4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003C90()
{
  return swift_beginAccess();
}

uint64_t sub_100003CB4()
{
  return swift_slowDealloc();
}

uint64_t sub_100003CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C4C(&qword_100011130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100003D60(uint64_t a1)
{
  sub_100003D68(a1, *(void *)(v1 + 16));
}

void sub_100003D68(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100003DD0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100003DE0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100003DF0()
{
  return sub_100002960((uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect, (void (*)(uint64_t))sub_100003DCC);
}

id sub_100003E10()
{
  sub_100003CCC();
  uint64_t v4 = v3;
  id v5 = objc_allocWithZone(v1);
  return sub_100002880(v4, v2, v0);
}

uint64_t sub_100003E58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = sub_100007450(a1, (SEL *)&selRef_serviceStateDirectorySandboxExtension);
  if (!v5)
  {
    uint64_t result = 0;
    return sub_100003F18(result);
  }
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension);
  if (v8)
  {
    BOOL v9 = *(void *)(v8 + 16) == v4 && v5 == *(void *)(v8 + 24);
    if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return swift_bridgeObjectRelease();
    }
  }
  type metadata accessor for CDMXPCSandboxExtension();
  uint64_t result = sub_100007C6C(v6, v7);
  if (!v2) {
    return sub_100003F18(result);
  }
  return result;
}

uint64_t sub_100003F18(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension) = a1;
  return swift_release();
}

uint64_t sub_100003F30(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_100003F48(uint64_t a1, uint64_t a2)
{
  return sub_100004078(a1, a2, (uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect, (uint64_t (*)(uint64_t, uint64_t))sub_100004DC4);
}

uint64_t (*sub_100003F68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100003FB0()
{
  return sub_100002960((uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate, (void (*)(uint64_t))sub_100003DD0);
}

uint64_t sub_100003FD0(uint64_t a1, uint64_t a2)
{
  return sub_100004078(a1, a2, (uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate, (uint64_t (*)(uint64_t, uint64_t))sub_100003DE0);
}

uint64_t (*sub_100003FF0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_100004038()
{
  return sub_100002960((uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt, (void (*)(uint64_t))sub_100003DD0);
}

uint64_t sub_100004058(uint64_t a1, uint64_t a2)
{
  return sub_100004078(a1, a2, (uint64_t)&OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt, (uint64_t (*)(uint64_t, uint64_t))sub_100003DE0);
}

uint64_t sub_100004078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  sub_100004DF4();
  uint64_t v8 = *v4;
  uint64_t v9 = v4[1];
  uint64_t *v4 = a1;
  v4[1] = a2;
  return a4(v8, v9);
}

uint64_t (*sub_1000040C8())()
{
  return j__swift_endAccess;
}

uint64_t sub_100004114()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_10000415C(char a1)
{
  uint64_t result = sub_100004DF4();
  *uint64_t v1 = a1;
  return result;
}

uint64_t sub_100004194()
{
  return sub_100003B8C(0, &qword_100011028);
}

uint64_t sub_1000041C0()
{
  return 0;
}

id sub_1000041C8(uint64_t a1, char a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_10000420C(a1, a2);
}

id sub_10000420C(uint64_t a1, char a2)
{
  uint64_t v4 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onConnect];
  void *v4 = 0;
  v4[1] = 0;
  id v5 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInvalidate];
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_onInterrupt];
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = &v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections];
  v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_allowAnonymousConnections] = 0;
  *(void *)&v2[OBJC_IVAR____TtC14assistant_cdmd21CDMXPCServiceDelegate_clientType] = a1;
  swift_beginAccess();
  *uint64_t v7 = a2;
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for CDMXPCServiceDelegate();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t type metadata accessor for CDMXPCServiceDelegate()
{
  return self;
}

uint64_t sub_1000042DC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_100004320()
{
}

id sub_100004360()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDMXPCServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000043FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000044D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100004D64((uint64_t)v12, *a3);
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
      sub_100004D64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004D14((uint64_t)v12);
  return v7;
}

uint64_t sub_1000044D0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100004628((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100004700(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_100004628(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100004700(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_100004798(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_100004974(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_100004974((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100004798(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_10000490C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10000490C(uint64_t a1, uint64_t a2)
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
  sub_100003C4C((uint64_t *)&unk_100011400);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100004974(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003C4C((uint64_t *)&unk_100011400);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unsigned int v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100004B24(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100004A4C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100004A4C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100004B24(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100004BB4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004BF4()
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0x90))();
  if (result)
  {
    uint64_t v3 = sub_100004E18();
    v1(v3);
    uint64_t v4 = sub_1000029C0();
    return sub_100003DE0(v4);
  }
  return result;
}

uint64_t sub_100004C84()
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0xA8))();
  if (result)
  {
    uint64_t v3 = sub_100004E18();
    v1(v3);
    uint64_t v4 = sub_1000029C0();
    return sub_100003DE0(v4);
  }
  return result;
}

uint64_t sub_100004D14(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004D64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004DD4()
{
  return swift_slowDealloc();
}

uint64_t sub_100004DF4()
{
  return swift_beginAccess();
}

uint64_t sub_100004E18()
{
  return v0;
}

void *sub_100004E2C()
{
  return &unk_10000C750;
}

uint64_t sub_100004E38(uint64_t a1)
{
  uint64_t v2 = sub_100003C4C(&qword_100011130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100004E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

void sub_100004EF4()
{
  id v1 = [*(id *)(v0 + 48) handleableXPCActivities];
  sub_100003C4C(&qword_1000111B0);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = 0;
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v20 = v2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & v4;
  int64_t v21 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v8 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v3 << 6))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * i);
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = v14;
    v17[3] = v15;
    v17[4] = v16;
    v17[5] = v0;
    aBlock[4] = sub_1000051FC;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000058D8;
    aBlock[3] = &unk_10000C788;
    uint64_t v18 = _Block_copy(aBlock);
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    swift_retain();
    swift_release();
    uint64_t v19 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    xpc_activity_register((const char *)(v19 + 32), v16, v18);
    swift_release();
    _Block_release(v18);
    swift_unknownObjectRelease();
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v10 >= v21) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v20 + 8 * v10);
    ++v3;
    if (!v11)
    {
      int64_t v3 = v10 + 1;
      if (v10 + 1 >= v21) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v20 + 8 * v3);
      if (!v11)
      {
        int64_t v3 = v10 + 2;
        if (v10 + 2 >= v21) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v20 + 8 * v3);
        if (!v11) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 3;
  if (v12 >= v21)
  {
LABEL_21:
    swift_release();
    return;
  }
  unint64_t v11 = *(void *)(v20 + 8 * v12);
  if (v11)
  {
    int64_t v3 = v12;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v3 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v3 >= v21) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v20 + 8 * v3);
    ++v12;
    if (v11) {
      goto LABEL_18;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1000051B4()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000051FC(_xpc_activity_s *a1)
{
  uint64_t v5 = v1[2];
  unint64_t v4 = v1[3];
  xpc_object_t criteria = (xpc_object_t)v1[4];
  uint64_t v44 = v1[5];
  LOBYTE(v7) = static os_log_type_t.debug.getter();
  sub_1000059D0();
  uint64_t v6 = sub_100003B30();
  uint64_t v7 = v7;
  if (os_log_type_enabled(v6, (os_log_type_t)v7))
  {
    sub_100005C78();
    uint64_t v2 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    uint64_t v8 = swift_bridgeObjectRetain();
    sub_100005C40(v8, v9, v10, criteria);
    sub_100005D34();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_100005C90();
    _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)v7, "Reached handler for XPC activity: %s", (uint8_t *)v2, 0xCu);
    swift_arrayDestroy();
    sub_100003CB4();
    sub_100003CB4();
  }

  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state != 2)
  {
    int64_t v12 = (void (*)())state;
    if (!state)
    {
      static os_log_type_t.debug.getter();
      uint64_t v13 = sub_100005CFC();
      if (os_log_type_enabled(v13, (os_log_type_t)v2))
      {
        sub_100005C78();
        swift_slowAlloc();
        uint64_t v14 = sub_100005C5C();
        LOBYTE(v2) = v14;
        aBlock[0] = v14;
        *(_DWORD *)uint64_t v7 = 136315138;
        uint64_t v15 = swift_bridgeObjectRetain();
        sub_100005C40(v15, v16, v17);
        sub_100005D34();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        sub_100005C90();
        sub_100005CC4((void *)&_mh_execute_header, v13, v18, "Checking in XPC activity %s");
        swift_arrayDestroy();
        sub_100003CB4();
        sub_100003CB4();
      }

      xpc_activity_set_criteria(a1, criteria);
LABEL_19:
      int64_t v12 = 0;
      goto LABEL_20;
    }
LABEL_16:
    static os_log_type_t.error.getter();
    uint64_t v32 = sub_100005CFC();
    os_log_type_t v33 = v2;
    if (os_log_type_enabled(v32, (os_log_type_t)v2))
    {
      sub_100005C78();
      swift_slowAlloc();
      aBlock[0] = sub_100005C5C();
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v34 = swift_bridgeObjectRetain();
      uint64_t v46 = sub_100005C40(v34, v35, v36);
      sub_100005CE0();
      sub_100005C90();
      *(_WORD *)(v7 + 12) = 2048;
      uint64_t v46 = (uint64_t)v12;
      uint64_t v2 = (uint64_t)&type metadata for Any;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "XPC activity %s in unexpected state: %ld", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      sub_100003CB4();
      sub_100003CB4();
    }

    goto LABEL_19;
  }
  if (!xpc_activity_set_state(a1, 4))
  {
    static os_log_type_t.error.getter();
    uint64_t v19 = sub_100005CFC();
    if (os_log_type_enabled(v19, (os_log_type_t)v2))
    {
      sub_100005C78();
      sub_100005CA8();
      uint64_t v20 = sub_100005C5C();
      LOBYTE(v2) = v20;
      aBlock[0] = v20;
      uint64_t v21 = sub_100005D14(4.8149e-34);
      sub_100005C40(v21, v22, v23);
      sub_1000029CC();
      sub_100005C90();
      sub_100005CC4((void *)&_mh_execute_header, v19, v24, "Failed to set XPC activity state to CONTINUE for %s");
      swift_arrayDestroy();
      sub_100003CB4();
      sub_100003CB4();
    }
  }
  static os_log_type_t.debug.getter();
  uint64_t v25 = sub_100005CFC();
  if (os_log_type_enabled(v25, (os_log_type_t)v2))
  {
    sub_100005C78();
    sub_100005CA8();
    aBlock[0] = sub_100005C5C();
    uint64_t v26 = sub_100005D14(4.8149e-34);
    sub_100005C40(v26, v27, v28);
    sub_1000029CC();
    sub_100005C90();
    sub_100005CC4((void *)&_mh_execute_header, v25, v29, "Handling XPC activity %s");
    swift_arrayDestroy();
    sub_100003CB4();
    sub_100003CB4();
  }

  uint64_t v7 = *(void *)(v44 + 32);
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = v44;
  v30[3] = a1;
  v30[4] = v5;
  v30[5] = v4;
  uint64_t v31 = swift_allocObject();
  int64_t v12 = sub_100005A58;
  *(void *)(v31 + 16) = sub_100005A58;
  *(void *)(v31 + 24) = v30;
  aBlock[4] = (uint64_t)sub_100005C10;
  aBlock[5] = v31;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000058B0;
  aBlock[3] = (uint64_t)&unk_10000C800;
  uint64_t v2 = (uint64_t)_Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v7, (dispatch_block_t)v2);
  _Block_release((const void *)v2);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v2)
  {
    __break(1u);
    goto LABEL_16;
  }
LABEL_20:
  if (xpc_activity_should_defer(a1))
  {
    BOOL v37 = xpc_activity_set_state(a1, 3);
    static os_log_type_t.debug.getter();
    uint64_t v38 = sub_100005CFC();
    if (os_log_type_enabled(v38, (os_log_type_t)v2))
    {
      sub_100005C78();
      uint64_t v39 = swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_1000043FC(v5, v4, aBlock);
      sub_100005CE0();
      sub_100005C90();
      *(_WORD *)(v39 + 12) = 2080;
      if (v37) {
        uint64_t v40 = 7562585;
      }
      else {
        uint64_t v40 = 28494;
      }
      if (v37) {
        unint64_t v41 = 0xE300000000000000;
      }
      else {
        unint64_t v41 = 0xE200000000000000;
      }
      uint64_t v46 = sub_1000043FC(v40, v41, aBlock);
      sub_100005CE0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v2, "Deferring XPC activity %s: %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      sub_100003CB4();
      sub_100003CB4();
    }
  }
  return sub_100003DE0((uint64_t)v12);
}

uint64_t sub_1000058B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1000058D8(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id *sub_100005938()
{
  swift_release();
  return v0;
}

uint64_t sub_100005978()
{
  sub_100005938();
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for CDMXPCActivityListener()
{
  return self;
}

unint64_t sub_1000059D0()
{
  unint64_t result = qword_100011030;
  if (!qword_100011030)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011030);
  }
  return result;
}

uint64_t sub_100005A10()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100005A58()
{
  uint64_t v2 = v0[2];
  id v1 = (_xpc_activity_s *)v0[3];
  uint64_t v4 = v0[4];
  unint64_t v3 = v0[5];
  uint64_t v5 = *(NSObject **)(v2 + 24);
  dispatch_group_enter(v5);
  [*(id *)(v2 + 16) signal];
  uint64_t v6 = *(void **)(v2 + 48);
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 handleXPCActivity:v1 fromIdentifier:v7];

  if (!xpc_activity_set_state(v1, 5))
  {
    os_log_type_t v8 = static os_log_type_t.error.getter();
    sub_1000059D0();
    uint64_t v9 = sub_100003B30();
    if (os_log_type_enabled(v9, v8))
    {
      swift_bridgeObjectRetain_n();
      uint64_t v10 = (uint8_t *)sub_100005CA8();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_1000043FC(v4, v3, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v8, "Failed to set XPC activity state to DONE for %s", v10, 0xCu);
      swift_arrayDestroy();
      sub_100003CB4();
      sub_100003CB4();
    }
  }
  dispatch_group_leave(v5);
}

uint64_t sub_100005C00()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005C10()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005C40(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  return sub_1000043FC(v4, v3, (uint64_t *)va);
}

uint64_t sub_100005C5C()
{
  return swift_slowAlloc();
}

uint64_t sub_100005C78()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_100005C90()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_100005CA8()
{
  return swift_slowAlloc();
}

void sub_100005CC4(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 0xCu);
}

uint64_t sub_100005CE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

id sub_100005CFC()
{
  return sub_100003B30();
}

uint64_t sub_100005D14(float a1)
{
  *id v1 = a1;
  return swift_bridgeObjectRetain();
}

void sub_100005D48()
{
  id v1 = [*(id *)(v0 + 48) handleableXPCEventStreams];
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = 0;
  uint64_t v4 = *(void *)(v2 + 56);
  uint64_t v20 = v2 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & v4;
  int64_t v21 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v8 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v3 << 6))
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(NSObject **)(v0 + 32);
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = v0;
    v17[3] = v14;
    v17[4] = v15;
    aBlock[4] = sub_100006020;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000058D8;
    aBlock[3] = &unk_10000C850;
    uint64_t v18 = _Block_copy(aBlock);
    swift_bridgeObjectRetain_n();
    swift_retain();
    swift_release();
    uint64_t v19 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    xpc_set_event_stream_handler((const char *)(v19 + 32), v16, v18);
    swift_release();
    _Block_release(v18);
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v10 >= v21) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v20 + 8 * v10);
    ++v3;
    if (!v11)
    {
      int64_t v3 = v10 + 1;
      if (v10 + 1 >= v21) {
        goto LABEL_21;
      }
      unint64_t v11 = *(void *)(v20 + 8 * v3);
      if (!v11)
      {
        int64_t v3 = v10 + 2;
        if (v10 + 2 >= v21) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(v20 + 8 * v3);
        if (!v11) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v11 - 1) & v11;
  }
  int64_t v12 = v10 + 3;
  if (v12 >= v21)
  {
LABEL_21:
    swift_release();
    return;
  }
  unint64_t v11 = *(void *)(v20 + 8 * v12);
  if (v11)
  {
    int64_t v3 = v12;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v3 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v3 >= v21) {
      goto LABEL_21;
    }
    unint64_t v11 = *(void *)(v20 + 8 * v3);
    ++v12;
    if (v11) {
      goto LABEL_18;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_100005FE0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006020(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  unint64_t v5 = v1[4];
  os_transaction_create();
  uint64_t v6 = *(NSObject **)(v3 + 24);
  dispatch_group_enter(v6);
  [*(id *)(v3 + 16) signal];
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  sub_1000059D0();
  unint64_t v8 = sub_100003B30();
  if (os_log_type_enabled(v8, v7))
  {
    swift_bridgeObjectRetain_n();
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1000043FC(v4, v5, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v7, "Handling XPC event from stream %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int64_t v10 = *(void **)(v3 + 48);
  NSString v11 = String._bridgeToObjectiveC()();
  [v10 handleXPCEvent:a1 fromStream:v11];

  dispatch_group_leave(v6);
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for CDMXPCStreamEventListener()
{
  return self;
}

id sub_100006224()
{
  uint64_t v1 = OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension;
  *(void *)&v0[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0;
  uint64_t v2 = OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction;
  *(void *)&v0[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0;
  id v3 = objc_allocWithZone((Class)CDMFoundationClient);
  uint64_t v4 = v0;
  id v5 = [v3 init];
  *(void *)&v4[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = v5;
  *(void *)&v0[v1] = 0;
  swift_release();
  *(void *)&v0[v2] = 0;

  swift_unknownObjectRelease();
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CDMXPCService();
  return objc_msgSendSuper2(&v7, "init");
}

id sub_1000062FC(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_100006330(a1);
}

id sub_100006330(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for CDMXPCService();
  return objc_msgSendSuper2(&v3, "init");
}

uint64_t sub_1000063B0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_sandboxExtension);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

void sub_100006454(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_transaction);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  int64_t v10 = sub_100003B30();
  NSString v11 = v10;
  if (v8)
  {
    os_log(_:dso:log:_:_:)();
  }
  else
  {
    if (os_log_type_enabled(v10, v9))
    {
      id v12 = a1;
      uint64_t v21 = a3;
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v14 = sub_100007450(v12, (SEL *)&selRef_invocationSource);
      if (v15)
      {
        unint64_t v16 = v15;
      }
      else
      {
        uint64_t v14 = 0x74657320746F6E28;
        unint64_t v16 = 0xE900000000000029;
      }
      sub_1000043FC(v14, v16, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v9, "Creating cdm_xpc_service_setup transaction. invocationSource:%s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v21;
      swift_slowDealloc();
    }

    uint64_t v17 = os_transaction_create();
    sub_100003F30(v17);
  }
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v18 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  sub_100003E58(a1);
  uint64_t v19 = *(void **)(v4 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  aBlock[4] = a2;
  aBlock[5] = a3;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100002BC4;
  aBlock[3] = (uint64_t)&unk_10000C878;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v19 setup:a1 completionHandler:v20];
  _Block_release(v20);
}

void sub_10000679C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v6 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  objc_super v7 = *(void **)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  v9[4] = a1;
  v9[5] = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100002BC4;
  v9[3] = &unk_10000C8A0;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  [v7 warmupWithCompletionHandler:v8];
  _Block_release(v8);
}

void sub_100006954()
{
  uint64_t v3 = v1;
  sub_100003CCC();
  id v5 = v4;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v6 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  objc_super v7 = *(void **)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  id v8 = objc_allocWithZone((Class)type metadata accessor for CDMNluRequest());
  id v9 = v5;
  int64_t v10 = (void *)CDMNluRequest.init(objcProto:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  *(void *)(v11 + 24) = v0;
  v13[4] = sub_1000074E8;
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100006ACC;
  v13[3] = &unk_10000C8F0;
  id v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v7 processCDMNluRequest:v10 completionHandler:v12];
  _Block_release(v12);
}

void sub_100006ACC(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100006B8C(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v6 = [v4 areAssetsAvailable:isa];

  ((void (**)(void, id))a3)[2](a3, v6);
  _Block_release(a3);
}

uint64_t sub_100006C10()
{
  sub_100003CCC();
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v4 = [v2 areAssetsAvailable:isa];

  return v1(v4);
}

void sub_100006D8C()
{
  uint64_t v3 = v1;
  sub_100003CCC();
  id v5 = v4;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v6 = sub_100003B30();
  sub_100003C4C(&qword_100011360);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100009610;
  *(void *)(v7 + 56) = sub_100003B8C(0, &qword_100011368);
  *(void *)(v7 + 64) = sub_1000075C0();
  *(void *)(v7 + 32) = v5;
  id v8 = v5;
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
  id v9 = *(void **)(v3 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client);
  self;
  int64_t v10 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  *(void *)(v11 + 24) = v0;
  v14[4] = sub_100007620;
  v14[5] = v11;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100006F7C;
  v14[3] = &unk_10000C940;
  id v12 = _Block_copy(v14);
  id v13 = v9;
  swift_retain();
  swift_release();
  [v10 doHandleCommand:v8 forCallback:v12];
  _Block_release(v12);
}

uint64_t sub_100006F7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100007030(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

void sub_1000070D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_100007148(uint64_t a1, void (**a2)(void))
{
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v4 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  [*(id *)(a1 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client) waitForDataDispatcherCompletion];
  a2[2](a2);
  _Block_release(a2);
}

uint64_t sub_10000720C(uint64_t (*a1)(id))
{
  uint64_t v2 = v1;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v4 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  return a1([*(id *)(v2 + OBJC_IVAR____TtC14assistant_cdmd13CDMXPCService_client) waitForDataDispatcherCompletion]);
}

id sub_100007328()
{
  uint64_t v1 = v0;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v2 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for CDMXPCService();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_100007450(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t sub_1000074B0()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000074E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v6 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  if (a1) {
    uint64_t v7 = dispatch thunk of CDMNluResponse.objcProto.getter();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  v5(v7, a2);
}

unint64_t sub_1000075C0()
{
  unint64_t result = qword_100011370;
  if (!qword_100011370)
  {
    sub_100003B8C(255, &qword_100011368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011370);
  }
  return result;
}

uint64_t sub_100007620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  if (a1)
  {
    self;
    a1 = swift_dynamicCastObjCClass();
  }
  return v4(a1, a2);
}

uint64_t sub_100007678()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000076B0(uint64_t a1, uint64_t a2)
{
  sub_1000070D8(a1, a2, *(void *)(v2 + 16));
}

id sub_1000076F8()
{
  return sub_100007748();
}

id sub_100007748()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

id sub_1000077BC()
{
  type metadata accessor for CDMXPCServiceDelegate();
  sub_100003B8C(0, &qword_100011028);
  uint64_t v0 = sub_100004194();
  char v1 = sub_1000041C0();
  return sub_1000041C8(v0, v1 & 1);
}

uint64_t sub_100007828(void *a1, void *a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100007878(a1, a2);
  return v4;
}

uint64_t sub_100007878(void *a1, void *a2)
{
  uint64_t v3 = v2;
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = *(void (**)(void (*)(uint64_t, char, uint64_t), uint64_t))((swift_isaMask & *a2) + 0x80);
  id v6 = a2;
  id v7 = a1;
  swift_retain();
  v5(sub_100002ABC, v3);

  id v8 = *(void **)(v3 + 24);
  id v9 = *(void (**)(void (*)(), void))((swift_isaMask & *v8) + 0xB0);
  int64_t v10 = v8;
  v9(sub_100007A0C, 0);

  uint64_t v11 = *(void **)(v3 + 24);
  uint64_t v12 = *(void (**)(void (*)(), uint64_t))((swift_isaMask & *v11) + 0x98);
  swift_retain();
  id v13 = v11;
  v12(sub_100007A9C, v3);

  id v14 = *(id *)(v3 + 24);
  [v7 setDelegate:v14];

  return v3;
}

void sub_100007A0C()
{
  static os_log_type_t.error.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v0 = sub_100003B30();
  os_log(_:dso:log:_:_:)();
}

void sub_100007A9C()
{
  uint64_t v1 = v0;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v2 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  uint64_t v3 = *(void *)(v1 + 32);
  BOOL v4 = __OFSUB__(v3, 1);
  uint64_t v5 = v3 - 1;
  if (v4) {
    __break(1u);
  }
  else {
    *(void *)(v1 + 32) = v5;
  }
}

uint64_t sub_100007B34()
{
  return *(void *)(v0 + 32);
}

id sub_100007B3C()
{
  uint64_t v1 = v0;
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v2 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  uint64_t v3 = *(void **)(v1 + 16);
  return [v3 resume];
}

uint64_t sub_100007BDC()
{
  return v0;
}

uint64_t sub_100007C04()
{
  sub_100007BDC();
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for CDMXPCListener()
{
  return self;
}

uint64_t sub_100007C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100007CC4(a1, a2);
  return v4;
}

void *sub_100007CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  static os_log_type_t.debug.getter();
  sub_1000059D0();
  id v6 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    uint64_t v9 = v13;
  }
  else
  {
    __chkstk_darwin();
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v9 = sandbox_extension_consume();
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v7 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v7 = _StringObject.sharedUTF8.getter();
      }
      uint64_t v9 = sub_10000800C(v7, v8, (uint64_t (*)(void))sub_10000804C);
    }
  }
  if (v9 == -1)
  {
    swift_bridgeObjectRelease();
    int v10 = errno.getter();
    sub_100007EE0();
    swift_allocError();
    *uint64_t v11 = v10;
    swift_willThrow();
    type metadata accessor for CDMXPCSandboxExtension();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v3[2] = a1;
    v3[3] = a2;
    v3[4] = v9;
  }
  return v3;
}

uint64_t sub_100007EB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sandbox_extension_consume();
  *a1 = result;
  return result;
}

unint64_t sub_100007EE0()
{
  unint64_t result = qword_100011500;
  if (!qword_100011500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011500);
  }
  return result;
}

uint64_t type metadata accessor for CDMXPCSandboxExtension()
{
  return self;
}

uint64_t sub_100007F50()
{
  uint64_t v1 = v0;
  static os_log_type_t.debug.getter();
  sub_1000059D0();
  id v2 = sub_100003B30();
  os_log(_:dso:log:_:_:)();

  sandbox_extension_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_100007FD8()
{
  sub_100007F50();
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_10000800C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *sub_10000804C@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

_DWORD *initializeBufferWithCopyOfBuffer for CDMXPCSandboxExtension.SandboxExtensionError(_DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CDMXPCSandboxExtension.SandboxExtensionError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CDMXPCSandboxExtension.SandboxExtensionError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CDMXPCSandboxExtension.SandboxExtensionError()
{
  return &type metadata for CDMXPCSandboxExtension.SandboxExtensionError;
}

int main(int argc, const char **argv, const char **envp)
{
  qword_100011748 = sub_100008700();
  (*(void (**)(void))(*(void *)qword_100011748 + 144))();
  return 0;
}

uint64_t sub_10000815C()
{
  sub_1000059D0();
  sub_1000086E4();
  swift_bridgeObjectRetain();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100011738 = result;
  return result;
}

void sub_1000081BC()
{
  sub_100003B8C(0, &qword_1000115C8);
  sub_100003B8C(0, &qword_1000115D0);
  uint64_t v0 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v1 = static OS_dispatch_source.makeSignalSource(signal:queue:)();

  qword_100011750 = v1;
}

void static CDMSignalHandler.registerHandlers()()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  sub_100003CD8();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  sub_100003CD8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100011740 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_getObjectType();
  aBlock[4] = sub_1000084D8;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000042DC;
  aBlock[3] = &unk_10000CAC0;
  uint64_t v12 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  sub_100008568();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v12);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  swift_getObjectType();
  swift_unknownObjectRetain();
  OS_dispatch_source.activate()();
  swift_unknownObjectRelease();
  static os_log_type_t.debug.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v13 = sub_100003B30();
  os_log(_:dso:log:_:_:)();
}

void sub_1000084D8()
{
  static os_log_type_t.fault.getter();
  sub_100003B8C(0, (unint64_t *)&qword_100011030);
  id v0 = sub_100003B30();
  os_log(_:dso:log:_:_:)();
}

uint64_t sub_100008568()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

ValueMetadata *type metadata accessor for CDMSignalHandler()
{
  return &type metadata for CDMSignalHandler;
}

unint64_t sub_1000085F8()
{
  unint64_t result = qword_1000115B0;
  if (!qword_1000115B0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000115B0);
  }
  return result;
}

unint64_t sub_100008648()
{
  unint64_t result = qword_1000115C0;
  if (!qword_1000115C0)
  {
    sub_10000869C(&qword_1000115B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000115C0);
  }
  return result;
}

uint64_t sub_10000869C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_1000086E4()
{
  return &unk_10000CB08;
}

ValueMetadata *type metadata accessor for NLRouterSignposts()
{
  return &type metadata for NLRouterSignposts;
}

uint64_t sub_100008700()
{
  uint64_t v0 = swift_allocObject();
  sub_100008738();
  return v0;
}

void *sub_100008738()
{
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100003CD8();
  uint64_t v4 = v3;
  ((void (*)(void))__chkstk_darwin)();
  sub_100008B68();
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  uint64_t v6 = sub_1000029F4(v5);
  __chkstk_darwin(v6);
  sub_100008B58();
  uint64_t v7 = type metadata accessor for DispatchQoS();
  uint64_t v8 = sub_1000029F4(v7);
  __chkstk_darwin(v8);
  sub_100008B58();
  sub_100003B8C(0, &qword_100011028);
  id v9 = sub_100002DCC();
  v0[2] = v9;
  id v10 = [objc_allocWithZone((Class)NSCondition) init];
  v0[6] = v10;
  dispatch_group_t v11 = dispatch_group_create();
  v0[7] = v11;
  sub_100003B8C(0, &qword_1000115D0);
  static DispatchQoS.background.getter();
  static OS_dispatch_queue.Attributes.concurrent.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  sub_100008B94();
  uint64_t v12 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v0[8] = v12;
  type metadata accessor for CDMXPCListener();
  id v13 = sub_1000076F8();
  id v14 = sub_1000077BC();
  v0[3] = sub_100007828(v13, v14);
  type metadata accessor for CDMXPCStreamEventListener();
  id v15 = v10;
  unint64_t v16 = v11;
  id v17 = v12;
  swift_retain();
  id v18 = v9;
  uint64_t v19 = sub_100008B80();
  v0[4] = sub_100004E98(v19, v20, v21, v22, (uint64_t)v18);
  type metadata accessor for CDMXPCActivityListener();
  id v23 = v15;
  uint64_t v24 = v16;
  id v25 = v17;
  swift_retain();
  id v26 = v18;
  uint64_t v27 = sub_100008B80();
  v0[5] = sub_100004E98(v27, v28, v29, v30, v31);
  return v0;
}

void sub_1000089C8()
{
  static CDMSignalHandler.registerHandlers()();
  uint64_t v1 = (*(uint64_t (**)(void))(*v0[3] + 144))();
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*v0[4] + 128))(v1);
  (*(void (**)(uint64_t))(*v0[5] + 128))(v2);
  id v3 = [self mainRunLoop];
  [v3 run];
}

id *sub_100008AB0()
{
  swift_release();
  swift_release();
  swift_release();

  return v0;
}

uint64_t sub_100008B00()
{
  sub_100008AB0();
  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for CDMDaemon()
{
  return self;
}

uint64_t sub_100008B80()
{
  return v0;
}

unint64_t sub_100008B94()
{
  return 0xD000000000000019;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t CDMNluRequest.init(objcProto:)()
{
  return CDMNluRequest.init(objcProto:)();
}

uint64_t type metadata accessor for CDMNluRequest()
{
  return type metadata accessor for CDMNluRequest();
}

uint64_t dispatch thunk of static CDMXPCDefines.machServiceName()()
{
  return dispatch thunk of static CDMXPCDefines.machServiceName()();
}

uint64_t type metadata accessor for CDMXPCDefines()
{
  return type metadata accessor for CDMXPCDefines();
}

uint64_t dispatch thunk of CDMNluResponse.objcProto.getter()
{
  return dispatch thunk of CDMNluResponse.objcProto.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}