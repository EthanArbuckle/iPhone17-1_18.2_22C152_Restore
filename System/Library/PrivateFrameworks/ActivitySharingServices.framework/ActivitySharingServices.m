int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned char v12[32];

  v3 = sub_1000025CC(&qword_100008018);
  v4 = __chkstk_darwin();
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002610(v4, qword_100008050);
  v7 = sub_100002674(v3, (uint64_t)qword_100008050);
  v8 = type metadata accessor for Daemon();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1000026AC();
  swift_beginAccess();
  sub_100002A18(v7, (uint64_t)v6);
  v10 = [self mainRunLoop];
  [v10 run];

  sub_100003258((uint64_t)v6, &qword_100008018);
  return 0;
}

uint64_t sub_1000025CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100002610(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100002674(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1000026AC()
{
  sub_1000025CC(&qword_100008020);
  __chkstk_darwin();
  v1 = (char *)&v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Daemon();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000025CC(&qword_100008018);
  uint64_t v6 = __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002674(v6, (uint64_t)&unk_100008050);
  if (ASActivitySharingDaemonEnabled())
  {
    Daemon.init()();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    swift_beginAccess();
    sub_100003018((uint64_t)v8, v9);
    swift_endAccess();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
      Daemon.bundleIdentifier.getter();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      static Sandbox.bootstrap(_:)();
      swift_bridgeObjectRelease();
      uint64_t v10 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v1, 1, 1, v10);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      *(void *)(v11 + 24) = 0;
      sub_100002E64((uint64_t)v1, (uint64_t)&unk_100008030, v11);
      swift_release();
    }
  }
  else
  {
    if (qword_100008010 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100002674(v12, (uint64_t)qword_100008068);
    v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Activity Sharing daemon not enabled", v15, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100002A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000025CC(&qword_100008018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100002A80(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for Daemon();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_1000025CC(&qword_100008018);
  v1[9] = sub_100002674(v3, (uint64_t)qword_100008050);
  return _swift_task_switch(sub_100002B5C, 0, 0);
}

uint64_t sub_100002B5C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  swift_beginAccess();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  *(_DWORD *)(v0 + 88) = v4;
  if (v4)
  {
    **(unsigned char **)(v0 + 40) = 1;
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 56) + 16))(*(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 48));
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_100002C98;
    return Daemon.activate()();
  }
}

uint64_t sub_100002C98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 64);
  uint64_t v2 = *(void *)(*(void *)v0 + 56);
  uint64_t v3 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100002DF0, 0, 0);
}

uint64_t sub_100002DF0()
{
  **(unsigned char **)(v0 + 40) = *(_DWORD *)(v0 + 88) != 0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100002E64(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100003258(a1, &qword_100008020);
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
  sub_1000025CC(&qword_100008048);
  return swift_task_create();
}

uint64_t sub_100003018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000025CC(&qword_100008018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003080()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000030B8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003164;
  return sub_100002A80(a1);
}

uint64_t sub_100003164()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003258(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000025CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000032B4(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100003394;
  return v5(v2 + 32);
}

uint64_t sub_100003394()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1000034A8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000034E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100003164;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100008038 + dword_100008038);
  return v6(a1, v4);
}

uint64_t sub_100003598()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100002610(v0, qword_100008068);
  sub_100002674(v0, (uint64_t)qword_100008068);
  return Logger.init(subsystem:category:)();
}

uint64_t Daemon.bundleIdentifier.getter()
{
  return Daemon.bundleIdentifier.getter();
}

uint64_t Daemon.init()()
{
  return Daemon.init()();
}

uint64_t type metadata accessor for Daemon()
{
  return type metadata accessor for Daemon();
}

uint64_t static Sandbox.bootstrap(_:)()
{
  return static Sandbox.bootstrap(_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t ASActivitySharingDaemonEnabled()
{
  return _ASActivitySharingDaemonEnabled();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
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