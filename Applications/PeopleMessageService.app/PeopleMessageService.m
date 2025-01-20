id sub_100003290()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void type metadata accessor for UIBackgroundTaskIdentifier()
{
  if (!qword_10001D7F8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001D7F8);
    }
  }
}

NSNumber sub_1000033CC()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1000033D4(uint64_t a1, uint64_t a2)
{
  uint64_t result = static Int._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100003428(uint64_t a1, uint64_t a2)
{
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_100003480@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

BOOL sub_1000034A8(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1000034BC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000034CC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000034D8()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100003578()
{
  return sub_100003650(&qword_10001D800);
}

uint64_t sub_1000035AC()
{
  return sub_100003650(&qword_10001D808);
}

uint64_t sub_1000035E0()
{
  return sub_100003650(&qword_10001D810);
}

uint64_t sub_100003614()
{
  return Int.hashValue.getter(*v0);
}

void sub_10000361C()
{
  Hasher._combine(_:)(*v0);
}

uint64_t sub_100003648(uint64_t a1)
{
  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_100003650(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UIBackgroundTaskIdentifier();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100003694(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v17[-v7];
  v9 = (void *)(a1 + 16);
  swift_beginAccess();
  if (*(void *)(a1 + 16) == UIBackgroundTaskInvalid)
  {
    static PeopleLogger.messages.getter();
    v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "sendMessage cleanup but task invalid", v12, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    static PeopleLogger.messages.getter();
    v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "sendMessage cleanup task", v15, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
    id v16 = [self sharedApplication];
    swift_beginAccess();
    [v16 endBackgroundTask:*v9];
  }
}

uint64_t sub_10000390C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100003990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageComposer();
  return [super dealloc];
}

uint64_t type metadata accessor for MessageComposer()
{
  return self;
}

unint64_t sub_1000039E8(uint64_t a1)
{
  type metadata accessor for MessageDetails.EventSource();
  sub_1000085B4(&qword_10001D8E8, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100003A80(a1, v2);
}

unint64_t sub_100003A80(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for MessageDetails.EventSource();
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
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    os_log_type_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000085B4(&qword_10001D8F0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
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

uint64_t sub_100003C40()
{
  uint64_t v0 = type metadata accessor for PeopleURL.PathAction();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v25 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000083D8(&qword_10001D8F8);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000083D8(&qword_10001D900);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v24 - v12;
  __chkstk_darwin(v11);
  char v15 = (char *)&v24 - v14;
  URLComponents.peopleAction.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v13, enum case for PeopleURL.PathAction.sendMessage(_:), v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  uint64_t v16 = (uint64_t)&v6[*(int *)(v4 + 56)];
  sub_1000084F4((uint64_t)v15, (uint64_t)v6, &qword_10001D900);
  sub_1000084F4((uint64_t)v13, v16, &qword_10001D900);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v17((uint64_t)v6, 1, v0) == 1)
  {
    sub_100008558((uint64_t)v13, &qword_10001D900);
    sub_100008558((uint64_t)v15, &qword_10001D900);
    int v18 = v17(v16, 1, v0);
    if (v18 == 1) {
      uint64_t v19 = &qword_10001D900;
    }
    else {
      uint64_t v19 = &qword_10001D8F8;
    }
    if (v18 == 1) {
      char v20 = -1;
    }
    else {
      char v20 = 0;
    }
  }
  else
  {
    sub_1000084F4((uint64_t)v6, (uint64_t)v10, &qword_10001D900);
    if (v17(v16, 1, v0) == 1)
    {
      sub_100008558((uint64_t)v13, &qword_10001D900);
      sub_100008558((uint64_t)v15, &qword_10001D900);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      char v20 = 0;
      uint64_t v19 = &qword_10001D8F8;
    }
    else
    {
      v21 = v25;
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v25, v16, v0);
      sub_1000085B4(&qword_10001D908, (void (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction);
      char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
      v22 = *(void (**)(char *, uint64_t))(v1 + 8);
      v22(v21, v0);
      uint64_t v19 = &qword_10001D900;
      sub_100008558((uint64_t)v13, &qword_10001D900);
      sub_100008558((uint64_t)v15, &qword_10001D900);
      v22(v10, v0);
    }
  }
  sub_100008558((uint64_t)v6, v19);
  return v20 & 1;
}

uint64_t sub_100004014(uint64_t a1)
{
  v1[38] = a1;
  sub_1000083D8(&qword_10001D8C0);
  v1[39] = swift_task_alloc();
  sub_1000083D8(&qword_10001D8C8);
  v1[40] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for AskToMetrics();
  v1[41] = v2;
  v1[42] = *(void *)(v2 - 8);
  v1[43] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for DiscoveredHandles();
  v1[44] = v3;
  v1[45] = *(void *)(v3 - 8);
  v1[46] = swift_task_alloc();
  sub_1000083D8(&qword_10001D8D0);
  v1[47] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ResolvedFamily();
  v1[48] = v4;
  v1[49] = *(void *)(v4 - 8);
  v1[50] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MessageDetails.EventStatus();
  v1[51] = v5;
  v1[52] = *(void *)(v5 - 8);
  v1[53] = swift_task_alloc();
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v1[56] = v6;
  v1[57] = *(void *)(v6 - 8);
  v1[58] = swift_task_alloc();
  v1[59] = swift_task_alloc();
  v1[60] = swift_task_alloc();
  v1[61] = swift_task_alloc();
  v1[62] = swift_task_alloc();
  v1[63] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MessageDetails();
  v1[64] = v7;
  v1[65] = *(void *)(v7 - 8);
  v1[66] = swift_task_alloc();
  v1[67] = swift_task_alloc();
  v1[68] = swift_task_alloc();
  sub_1000083D8(&qword_10001D8D8);
  v1[69] = swift_task_alloc();
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MessageDetails.EventSource();
  v1[72] = v8;
  v1[73] = *(void *)(v8 - 8);
  v1[74] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for PeopleURL.Parameter();
  v1[75] = v9;
  v1[76] = *(void *)(v9 - 8);
  v1[77] = swift_task_alloc();
  v1[78] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[79] = static MainActor.shared.getter();
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[80] = v11;
  v1[81] = v10;
  return _swift_task_switch(sub_1000044F4, v11, v10);
}

uint64_t sub_1000044F4()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = v0[76];
  uint64_t v3 = v0[75];
  uint64_t v4 = *(void (**)(uint64_t, void, uint64_t))(v2 + 104);
  v4(v1, enum case for PeopleURL.Parameter.requestID(_:), v3);
  uint64_t v5 = URLComponents.subscript.getter();
  uint64_t v7 = v6;
  v0[82] = v6;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v1, v3);
  if (!v7)
  {
    swift_release();
    goto LABEL_5;
  }
  uint64_t v26 = v5;
  uint64_t v9 = v0[77];
  uint64_t v10 = v0[75];
  uint64_t v11 = v0[73];
  uint64_t v27 = v0[72];
  uint64_t v12 = v0[71];
  v4(v9, enum case for PeopleURL.Parameter.eventSource(_:), v10);
  URLComponents.subscript.getter();
  v8(v9, v10);
  MessageDetails.EventSource.init(rawValue:)();
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v0[83] = v13;
  v0[84] = (v11 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v13(v12, 1, v27) == 1)
  {
    uint64_t v14 = v0[71];
    swift_release();
    swift_bridgeObjectRelease();
    sub_100008558(v14, &qword_10001D8D8);
LABEL_5:
    static PeopleErrors.createError(_:code:)();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
  (*(void (**)(void, void, void))(v0[73] + 32))(v0[74], v0[71], v0[72]);
  uint64_t v17 = swift_allocObject();
  v0[85] = v17;
  *(void *)(v17 + 16) = UIBackgroundTaskInvalid;
  int v18 = (void *)(v17 + 16);
  id v19 = [self sharedApplication];
  NSString v20 = String._bridgeToObjectiveC()();
  v0[6] = sub_10000842C;
  v0[7] = v17;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000390C;
  v0[5] = &unk_100018BB0;
  v21 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  id v22 = [v19 beginBackgroundTaskWithName:v20 expirationHandler:v21];
  _Block_release(v21);

  swift_beginAccess();
  *int v18 = v22;
  if (qword_10001D760 != -1) {
    swift_once();
  }
  v23 = (void *)swift_task_alloc();
  v0[86] = v23;
  void *v23 = v0;
  v23[1] = sub_100004A3C;
  uint64_t v24 = v0[74];
  uint64_t v25 = v0[68];
  return sub_10000BD04(v25, v26, v7, v24);
}

uint64_t sub_100004A3C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 696) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 648);
  uint64_t v4 = *(void *)(v2 + 640);
  if (v0) {
    uint64_t v5 = sub_1000081E4;
  }
  else {
    uint64_t v5 = sub_100004B90;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100004B90()
{
  uint64_t v118 = v0;
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v2 = *(void *)(v0 + 536);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 512);
  static PeopleLogger.messages.getter();
  v110 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v110(v2, v1, v4);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 536);
    uint64_t v8 = *(void *)(v0 + 520);
    *(void *)typea = *(void *)(v0 + 512);
    uint64_t v103 = *(void *)(v0 + 456);
    uint64_t v105 = *(void *)(v0 + 448);
    uint64_t v107 = *(void *)(v0 + 504);
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v117[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v10 = MessageDetails.debugDescription.getter();
    *(void *)(v0 + 296) = sub_1000091CC(v10, v11, v117);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v12(v7, *(void *)typea);
    uint64_t v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetched & created %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
    v14(v107, v105);
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 504);
    uint64_t v16 = *(void *)(v0 + 448);
    uint64_t v17 = *(void *)(v0 + 456);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 520) + 8);
    v13(*(void *)(v0 + 536), *(void *)(v0 + 512));

    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v14(v15, v16);
  }
  *(void *)(v0 + 712) = v13;
  *(void *)(v0 + 704) = v14;
  if (qword_10001D768 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_10001DFB8;
  if (!*(void *)(qword_10001DFB8 + 16) || (unint64_t v19 = sub_1000039E8(*(void *)(v0 + 592)), (v20 & 1) == 0))
  {
    uint64_t v26 = *(void *)(v0 + 592);
    uint64_t v27 = *(void *)(v0 + 584);
    uint64_t v28 = *(void *)(v0 + 576);
    uint64_t v29 = *(void *)(v0 + 544);
    uint64_t v30 = *(void *)(v0 + 512);
    swift_release();
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    v13(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    goto LABEL_26;
  }
  v98 = v14;
  v99 = v13;
  uint64_t v21 = *(void *)(v0 + 432);
  uint64_t v23 = *(void *)(v0 + 408);
  uint64_t v22 = *(void *)(v0 + 416);
  uint64_t v24 = (void *)(*(void *)(v18 + 56) + (v19 << 6));
  *(void *)(v0 + 720) = *v24;
  *(void *)(v0 + 728) = v24[1];
  *(void *)(v0 + 736) = v24[3];
  *(void *)(v0 + 744) = v24[5];
  *(void *)(v0 + 752) = v24[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MessageDetails.status.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v22 + 104))(v21, enum case for MessageDetails.EventStatus.pending(_:), v23);
  sub_1000085B4(&qword_10001D8E0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (*(void *)(v0 + 248) == *(void *)(v0 + 264) && *(void *)(v0 + 256) == *(void *)(v0 + 272)) {
    char v25 = 1;
  }
  else {
    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  uint64_t v32 = *(void *)(v0 + 432);
  uint64_t v31 = *(void *)(v0 + 440);
  uint64_t v33 = *(void *)(v0 + 408);
  uint64_t v34 = *(void *)(v0 + 416);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v35(v32, v33);
  v35(v31, v33);
  if ((v25 & 1) == 0)
  {
    uint64_t v40 = *(void *)(v0 + 544);
    uint64_t v41 = *(void *)(v0 + 528);
    uint64_t v42 = *(void *)(v0 + 512);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static PeopleLogger.messages.getter();
    v110(v41, v40, v42);
    v43 = Logger.logObject.getter();
    os_log_type_t type = static os_log_type_t.debug.getter();
    BOOL v44 = os_log_type_enabled(v43, type);
    uint64_t v45 = *(void *)(v0 + 592);
    uint64_t v46 = *(void *)(v0 + 584);
    uint64_t v47 = *(void *)(v0 + 576);
    uint64_t v114 = *(void *)(v0 + 544);
    uint64_t v48 = *(void *)(v0 + 528);
    uint64_t v49 = *(void *)(v0 + 512);
    uint64_t v111 = *(void *)(v0 + 464);
    uint64_t v108 = *(void *)(v0 + 448);
    if (v44)
    {
      log = v43;
      uint64_t v100 = *(void *)(v0 + 576);
      uint64_t v50 = *(void *)(v0 + 424);
      uint64_t v94 = *(void *)(v0 + 408);
      uint64_t v95 = *(void *)(v0 + 512);
      v51 = (uint8_t *)swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)v51 = 136315138;
      MessageDetails.status.getter();
      uint64_t v52 = MessageDetails.EventStatus.rawValue.getter();
      uint64_t v97 = v45;
      unint64_t v54 = v53;
      v35(v50, v94);
      *(void *)(v0 + 288) = sub_1000091CC(v52, v54, v117);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v99(v48, v95);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Event status != pending (%s), no message to send", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v98(v111, v108);
      v99(v114, v95);
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v97, v100);
    }
    else
    {

      v99(v48, v49);
      v98(v111, v108);
      v99(v114, v49);
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    }
LABEL_26:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v69 = *(uint64_t (**)(void))(v0 + 8);
    return v69();
  }
  uint64_t v36 = *(void *)(v0 + 384);
  uint64_t v37 = *(void *)(v0 + 392);
  uint64_t v38 = *(void *)(v0 + 376);
  MessageDetails.family.getter();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v38, 1, v36) == 1)
  {
    uint64_t v39 = *(void *)(v0 + 376);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008558(v39, &qword_10001D8D0);
LABEL_23:
    static PeopleLogger.messages.getter();
    v60 = Logger.logObject.getter();
    os_log_type_t v61 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, v61, "Only send message if I am requesting family member ", v62, 2u);
      swift_slowDealloc();
    }
    uint64_t v112 = *(void *)(v0 + 592);
    uint64_t v63 = *(void *)(v0 + 584);
    uint64_t v64 = *(void *)(v0 + 576);
    uint64_t v65 = *(void *)(v0 + 544);
    uint64_t v66 = *(void *)(v0 + 512);
    uint64_t v67 = *(void *)(v0 + 472);
    uint64_t v68 = *(void *)(v0 + 448);

    v98(v67, v68);
    v99(v65, v66);
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v112, v64);
    goto LABEL_26;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 392) + 32))(*(void *)(v0 + 400), *(void *)(v0 + 376), *(void *)(v0 + 384));
  v55 = (void *)ResolvedFamily.requestingFamilyMember.getter();
  unsigned int v56 = [v55 isMe];

  if (!v56)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 392) + 8))(*(void *)(v0 + 400), *(void *)(v0 + 384));
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 664);
  uint64_t v58 = *(void *)(v0 + 576);
  uint64_t v59 = *(void *)(v0 + 560);
  AskToMetrics.init(isAskToProcess:)();
  MessageDetails.eventSource.getter();
  if (v57(v59, 1, v58) == 1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_37:
    uint64_t v113 = *(void *)(v0 + 592);
    uint64_t v86 = *(void *)(v0 + 584);
    uint64_t v109 = *(void *)(v0 + 576);
    uint64_t v116 = *(void *)(v0 + 560);
    uint64_t v104 = *(void *)(v0 + 512);
    uint64_t v106 = *(void *)(v0 + 544);
    uint64_t v87 = *(void *)(v0 + 392);
    uint64_t v88 = *(void *)(v0 + 400);
    uint64_t v89 = *(void *)(v0 + 384);
    uint64_t v91 = *(void *)(v0 + 336);
    uint64_t v90 = *(void *)(v0 + 344);
    uint64_t v92 = *(void *)(v0 + 328);
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v90, v92);
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v88, v89);
    v99(v106, v104);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v113, v109);
    sub_100008558(v116, &qword_10001D8D8);
    goto LABEL_26;
  }
  uint64_t v71 = *(void *)(v0 + 584);
  uint64_t v72 = *(void *)(v0 + 576);
  uint64_t v73 = *(void *)(v0 + 552);
  sub_1000084F4(*(void *)(v0 + 560), v73, &qword_10001D8D8);
  int v74 = (*(uint64_t (**)(uint64_t, uint64_t))(v71 + 88))(v73, v72);
  if (v74 == enum case for MessageDetails.EventSource.askToBuy(_:))
  {
    type metadata accessor for ServerFeatureFlag();
    static ServerFeatureFlag.shared.getter();
    char v75 = ServerFeatureFlag.preventAskToBuyDeviceValidation.getter();
    *(unsigned char *)(v0 + 930) = v75 & 1;
    swift_release();
    type metadata accessor for MessageSendRules();
    *(void *)(v0 + 824) = static MessageSendRules.sharedInstance.getter();
    uint64_t v76 = ResolvedFamily.approvers.getter();
    *(void *)(v0 + 832) = v76;
    uint64_t v77 = type metadata accessor for MessageDeviceCapabilityLookup();
    if (v75)
    {
      *(void *)(v0 + 184) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      uint64_t v78 = v0 + 184;
      *(void *)(v0 + 208) = v77;
      *(void *)(v0 + 216) = &protocol witness table for MessageDeviceCapabilityLookup;
      v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
                                                               + async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:));
      v79 = (void *)swift_task_alloc();
      *(void *)(v0 + 840) = v79;
      void *v79 = v0;
      v80 = sub_100006A44;
    }
    else
    {
      *(void *)(v0 + 64) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      uint64_t v78 = v0 + 64;
      *(void *)(v0 + 88) = v77;
      *(void *)(v0 + 96) = &protocol witness table for MessageDeviceCapabilityLookup;
      v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingAskToBuyMessage(_:lookup:)
                                                               + async function pointer to dispatch thunk of MessageSendRules.approversSupportingAskToBuyMessage(_:lookup:));
      v79 = (void *)swift_task_alloc();
      *(void *)(v0 + 848) = v79;
      void *v79 = v0;
      v80 = sub_100006D10;
    }
  }
  else
  {
    if (v74 != enum case for MessageDetails.EventSource.screenTime(_:))
    {
      uint64_t v83 = *(void *)(v0 + 584);
      uint64_t v84 = *(void *)(v0 + 576);
      uint64_t v85 = *(void *)(v0 + 552);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v85, v84);
      goto LABEL_37;
    }
    type metadata accessor for ServerFeatureFlag();
    static ServerFeatureFlag.shared.getter();
    char v81 = ServerFeatureFlag.preventScreenTimeMessageDeviceValidation.getter();
    *(unsigned char *)(v0 + 928) = v81 & 1;
    swift_release();
    type metadata accessor for MessageSendRules();
    *(void *)(v0 + 760) = static MessageSendRules.sharedInstance.getter();
    uint64_t v76 = ResolvedFamily.approvers.getter();
    *(void *)(v0 + 768) = v76;
    uint64_t v82 = type metadata accessor for MessageDeviceCapabilityLookup();
    if (v81)
    {
      *(void *)(v0 + 104) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      uint64_t v78 = v0 + 104;
      *(void *)(v0 + 128) = v82;
      *(void *)(v0 + 136) = &protocol witness table for MessageDeviceCapabilityLookup;
      v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
                                                               + async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:));
      v79 = (void *)swift_task_alloc();
      *(void *)(v0 + 776) = v79;
      void *v79 = v0;
      v80 = sub_100005C50;
    }
    else
    {
      *(void *)(v0 + 144) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      uint64_t v78 = v0 + 144;
      *(void *)(v0 + 168) = v82;
      *(void *)(v0 + 176) = &protocol witness table for MessageDeviceCapabilityLookup;
      v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingScreenTimeMessage(_:lookup:)
                                                               + async function pointer to dispatch thunk of MessageSendRules.approversSupportingScreenTimeMessage(_:lookup:));
      v79 = (void *)swift_task_alloc();
      *(void *)(v0 + 784) = v79;
      void *v79 = v0;
      v80 = sub_100005F1C;
    }
  }
  v79[1] = v80;
  uint64_t v93 = *(void *)(v0 + 368);
  return v115(v93, v76, v78);
}

uint64_t sub_100005C50()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 104;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000844C(v2);
  uint64_t v3 = *(void *)(v1 + 648);
  uint64_t v4 = *(void *)(v1 + 640);
  return _swift_task_switch(sub_100005DC4, v4, v3);
}

uint64_t sub_100005DC4()
{
  uint64_t v2 = v0[45];
  uint64_t v1 = v0[46];
  uint64_t v3 = v0[44];
  uint64_t v4 = v0[40];
  type metadata accessor for MessageSendRules();
  v0[99] = static MessageSendRules.sharedInstance.getter();
  uint64_t v5 = ResolvedFamily.requestingFamilyMember.getter();
  v0[100] = v5;
  uint64_t v6 = ResolvedFamily.approvers.getter();
  v0[101] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  unint64_t v11 = (char *)&async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:askToMetrics:discoveredHandles:)
      + async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:askToMetrics:discoveredHandles:);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[102] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100006090;
  uint64_t v8 = v0[43];
  uint64_t v9 = v0[40];
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))v11)(v5, v6, 0, v8, v9);
}

uint64_t sub_100005F1C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 144;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000844C(v2);
  uint64_t v3 = *(void *)(v1 + 648);
  uint64_t v4 = *(void *)(v1 + 640);
  return _swift_task_switch(sub_1000085FC, v4, v3);
}

uint64_t sub_100006090(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void **)(*v1 + 800);
  uint64_t v4 = *(void *)(*v1 + 320);
  *(unsigned char *)(*v1 + 929) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  swift_release();
  sub_100008558(v4, &qword_10001D8C8);
  uint64_t v5 = *(void *)(v2 + 648);
  uint64_t v6 = *(void *)(v2 + 640);
  return _swift_task_switch(sub_10000623C, v6, v5);
}

uint64_t sub_10000623C()
{
  uint64_t v54 = v0;
  if (*(unsigned char *)(v0 + 929) == 1)
  {
    uint64_t v1 = *(unsigned __int8 *)(v0 + 928);
    sub_100008558(*(void *)(v0 + 560), &qword_10001D8D8);
    if (DiscoveredHandles.allMembersMeetRequirements.getter())
    {
      *(void *)(v0 + 888) = DiscoveredHandles.iMessageHandles.getter();
      static PeopleLogger.messages.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v3 = static os_log_type_t.debug.getter();
      BOOL v4 = os_log_type_enabled(v2, v3);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 704);
      uint64_t v6 = *(void *)(v0 + 496);
      uint64_t v7 = *(void *)(v0 + 448);
      if (v4)
      {
        unsigned int v51 = v1;
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v43 = v6;
        uint64_t v9 = Array.description.getter();
        unint64_t v11 = v10;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 280) = sub_1000091CC(v9, v11, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "MessageComposer validated destinations %s", v8, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v1 = v51;
        swift_slowDealloc();

        v5(v43, v7);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v5(v6, v7);
      }
      uint64_t v26 = *(void *)(v0 + 312);
      uint64_t v27 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
      uint64_t v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10001DB90 + dword_10001DB90);
      uint64_t v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 896) = v28;
      *uint64_t v28 = v0;
      v28[1] = sub_100007838;
      uint64_t v29 = *(void *)(v0 + 544);
      uint64_t v30 = *(void *)(v0 + 312);
      return v52(v29, v1, v30);
    }
    uint64_t v49 = *(void *)(v0 + 592);
    uint64_t v20 = *(void *)(v0 + 584);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    uint64_t v47 = *(void *)(v0 + 576);
    uint64_t v40 = *(void *)(v0 + 512);
    uint64_t v42 = *(void *)(v0 + 544);
    uint64_t v21 = *(void *)(v0 + 392);
    uint64_t v38 = *(void *)(v0 + 400);
    uint64_t v22 = *(void *)(v0 + 360);
    uint64_t v34 = *(void *)(v0 + 368);
    uint64_t v36 = *(void *)(v0 + 384);
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v31 = *(void *)(v0 + 344);
    uint64_t v33 = *(void *)(v0 + 352);
    uint64_t v24 = *(void *)(v0 + 328);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v31, v24);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v34, v33);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v38, v36);
    v45(v42, v40);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v49, v47);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    BOOL v44 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    uint64_t v12 = *(void *)(v0 + 584);
    uint64_t v46 = *(void *)(v0 + 576);
    uint64_t v48 = *(void *)(v0 + 592);
    uint64_t v50 = *(void *)(v0 + 560);
    uint64_t v39 = *(void *)(v0 + 512);
    uint64_t v41 = *(void *)(v0 + 544);
    uint64_t v13 = *(void *)(v0 + 392);
    uint64_t v37 = *(void *)(v0 + 400);
    uint64_t v35 = *(void *)(v0 + 384);
    uint64_t v14 = *(void *)(v0 + 360);
    uint64_t v32 = *(void *)(v0 + 368);
    uint64_t v15 = *(void *)(v0 + 344);
    uint64_t v16 = *(void *)(v0 + 352);
    uint64_t v17 = *(void *)(v0 + 328);
    uint64_t v18 = *(void *)(v0 + 336);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v17);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v32, v16);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v37, v35);
    v44(v41, v39);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v48, v46);
    sub_100008558(v50, &qword_10001D8D8);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v19();
}

uint64_t sub_100006A44()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 184;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000844C(v2);
  uint64_t v3 = *(void *)(v1 + 648);
  uint64_t v4 = *(void *)(v1 + 640);
  return _swift_task_switch(sub_100006BB8, v4, v3);
}

uint64_t sub_100006BB8()
{
  uint64_t v2 = v0[45];
  uint64_t v1 = v0[46];
  uint64_t v3 = v0[44];
  uint64_t v4 = v0[40];
  type metadata accessor for MessageSendRules();
  v0[107] = static MessageSendRules.sharedInstance.getter();
  uint64_t v5 = ResolvedFamily.requestingFamilyMember.getter();
  v0[108] = v5;
  uint64_t v6 = ResolvedFamily.approvers.getter();
  v0[109] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  unint64_t v11 = (char *)&async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:)
      + async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:askToMetrics:discoveredHandles:);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[110] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100006E84;
  uint64_t v8 = v0[43];
  uint64_t v9 = v0[40];
  return ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t))v11)(v5, v6, 0, v8, v9);
}

uint64_t sub_100006D10()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 64;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000844C(v2);
  uint64_t v3 = *(void *)(v1 + 648);
  uint64_t v4 = *(void *)(v1 + 640);
  return _swift_task_switch(sub_100008600, v4, v3);
}

uint64_t sub_100006E84(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void **)(*v1 + 864);
  uint64_t v4 = *(void *)(*v1 + 320);
  *(unsigned char *)(*v1 + 931) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  swift_release();
  sub_100008558(v4, &qword_10001D8C8);
  uint64_t v5 = *(void *)(v2 + 648);
  uint64_t v6 = *(void *)(v2 + 640);
  return _swift_task_switch(sub_100007030, v6, v5);
}

uint64_t sub_100007030()
{
  uint64_t v54 = v0;
  if (*(unsigned char *)(v0 + 931) == 1)
  {
    uint64_t v1 = *(unsigned __int8 *)(v0 + 930);
    sub_100008558(*(void *)(v0 + 560), &qword_10001D8D8);
    if (DiscoveredHandles.allMembersMeetRequirements.getter())
    {
      *(void *)(v0 + 888) = DiscoveredHandles.iMessageHandles.getter();
      static PeopleLogger.messages.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v3 = static os_log_type_t.debug.getter();
      BOOL v4 = os_log_type_enabled(v2, v3);
      uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 704);
      uint64_t v6 = *(void *)(v0 + 496);
      uint64_t v7 = *(void *)(v0 + 448);
      if (v4)
      {
        unsigned int v51 = v1;
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v43 = v6;
        uint64_t v9 = Array.description.getter();
        unint64_t v11 = v10;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 280) = sub_1000091CC(v9, v11, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "MessageComposer validated destinations %s", v8, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v1 = v51;
        swift_slowDealloc();

        v5(v43, v7);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v5(v6, v7);
      }
      uint64_t v26 = *(void *)(v0 + 312);
      uint64_t v27 = type metadata accessor for URL();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
      uint64_t v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10001DB90 + dword_10001DB90);
      uint64_t v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 896) = v28;
      *uint64_t v28 = v0;
      v28[1] = sub_100007838;
      uint64_t v29 = *(void *)(v0 + 544);
      uint64_t v30 = *(void *)(v0 + 312);
      return v52(v29, v1, v30);
    }
    uint64_t v49 = *(void *)(v0 + 592);
    uint64_t v20 = *(void *)(v0 + 584);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    uint64_t v47 = *(void *)(v0 + 576);
    uint64_t v40 = *(void *)(v0 + 512);
    uint64_t v42 = *(void *)(v0 + 544);
    uint64_t v21 = *(void *)(v0 + 392);
    uint64_t v38 = *(void *)(v0 + 400);
    uint64_t v22 = *(void *)(v0 + 360);
    uint64_t v34 = *(void *)(v0 + 368);
    uint64_t v36 = *(void *)(v0 + 384);
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v31 = *(void *)(v0 + 344);
    uint64_t v33 = *(void *)(v0 + 352);
    uint64_t v24 = *(void *)(v0 + 328);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v31, v24);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v34, v33);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v38, v36);
    v45(v42, v40);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v49, v47);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    BOOL v44 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    uint64_t v12 = *(void *)(v0 + 584);
    uint64_t v46 = *(void *)(v0 + 576);
    uint64_t v48 = *(void *)(v0 + 592);
    uint64_t v50 = *(void *)(v0 + 560);
    uint64_t v39 = *(void *)(v0 + 512);
    uint64_t v41 = *(void *)(v0 + 544);
    uint64_t v13 = *(void *)(v0 + 392);
    uint64_t v37 = *(void *)(v0 + 400);
    uint64_t v35 = *(void *)(v0 + 384);
    uint64_t v14 = *(void *)(v0 + 360);
    uint64_t v32 = *(void *)(v0 + 368);
    uint64_t v15 = *(void *)(v0 + 344);
    uint64_t v16 = *(void *)(v0 + 352);
    uint64_t v17 = *(void *)(v0 + 328);
    uint64_t v18 = *(void *)(v0 + 336);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v17);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v32, v16);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v37, v35);
    v44(v41, v39);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v48, v46);
    sub_100008558(v50, &qword_10001D8D8);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v19();
}

uint64_t sub_100007838(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *v3;
  v4[113] = a1;
  v4[114] = a2;
  v4[115] = v2;
  swift_task_dealloc();
  sub_100008558(v4[39], &qword_10001D8C0);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = v4[81];
    uint64_t v6 = v4[80];
    uint64_t v7 = sub_100007F58;
  }
  else
  {
    uint64_t v5 = v4[81];
    uint64_t v6 = v4[80];
    uint64_t v7 = sub_1000079C8;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_1000079C8()
{
  swift_release();
  uint64_t v50 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  MessageDetails.requestID.getter();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class v4 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unsigned int v5 = [v50 sendPayload:isa extensionBundleID:v2 chatGUID:v3 withRecipients:v4];

  if (v5)
  {
    static PeopleLogger.messages.getter();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Message send with imcore seems OK", v8, 2u);
      swift_slowDealloc();
    }
    uint64_t v46 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v34 = (void (*)(uint64_t, uint64_t))v0[88];
    uint64_t v48 = v0[74];
    uint64_t v9 = v0[73];
    uint64_t v42 = v0[68];
    uint64_t v44 = v0[72];
    uint64_t v40 = v0[64];
    uint64_t v10 = v0[56];
    uint64_t v11 = v0[49];
    uint64_t v36 = v0[48];
    uint64_t v38 = v0[50];
    uint64_t v12 = v0[45];
    uint64_t v32 = v0[46];
    uint64_t v13 = v0[43];
    uint64_t v28 = v0[61];
    uint64_t v30 = v0[44];
    uint64_t v15 = v0[41];
    uint64_t v14 = v0[42];
    sub_10000849C(v0[113], v0[114]);

    v34(v28, v10);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v32, v30);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v38, v36);
    v46(v42, v40);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v48, v44);
  }
  else
  {
    static PeopleLogger.messages.getter();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Message send with imcore failed", v18, 2u);
      swift_slowDealloc();
    }
    uint64_t v47 = (void (*)(uint64_t, uint64_t))v0[89];
    uint64_t v35 = (void (*)(uint64_t, uint64_t))v0[88];
    uint64_t v49 = v0[74];
    uint64_t v19 = v0[73];
    uint64_t v43 = v0[68];
    uint64_t v45 = v0[72];
    uint64_t v41 = v0[64];
    uint64_t v20 = v0[56];
    uint64_t v21 = v0[49];
    uint64_t v37 = v0[48];
    uint64_t v39 = v0[50];
    uint64_t v22 = v0[45];
    uint64_t v33 = v0[46];
    uint64_t v23 = v0[43];
    uint64_t v29 = v0[60];
    uint64_t v31 = v0[44];
    uint64_t v25 = v0[41];
    uint64_t v24 = v0[42];
    sub_10000849C(v0[113], v0[114]);

    v35(v29, v20);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v33, v31);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v39, v37);
    v47(v43, v41);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v49, v45);
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26();
}

uint64_t sub_100007F58()
{
  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[89];
  uint64_t v17 = v0[74];
  uint64_t v1 = v0[73];
  uint64_t v16 = v0[72];
  uint64_t v13 = v0[64];
  uint64_t v14 = v0[68];
  uint64_t v2 = v0[49];
  uint64_t v12 = v0[50];
  uint64_t v3 = v0[48];
  uint64_t v4 = v0[45];
  uint64_t v5 = v0[46];
  uint64_t v6 = v0[43];
  uint64_t v7 = v0[44];
  uint64_t v8 = v0[41];
  uint64_t v9 = v0[42];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v3);
  v15(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v17, v16);
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

uint64_t sub_1000081E4()
{
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[73];
  uint64_t v3 = v0[72];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_1000083D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000841C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000842C()
{
  sub_100003694(v0);
}

uint64_t sub_100008434(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008444()
{
  return swift_release();
}

uint64_t sub_10000844C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000849C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000084F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000083D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100008558(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000083D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000085B4(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_10000879C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootContainerViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RootContainerViewController()
{
  return self;
}

uint64_t sub_1000088E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = type metadata accessor for Logger();
  v5[2] = v7;
  v5[3] = *(void *)(v7 - 8);
  v5[4] = swift_task_alloc();
  v5[5] = type metadata accessor for MainActor();
  v5[6] = static MainActor.shared.getter();
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_10001D8B8 + dword_10001D8B8);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[7] = v8;
  void *v8 = v5;
  v8[1] = sub_100008A00;
  return v10(a5);
}

uint64_t sub_100008A00()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  if (v0) {
    uint64_t v4 = sub_100008BC4;
  }
  else {
    uint64_t v4 = sub_100008B5C;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_100008B5C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100008BC4()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  swift_release();
  static PeopleLogger.messages.getter();
  swift_errorRetain();
  Logger.ifError(_:message:)();
  swift_errorRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_100008D50()
{
  *(void *)&v0[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window] = 0;
  uint64_t v1 = OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController;
  type metadata accessor for RootContainerViewController();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  *(void *)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_backgroundTaskID] = UIBackgroundTaskInvalid;

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super init];
}

id sub_100008E28()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

unint64_t sub_100008EDC()
{
  unint64_t result = qword_10001DA48;
  if (!qword_10001DA48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001DA48);
  }
  return result;
}

uint64_t sub_100008F1C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100008FF8;
  return v6(a1);
}

uint64_t sub_100008FF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000090F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10000B304;
  return v6(a1);
}

uint64_t sub_1000091CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000092A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000ACA4((uint64_t)v12, *a3);
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
      sub_10000ACA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000844C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000092A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000945C(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000945C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000094F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000096D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000096D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000094F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000966C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000966C(uint64_t a1, uint64_t a2)
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
  sub_1000083D8((uint64_t *)&unk_10001DAA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000096D4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000083D8((uint64_t *)&unk_10001DAA0);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100009824(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000083D8(&qword_10001DA58);
  __chkstk_darwin(v4 - 8);
  v129 = (char *)v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = type metadata accessor for PeopleURL.Scheme();
  uint64_t v6 = *(void *)(v118 - 8);
  __chkstk_darwin(v118);
  v117 = (char *)v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000083D8(&qword_10001DA60);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URLComponents();
  uint64_t v103 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  v101 = (char *)v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = v13;
  __chkstk_darwin(v12);
  uint64_t v116 = (char *)v100 - v14;
  uint64_t v133 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v133 - 8);
  uint64_t v16 = __chkstk_darwin(v133);
  uint64_t v18 = (char *)v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  v120 = (char *)v100 - v20;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v100 - v21;
  uint64_t v131 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v131 - 8);
  uint64_t v24 = __chkstk_darwin(v131);
  v127 = (char *)v100 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v100 - v26;
  id v104 = *(id *)(v2 + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer);
  if (v104)
  {
    v126 = v10;
    uint64_t v137 = v6;
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v28 = v104;
      swift_bridgeObjectRetain();
      __CocoaSet.makeIterator()();
      sub_100008EDC();
      sub_10000AC5C(&qword_10001DA50, (void (*)(uint64_t))sub_100008EDC);
      Set.Iterator.init(_cocoa:)();
      a1 = v145[0];
      uint64_t v108 = v145[1];
      uint64_t v31 = v145[2];
      uint64_t v30 = v145[3];
      unint64_t v32 = v145[4];
    }
    else
    {
      uint64_t v36 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v37 = *(void *)(a1 + 56);
      uint64_t v108 = a1 + 56;
      uint64_t v31 = ~v36;
      uint64_t v38 = -v36;
      if (v38 < 64) {
        uint64_t v39 = ~(-1 << v38);
      }
      else {
        uint64_t v39 = -1;
      }
      unint64_t v32 = v39 & v37;
      id v40 = v104;
      swift_bridgeObjectRetain();
      uint64_t v30 = 0;
    }
    uint64_t v41 = v131;
    uint64_t v106 = a1 & 0x7FFFFFFFFFFFFFFFLL;
    int64_t v107 = (unint64_t)(v31 + 64) >> 6;
    v125 = (void (**)(char *, char *, uint64_t))(v23 + 16);
    v138 = (void (**)(char *, uint64_t))(v23 + 8);
    v132 = (void (**)(char *, uint64_t))(v15 + 8);
    v124 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v103 + 48);
    uint64_t v119 = (void (**)(char *, uint64_t, uint64_t))(v103 + 32);
    unsigned int v115 = enum case for PeopleURL.Scheme.message(_:);
    uint64_t v114 = (void (**)(char *, void, uint64_t))(v137 + 104);
    uint64_t v113 = (void (**)(char *, uint64_t))(v137 + 8);
    uint64_t v109 = (void (**)(char *, uint64_t))(v103 + 8);
    v100[2] = v103 + 16;
    *(void *)&long long v29 = 136315650;
    long long v112 = v29;
    unint64_t v111 = 0x8000000100016320;
    v110 = (char *)&type metadata for Any + 8;
    v100[1] = (char *)&type metadata for () + 8;
    uint64_t v105 = (char *)&type metadata for Swift.AnyObject + 8;
    uint64_t v128 = a1;
    uint64_t v130 = v11;
    v123 = v22;
    v122 = v27;
    uint64_t v121 = v31;
    while (1)
    {
      if (a1 < 0)
      {
        uint64_t v44 = __CocoaSet.Iterator.next()();
        if (!v44) {
          goto LABEL_54;
        }
        uint64_t v139 = v44;
        sub_100008EDC();
        swift_unknownObjectRetain();
        uint64_t v41 = v131;
        swift_dynamicCast();
        id v45 = v144;
        swift_unknownObjectRelease();
        uint64_t v43 = v30;
        uint64_t v137 = v32;
        if (!v45) {
          goto LABEL_54;
        }
      }
      else
      {
        if (v32)
        {
          uint64_t v137 = (v32 - 1) & v32;
          unint64_t v42 = __clz(__rbit64(v32)) | (v30 << 6);
          uint64_t v43 = v30;
        }
        else
        {
          int64_t v46 = v30 + 1;
          if (__OFADD__(v30, 1))
          {
            __break(1u);
            return;
          }
          if (v46 >= v107) {
            goto LABEL_54;
          }
          unint64_t v47 = *(void *)(v108 + 8 * v46);
          uint64_t v43 = v30 + 1;
          if (!v47)
          {
            uint64_t v43 = v30 + 2;
            if (v30 + 2 >= v107) {
              goto LABEL_54;
            }
            unint64_t v47 = *(void *)(v108 + 8 * v43);
            if (!v47)
            {
              uint64_t v43 = v30 + 3;
              if (v30 + 3 >= v107) {
                goto LABEL_54;
              }
              unint64_t v47 = *(void *)(v108 + 8 * v43);
              if (!v47)
              {
                uint64_t v43 = v30 + 4;
                if (v30 + 4 >= v107) {
                  goto LABEL_54;
                }
                unint64_t v47 = *(void *)(v108 + 8 * v43);
                if (!v47)
                {
                  uint64_t v48 = v30 + 5;
                  while (v107 != v48)
                  {
                    unint64_t v47 = *(void *)(v108 + 8 * v48++);
                    if (v47)
                    {
                      uint64_t v43 = v48 - 1;
                      a1 = v128;
                      goto LABEL_33;
                    }
                  }
LABEL_54:
                  sub_10000A8A0();

                  return;
                }
              }
            }
          }
LABEL_33:
          uint64_t v137 = (v47 - 1) & v47;
          unint64_t v42 = __clz(__rbit64(v47)) + (v43 << 6);
        }
        id v45 = *(id *)(*(void *)(a1 + 48) + 8 * v42);
        if (!v45) {
          goto LABEL_54;
        }
      }
      uint64_t v49 = v27;
      uint64_t v50 = v11;
      uint64_t v135 = v43;
      id v51 = [v45 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      static PeopleLogger.messages.getter();
      uint64_t v52 = v127;
      uint64_t v53 = v49;
      (*v125)(v127, v49, v41);
      id v54 = v45;
      uint64_t v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.default.getter();
      BOOL v57 = os_log_type_enabled(v55, v56);
      id v134 = v54;
      if (v57)
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v59 = v41;
        v60 = (void *)swift_slowAlloc();
        v144 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = v112;
        *(void *)(v58 + 4) = sub_1000091CC(0xD000000000000019, v111, (uint64_t *)&v144);
        *(_WORD *)(v58 + 12) = 2112;
        *(void *)(v58 + 14) = v54;
        void *v60 = v45;
        *(_WORD *)(v58 + 22) = 2080;
        sub_10000AC5C(&qword_10001DA88, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v61 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v58 + 24) = sub_1000091CC(v61, v62, (uint64_t *)&v144);
        swift_bridgeObjectRelease();
        v136 = *v138;
        uint64_t v63 = v52;
        uint64_t v64 = v122;
        v136(v63, v59);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s url centext: %@ url: %s", (uint8_t *)v58, 0x20u);
        sub_1000083D8(&qword_10001DA90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        uint64_t v11 = v130;
        swift_slowDealloc();
        uint64_t v22 = v123;
        swift_slowDealloc();

        uint64_t v65 = *v132;
        (*v132)(v22, v133);
        uint64_t v66 = (uint64_t)v126;
      }
      else
      {

        v136 = *v138;
        v136(v52, v41);

        uint64_t v65 = *v132;
        (*v132)(v22, v133);
        uint64_t v66 = (uint64_t)v126;
        uint64_t v11 = v50;
        uint64_t v64 = v53;
      }
      URLComponents.init(url:resolvingAgainstBaseURL:)();
      int v67 = (*v124)(v66, 1, v11);
      uint64_t v68 = v129;
      if (v67 == 1)
      {
        uint64_t v27 = v64;
        sub_100008558(v66, &qword_10001DA60);
        v69 = v120;
LABEL_46:
        static PeopleLogger.messages.getter();
        uint64_t v91 = Logger.logObject.getter();
        os_log_type_t v92 = static os_log_type_t.default.getter();
        BOOL v93 = os_log_type_enabled(v91, v92);
        unint64_t v32 = v137;
        id v94 = v134;
        if (v93)
        {
          uint64_t v95 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v95 = 0;
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "Url does not represent people/can't be parsed", v95, 2u);
          uint64_t v11 = v130;
          swift_slowDealloc();
        }

        v65(v69, v133);
        uint64_t v41 = v131;
        uint64_t v30 = v135;
        goto LABEL_13;
      }
      v70 = *v119;
      uint64_t v71 = v116;
      (*v119)(v116, v66, v11);
      URLComponents.scheme.getter();
      uint64_t v72 = v11;
      uint64_t v73 = v117;
      uint64_t v74 = v118;
      (*v114)(v117, v115, v118);
      char v75 = static PeopleURL.Scheme.== infix(_:_:)();
      swift_bridgeObjectRelease();
      (*v113)(v73, v74);
      if ((v75 & 1) == 0)
      {
        (*v109)(v71, v72);
        uint64_t v11 = v72;
        v69 = v120;
        uint64_t v22 = v123;
        uint64_t v27 = v122;
        goto LABEL_46;
      }
      if ((sub_100003C40() & 1) == 0)
      {

        uint64_t v11 = v130;
        (*v109)(v71, v130);
        uint64_t v22 = v123;
        uint64_t v41 = v131;
        uint64_t v27 = v122;
        uint64_t v30 = v135;
        unint64_t v32 = v137;
        goto LABEL_13;
      }
      uint64_t v76 = type metadata accessor for TaskPriority();
      uint64_t v77 = *(void *)(v76 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56))(v68, 1, 1, v76);
      uint64_t v78 = v103;
      v79 = v101;
      v80 = v71;
      char v81 = v71;
      uint64_t v82 = v130;
      (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v101, v81, v130);
      type metadata accessor for MainActor();
      id v83 = v104;
      uint64_t v84 = static MainActor.shared.getter();
      unint64_t v85 = (*(unsigned __int8 *)(v78 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
      uint64_t v86 = (char *)swift_allocObject();
      *((void *)v86 + 2) = v84;
      *((void *)v86 + 3) = &protocol witness table for MainActor;
      *((void *)v86 + 4) = v83;
      uint64_t v87 = (uint64_t)v129;
      v70(&v86[v85], (uint64_t)v79, v82);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v87, 1, v76) == 1)
      {
        sub_100008558(v87, &qword_10001DA58);
        if (!*((void *)v86 + 2)) {
          goto LABEL_50;
        }
      }
      else
      {
        TaskPriority.rawValue.getter();
        (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v87, v76);
        if (!*((void *)v86 + 2))
        {
LABEL_50:
          uint64_t v88 = 0;
          uint64_t v90 = 0;
          goto LABEL_51;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v88 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v90 = v89;
      swift_unknownObjectRelease();
LABEL_51:
      uint64_t v96 = v130;
      uint64_t v97 = swift_allocObject();
      *(void *)(v97 + 16) = &unk_10001DA70;
      *(void *)(v97 + 24) = v86;
      uint64_t v98 = v96;
      if (v90 | v88)
      {
        uint64_t v140 = 0;
        uint64_t v141 = 0;
        uint64_t v142 = v88;
        uint64_t v143 = v90;
      }
      uint64_t v41 = v131;
      unint64_t v32 = v137;
      id v99 = v134;
      swift_task_create();

      swift_release();
      uint64_t v11 = v98;
      (*v109)(v80, v98);
      uint64_t v22 = v123;
      uint64_t v30 = v135;
      uint64_t v27 = v122;
LABEL_13:
      v136(v27, v41);
      a1 = v128;
    }
  }
  static PeopleLogger.messages.getter();
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    v145[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    v144 = (void *)sub_1000091CC(0xD000000000000019, 0x8000000100016320, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s impossible error, no peopleView", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v133);
}

uint64_t sub_10000A8A0()
{
  return swift_release();
}

uint64_t sub_10000A8A8()
{
  uint64_t v1 = type metadata accessor for URLComponents();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000A97C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URLComponents() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10000AA78;
  return sub_1000088E0(a1, v5, v6, v7, v8);
}

uint64_t sub_10000AA78()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000AB6C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000ABA4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AA78;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001DA78 + dword_10001DA78);
  return v6(a1, v4);
}

uint64_t sub_10000AC5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000ACA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AD04(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v51 = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v49 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v48 - v9;
  static PeopleLogger.messages.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v50 = v3;
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    uint64_t v16 = (uint8_t *)v13;
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v52 = sub_1000091CC(0xD00000000000001FLL, 0x80000001000165A0, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v15;
    uint64_t v5 = v14;
    uint64_t v3 = v50;
    swift_slowDealloc();
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v10, v5);
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v48 = (uint64_t (*)(char *, uint64_t))v17;
    uint64_t v20 = self;
    uint64_t v21 = a1;
    id v22 = [v20 mainScreen];
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    id v31 = [objc_allocWithZone((Class)UIWindow) initWithFrame:v24, v26, v28, v30];
    unint64_t v32 = *(void **)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window];
    *(void *)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window] = v31;
    id v33 = v31;

    [v33 setOpaque:0];
    os_log_type_t v34 = self;
    id v35 = v33;
    id v36 = [v34 clearColor];
    [v35 setBackgroundColor:v36];

    [v35 setWindowScene:v19];
    [v35 setRootViewController:*(void *)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController]];
    [v35 makeKeyAndVisible];
    id v37 = [objc_allocWithZone((Class)type metadata accessor for MessageComposer()) init];
    uint64_t v38 = *(void **)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer];
    *(void *)&v3[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer] = v37;

    id v39 = [v51 URLContexts];
    sub_100008EDC();
    sub_10000AC5C(&qword_10001DA50, (void (*)(uint64_t))sub_100008EDC);
    uint64_t v40 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v50 = v21;
    if ((v40 & 0xC000000000000001) != 0) {
      uint64_t v41 = __CocoaSet.count.getter();
    }
    else {
      uint64_t v41 = *(void *)(v40 + 16);
    }
    swift_bridgeObjectRelease();
    if (v41)
    {
      id v42 = [v51 URLContexts];
      uint64_t v43 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100009824(v43);
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v44 = v49;
      static PeopleLogger.messages.getter();
      id v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v45, v46))
      {
        unint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        *(_DWORD *)unint64_t v47 = 136315138;
        uint64_t v52 = sub_1000091CC(0xD00000000000001FLL, 0x80000001000165A0, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s missing URL data", v47, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return v48(v44, v5);
    }
  }
  return result;
}

uint64_t sub_10000B308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008558(a1, &qword_10001DA58);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_1000083D8(&qword_10001DBE0);
  return swift_task_create();
}

uint64_t sub_10000B4BC()
{
  uint64_t v0 = type metadata accessor for RequestMessageDetailsBuilder();
  swift_allocObject();
  uint64_t v7 = v0;
  uint64_t v8 = &protocol witness table for RequestMessageDetailsBuilder;
  *(void *)&long long v6 = RequestMessageDetailsBuilder.init()();
  uint64_t v4 = type metadata accessor for ContactFetcher();
  uint64_t v5 = &protocol witness table for ContactFetcher;
  *(void *)&long long v3 = ContactFetcher.__allocating_init()();
  type metadata accessor for MessagePackage();
  uint64_t v1 = swift_allocObject();
  sub_100013384(&v6, v1 + 16);
  uint64_t result = sub_100013384(&v3, v1 + 56);
  qword_10001DFB0 = v1;
  return result;
}

unint64_t sub_10000B564()
{
  sub_1000083D8(&qword_10001DBF8);
  uint64_t v0 = (int *)(sub_1000083D8(&qword_10001DC00) - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016B40;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = (void *)(v4 + v0[14]);
  uint64_t v6 = enum case for MessageDetails.EventSource.screenTime(_:);
  uint64_t v7 = type metadata accessor for MessageDetails.EventSource();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v4, v6, v7);
  *uint64_t v5 = 0xD000000000000029;
  v5[1] = 0x80000001000167A0;
  v5[2] = 0xD000000000000011;
  v5[3] = 0x80000001000167D0;
  v5[4] = 0xD000000000000022;
  v5[5] = 0x80000001000167F0;
  v5[6] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5[7] = v9;
  uint64_t v10 = (void *)(v4 + v1 + v0[14]);
  v8();
  void *v10 = 0xD000000000000027;
  v10[1] = 0x8000000100016820;
  v10[2] = 0x7975426F546B7341;
  v10[3] = 0xE800000000000000;
  v10[4] = 0xD000000000000022;
  v10[5] = 0x8000000100016850;
  v10[6] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10[7] = v11;
  unint64_t result = sub_10000B778(v3);
  qword_10001DFB8 = result;
  return result;
}

unint64_t sub_10000B778(uint64_t a1)
{
  uint64_t v2 = sub_1000083D8(&qword_10001DC00);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000083D8(&qword_10001DC08);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v7 = (void *)v6;
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
  v27[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1000084F4(v12, (uint64_t)v5, &qword_10001DC00);
    unint64_t result = sub_1000039E8((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for MessageDetails.EventSource();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t v19 = v7[7] + (v16 << 6);
    long long v20 = *((_OWORD *)v9 + 1);
    long long v21 = *((_OWORD *)v9 + 2);
    uint64_t v22 = *((void *)v9 + 6);
    uint64_t v23 = *((void *)v9 + 7);
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v9;
    *(_OWORD *)(v19 + 16) = v20;
    *(_OWORD *)(v19 + 32) = v21;
    *(void *)(v19 + 48) = v22;
    *(void *)(v19 + 56) = v23;
    uint64_t v24 = v7[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_11;
    }
    v7[2] = v26;
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

uint64_t sub_10000B988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a1;
  v4[4] = a4;
  uint64_t v5 = type metadata accessor for URL();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Logger();
  v4[8] = v6;
  v4[9] = *(void *)(v6 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10000BAA4, 0, 0);
}

uint64_t sub_10000BAA4()
{
  BOOL v25 = v0;
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  static PeopleLogger.messages.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[7];
    uint64_t v22 = v0[8];
    uint64_t v23 = v0[10];
    uint64_t v8 = v0[6];
    uint64_t v20 = v0[5];
    uint64_t v21 = v0[9];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v10 = URL.absoluteString.getter();
    v0[2] = sub_1000091CC(v10, v11, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v20);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Fetching %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  }
  else
  {
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v14 = v0[8];
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  uint64_t v15 = Data.init(contentsOf:options:)();
  unint64_t v16 = (uint64_t *)v0[3];
  *unint64_t v16 = v15;
  v16[1] = v17;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_10000BD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v7 = sub_1000083D8(&qword_10001DB80);
  v5[14] = v7;
  v5[15] = *(void *)(v7 - 8);
  v5[16] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MessageDetails.EventSource();
  v5[17] = v8;
  v5[18] = *(void *)(v8 - 8);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  return _swift_task_switch(sub_10000BE98, 0, 0);
}

uint64_t sub_10000BE98()
{
  (*(void (**)(void, void, void))(v0[18] + 104))(v0[20], enum case for MessageDetails.EventSource.unknown(_:), v0[17]);
  sub_100013094(&qword_10001DB88, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v0[2] == v0[4] && v0[3] == v0[5]) {
    char v1 = 1;
  }
  else {
    char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[18];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  if (v1)
  {
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    uint64_t v7 = v0[12];
    uint64_t v6 = v0[13];
    uint64_t v8 = v0[11];
    static PeopleLogger.messages.getter();
    swift_errorRetain();
    Logger.ifError(_:message:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    uint64_t v12 = v0[18];
    uint64_t v11 = v0[19];
    uint64_t v13 = v0[17];
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 16))(v11, v0[9], v13);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 88))(v11, v13) == enum case for MessageDetails.EventSource.screenTime(_:))
    {
      static PeopleConstants.screenTimeRequestEventTTL.getter();
    }
    else
    {
      uint64_t v14 = v0[19];
      uint64_t v15 = v0[17];
      static PeopleConstants.askToBuyEventTTL.getter();
      v5(v14, v15);
    }
    uint64_t v16 = v0[10];
    sub_10000C6EC((void *)(v16 + 16), *(void *)(v16 + 40));
    uint64_t v17 = (void *)swift_task_alloc();
    v0[21] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_10000C208;
    uint64_t v18 = v0[16];
    uint64_t v20 = v0[8];
    uint64_t v19 = v0[9];
    uint64_t v21 = v0[6];
    uint64_t v22 = v0[7];
    return dispatch thunk of RequestMessageDetailsBuilderProtocol.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:)(v21, v19, v22, v20, 0, 1, v18, v16 + 56);
  }
}

uint64_t sub_10000C208()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000C3C0;
  }
  else {
    uint64_t v2 = sub_10000C31C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000C31C()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000C3C0()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  static PeopleLogger.messages.getter();
  swift_errorRetain();
  Logger.ifError(_:message:)();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10000C4D8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_10000C730(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C688()
{
  sub_10000844C(v0 + 16);
  sub_10000844C(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for MessagePackage()
{
  return self;
}

void *sub_10000C6EC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000C730(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000083D8(&qword_10001DBF0);
  uint64_t v10 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for URLQueryItem() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000D240(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_10000C998(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000C9B8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000C9B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000083D8(&qword_10001DB98);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000CB24(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[9] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[10] = v4;
  v1[11] = *(void *)(v4 + 64);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_1000083D8(&qword_10001DA58);
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000CC88, 0, 0);
}

uint64_t sub_10000CC88()
{
  unint64_t v32 = v0;
  if (static AMSBagHelper.isTrustedDomain(for:)())
  {
    uint64_t v2 = v0[13];
    uint64_t v1 = v0[14];
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[5];
    static TaskPriority.userInitiated.getter();
    uint64_t v6 = type metadata accessor for TaskPriority();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v2, v4);
    uint64_t v9 = sub_10000B308(v1, (uint64_t)&unk_10001DBD8, v8);
    v0[15] = v9;
    uint64_t v10 = (void *)swift_task_alloc();
    v0[16] = v10;
    uint64_t v11 = sub_1000083D8(&qword_10001DBE0);
    void *v10 = v0;
    v10[1] = sub_10000D0A0;
    return Task<>.value.getter(v0 + 2, v9, v11);
  }
  else
  {
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[9];
    uint64_t v14 = v0[10];
    uint64_t v15 = v0[5];
    static PeopleLogger.messages.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v15, v13);
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = v0[12];
    uint64_t v21 = v0[9];
    uint64_t v20 = v0[10];
    uint64_t v23 = v0[7];
    uint64_t v22 = v0[8];
    uint64_t v24 = v0[6];
    if (v18)
    {
      uint64_t v30 = v0[6];
      BOOL v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)BOOL v25 = 136315138;
      sub_100013094(&qword_10001DA88, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
      v0[4] = sub_1000091CC(v26, v27, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s not in trusted list", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v30);
    }
    else
    {
      (*(void (**)(void, void))(v20 + 8))(v0[12], v0[9]);

      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    double v28 = (uint64_t (*)(void, unint64_t))v0[1];
    return v28(0, 0xF000000000000000);
  }
}

uint64_t sub_10000D0A0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000D19C, 0, 0);
}

uint64_t sub_10000D19C()
{
  swift_release();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_10000D240(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for URLQueryItem() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000D398(uint64_t a1, char a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 880) = a2;
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = a3;
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v3 + 328) = v4;
  *(void *)(v3 + 336) = *(void *)(v4 - 8);
  *(void *)(v3 + 344) = swift_task_alloc();
  *(void *)(v3 + 352) = swift_task_alloc();
  *(void *)(v3 + 360) = swift_task_alloc();
  *(void *)(v3 + 368) = swift_task_alloc();
  *(void *)(v3 + 376) = swift_task_alloc();
  *(void *)(v3 + 384) = swift_task_alloc();
  *(void *)(v3 + 392) = swift_task_alloc();
  *(void *)(v3 + 400) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for URLQueryItem();
  *(void *)(v3 + 408) = v5;
  *(void *)(v3 + 416) = *(void *)(v5 - 8);
  *(void *)(v3 + 424) = swift_task_alloc();
  *(void *)(v3 + 432) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for ATURL.Parser();
  *(void *)(v3 + 440) = v6;
  *(void *)(v3 + 448) = *(void *)(v6 - 8);
  *(void *)(v3 + 456) = swift_task_alloc();
  sub_1000083D8(&qword_10001DA60);
  *(void *)(v3 + 464) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URLComponents();
  *(void *)(v3 + 472) = v7;
  *(void *)(v3 + 480) = *(void *)(v7 - 8);
  *(void *)(v3 + 488) = swift_task_alloc();
  *(void *)(v3 + 496) = swift_task_alloc();
  uint64_t PartyApps = type metadata accessor for FirstPartyApps();
  *(void *)(v3 + 504) = PartyApps;
  *(void *)(v3 + 512) = *(void *)(PartyApps - 8);
  *(void *)(v3 + 520) = swift_task_alloc();
  *(void *)(v3 + 528) = sub_1000083D8(&qword_10001D8C0);
  *(void *)(v3 + 536) = swift_task_alloc();
  *(void *)(v3 + 544) = swift_task_alloc();
  *(void *)(v3 + 552) = swift_task_alloc();
  *(void *)(v3 + 560) = swift_task_alloc();
  *(void *)(v3 + 568) = swift_task_alloc();
  *(void *)(v3 + 576) = swift_task_alloc();
  *(void *)(v3 + 584) = swift_task_alloc();
  *(void *)(v3 + 592) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  *(void *)(v3 + 600) = v9;
  *(void *)(v3 + 608) = *(void *)(v9 - 8);
  *(void *)(v3 + 616) = swift_task_alloc();
  *(void *)(v3 + 624) = swift_task_alloc();
  *(void *)(v3 + 632) = swift_task_alloc();
  *(void *)(v3 + 640) = swift_task_alloc();
  *(void *)(v3 + 648) = swift_task_alloc();
  sub_1000083D8(&qword_10001D8D8);
  *(void *)(v3 + 656) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for MessageDetails.EventSource();
  *(void *)(v3 + 664) = v10;
  *(void *)(v3 + 672) = *(void *)(v10 - 8);
  *(void *)(v3 + 680) = swift_task_alloc();
  *(void *)(v3 + 688) = swift_task_alloc();
  *(void *)(v3 + 696) = swift_task_alloc();
  *(void *)(v3 + 704) = swift_task_alloc();
  *(void *)(v3 + 712) = swift_task_alloc();
  uint64_t v11 = type metadata accessor for MessageDetails();
  *(void *)(v3 + 720) = v11;
  *(void *)(v3 + 728) = *(void *)(v11 - 8);
  *(void *)(v3 + 736) = swift_task_alloc();
  return _swift_task_switch(sub_10000D8D8, 0, 0);
}

uint64_t sub_10000D8D8()
{
  uint64_t v1 = v0[84];
  uint64_t v2 = v0[83];
  uint64_t v3 = v0[82];
  (*(void (**)(void, void, void))(v0[91] + 16))(v0[92], v0[39], v0[90]);
  MessageDetails.eventSource.getter();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  uint64_t v5 = v0[89];
  uint64_t v6 = v0[84];
  uint64_t v7 = v0[83];
  uint64_t v8 = v0[82];
  if (v4 == 1)
  {
    uint64_t v9 = enum case for MessageDetails.EventSource.unknown(_:);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
    v10(v5, enum case for MessageDetails.EventSource.unknown(_:), v7);
    sub_100008558(v8, &qword_10001D8D8);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 32))(v5, v0[82], v7);
    uint64_t v9 = enum case for MessageDetails.EventSource.unknown(_:);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  }
  v0[93] = v10;
  uint64_t v11 = v0[88];
  uint64_t v12 = v0[83];
  v0[94] = (v6 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v10(v11, v9, v12);
  v0[95] = sub_100013094(&qword_10001DB88, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v0[17] == v0[19] && v0[18] == v0[20]) {
    char v13 = 1;
  }
  else {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  uint64_t v14 = v0[88];
  uint64_t v15 = v0[84];
  uint64_t v16 = v0[83];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v17 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v0[96] = v17;
  v0[97] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v14, v16);
  if (v13)
  {
    uint64_t v18 = v0[92];
    uint64_t v19 = v0[91];
    uint64_t v20 = v0[90];
    uint64_t v21 = v0[89];
    uint64_t v22 = v0[83];
LABEL_23:
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    v17(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
  if (qword_10001D768 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_10001DFB8;
  if (!*(void *)(qword_10001DFB8 + 16) || (unint64_t v24 = sub_1000039E8(v0[89]), (v25 & 1) == 0))
  {
    uint64_t v18 = v0[92];
    uint64_t v19 = v0[91];
    uint64_t v20 = v0[90];
    uint64_t v21 = v0[89];
    uint64_t v22 = v0[83];
    goto LABEL_23;
  }
  uint64_t v26 = (void *)(*(void *)(v23 + 56) + (v24 << 6));
  v0[98] = v26[1];
  v0[99] = v26[2];
  v0[100] = v26[3];
  v0[101] = v26[4];
  v0[102] = v26[5];
  v0[103] = v26[6];
  v0[104] = v26[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MessageDetails.thumbnailPath.getter();
  if (!v27) {
    goto LABEL_17;
  }
  uint64_t v28 = v0[76];
  uint64_t v29 = v0[75];
  uint64_t v30 = v0[74];
  URL.init(string:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v30, 1, v29) == 1)
  {
    sub_100008558(v0[74], &qword_10001D8C0);
LABEL_17:
    uint64_t v31 = v0[65];
    uint64_t v32 = v0[63];
    uint64_t v33 = v0[64];
    uint64_t v34 = MessageDetails.bundleId.getter();
    unint64_t v36 = v35;
    v0[107] = v35;
    type metadata accessor for AppBundleResolver();
    if (!v36)
    {
      uint64_t v34 = 0;
      unint64_t v36 = 0xE000000000000000;
    }
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v31, enum case for FirstPartyApps.none(_:), v32);
    id v37 = (void *)swift_task_alloc();
    v0[108] = v37;
    *id v37 = v0;
    v37[1] = sub_1000107BC;
    uint64_t v38 = v0[65];
    return static AppBundleResolver.resolveThumbnail(_:_:)(v34, v36, v38);
  }
  (*(void (**)(void, void, void))(v0[76] + 32))(v0[81], v0[74], v0[75]);
  uint64_t v40 = dword_10001DBC8;
  uint64_t v41 = (void *)swift_task_alloc();
  v0[105] = v41;
  *uint64_t v41 = v0;
  v41[1] = sub_10000E0A0;
  uint64_t v42 = v0[81];
  return ((uint64_t (*)(uint64_t))((char *)&dword_10001DBC8 + v40))(v42);
}

uint64_t sub_10000E0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = a2;
  v3[106] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000E1D4, 0, 0);
}

uint64_t sub_10000E1D4()
{
  v295 = v0;
  uint64_t v1 = v0;
  unint64_t v2 = v0[106];
  if (v2 >> 60 == 15)
  {
    (*(void (**)(void, void))(v0[76] + 8))(v0[81], v0[75]);
LABEL_6:
    uint64_t v15 = v1[65];
    uint64_t v17 = v1[63];
    uint64_t v16 = v1[64];
    uint64_t v18 = MessageDetails.bundleId.getter();
    unint64_t v20 = v19;
    v1[107] = v19;
    type metadata accessor for AppBundleResolver();
    if (!v20)
    {
      uint64_t v18 = 0;
      unint64_t v20 = 0xE000000000000000;
    }
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, enum case for FirstPartyApps.none(_:), v17);
    uint64_t v21 = (void *)swift_task_alloc();
    v1[108] = v21;
    void *v21 = v1;
    v21[1] = sub_1000107BC;
    uint64_t v22 = v1[65];
    return static AppBundleResolver.resolveThumbnail(_:_:)(v18, v20, v22);
  }
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[81];
  uint64_t v5 = v0[76];
  uint64_t v6 = v1[75];
  id v7 = objc_allocWithZone((Class)UIImage);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v9 = (UIImage *)[v7 initWithData:isa];
  sub_100012F18(v3, v2);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = v1[76];
  uint64_t v11 = v1[75];
  uint64_t v12 = v1[73];
  uint64_t v13 = v1[40];
  URLComponents.init()();
  v1[29] = &_swiftEmptyArrayStorage;
  sub_1000084F4(v13, v12, &qword_10001D8C0);
  uint64_t v14 = *(unsigned int (**)(void, void, void))(v10 + 48);
  v290 = v1;
  v281 = v9;
  if (v14(v12, 1, v11) == 1)
  {
    sub_100008558(v1[73], &qword_10001D8C0);
  }
  else
  {
    uint64_t v23 = v1[59];
    uint64_t v24 = v1[60];
    uint64_t v25 = v1[58];
    (*(void (**)(void, void, void))(v1[76] + 32))(v1[80], v1[73], v1[75]);
    URLComponents.init(url:resolvingAgainstBaseURL:)();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1)
    {
      uint64_t v26 = v1[58];
      (*(void (**)(void, void))(v1[76] + 8))(v1[80], v1[75]);
      sub_100008558(v26, &qword_10001DA60);
    }
    else
    {
      (*(void (**)(void, void, void))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      uint64_t v27 = URLComponents.queryItems.getter();
      if (v27)
      {
        uint64_t v28 = v27;
        v276 = v14;
        uint64_t v29 = v1[80];
        uint64_t v285 = *(void *)(v27 + 16);
        if (v285)
        {
          ATURL.Parser.init()();
          type metadata accessor for ATPayload();
          sub_100013094(&qword_10001DBB8, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_100013094(&qword_10001DBC0, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          ATURL.Parser.parse<A>(_:from:)();
          uint64_t v38 = (void *)v1[36];
          id v39 = (void *)ATPayload.question.getter();
          ATQuestion.notificationText.getter();
          uint64_t v41 = v40;

          if (!v41)
          {
            uint64_t v42 = (void *)ATPayload.question.getter();
            ATQuestion.summary.getter();
          }
          uint64_t v43 = v1[52];
          MessageDetails.notificationCaption.setter();

          unint64_t v44 = v28 + ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80));
          id v45 = (void (**)(uint64_t, uint64_t))(v43 + 8);
          uint64_t v282 = v28;
          swift_bridgeObjectRetain();
          uint64_t v46 = 0;
          while (1)
          {
            uint64_t v47 = v46 + 1;
            if (__OFADD__(v46, 1)) {
              __break(1u);
            }
            (*(void (**)(void, unint64_t, void))(v43 + 16))(v290[54], v44 + *(void *)(v43 + 72) * v46, v290[51]);
            uint64_t v48 = URLQueryItem.name.getter();
            uint64_t v50 = v290[54];
            uint64_t v51 = v290[51];
            if (v48 == 0x69616E626D756874 && v49 == 0xED0000617461446CLL) {
              break;
            }
            char v53 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            (*v45)(v50, v51);
            if ((v53 & 1) == 0)
            {
              ++v46;
              if (v47 != v285) {
                continue;
              }
            }
            goto LABEL_30;
          }
          swift_bridgeObjectRelease();
          (*v45)(v50, v51);
          char v53 = 1;
LABEL_30:
          uint64_t v1 = v290;
          uint64_t v286 = v290[80];
          uint64_t v54 = v290[76];
          uint64_t v272 = v290[75];
          uint64_t v56 = v290[60];
          uint64_t v55 = v290[61];
          uint64_t v57 = v290[59];
          uint64_t v59 = v290[56];
          uint64_t v58 = v290[57];
          uint64_t v60 = v290[55];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
          (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v286, v272);
          swift_bridgeObjectRelease();
          v290[29] = v282;
          uint64_t v14 = v276;
          uint64_t v9 = v281;
          if (v53)
          {
            static PeopleLogger.messages.getter();
            uint64_t v61 = Logger.logObject.getter();
            os_log_type_t v62 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v61, v62))
            {
              uint64_t v63 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v63 = 0;
              _os_log_impl((void *)&_mh_execute_header, v61, v62, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v63, 2u);
              swift_slowDealloc();
            }
            uint64_t v64 = v290[50];
            uint64_t v65 = v290[41];
            uint64_t v66 = v290[42];

            (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v65);
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v33 = v1[76];
          uint64_t v34 = v1[75];
          uint64_t v36 = v1[60];
          uint64_t v35 = v1[61];
          uint64_t v37 = v1[59];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
          (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v29, v34);
          uint64_t v14 = v276;
        }
      }
      else
      {
        uint64_t v30 = v1[80];
        uint64_t v31 = v1[76];
        uint64_t v32 = v1[75];
        (*(void (**)(void, void))(v1[60] + 8))(v1[61], v1[59]);
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
      }
    }
  }
  uint64_t v67 = MessageDetails.thumbnailData.getter();
  unint64_t v69 = v68;
  sub_100012F18(v67, v68);
  if (v69 >> 60 != 15) {
    goto LABEL_38;
  }
  v70 = UIImagePNGRepresentation(v9);
  if (v70)
  {
    uint64_t v71 = v70;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_37:
  MessageDetails.thumbnailData.setter();
LABEL_38:
  MessageDetails.queryItems.getter();
  static PeopleLogger.messages.getter();
  uint64_t v72 = v1[29];
  swift_bridgeObjectRetain_n();
  uint64_t v73 = Logger.logObject.getter();
  os_log_type_t v74 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v73, v74))
  {
    os_log_type_t v260 = v74;
    v264 = v73;
    v277 = v14;
    uint64_t v75 = swift_slowAlloc();
    uint64_t v293 = swift_slowAlloc();
    *(_DWORD *)uint64_t v75 = 134218242;
    v1[34] = *(void *)(v72 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v262 = (uint8_t *)v75;
    *(_WORD *)(v75 + 12) = 2080;
    int64_t v76 = *(void *)(v72 + 16);
    if (v76)
    {
      uint64_t v77 = v1[52];
      v294[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_10000C998(0, v76, 0);
      uint64_t v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 16);
      v77 += 16;
      v287 = v78;
      uint64_t v79 = v72 + ((*(unsigned __int8 *)(v77 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 64));
      uint64_t v283 = *(void *)(v77 + 56);
      v80 = (void (**)(uint64_t, uint64_t))(v77 - 8);
      do
      {
        uint64_t v81 = v1[53];
        uint64_t v82 = v1[51];
        v287(v81, v79, v82);
        uint64_t v83 = URLQueryItem.name.getter();
        uint64_t v85 = v84;
        (*v80)(v81, v82);
        uint64_t v86 = v294[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000C998(0, *(void *)(v294[0] + 16) + 1, 1);
          uint64_t v86 = v294[0];
        }
        unint64_t v88 = *(void *)(v86 + 16);
        unint64_t v87 = *(void *)(v86 + 24);
        if (v88 >= v87 >> 1)
        {
          sub_10000C998(v87 > 1, v88 + 1, 1);
          uint64_t v86 = v294[0];
        }
        *(void *)(v86 + 16) = v88 + 1;
        uint64_t v89 = v86 + 16 * v88;
        *(void *)(v89 + 32) = v83;
        *(void *)(v89 + 40) = v85;
        v79 += v283;
        --v76;
        uint64_t v1 = v290;
      }
      while (v76);
      swift_bridgeObjectRelease();
    }
    uint64_t v95 = v1[49];
    uint64_t v96 = v1[41];
    uint64_t v97 = v1[42];
    uint64_t v98 = Array.description.getter();
    unint64_t v100 = v99;
    swift_bridgeObjectRelease();
    v1[35] = sub_1000091CC(v98, v100, &v293);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v264, v260, "Appending %ld additional components to conversation url: %s", v262, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v94 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    v94(v95, v96);
    uint64_t v14 = v277;
    uint64_t v9 = v281;
  }
  else
  {
    uint64_t v90 = v73;
    uint64_t v91 = v1[49];
    uint64_t v92 = v1[41];
    uint64_t v93 = v1[42];
    swift_bridgeObjectRelease_n();

    id v94 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
    v94(v91, v92);
  }
  uint64_t v101 = v1[75];
  uint64_t v102 = v1[72];
  swift_beginAccess();
  sub_10000C4D8(v1[29]);
  URLComponents.queryItems.setter();
  URLComponents.url.getter();
  if (v14(v102, 1, v101) == 1)
  {
    uint64_t v291 = v1[92];
    uint64_t v103 = v1[91];
    uint64_t v288 = v1[90];
    uint64_t v104 = v1[89];
    uint64_t v273 = v1[83];
    v278 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v105 = v1[72];
    uint64_t v106 = v1[62];
    uint64_t v108 = v1[59];
    uint64_t v107 = v1[60];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008558(v105, &qword_10001D8C0);
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v106, v108);
    v278(v104, v273);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v291, v288);
LABEL_106:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v248 = (uint64_t (*)(void))v1[1];
    return v248();
  }
  v274 = v1 + 31;
  int v109 = *((unsigned __int8 *)v1 + 880);
  (*(void (**)(void, void, void))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v289 = v94;
  if (v109 != 1)
  {
    id v123 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
    [v123 setImage:v9];
    MessageDetails.notificationCaption.getter();
    NSString v124 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v123 setCaption:v124];

    id v125 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v123];
    goto LABEL_88;
  }
  uint64_t v110 = v1[89];
  uint64_t v111 = v1[87];
  uint64_t v112 = v1[84];
  uint64_t v113 = v1[83];
  static PeopleLogger.messages.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 16))(v111, v110, v113);
  uint64_t v114 = Logger.logObject.getter();
  os_log_type_t v115 = static os_log_type_t.debug.getter();
  BOOL v116 = os_log_type_enabled(v114, v115);
  uint64_t v117 = v1[87];
  uint64_t v118 = v1[83];
  uint64_t v119 = v1[48];
  uint64_t v265 = v1[41];
  v279 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  if (v116)
  {
    v258 = (void (*)(uint64_t, uint64_t))v1[96];
    v120 = (uint8_t *)swift_slowAlloc();
    v294[0] = swift_slowAlloc();
    *(_DWORD *)v120 = 136315138;
    uint64_t v121 = MessageDetails.EventSource.rawValue.getter();
    v1[33] = sub_1000091CC(v121, v122, v294);
    uint64_t v1 = v290;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v258(v117, v118);
    _os_log_impl((void *)&_mh_execute_header, v114, v115, "Using LP fallback for %s", v120, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v1[96])(v117, v118);
  }

  v94(v119, v265);
  uint64_t v126 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(void, void, void))v1[93])(v1[86], enum case for MessageDetails.EventSource.screenTime(_:), v1[83]);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  v127 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v128 = v1[86];
  uint64_t v129 = v1[83];
  uint64_t v9 = v281;
  if (v1[21] == v1[23] && v1[22] == v1[24])
  {
    swift_bridgeObjectRelease_n();
    v127(v128, v129);
LABEL_60:
    String.localized.getter();
    sub_1000083D8(&qword_10001DBA8);
    uint64_t v131 = swift_allocObject();
    *(_OWORD *)(v131 + 16) = xmmword_100016B40;
    uint64_t v132 = MessageDetails.childName.getter();
    uint64_t v134 = v133;
    *(void *)(v131 + 56) = &type metadata for String;
    unint64_t v135 = sub_100013040();
    *(void *)(v131 + 64) = v135;
    *(void *)(v131 + 32) = v132;
    *(void *)(v131 + 40) = v134;
    uint64_t v136 = MessageDetails.title.getter();
    *(void *)(v131 + 96) = &type metadata for String;
    *(void *)(v131 + 104) = v135;
    uint64_t v1 = v290;
    *(void *)(v131 + 72) = v136;
    *(void *)(v131 + 80) = v137;
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_67;
  }
  char v130 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v127(v128, v129);
  if (v130) {
    goto LABEL_60;
  }
  MessageDetails.title.getter();
  Swift::String v138 = String.trim()();
  swift_bridgeObjectRelease();
  if (v138._countAndFlagsBits == static MessageDetails.titleFallbackKey.getter() && v138._object == v139)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v140 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v140 & 1) == 0)
    {
      MessageDetails.title.getter();
      goto LABEL_67;
    }
  }
  MessageDetails.notificationCaption.getter();
LABEL_67:
  uint64_t v141 = (void (*)(uint64_t, uint64_t, uint64_t))v1[93];
  uint64_t v142 = v1[85];
  uint64_t v143 = v1[83];
  (*(void (**)(void, uint64_t, uint64_t, void))(v1[76] + 56))(v1[71], 1, 1, v1[75]);
  v141(v142, v126, v143);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  v144 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v145 = v1[85];
  uint64_t v146 = v1[83];
  if (v1[25] == v1[27] && v1[26] == v1[28])
  {
    swift_bridgeObjectRelease_n();
    v144(v145, v146);
  }
  else
  {
    char v147 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v144(v145, v146);
    if ((v147 & 1) == 0)
    {
      type metadata accessor for ServerFeatureFlag();
      static ServerFeatureFlag.shared.getter();
      ServerFeatureFlag.lpForAskToBuyFallback.getter();
      goto LABEL_73;
    }
  }
  type metadata accessor for ServerFeatureFlag();
  static ServerFeatureFlag.shared.getter();
  ServerFeatureFlag.lpForScreenTimeFallback.getter();
LABEL_73:
  swift_release();
  object = String.trimToNil()().value._object;
  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v149 = v1[71];
    uint64_t v150 = v1[70];
    URL.init(string:)();
    swift_bridgeObjectRelease();
    sub_100012F84(v150, v149);
  }
  uint64_t v151 = v1[75];
  uint64_t v152 = v1[69];
  sub_1000084F4(v1[71], v152, &qword_10001D8C0);
  LODWORD(v151) = v279(v152, 1, v151);
  sub_100008558(v152, &qword_10001D8C0);
  if (v151 == 1)
  {
    uint64_t v153 = v1[71];
    uint64_t v154 = v1[70];
    URL.init(string:)();
    sub_100012F84(v154, v153);
  }
  static PeopleLogger.messages.getter();
  v155 = Logger.logObject.getter();
  os_log_type_t v156 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v155, v156))
  {
    uint64_t v157 = v1[75];
    v158 = v1;
    uint64_t v159 = v1[71];
    v160 = (uint8_t *)swift_slowAlloc();
    v161 = (void *)swift_slowAlloc();
    *(_DWORD *)v160 = 138412290;
    swift_beginAccess();
    if (v279(v159, 1, v157))
    {
      void *v274 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v162 = 0;
    }
    else
    {
      uint64_t v163 = v158[78];
      uint64_t v164 = v158[76];
      uint64_t v165 = v158[75];
      (*(void (**)(uint64_t, void, uint64_t))(v164 + 16))(v163, v158[71], v165);
      uint64_t v166 = URL.absoluteString.getter();
      uint64_t v266 = v167;
      (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v163, v165);
      sub_100012FEC();
      swift_allocError();
      uint64_t *v168 = v166;
      v168[1] = v266;
      uint64_t v162 = _swift_stdlib_bridgeErrorToNSError();
      v158[32] = v162;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    uint64_t v1 = v158;
    void *v161 = v162;
    _os_log_impl((void *)&_mh_execute_header, v155, v156, "alternate url %@", v160, 0xCu);
    sub_1000083D8(&qword_10001DA90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v9 = v281;
  }
  uint64_t v169 = v1[75];
  uint64_t v170 = v1[71];
  uint64_t v171 = v1[68];
  uint64_t v172 = v1[47];
  uint64_t v173 = v1[41];

  id v94 = v289;
  v289(v172, v173);
  swift_beginAccess();
  sub_1000084F4(v170, v171, &qword_10001D8C0);
  v175 = 0;
  if (v279(v171, 1, v169) != 1)
  {
    uint64_t v176 = v1[76];
    uint64_t v177 = v1[75];
    uint64_t v178 = v1[68];
    URL._bridgeToObjectiveC()(v174);
    v175 = v179;
    (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v178, v177);
  }
  NSString v180 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v181 = UIImagePNGRepresentation(v9);
  if (v181)
  {
    v182 = v181;
    uint64_t v183 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v185 = v184;

    v186.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000849C(v183, v185);
  }
  else
  {
    v186.super.Class isa = 0;
  }
  uint64_t v187 = v1[104];
  uint64_t v188 = v1[103];
  uint64_t v189 = v1[71];
  id v190 = [self createRichLinkLayoutWithURL:v175 title:v180 imageData:v186.super.isa];

  id v191 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v190];
  sub_1000083D8(&qword_10001DB98);
  uint64_t v192 = swift_allocObject();
  *(_OWORD *)(v192 + 16) = xmmword_100016B50;
  *(void *)(v192 + 32) = v188;
  *(void *)(v192 + 40) = v187;
  swift_bridgeObjectRetain();
  id v125 = v191;
  Class v193 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v125 setPpl_requiredCapabilities:v193];

  sub_100008558(v189, &qword_10001D8C0);
LABEL_88:
  v280 = v125;
  id v194 = [objc_allocWithZone((Class)MSSession) init];
  id v195 = [objc_allocWithZone((Class)MSMessage) initWithSession:v194];

  URL._bridgeToObjectiveC()(v196);
  v198 = v197;
  [v195 setURL:v197];

  [v195 setLayout:v125];
  MessageDetails.notificationCaption.getter();
  NSString v199 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v195 setSummaryText:v199];

  static PeopleLogger.messages.getter();
  id v200 = v195;
  v201 = Logger.logObject.getter();
  os_log_type_t v202 = static os_log_type_t.debug.getter();
  v284 = v200;
  if (os_log_type_enabled(v201, v202))
  {
    v203 = (uint8_t *)swift_slowAlloc();
    v294[0] = swift_slowAlloc();
    *(_DWORD *)v203 = 136315138;
    id v204 = [v200 URL];
    if (v204)
    {
      v205 = v204;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v206 = 0;
    }
    else
    {
      uint64_t v206 = 1;
    }
    uint64_t v209 = v1[76];
    uint64_t v210 = v1[75];
    uint64_t v211 = v1[67];
    uint64_t v270 = v1[46];
    uint64_t v212 = v290[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v209 + 56))(v211, v206, 1, v210);
    uint64_t v213 = String.init<A>(describing:)();
    v290[30] = sub_1000091CC(v213, v214, v294);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v201, v202, "message url %s", v203, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v200 = v284;
    uint64_t v215 = v212;
    uint64_t v1 = v290;
    v289(v270, v215);
    uint64_t v9 = v281;
  }
  else
  {
    uint64_t v207 = v1[46];
    uint64_t v208 = v1[41];

    v94(v207, v208);
  }
  v216 = v9;
  v217 = UIImageJPEGRepresentation(v216, 0.4);
  if (v217)
  {
    uint64_t v218 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v220 = v219;

    sub_100012F2C(v218, v220);
    v217 = (NSData *)Data._bridgeToObjectiveC()().super.isa;
    uint64_t v271 = v218;
    unint64_t v275 = v220;
    sub_10000849C(v218, v220);
  }
  else
  {

    uint64_t v271 = 0;
    unint64_t v275 = 0xF000000000000000;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  String.localized.getter();
  swift_bridgeObjectRelease();
  NSString v221 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v222 = [v200 ppl_pluginPayloadWithAppIconData:v217 appName:v221 allowDataPayloads:0];

  id v223 = [v222 data];
  v281 = v216;
  if (!v223)
  {
    static PeopleLogger.messages.getter();
    v238 = Logger.logObject.getter();
    uint64_t v239 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v238, (os_log_type_t)v239))
    {
      v240 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v240 = 0;
      _os_log_impl((void *)&_mh_execute_header, v238, (os_log_type_t)v239, "Message _pluginPayload create failed", v240, 2u);
      swift_slowDealloc();
    }
    v268 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v292 = v1[92];
    uint64_t v241 = v1[91];
    uint64_t v269 = v1[90];
    uint64_t v263 = v1[83];
    uint64_t v267 = v1[89];
    uint64_t v242 = v1[79];
    uint64_t v243 = v1[76];
    uint64_t v244 = v1[75];
    uint64_t v245 = v1[60];
    uint64_t v259 = v1[59];
    uint64_t v261 = v1[62];
    uint64_t v246 = v1[44];
    uint64_t v247 = v1[41];

    v289(v246, v247);
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();

    sub_100012F18(v271, v275);
    (*(void (**)(uint64_t, uint64_t))(v243 + 8))(v242, v244);
    (*(void (**)(uint64_t, uint64_t))(v245 + 8))(v261, v259);
    v268(v267, v263);
    (*(void (**)(uint64_t, uint64_t))(v241 + 8))(v292, v269);
    goto LABEL_106;
  }
  uint64_t v224 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v250 = v225;
  uint64_t v251 = v224;

  static PeopleLogger.messages.getter();
  v226 = Logger.logObject.getter();
  os_log_type_t v227 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v226, v227))
  {
    v228 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v228 = 0;
    _os_log_impl((void *)&_mh_execute_header, v226, v227, "SPI Payload successful!", v228, 2u);
    swift_slowDealloc();
  }
  v255 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v229 = v1[91];
  uint64_t v256 = v1[90];
  uint64_t v257 = v1[92];
  uint64_t v253 = v1[83];
  uint64_t v254 = v1[89];
  uint64_t v252 = v1[79];
  uint64_t v230 = v1[76];
  uint64_t v231 = v1[75];
  uint64_t v232 = v1[62];
  uint64_t v233 = v1[60];
  uint64_t v234 = v290[59];
  uint64_t v235 = v290[45];
  uint64_t v236 = v290[41];

  sub_100012F18(v271, v275);
  v289(v235, v236);
  (*(void (**)(uint64_t, uint64_t))(v230 + 8))(v252, v231);
  (*(void (**)(uint64_t, uint64_t))(v233 + 8))(v232, v234);
  v255(v254, v253);
  (*(void (**)(uint64_t, uint64_t))(v229 + 8))(v257, v256);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v237 = (uint64_t (*)(uint64_t, uint64_t))v290[1];
  return v237(v251, v250);
}

uint64_t sub_1000107BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[14] = v2;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = v3[65];
  uint64_t v6 = v3[64];
  uint64_t v7 = v3[63];
  v4[109] = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  return _swift_task_switch(sub_10001097C, 0, 0);
}

uint64_t sub_10001097C()
{
  v287 = v0;
  uint64_t v1 = v0;
  unint64_t v2 = v0[109];
  if (v2 >> 60 == 15
    || (uint64_t v3 = v0[15],
        id v4 = objc_allocWithZone((Class)UIImage),
        Class isa = Data._bridgeToObjectiveC()().super.isa,
        uint64_t v6 = (UIImage *)[v4 initWithData:isa],
        sub_100012F18(v3, v2),
        isa,
        !v6))
  {
    NSString v7 = String._bridgeToObjectiveC()();
    uint64_t v6 = (UIImage *)[self imageNamed:v7];
  }
  os_log_type_t v260 = (void **)(v0 + 36);
  uint64_t v8 = v0[76];
  uint64_t v9 = v0[75];
  uint64_t v10 = v0[73];
  uint64_t v11 = v0[40];
  URLComponents.init()();
  v0[29] = &_swiftEmptyArrayStorage;
  sub_1000084F4(v11, v10, &qword_10001D8C0);
  uint64_t v12 = *(unsigned int (**)(void, void, void))(v8 + 48);
  uint64_t v282 = v0;
  uint64_t v273 = v6;
  if (v12(v10, 1, v9) == 1)
  {
    sub_100008558(v0[73], &qword_10001D8C0);
  }
  else
  {
    uint64_t v13 = v0[59];
    uint64_t v14 = v0[60];
    uint64_t v15 = v1[58];
    (*(void (**)(void, void, void))(v1[76] + 32))(v1[80], v1[73], v1[75]);
    URLComponents.init(url:resolvingAgainstBaseURL:)();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13) == 1)
    {
      uint64_t v16 = v1[58];
      (*(void (**)(void, void))(v1[76] + 8))(v1[80], v1[75]);
      sub_100008558(v16, &qword_10001DA60);
    }
    else
    {
      (*(void (**)(void, void, void))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      uint64_t v17 = URLComponents.queryItems.getter();
      if (v17)
      {
        uint64_t v18 = v17;
        v268 = v12;
        uint64_t v19 = v1[80];
        uint64_t v277 = *(void *)(v17 + 16);
        if (v277)
        {
          ATURL.Parser.init()();
          type metadata accessor for ATPayload();
          sub_100013094(&qword_10001DBB8, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          sub_100013094(&qword_10001DBC0, (void (*)(uint64_t))&type metadata accessor for ATPayload);
          ATURL.Parser.parse<A>(_:from:)();
          uint64_t v28 = *v260;
          uint64_t v29 = (void *)ATPayload.question.getter();
          ATQuestion.notificationText.getter();
          uint64_t v31 = v30;

          if (!v31)
          {
            uint64_t v32 = (void *)ATPayload.question.getter();
            ATQuestion.summary.getter();
          }
          uint64_t v33 = v1[52];
          MessageDetails.notificationCaption.setter();

          unint64_t v34 = v18 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
          uint64_t v35 = (void (**)(uint64_t, uint64_t))(v33 + 8);
          uint64_t v274 = v18;
          swift_bridgeObjectRetain();
          uint64_t v36 = 0;
          while (1)
          {
            uint64_t v37 = v36 + 1;
            if (__OFADD__(v36, 1)) {
              __break(1u);
            }
            (*(void (**)(void, unint64_t, void))(v33 + 16))(v282[54], v34 + *(void *)(v33 + 72) * v36, v282[51]);
            uint64_t v38 = URLQueryItem.name.getter();
            uint64_t v40 = v282[54];
            uint64_t v41 = v282[51];
            if (v38 == 0x69616E626D756874 && v39 == 0xED0000617461446CLL) {
              break;
            }
            char v43 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            (*v35)(v40, v41);
            if ((v43 & 1) == 0)
            {
              ++v36;
              if (v37 != v277) {
                continue;
              }
            }
            goto LABEL_25;
          }
          swift_bridgeObjectRelease();
          (*v35)(v40, v41);
          char v43 = 1;
LABEL_25:
          uint64_t v1 = v282;
          uint64_t v278 = v282[80];
          uint64_t v44 = v282[76];
          uint64_t v264 = v282[75];
          uint64_t v46 = v282[60];
          uint64_t v45 = v282[61];
          uint64_t v47 = v282[59];
          uint64_t v49 = v282[56];
          uint64_t v48 = v282[57];
          uint64_t v50 = v282[55];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
          (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v278, v264);
          swift_bridgeObjectRelease();
          v282[29] = v274;
          uint64_t v12 = v268;
          uint64_t v6 = v273;
          if (v43)
          {
            static PeopleLogger.messages.getter();
            uint64_t v51 = Logger.logObject.getter();
            os_log_type_t v52 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v51, v52))
            {
              char v53 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)char v53 = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, v52, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v53, 2u);
              swift_slowDealloc();
            }
            uint64_t v54 = v282[50];
            uint64_t v55 = v282[41];
            uint64_t v56 = v282[42];

            (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v23 = v1[76];
          uint64_t v24 = v1[75];
          uint64_t v26 = v1[60];
          uint64_t v25 = v1[61];
          uint64_t v27 = v1[59];
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
          (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v19, v24);
          uint64_t v12 = v268;
        }
      }
      else
      {
        uint64_t v20 = v1[80];
        uint64_t v21 = v1[76];
        uint64_t v22 = v1[75];
        (*(void (**)(void, void))(v1[60] + 8))(v1[61], v1[59]);
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      }
    }
  }
  uint64_t v57 = MessageDetails.thumbnailData.getter();
  unint64_t v59 = v58;
  sub_100012F18(v57, v58);
  if (v59 >> 60 != 15) {
    goto LABEL_34;
  }
  if (v6)
  {
    uint64_t v60 = UIImagePNGRepresentation(v6);
    if (v60)
    {
      uint64_t v61 = v60;
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
LABEL_33:
  MessageDetails.thumbnailData.setter();
LABEL_34:
  MessageDetails.queryItems.getter();
  static PeopleLogger.messages.getter();
  uint64_t v62 = v1[29];
  swift_bridgeObjectRetain_n();
  uint64_t v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    v255 = v63;
    uint64_t v269 = v12;
    uint64_t v65 = swift_slowAlloc();
    uint64_t v285 = swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 134218242;
    v1[34] = *(void *)(v62 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v65 + 12) = 2080;
    int64_t v66 = *(void *)(v62 + 16);
    uint64_t v253 = (uint8_t *)v65;
    os_log_type_t v251 = v64;
    if (v66)
    {
      uint64_t v67 = v1[52];
      v286[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_10000C998(0, v66, 0);
      unint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
      v67 += 16;
      v279 = v68;
      uint64_t v69 = v62 + ((*(unsigned __int8 *)(v67 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 64));
      uint64_t v275 = *(void *)(v67 + 56);
      v70 = (void (**)(uint64_t, uint64_t))(v67 - 8);
      do
      {
        uint64_t v71 = v1[53];
        uint64_t v72 = v1[51];
        v279(v71, v69, v72);
        uint64_t v73 = URLQueryItem.name.getter();
        uint64_t v75 = v74;
        (*v70)(v71, v72);
        uint64_t v76 = v286[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10000C998(0, *(void *)(v286[0] + 16) + 1, 1);
          uint64_t v76 = v286[0];
        }
        unint64_t v78 = *(void *)(v76 + 16);
        unint64_t v77 = *(void *)(v76 + 24);
        if (v78 >= v77 >> 1)
        {
          sub_10000C998(v77 > 1, v78 + 1, 1);
          uint64_t v76 = v286[0];
        }
        *(void *)(v76 + 16) = v78 + 1;
        uint64_t v79 = v76 + 16 * v78;
        *(void *)(v79 + 32) = v73;
        *(void *)(v79 + 40) = v75;
        v69 += v275;
        --v66;
        uint64_t v1 = v282;
      }
      while (v66);
      swift_bridgeObjectRelease();
    }
    uint64_t v84 = v1[49];
    uint64_t v85 = v1[41];
    uint64_t v86 = v1[42];
    uint64_t v87 = Array.description.getter();
    unint64_t v89 = v88;
    swift_bridgeObjectRelease();
    v1[35] = sub_1000091CC(v87, v89, &v285);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v255, v251, "Appending %ld additional components to conversation url: %s", v253, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
    v83(v84, v85);
    uint64_t v12 = v269;
    uint64_t v6 = v273;
  }
  else
  {
    uint64_t v80 = v1[49];
    uint64_t v81 = v1[41];
    uint64_t v82 = v1[42];
    swift_bridgeObjectRelease_n();

    uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
    v83(v80, v81);
  }
  uint64_t v90 = v1[75];
  uint64_t v91 = v1[72];
  swift_beginAccess();
  sub_10000C4D8(v1[29]);
  URLComponents.queryItems.setter();
  URLComponents.url.getter();
  if (v12(v91, 1, v90) == 1)
  {
    uint64_t v283 = v1[92];
    uint64_t v92 = v1[91];
    uint64_t v280 = v1[90];
    uint64_t v93 = v1[89];
    uint64_t v265 = v1[83];
    uint64_t v270 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v94 = v1[72];
    uint64_t v95 = v1[62];
    uint64_t v97 = v1[59];
    uint64_t v96 = v1[60];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100008558(v94, &qword_10001D8C0);
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v95, v97);
    v270(v93, v265);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v283, v280);
LABEL_105:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v240 = (uint64_t (*)(void))v1[1];
    return v240();
  }
  uint64_t v266 = v1 + 31;
  int v98 = *((unsigned __int8 *)v1 + 880);
  (*(void (**)(void, void, void))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v276 = v83;
  if (v98 != 1)
  {
    id v112 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
    [v112 setImage:v6];
    MessageDetails.notificationCaption.getter();
    NSString v113 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v112 setCaption:v113];

    id v114 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v112];
    goto LABEL_85;
  }
  uint64_t v99 = v1[89];
  uint64_t v100 = v1[87];
  uint64_t v101 = v1[84];
  uint64_t v102 = v1[83];
  static PeopleLogger.messages.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 16))(v100, v99, v102);
  uint64_t v103 = Logger.logObject.getter();
  os_log_type_t v104 = static os_log_type_t.debug.getter();
  BOOL v105 = os_log_type_enabled(v103, v104);
  uint64_t v106 = v1[87];
  uint64_t v107 = v1[83];
  uint64_t v108 = v1[48];
  uint64_t v256 = v1[41];
  uint64_t v271 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  if (v105)
  {
    v249 = (void (*)(uint64_t, uint64_t))v1[96];
    int v109 = (uint8_t *)swift_slowAlloc();
    v286[0] = swift_slowAlloc();
    *(_DWORD *)int v109 = 136315138;
    uint64_t v110 = MessageDetails.EventSource.rawValue.getter();
    v1[33] = sub_1000091CC(v110, v111, v286);
    uint64_t v1 = v282;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v249(v106, v107);
    _os_log_impl((void *)&_mh_execute_header, v103, v104, "Using LP fallback for %s", v109, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v1[96])(v106, v107);
  }

  v83(v108, v256);
  uint64_t v115 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(void, void, void))v1[93])(v1[86], enum case for MessageDetails.EventSource.screenTime(_:), v1[83]);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  BOOL v116 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v117 = v1[86];
  uint64_t v118 = v1[83];
  uint64_t v6 = v273;
  if (v1[21] == v1[23] && v1[22] == v1[24])
  {
    swift_bridgeObjectRelease_n();
    v116(v117, v118);
LABEL_56:
    String.localized.getter();
    sub_1000083D8(&qword_10001DBA8);
    uint64_t v120 = swift_allocObject();
    *(_OWORD *)(v120 + 16) = xmmword_100016B40;
    uint64_t v121 = MessageDetails.childName.getter();
    uint64_t v123 = v122;
    *(void *)(v120 + 56) = &type metadata for String;
    unint64_t v124 = sub_100013040();
    *(void *)(v120 + 64) = v124;
    *(void *)(v120 + 32) = v121;
    *(void *)(v120 + 40) = v123;
    uint64_t v125 = MessageDetails.title.getter();
    *(void *)(v120 + 96) = &type metadata for String;
    *(void *)(v120 + 104) = v124;
    uint64_t v1 = v282;
    *(void *)(v120 + 72) = v125;
    *(void *)(v120 + 80) = v126;
    String.init(format:_:)();
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
  char v119 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v116(v117, v118);
  if (v119) {
    goto LABEL_56;
  }
  MessageDetails.title.getter();
  Swift::String v127 = String.trim()();
  swift_bridgeObjectRelease();
  if (v127._countAndFlagsBits == static MessageDetails.titleFallbackKey.getter() && v127._object == v128)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v129 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v129 & 1) == 0)
    {
      MessageDetails.title.getter();
      goto LABEL_63;
    }
  }
  MessageDetails.notificationCaption.getter();
LABEL_63:
  char v130 = (void (*)(uint64_t, uint64_t, uint64_t))v1[93];
  uint64_t v131 = v1[85];
  uint64_t v132 = v1[83];
  (*(void (**)(void, uint64_t, uint64_t, void))(v1[76] + 56))(v1[71], 1, 1, v1[75]);
  v130(v131, v115, v132);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v133 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v134 = v1[85];
  uint64_t v135 = v1[83];
  if (v1[25] == v1[27] && v1[26] == v1[28])
  {
    swift_bridgeObjectRelease_n();
    v133(v134, v135);
  }
  else
  {
    char v136 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v133(v134, v135);
    if ((v136 & 1) == 0)
    {
      type metadata accessor for ServerFeatureFlag();
      static ServerFeatureFlag.shared.getter();
      ServerFeatureFlag.lpForAskToBuyFallback.getter();
      goto LABEL_69;
    }
  }
  type metadata accessor for ServerFeatureFlag();
  static ServerFeatureFlag.shared.getter();
  ServerFeatureFlag.lpForScreenTimeFallback.getter();
LABEL_69:
  swift_release();
  object = String.trimToNil()().value._object;
  swift_bridgeObjectRelease();
  if (object)
  {
    uint64_t v138 = v1[71];
    uint64_t v139 = v1[70];
    URL.init(string:)();
    swift_bridgeObjectRelease();
    sub_100012F84(v139, v138);
  }
  uint64_t v140 = v1[75];
  uint64_t v141 = v1[69];
  sub_1000084F4(v1[71], v141, &qword_10001D8C0);
  LODWORD(v140) = v271(v141, 1, v140);
  sub_100008558(v141, &qword_10001D8C0);
  if (v140 == 1)
  {
    uint64_t v142 = v1[71];
    uint64_t v143 = v1[70];
    URL.init(string:)();
    sub_100012F84(v143, v142);
  }
  static PeopleLogger.messages.getter();
  v144 = Logger.logObject.getter();
  os_log_type_t v145 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v144, v145))
  {
    uint64_t v146 = v1[75];
    char v147 = v1;
    uint64_t v148 = v1[71];
    uint64_t v149 = (uint8_t *)swift_slowAlloc();
    uint64_t v150 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v149 = 138412290;
    swift_beginAccess();
    if (v271(v148, 1, v146))
    {
      *uint64_t v266 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v151 = 0;
    }
    else
    {
      uint64_t v152 = v147[78];
      uint64_t v153 = v147[76];
      uint64_t v154 = v147[75];
      (*(void (**)(uint64_t, void, uint64_t))(v153 + 16))(v152, v147[71], v154);
      uint64_t v155 = URL.absoluteString.getter();
      uint64_t v257 = v156;
      (*(void (**)(uint64_t, uint64_t))(v153 + 8))(v152, v154);
      sub_100012FEC();
      swift_allocError();
      *uint64_t v157 = v155;
      v157[1] = v257;
      uint64_t v151 = _swift_stdlib_bridgeErrorToNSError();
      v147[32] = v151;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    uint64_t v1 = v147;
    *uint64_t v150 = v151;
    _os_log_impl((void *)&_mh_execute_header, v144, v145, "alternate url %@", v149, 0xCu);
    sub_1000083D8(&qword_10001DA90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v6 = v273;
  }
  uint64_t v158 = v1[75];
  uint64_t v159 = v1[71];
  uint64_t v160 = v1[68];
  uint64_t v161 = v1[47];
  uint64_t v162 = v1[41];

  uint64_t v83 = v276;
  v276(v161, v162);
  swift_beginAccess();
  sub_1000084F4(v159, v160, &qword_10001D8C0);
  uint64_t v164 = 0;
  if (v271(v160, 1, v158) != 1)
  {
    uint64_t v165 = v1[76];
    uint64_t v166 = v1[75];
    uint64_t v167 = v1[68];
    URL._bridgeToObjectiveC()(v163);
    uint64_t v164 = v168;
    (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v167, v166);
  }
  NSString v169 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v6 && (uint64_t v170 = UIImagePNGRepresentation(v6)) != 0)
  {
    uint64_t v171 = v170;
    uint64_t v172 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v174 = v173;

    v175.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10000849C(v172, v174);
  }
  else
  {
    v175.super.Class isa = 0;
  }
  uint64_t v176 = v1[104];
  uint64_t v177 = v1[103];
  uint64_t v178 = v1[71];
  id v179 = [self createRichLinkLayoutWithURL:v164 title:v169 imageData:v175.super.isa];

  id v180 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v179];
  sub_1000083D8(&qword_10001DB98);
  uint64_t v181 = swift_allocObject();
  *(_OWORD *)(v181 + 16) = xmmword_100016B50;
  *(void *)(v181 + 32) = v177;
  *(void *)(v181 + 40) = v176;
  swift_bridgeObjectRetain();
  id v114 = v180;
  Class v182 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v114 setPpl_requiredCapabilities:v182];

  sub_100008558(v178, &qword_10001D8C0);
LABEL_85:
  id v183 = [objc_allocWithZone((Class)MSSession) init];
  id v184 = [objc_allocWithZone((Class)MSMessage) initWithSession:v183];

  URL._bridgeToObjectiveC()(v185);
  uint64_t v187 = v186;
  [v184 setURL:v186];

  [v184 setLayout:v114];
  MessageDetails.notificationCaption.getter();
  NSString v188 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v184 setSummaryText:v188];

  static PeopleLogger.messages.getter();
  id v189 = v184;
  id v190 = Logger.logObject.getter();
  os_log_type_t v191 = static os_log_type_t.debug.getter();
  v281 = v189;
  uint64_t v272 = v114;
  if (os_log_type_enabled(v190, v191))
  {
    uint64_t v192 = (uint8_t *)swift_slowAlloc();
    v286[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v192 = 136315138;
    id v193 = [v189 URL];
    if (v193)
    {
      id v194 = v193;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v195 = 0;
    }
    else
    {
      uint64_t v195 = 1;
    }
    uint64_t v198 = v1[76];
    uint64_t v199 = v1[75];
    uint64_t v200 = v1[67];
    uint64_t v262 = v1[46];
    uint64_t v201 = v282[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v198 + 56))(v200, v195, 1, v199);
    uint64_t v202 = String.init<A>(describing:)();
    v282[30] = sub_1000091CC(v202, v203, v286);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v190, v191, "message url %s", v192, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v204 = v201;
    uint64_t v1 = v282;
    v276(v262, v204);
    uint64_t v6 = v273;
    if (!v273) {
      goto LABEL_95;
    }
  }
  else
  {
    uint64_t v196 = v1[46];
    uint64_t v197 = v1[41];

    v83(v196, v197);
    if (!v6) {
      goto LABEL_95;
    }
  }
  v205 = v6;
  uint64_t v206 = UIImageJPEGRepresentation(v205, 0.4);
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v210 = v209;

    sub_100012F2C(v208, v210);
    v211.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v263 = v208;
    unint64_t v267 = v210;
    sub_10000849C(v208, v210);
    goto LABEL_96;
  }

LABEL_95:
  v211.super.Class isa = 0;
  uint64_t v263 = 0;
  unint64_t v267 = 0xF000000000000000;
LABEL_96:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  String.localized.getter();
  swift_bridgeObjectRelease();
  NSString v212 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v213 = [v189 ppl_pluginPayloadWithAppIconData:v211.super.isa appName:v212 allowDataPayloads:0];

  id v214 = [v213 data];
  if (!v214)
  {
    static PeopleLogger.messages.getter();
    uint64_t v230 = Logger.logObject.getter();
    uint64_t v231 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v230, (os_log_type_t)v231))
    {
      uint64_t v232 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v232 = 0;
      _os_log_impl((void *)&_mh_execute_header, v230, (os_log_type_t)v231, "Message _pluginPayload create failed", v232, 2u);
      swift_slowDealloc();
    }
    uint64_t v259 = (void (*)(uint64_t, uint64_t))v1[96];
    uint64_t v284 = v1[92];
    uint64_t v233 = v1[91];
    uint64_t v261 = v1[90];
    uint64_t v254 = v1[83];
    uint64_t v258 = v1[89];
    uint64_t v234 = v1[79];
    uint64_t v235 = v1[76];
    uint64_t v236 = v1[75];
    uint64_t v237 = v1[60];
    uint64_t v250 = v1[59];
    uint64_t v252 = v1[62];
    uint64_t v238 = v1[44];
    uint64_t v239 = v1[41];

    v276(v238, v239);
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();

    sub_100012F18(v263, v267);
    (*(void (**)(uint64_t, uint64_t))(v235 + 8))(v234, v236);
    (*(void (**)(uint64_t, uint64_t))(v237 + 8))(v252, v250);
    v259(v258, v254);
    (*(void (**)(uint64_t, uint64_t))(v233 + 8))(v284, v261);
    goto LABEL_105;
  }
  uint64_t v215 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v241 = v216;
  uint64_t v242 = v215;

  static PeopleLogger.messages.getter();
  v217 = Logger.logObject.getter();
  os_log_type_t v218 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v217, v218))
  {
    unint64_t v219 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v219 = 0;
    _os_log_impl((void *)&_mh_execute_header, v217, v218, "SPI Payload successful!", v219, 2u);
    swift_slowDealloc();
  }
  uint64_t v246 = (void (*)(uint64_t, uint64_t))v1[96];
  uint64_t v248 = v282[92];
  uint64_t v220 = v282[91];
  uint64_t v247 = v282[90];
  uint64_t v245 = v282[89];
  uint64_t v244 = v282[83];
  uint64_t v243 = v282[79];
  uint64_t v221 = v282[76];
  uint64_t v222 = v282[75];
  uint64_t v223 = v282[62];
  uint64_t v224 = v282[60];
  uint64_t v225 = v282[59];
  uint64_t v226 = v282[45];
  uint64_t v227 = v282[41];

  sub_100012F18(v263, v267);
  v276(v226, v227);
  (*(void (**)(uint64_t, uint64_t))(v221 + 8))(v243, v222);
  (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v223, v225);
  v246(v245, v244);
  (*(void (**)(uint64_t, uint64_t))(v220 + 8))(v248, v247);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v228 = (uint64_t (*)(uint64_t, uint64_t))v282[1];
  return v228(v242, v241);
}

uint64_t sub_100012F18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000849C(a1, a2);
  }
  return a1;
}

uint64_t sub_100012F2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100012F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000083D8(&qword_10001D8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100012FEC()
{
  unint64_t result = qword_10001DBA0;
  if (!qword_10001DBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DBA0);
  }
  return result;
}

unint64_t sub_100013040()
{
  unint64_t result = qword_10001DBB0;
  if (!qword_10001DBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001DBB0);
  }
  return result;
}

uint64_t sub_100013094(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000130DC()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000131A8(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_10000AA78;
  return sub_10000B988(a1, v5, v6, v7);
}

uint64_t sub_100013294()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000132CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000AA78;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001DA98 + dword_10001DA98);
  return v6(a1, v4);
}

uint64_t sub_100013384(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10001339C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.subscript.getter()
{
  return URLComponents.subscript.getter();
}

uint64_t URLComponents.peopleAction.getter()
{
  return URLComponents.peopleAction.getter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Logger.ifError(_:message:)()
{
  return Logger.ifError(_:message:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t ATQuestion.notificationText.getter()
{
  return ATQuestion.notificationText.getter();
}

uint64_t ATQuestion.summary.getter()
{
  return ATQuestion.summary.getter();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t type metadata accessor for PeopleURL.PathAction()
{
  return type metadata accessor for PeopleURL.PathAction();
}

uint64_t static PeopleURL.Scheme.== infix(_:_:)()
{
  return static PeopleURL.Scheme.== infix(_:_:)();
}

uint64_t type metadata accessor for PeopleURL.Scheme()
{
  return type metadata accessor for PeopleURL.Scheme();
}

uint64_t type metadata accessor for PeopleURL.Parameter()
{
  return type metadata accessor for PeopleURL.Parameter();
}

uint64_t static PeopleErrors.createError(_:code:)()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t static PeopleLogger.messages.getter()
{
  return static PeopleLogger.messages.getter();
}

uint64_t static PeopleConstants.askToBuyEventTTL.getter()
{
  return static PeopleConstants.askToBuyEventTTL.getter();
}

uint64_t static PeopleConstants.screenTimeRequestEventTTL.getter()
{
  return static PeopleConstants.screenTimeRequestEventTTL.getter();
}

uint64_t static AMSBagHelper.isTrustedDomain(for:)()
{
  return static AMSBagHelper.isTrustedDomain(for:)();
}

uint64_t AskToMetrics.init(isAskToProcess:)()
{
  return AskToMetrics.init(isAskToProcess:)();
}

uint64_t type metadata accessor for AskToMetrics()
{
  return type metadata accessor for AskToMetrics();
}

uint64_t ContactFetcher.__allocating_init()()
{
  return ContactFetcher.__allocating_init()();
}

uint64_t type metadata accessor for ContactFetcher()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t type metadata accessor for FirstPartyApps()
{
  return type metadata accessor for FirstPartyApps();
}

uint64_t MessageDetails.queryItems.getter()
{
  return MessageDetails.queryItems.getter();
}

uint64_t MessageDetails.EventSource.init(rawValue:)()
{
  return MessageDetails.EventSource.init(rawValue:)();
}

uint64_t MessageDetails.EventSource.rawValue.getter()
{
  return MessageDetails.EventSource.rawValue.getter();
}

uint64_t type metadata accessor for MessageDetails.EventSource()
{
  return type metadata accessor for MessageDetails.EventSource();
}

uint64_t MessageDetails.EventStatus.rawValue.getter()
{
  return MessageDetails.EventStatus.rawValue.getter();
}

uint64_t type metadata accessor for MessageDetails.EventStatus()
{
  return type metadata accessor for MessageDetails.EventStatus();
}

uint64_t MessageDetails.eventSource.getter()
{
  return MessageDetails.eventSource.getter();
}

uint64_t MessageDetails.thumbnailData.getter()
{
  return MessageDetails.thumbnailData.getter();
}

uint64_t MessageDetails.thumbnailData.setter()
{
  return MessageDetails.thumbnailData.setter();
}

uint64_t MessageDetails.thumbnailPath.getter()
{
  return MessageDetails.thumbnailPath.getter();
}

uint64_t MessageDetails.debugDescription.getter()
{
  return MessageDetails.debugDescription.getter();
}

uint64_t static MessageDetails.titleFallbackKey.getter()
{
  return static MessageDetails.titleFallbackKey.getter();
}

uint64_t MessageDetails.notificationCaption.getter()
{
  return MessageDetails.notificationCaption.getter();
}

uint64_t MessageDetails.notificationCaption.setter()
{
  return MessageDetails.notificationCaption.setter();
}

uint64_t MessageDetails.title.getter()
{
  return MessageDetails.title.getter();
}

uint64_t MessageDetails.family.getter()
{
  return MessageDetails.family.getter();
}

uint64_t MessageDetails.status.getter()
{
  return MessageDetails.status.getter();
}

uint64_t MessageDetails.bundleId.getter()
{
  return MessageDetails.bundleId.getter();
}

uint64_t MessageDetails.childName.getter()
{
  return MessageDetails.childName.getter();
}

uint64_t MessageDetails.requestID.getter()
{
  return MessageDetails.requestID.getter();
}

uint64_t type metadata accessor for MessageDetails()
{
  return type metadata accessor for MessageDetails();
}

uint64_t ResolvedFamily.requestingFamilyMember.getter()
{
  return ResolvedFamily.requestingFamilyMember.getter();
}

uint64_t ResolvedFamily.approvers.getter()
{
  return ResolvedFamily.approvers.getter();
}

uint64_t type metadata accessor for ResolvedFamily()
{
  return type metadata accessor for ResolvedFamily();
}

uint64_t static MessageSendRules.sharedInstance.getter()
{
  return static MessageSendRules.sharedInstance.getter();
}

uint64_t type metadata accessor for MessageSendRules()
{
  return type metadata accessor for MessageSendRules();
}

uint64_t type metadata accessor for AppBundleResolver()
{
  return type metadata accessor for AppBundleResolver();
}

uint64_t DiscoveredHandles.iMessageHandles.getter()
{
  return DiscoveredHandles.iMessageHandles.getter();
}

uint64_t DiscoveredHandles.allMembersMeetRequirements.getter()
{
  return DiscoveredHandles.allMembersMeetRequirements.getter();
}

uint64_t type metadata accessor for DiscoveredHandles()
{
  return type metadata accessor for DiscoveredHandles();
}

uint64_t ServerFeatureFlag.lpForAskToBuyFallback.getter()
{
  return ServerFeatureFlag.lpForAskToBuyFallback.getter();
}

uint64_t ServerFeatureFlag.lpForScreenTimeFallback.getter()
{
  return ServerFeatureFlag.lpForScreenTimeFallback.getter();
}

uint64_t ServerFeatureFlag.preventAskToBuyDeviceValidation.getter()
{
  return ServerFeatureFlag.preventAskToBuyDeviceValidation.getter();
}

uint64_t ServerFeatureFlag.preventScreenTimeMessageDeviceValidation.getter()
{
  return ServerFeatureFlag.preventScreenTimeMessageDeviceValidation.getter();
}

uint64_t static ServerFeatureFlag.shared.getter()
{
  return static ServerFeatureFlag.shared.getter();
}

uint64_t type metadata accessor for ServerFeatureFlag()
{
  return type metadata accessor for ServerFeatureFlag();
}

uint64_t RequestMessageDetailsBuilder.init()()
{
  return RequestMessageDetailsBuilder.init()();
}

uint64_t type metadata accessor for RequestMessageDetailsBuilder()
{
  return type metadata accessor for RequestMessageDetailsBuilder();
}

uint64_t static MessageDeviceCapabilityLookup.sharedInstance.getter()
{
  return static MessageDeviceCapabilityLookup.sharedInstance.getter();
}

uint64_t type metadata accessor for MessageDeviceCapabilityLookup()
{
  return type metadata accessor for MessageDeviceCapabilityLookup();
}

uint64_t ATURL.Parser.parse<A>(_:from:)()
{
  return ATURL.Parser.parse<A>(_:from:)();
}

uint64_t ATURL.Parser.init()()
{
  return ATURL.Parser.init()();
}

uint64_t type metadata accessor for ATURL.Parser()
{
  return type metadata accessor for ATURL.Parser();
}

uint64_t ATPayload.question.getter()
{
  return ATPayload.question.getter();
}

uint64_t type metadata accessor for ATPayload()
{
  return type metadata accessor for ATPayload();
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

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.trim()()
{
  uint64_t v0 = String.trim()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.localized.getter()
{
  return String.localized.getter();
}

Swift::String_optional __swiftcall String.trimToNil()()
{
  uint64_t v0 = String.trimToNil()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
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

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
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

void exit(int a1)
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:MIMEType:];
}

id objc_msgSend_initWithLinkMetadata_(void *a1, const char *a2, ...)
{
  return [a1 initWithLinkMetadata:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}