uint64_t BuiltInInferenceProvider.inferenceProvider.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t (**v11)(void);
  uint64_t result;
  BOOL v13;
  uint64_t v18;
  BOOL v19;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  Swift::String v33;

  v2 = v1;
  v4 = sub_1000034B0();
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for BuiltInInferenceProvider.tokenGeneration(_:))
  {
    sub_100003540();
    sub_100002184();
    v9 = sub_100003530();
    v30 = v2;
    v10 = (unint64_t *)&unk_1000080D8;
    v11 = &type metadata accessor for OnDeviceInferenceProvider;
LABEL_3:
    v31 = sub_10000213C(v10, (void (*)(uint64_t))v11);
    v28 = v9;
    a1[3] = sub_1000034C0();
    a1[4] = (uint64_t)&protocol witness table for InferenceProviderAdapter;
    sub_1000020D8(a1);
    return sub_1000034D0();
  }
  if (v8 == enum case for BuiltInInferenceProvider.visualGeneration(_:))
  {
    if (&class metadata base offset for ModelManagerInferenceProvider) {
      v13 = &protocol conformance descriptor for ModelManagerInferenceProvider == 0;
    }
    else {
      v13 = 1;
    }
    if (!v13
      && &type metadata accessor for ModelManagerInferenceProvider != 0
      && &type metadata for ModelManagerInferenceProvider != 0
      && &nominal type descriptor for ModelManagerInferenceProvider != 0
      && &metaclass for ModelManagerInferenceProvider != 0)
    {
      sub_100003450();
      sub_100002184();
      v18 = sub_100003440();
      a1[3] = v2;
      result = sub_10000213C(&qword_1000080D0, (void (*)(uint64_t))&type metadata accessor for ModelManagerInferenceProvider);
      a1[4] = result;
      *a1 = v18;
      return result;
    }
    goto LABEL_40;
  }
  if (v8 == enum case for BuiltInInferenceProvider.safetyGeneration(_:))
  {
    if (&class metadata base offset for TextModerationLMInferenceProvider) {
      v19 = &protocol conformance descriptor for TextModerationLMInferenceProvider == 0;
    }
    else {
      v19 = 1;
    }
    if (!v19
      && &type metadata accessor for TextModerationLMInferenceProvider != 0
      && &type metadata for TextModerationLMInferenceProvider != 0
      && &nominal type descriptor for TextModerationLMInferenceProvider != 0
      && &metaclass for TextModerationLMInferenceProvider != 0)
    {
      sub_100003560();
      sub_100002184();
      v9 = sub_100003550();
      v30 = v2;
      v10 = (unint64_t *)&unk_1000080C8;
      v11 = &type metadata accessor for TextModerationLMInferenceProvider;
      goto LABEL_3;
    }
LABEL_40:
    v24 = sub_100003490();
    sub_100002070();
    swift_allocError();
    v26 = v25;
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_100003680(38);
    swift_bridgeObjectRelease();
    v28 = 0xD000000000000013;
    v29 = 0x8000000100003A70;
    v32._countAndFlagsBits = sub_1000034A0();
    sub_100003600(v32);
    swift_bridgeObjectRelease();
    v33._object = (void *)0x8000000100003A90;
    v33._countAndFlagsBits = 0xD000000000000011;
    sub_100003600(v33);
    sub_1000035F0();
    sub_100003480();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, enum case for InferenceError.notImplemented(_:), v24);
    return swift_willThrow();
  }
  result = sub_100003690();
  __break(1u);
  return result;
}

unint64_t sub_100002070()
{
  unint64_t result = qword_1000080C0;
  if (!qword_1000080C0)
  {
    sub_100003490();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080C0);
  }
  return result;
}

uint64_t sub_1000020C0@<X0>(uint64_t *a1@<X8>)
{
  return BuiltInInferenceProvider.inferenceProvider.getter(a1);
}

uint64_t *sub_1000020D8(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000213C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002184()
{
  return swift_allocObject();
}

uint64_t sub_1000021A0()
{
  uint64_t v0 = sub_100003590();
  sub_100003354(v0, qword_1000080E0);
  sub_100002E0C(v0, (uint64_t)qword_1000080E0);
  sub_100003470();
  return sub_100003580();
}

uint64_t sub_10000220C()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t sub_100002234()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10000226C()
{
  return swift_retain();
}

uint64_t sub_100002274@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = sub_10000226C();
  *a1 = v3;
  return result;
}

uint64_t sub_1000022A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000220C();
  *a1 = result;
  return result;
}

uint64_t sub_1000022C8()
{
  return 0;
}

uint64_t sub_1000022D0(_xpc_connection_s *a1)
{
  uint64_t v2 = v1;
  sub_100002DAC(&qword_1000081C0);
  __chkstk_darwin();
  sub_100003414();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100003500();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  sub_100003414();
  v11 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v10 - v9);
  pid_t pid = xpc_connection_get_pid(a1);
  sub_100003520();
  *v11 = sub_100002750;
  v11[1] = 0;
  (*(void (**)(uint64_t (**)@<X0>(uint64_t *@<X8>), void, uint64_t))(v8 + 104))(v11, enum case for InferenceProviderXPCRequestDispatcher.ProviderConfiguration.uninitializedBuiltIn(_:), v7);
  sub_100003510();
  sub_100002DAC(&qword_1000081C8);
  swift_retain();
  sub_1000034F0();
  sub_1000035D0();
  *(_DWORD *)(swift_allocObject() + 16) = pid;
  sub_1000035C0();
  __chkstk_darwin();
  sub_100003414();
  swift_unknownObjectRetain();
  swift_retain();
  sub_1000035B0();
  uint64_t v13 = sub_1000035A0();
  uint64_t v14 = sub_100003650();
  sub_100002FE8(v6, 1, 1, v14);
  sub_100003630();
  swift_retain();
  swift_retain();
  uint64_t v15 = sub_100003620();
  v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v2;
  v16[5] = v13;
  sub_100002B10(v6, (uint64_t)&unk_1000081E0, (uint64_t)v16);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100002750@<X0>(uint64_t *a1@<X8>)
{
  return BuiltInInferenceProvider.inferenceProvider.getter(a1);
}

void sub_100002774(uint64_t a1, int a2)
{
  if (qword_1000080B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100003590();
  sub_100002E0C(v4, (uint64_t)qword_1000080E0);
  uint64_t v5 = sub_1000035E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a1, v5);
  uint64_t v10 = sub_100003570();
  os_log_type_t v11 = sub_100003660();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67109378;
    int v17 = a2;
    sub_100003670();
    *(_WORD *)(v12 + 8) = 2112;
    v16[1] = v12 + 10;
    sub_1000033B8();
    swift_allocError();
    v9(v14, (uint64_t)v8, v5);
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v16[2] = v15;
    sub_100003670();
    *uint64_t v13 = v15;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Session with host process with %d was cancelled: %@", (uint8_t *)v12, 0x12u);
    sub_100002DAC(&qword_1000081D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  exit(1);
}

uint64_t sub_1000029F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_100003630();
  v5[4] = sub_100003620();
  uint64_t v7 = sub_100003610();
  return _swift_task_switch(sub_100002A90, v7, v6);
}

uint64_t sub_100002A90()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_release();
  *(void *)(v2 + 16) = v1;
  swift_retain();
  swift_release();
  sub_100003434();
  return v3();
}

uint64_t sub_100002B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100003650();
  if (sub_1000031DC(a1, 1, v6) == 1)
  {
    sub_100003204(a1);
  }
  else
  {
    sub_100003640();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100003610();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100002C78(_xpc_connection_s *a1)
{
  return sub_1000022D0(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for BuiltInInferenceProviderService()
{
  return self;
}

uint64_t sub_100002D38()
{
  return sub_100002D6C(&qword_1000081B8);
}

uint64_t sub_100002D6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BuiltInInferenceProviderService();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100002DAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002DF4()
{
  return _swift_deallocObject(v0, 20, 7);
}

void sub_100002E04(uint64_t a1)
{
  sub_100002774(a1, *(_DWORD *)(v1 + 16));
}

uint64_t sub_100002E0C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002E44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100002F20;
  return v6(a1);
}

uint64_t sub_100002F20()
{
  sub_1000033FC();
  uint64_t v1 = *v0;
  sub_100003424();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100003434();
  return v3();
}

uint64_t sub_100002FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100003010()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100003058(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100003118;
  return sub_1000029F8(a1, v4, v5, v7, v6);
}

uint64_t sub_100003118()
{
  sub_1000033FC();
  uint64_t v1 = *v0;
  sub_100003424();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_100003434();
  return v3();
}

uint64_t sub_1000031DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100003204(uint64_t a1)
{
  uint64_t v2 = sub_100002DAC(&qword_1000081C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003264()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000329C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100003118;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000081E8 + dword_1000081E8);
  return v6(a1, v4);
}

uint64_t *sub_100003354(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000033B8()
{
  unint64_t result = qword_1000081F8;
  if (!qword_1000081F8)
  {
    sub_1000035E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000081F8);
  }
  return result;
}

uint64_t sub_100003434()
{
  return v0 + 8;
}

uint64_t sub_100003440()
{
  return ModelManagerInferenceProvider.init()();
}

uint64_t sub_100003450()
{
  return type metadata accessor for ModelManagerInferenceProvider();
}

uint64_t sub_100003460()
{
  return static AppExtension.main()();
}

uint64_t sub_100003470()
{
  return subsystemName.getter();
}

uint64_t sub_100003480()
{
  return InferenceError.Context.init(additionalDescription:domain:code:userInfo:fallbackAllowed:)();
}

uint64_t sub_100003490()
{
  return type metadata accessor for InferenceError();
}

uint64_t sub_1000034A0()
{
  return BuiltInInferenceProvider.rawValue.getter();
}

uint64_t sub_1000034B0()
{
  return type metadata accessor for BuiltInInferenceProvider();
}

uint64_t sub_1000034C0()
{
  return type metadata accessor for InferenceProviderAdapter();
}

uint64_t sub_1000034D0()
{
  return InferenceProviderAdapter.init(_:)();
}

uint64_t sub_1000034E0()
{
  return dispatch thunk of TaskCancellingXPCPeerHandler.handleIncomingRequest(_:)();
}

uint64_t sub_1000034F0()
{
  return TaskCancellingXPCPeerHandler.__allocating_init(handler:)();
}

uint64_t sub_100003500()
{
  return type metadata accessor for InferenceProviderXPCRequestDispatcher.ProviderConfiguration();
}

uint64_t sub_100003510()
{
  return InferenceProviderXPCRequestDispatcher.__allocating_init(configuration:)();
}

uint64_t sub_100003520()
{
  return type metadata accessor for InferenceProviderXPCRequestDispatcher();
}

uint64_t sub_100003530()
{
  return OnDeviceInferenceProvider.init()();
}

uint64_t sub_100003540()
{
  return type metadata accessor for OnDeviceInferenceProvider();
}

uint64_t sub_100003550()
{
  return TextModerationLMInferenceProvider.init()();
}

uint64_t sub_100003560()
{
  return type metadata accessor for TextModerationLMInferenceProvider();
}

uint64_t sub_100003570()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003580()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003590()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000035A0()
{
  return XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)();
}

uint64_t sub_1000035B0()
{
  return static XPCSession.InitializationOptions.none.getter();
}

uint64_t sub_1000035C0()
{
  return type metadata accessor for XPCSession.InitializationOptions();
}

uint64_t sub_1000035D0()
{
  return type metadata accessor for XPCSession();
}

uint64_t sub_1000035E0()
{
  return type metadata accessor for XPCRichError();
}

uint64_t sub_1000035F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

void sub_100003600(Swift::String a1)
{
}

uint64_t sub_100003610()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100003620()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100003630()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100003640()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100003650()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100003660()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100003670()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_100003680(Swift::Int a1)
{
}

uint64_t sub_100003690()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t self
{
  return _self;
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
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

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}