int main(int argc, const char **argv, const char **envp)
{
  FILE *v3;
  id v4;

  v3 = (FILE *)sub_100003470();
  setlinebuf(v3);
  qword_100008910 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for TextUnderstandingDaemon()) init];
  v4 = [self mainRunLoop];
  [v4 run];

  return 0;
}

Swift::String *TextUnderstandingDaemonName.unsafeMutableAddressor()
{
  return &TextUnderstandingDaemonName;
}

uint64_t sub_100002AD8()
{
  sub_100003424();
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t sub_100002B54()
{
  sub_100003424();
  return (*(uint64_t (**)(void))(v0 + 208))();
}

void sub_100002CA4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_100003430();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100002D08()
{
  sub_100003424();
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_100002D84(int a1, int a2, void *aBlock, uint64_t a4, void (*a5)(uint64_t, void *))
{
  v7 = _Block_copy(aBlock);
  v9[2] = v7;
  swift_retain();
  a5(a4, v9);
  _Block_release(v7);
  return swift_release();
}

uint64_t sub_100002DF8()
{
  sub_100003424();
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t sub_100002E60()
{
  sub_100003424();
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_100002EC8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  a3(v4);
  return swift_release();
}

uint64_t sub_100002F0C()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for DocumentUnderstandingServer()
{
  return self;
}

char *sub_100002F68()
{
  uint64_t v1 = OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_interface;
  v2 = self;
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 interfaceWithProtocol:&OBJC_PROTOCOL____TtP18textunderstandingd31TextUnderstandingDaemonProtocol_];
  uint64_t v4 = (void **)sub_100003460();
  v5 = *v4;
  *(void *)&v3[OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_manager] = *v4;
  type metadata accessor for DocumentUnderstandingServer();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)&v3[OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_server] = v6;
  id v7 = v5;

  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for TextUnderstandingDaemon();
  id v8 = objc_msgSendSuper2(&v14, "init");
  sub_1000033A4(0, &qword_1000088A0);
  v9 = (char *)v8;
  id v10 = sub_1000030F8();
  [v10 setDelegate:v9];
  [v10 resume];
  sub_100003450();
  sub_100003440();
  v11 = self;
  id v12 = *(id *)&v9[OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_manager];
  [v11 registerDUXPCListenersWithManager:v12];

  return v9;
}

id sub_1000030F8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_100003480();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

id sub_100003190(uint64_t a1, void *a2)
{
  uint64_t v4 = self;
  NSString v5 = sub_100003480();
  NSString v6 = sub_100003480();
  id v7 = [v4 checkForAndLogTrueBooleanEntitlement:v5 connection:a2 serviceName:v6];

  if (v7)
  {
    [a2 setExportedInterface:*(void *)(v2 + OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_interface)];
    [a2 setExportedObject:*(void *)(v2 + OBJC_IVAR____TtC18textunderstandingd23TextUnderstandingDaemon_server)];
    [a2 resume];
  }
  return v7;
}

id sub_1000032E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextUnderstandingDaemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TextUnderstandingDaemon()
{
  return self;
}

uint64_t sub_100003394()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000033A4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000033E0()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100003418(uint64_t a1)
{
  sub_100002CA4(a1, *(void *)(v1 + 16));
}

uint64_t sub_100003430()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003440()
{
  return static SRSSmartRepliesServerXPCServer.registerXPCListeners()();
}

uint64_t sub_100003450()
{
  return type metadata accessor for SRSSmartRepliesServerXPCServer();
}

uint64_t sub_100003460()
{
  return TextUnderstandingManager.shared.unsafeMutableAddressor();
}

uint64_t sub_100003470()
{
  return stdout.getter();
}

NSString sub_100003480()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100003490()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000034A0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
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

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}