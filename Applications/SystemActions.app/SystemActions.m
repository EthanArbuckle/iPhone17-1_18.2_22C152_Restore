int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  sub_10000641C(&qword_10000C8A8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100007550;
  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 32) = 0x7075206D2769;
  *(void *)(v4 + 40) = 0xE600000000000000;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  _set_user_dir_suffix();
  swift_release();
  v5 = [objc_allocWithZone((Class)type metadata accessor for Server()) init];
  sub_1000055E8();
  v6 = [self mainRunLoop];
  [v6 run];

  return 0;
}

id sub_1000055E8()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC13SystemActions6Server_listener);
  if (result) {
    return [result activate];
  }
  __break(1u);
  return result;
}

char *sub_100005608()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_100006FA8();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_100006FE8();
  uint64_t v6 = v5 - v4;
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  sub_100006FE8();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100006FE8();
  *(void *)&v0[OBJC_IVAR____TtC13SystemActions6Server_listener] = 0;
  sub_100006EA8(0, &qword_10000C820);
  v7 = v0;
  static DispatchQoS.unspecified.getter();
  v17 = &_swiftEmptyArrayStorage;
  sub_100006DC4(&qword_10000C828, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000641C(&qword_10000C830);
  sub_100006E0C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(void *)&v7[OBJC_IVAR____TtC13SystemActions6Server_serviceQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v7[OBJC_IVAR____TtC13SystemActions6Server_runners] = &_swiftEmptyDictionarySingleton;

  v16.receiver = v7;
  v16.super_class = ObjectType;
  [super init];
  sub_100006EA8(0, &qword_10000C840);
  id v15 = v8;
  v9 = (char *)v8;
  uint64_t v10 = sub_1000058C8((uint64_t)sub_100006EE4, (uint64_t)v14);

  v11 = *(void **)&v9[OBJC_IVAR____TtC13SystemActions6Server_listener];
  *(void *)&v9[OBJC_IVAR____TtC13SystemActions6Server_listener] = v10;

  return v9;
}

uint64_t sub_1000058C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  v9[4] = sub_100006FA4;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000059F8;
  v9[3] = &unk_100008538;
  uint64_t v5 = _Block_copy(v9);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  id v7 = [ObjCClassFromMetadata listenerWithConfigurator:v5];
  _Block_release(v5);
  swift_release();
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v5 & 1) == 0) {
    return (uint64_t)v7;
  }
  __break(1u);
  return result;
}

id sub_100005A20()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for Server()
{
  return self;
}

id sub_100005AD8(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  type metadata accessor for Logger();
  sub_100006FA8();
  uint64_t v50 = v6;
  uint64_t v51 = v5;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v49 = (char *)&v48 - v10;
  uint64_t v11 = type metadata accessor for UUID();
  sub_100006FA8();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v17 = __chkstk_darwin(v16);
  v18 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v20 = (char *)&v48 - v19;
  uint64_t v21 = sub_10000641C(&qword_10000C790);
  __chkstk_darwin(v21 - 8);
  sub_100006FE8();
  uint64_t v24 = v23 - v22;
  id v25 = a2;
  RunnerConnection.Policy.Client.init(client:)();
  uint64_t v26 = type metadata accessor for RunnerConnection.Policy.Client();
  int v27 = sub_100006460(v24, 1, v26);
  sub_100006488(v24);
  if (v27 == 1)
  {
    static WFLog.subscript.getter();
    v28 = v25;
    v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = (void *)swift_slowAlloc();
      *(_DWORD *)v31 = 138412290;
      aBlock[0] = v28;
      v33 = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v32 = v28;

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Client is not entitled as a trusted client: %@", v31, 0xCu);
      sub_10000641C(&qword_10000C798);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v29 = v28;
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v51);
    return [v28 invalidate];
  }
  else
  {
    UUID.init()();
    id v34 = [objc_allocWithZone((Class)WFBackgroundShortcutRunner) initWithProcessPolicy:1];
    swift_beginAccess();
    id v35 = v34;
    sub_100006660((uint64_t)v35, (uint64_t)v20);
    swift_endAccess();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v20, v11);
    unint64_t v36 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v3;
    *(void *)(v37 + 24) = v35;
    v38 = *(void (**)(unint64_t, char *, uint64_t))(v13 + 32);
    uint64_t v48 = v11;
    v38(v37 + v36, v18, v11);
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = sub_10000677C;
    *(void *)(v39 + 24) = v37;
    aBlock[4] = sub_1000067D4;
    aBlock[5] = v39;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000059F8;
    aBlock[3] = &unk_100008498;
    v40 = _Block_copy(aBlock);
    id v41 = v35;
    id v42 = v3;
    swift_retain();
    swift_release();
    [v25 configureConnection:v40];
    _Block_release(v40);
    LOBYTE(v40) = swift_isEscapingClosureAtFileLocation();
    id result = (id)swift_release();
    if (v40)
    {
      __break(1u);
    }
    else
    {
      [v25 activate];
      v44 = v49;
      static WFLog.subscript.getter();
      v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v47 = 134217984;
        aBlock[0] = CACurrentMediaTime();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "[Performance] Connection came in: %f", v47, 0xCu);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v50 + 8))(v44, v51);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v48);
      return (id)swift_release();
    }
  }
  return result;
}

void sub_1000060A0(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  sub_100006FA8();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin();
  [a1 setTargetQueue:*(void *)&a2[OBJC_IVAR____TtC13SystemActions6Server_serviceQueue]];
  id v13 = [self userInitiated];
  [a1 setServiceQuality:v13];

  type metadata accessor for RunnerConnection();
  uint64_t v14 = (void *)static RunnerConnection.bsServiceInterface.getter();
  [a1 setInterface:v14];

  [a1 setInterfaceTarget:a3];
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v15, (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_1000068A8;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000062D0;
  aBlock[3] = &unk_1000084E8;
  uint64_t v17 = _Block_copy(aBlock);
  v18 = a2;
  swift_release();
  [a1 setInvalidationHandler:v17];
  _Block_release(v17);
}

void sub_1000062D0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100006338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_10000641C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100006488(uint64_t a1)
{
  uint64_t v2 = sub_10000641C(&qword_10000C790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000064E8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100006924(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  Swift::Int v8 = *(void *)(v7 + 24);
  sub_10000641C(&qword_10000C800);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8);
  uint64_t v9 = *(void *)(v13 + 48);
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v4, v10);
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 8 * v4);
  sub_100006EA8(0, &qword_10000C808);
  sub_100006DC4(&qword_10000C810, (void (*)(uint64_t))&type metadata accessor for UUID);
  _NativeDictionary._delete(at:)();
  *uint64_t v2 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100006660(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1000069BC(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000066E0()
{
  type metadata accessor for UUID();
  sub_100006FA8();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_100006FF8();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_10000677C(void *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  sub_100006FC4(v3);
  uint64_t v5 = *(char **)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  sub_1000060A0(a1, v5, v6, v7);
}

uint64_t sub_1000067D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000067FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000680C()
{
  return swift_release();
}

uint64_t sub_100006814()
{
  type metadata accessor for UUID();
  sub_100006FA8();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_100006FF8();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_1000068A8()
{
  uint64_t v1 = type metadata accessor for UUID();
  sub_100006FC4(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  swift_beginAccess();
  uint64_t v4 = (void *)sub_1000064E8(v3);
  swift_endAccess();
}

unint64_t sub_100006924(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_100006DC4(&qword_10000C810, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100006C04(a1, v2);
}

void sub_1000069BC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_100006924(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10000641C(&qword_10000C800);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100006924(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];

    *(void *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    sub_100006B4C(v18, (uint64_t)v11, a1, v22);
  }
}

uint64_t sub_100006B4C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_100006C04(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
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
      sub_100006DC4(&qword_10000C818, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
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

uint64_t sub_100006DC4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100006E0C()
{
  unint64_t result = qword_10000C838;
  if (!qword_10000C838)
  {
    sub_100006E60(&qword_10000C830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C838);
  }
  return result;
}

uint64_t sub_100006E60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006EA8(uint64_t a1, unint64_t *a2)
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

id sub_100006EE4(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  static RunnerConnection.ServiceSpec.SystemRunner.domain.getter();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setDomain:v4];

  static RunnerConnection.ServiceSpec.SystemRunner.serviceIdentifier.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setService:v5];

  return [a1 setDelegate:v3];
}

uint64_t sub_100006FC4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100006FD8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006FF8()
{
  return v0 + v1;
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static RunnerConnection.ServiceSpec.SystemRunner.serviceIdentifier.getter()
{
  return static RunnerConnection.ServiceSpec.SystemRunner.serviceIdentifier.getter();
}

uint64_t static RunnerConnection.ServiceSpec.SystemRunner.domain.getter()
{
  return static RunnerConnection.ServiceSpec.SystemRunner.domain.getter();
}

uint64_t static RunnerConnection.bsServiceInterface.getter()
{
  return static RunnerConnection.bsServiceInterface.getter();
}

uint64_t RunnerConnection.Policy.Client.init(client:)()
{
  return RunnerConnection.Policy.Client.init(client:)();
}

uint64_t type metadata accessor for RunnerConnection.Policy.Client()
{
  return type metadata accessor for RunnerConnection.Policy.Client();
}

uint64_t type metadata accessor for RunnerConnection()
{
  return type metadata accessor for RunnerConnection();
}

uint64_t static WFLog.subscript.getter()
{
  return static WFLog.subscript.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
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

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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
  return [super a2];
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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