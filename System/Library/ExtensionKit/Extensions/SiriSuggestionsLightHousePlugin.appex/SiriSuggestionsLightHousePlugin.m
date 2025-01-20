uint64_t sub_100002490()
{
  uint64_t v0;

  v0 = sub_100003890();
  sub_100002644(v0, static Logger.metricPluginCategory);
  sub_100002564(v0, (uint64_t)static Logger.metricPluginCategory);
  sub_1000037F0();
  return sub_100003880();
}

uint64_t Logger.metricPluginCategory.unsafeMutableAddressor()
{
  if (qword_100008090 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100003890();

  return sub_100002564(v0, (uint64_t)static Logger.metricPluginCategory);
}

uint64_t sub_100002564(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.metricPluginCategory.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100008090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100003890();
  uint64_t v3 = sub_100002564(v2, (uint64_t)static Logger.metricPluginCategory);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t *sub_100002644(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000026A8()
{
  return _swift_task_switch(sub_1000026C4, 0, 0);
}

uint64_t sub_1000026C4()
{
  sub_10000378C();
  objc_allocWithZone((Class)sub_100003820());
  uint64_t v1 = sub_100003810();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100002734()
{
  return _swift_allocObject(v0, 16, 7);
}

uint64_t sub_100002744()
{
  sub_10000378C();
  v0[6] = v1;
  uint64_t v2 = sub_1000037C0();
  v0[7] = v2;
  v0[8] = *(void *)(v2 - 8);
  v0[9] = swift_task_alloc();
  return _swift_task_switch(sub_100002800, 0, 0);
}

uint64_t sub_100002800()
{
  if (qword_100008090 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = sub_100003890();
  v0[10] = sub_100002564(v2, (uint64_t)static Logger.metricPluginCategory);
  id v3 = v1;
  uint64_t v4 = sub_100003870();
  os_log_type_t v5 = sub_1000038A0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[6];
  v21 = v0;
  if (v6)
  {
    v20 = v4;
    v8 = v0 + 5;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (void *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    void *v8 = v7;
    id v11 = v7;
    uint64_t v4 = v20;
    sub_1000038C0();
    void *v10 = v7;

    _os_log_impl((void *)&_mh_execute_header, v20, v5, "SiriSuggestionsLightHousePlugin invoked: with %@", v9, 0xCu);
    sub_1000036DC(&qword_100008178);
    swift_arrayDestroy();
    sub_100003768((uint64_t)v10);
    sub_100003768((uint64_t)v9);
  }
  else
  {
  }
  v12 = sub_100003870();
  os_log_type_t v13 = sub_1000038A0();
  if (sub_10000373C(v13))
  {
    v14 = (uint8_t *)sub_100003798();
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v7, "running DefaultConversionLogger from lighthouse plugin", v14, 2u);
    sub_100003768((uint64_t)v14);
  }

  sub_100003860();
  uint64_t v15 = sub_100003850();
  v21[11] = v15;
  sub_1000037B0();
  v19 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v15 + 216) + **(int **)(*(void *)v15 + 216));
  v16 = (void *)swift_task_alloc();
  v21[12] = v16;
  void *v16 = v21;
  v16[1] = sub_100002BB8;
  uint64_t v17 = v21[9];
  return v19(v17);
}

uint64_t sub_100002BB8()
{
  uint64_t v2 = (void *)*v1;
  sub_100003780();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
  if (v0) {
    os_log_type_t v5 = sub_10000302C;
  }
  else {
    os_log_type_t v5 = sub_100002D1C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100002D1C()
{
  uint64_t v2 = sub_100003870();
  os_log_type_t v3 = sub_1000038A0();
  if (sub_10000373C(v3))
  {
    uint64_t v4 = (uint8_t *)sub_100003798();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Building the AutoComplete index via SiriSuggestionsLightHousePlugin", v4, 2u);
    sub_100003768((uint64_t)v4);
  }

  sub_1000037E0();
  *(void *)(v1 + 112) = sub_1000037D0();
  uint64_t v7 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.run(onStartUpEvent:)
                                      + async function pointer to dispatch thunk of SiriAutoCompleteIndexBuilder.run(onStartUpEvent:));
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 120) = v5;
  *os_log_type_t v5 = v1;
  v5[1] = sub_100002E34;
  return v7(0);
}

uint64_t sub_100002E34()
{
  sub_10000378C();
  sub_100003724();
  sub_100003780();
  *uint64_t v2 = v1;
  *(void *)(v1 + 16) = v0;
  *(void *)(v1 + 24) = v3;
  uint64_t v4 = *v0;
  sub_100003780();
  *os_log_type_t v5 = v4;
  swift_task_dealloc();
  return _swift_task_switch(sub_100002F04, 0, 0);
}

uint64_t sub_100002F04()
{
  uint64_t v2 = sub_100003870();
  os_log_type_t v3 = sub_1000038A0();
  if (sub_10000373C(v3))
  {
    uint64_t v4 = *(void *)(v1 + 24);
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 134217984;
    *(void *)(v1 + 32) = v4;
    sub_1000038C0();
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Number of phrases added to the index from lighthouse plugin: %ld", v5, 0xCu);
    sub_100003768((uint64_t)v5);
  }

  id v6 = objc_allocWithZone((Class)sub_100003820());
  sub_100003810();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v7 = sub_100003758();
  return v8(v7);
}

uint64_t sub_10000302C()
{
  swift_release();
  os_log_type_t v0 = sub_100003870();
  os_log_type_t v1 = sub_1000038B0();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)sub_100003798();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "error running the lighthouse plugin", v2, 2u);
    sub_100003768((uint64_t)v2);
  }

  id v3 = objc_allocWithZone((Class)sub_100003820());
  sub_100003810();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v4 = sub_100003758();
  return v5(v4);
}

uint64_t sub_100003124()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100003134()
{
  os_log_type_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *os_log_type_t v1 = v0;
  v1[1] = sub_100003720;
  return sub_1000026A8();
}

uint64_t sub_1000031C0()
{
  os_log_type_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *os_log_type_t v1 = v0;
  v1[1] = sub_100003254;
  return sub_100002744();
}

uint64_t sub_100003254()
{
  sub_10000378C();
  sub_100003724();
  uint64_t v1 = *v0;
  sub_100003780();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_100003758();
  return v4(v3);
}

uint64_t sub_10000331C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100003400;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100003400()
{
  sub_10000378C();
  sub_100003724();
  uint64_t v1 = *v0;
  sub_100003780();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_1000034C8()
{
  uint64_t v0 = type metadata accessor for SiriSuggestionsLightHousePlugin();
  uint64_t v1 = sub_10000369C(&qword_100008170);

  return MLHostExtension.configuration.getter(v0, v1);
}

uint64_t sub_100003534@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100002734();
  *a1 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for SiriSuggestionsLightHousePlugin()
{
  return self;
}

uint64_t sub_1000035F8()
{
  return sub_10000369C(&qword_100008098);
}

uint64_t sub_10000362C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000369C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriSuggestionsLightHousePlugin();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000036DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

BOOL sub_10000373C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100003758()
{
  return v0;
}

uint64_t sub_100003768(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_100003798()
{
  return swift_slowAlloc();
}

uint64_t sub_1000037B0()
{
  return static InteractionStore.inProcess()();
}

uint64_t sub_1000037C0()
{
  return type metadata accessor for InteractionStore();
}

uint64_t sub_1000037D0()
{
  return SiriAutoCompleteIndexBuilder.__allocating_init()();
}

uint64_t sub_1000037E0()
{
  return type metadata accessor for SiriAutoCompleteIndexBuilder();
}

uint64_t sub_1000037F0()
{
  return static Logger.subsystem.getter();
}

uint64_t sub_100003800()
{
  return static AppExtension.main()();
}

uint64_t sub_100003810()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100003820()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100003850()
{
  return DefaultConversionLogger.__allocating_init()();
}

uint64_t sub_100003860()
{
  return type metadata accessor for DefaultConversionLogger();
}

uint64_t sub_100003870()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003880()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003890()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000038A0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000038B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000038C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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