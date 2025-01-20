uint64_t sub_10000317C()
{
  uint64_t v0;

  v0 = sub_100003B70();
  sub_100003A98(v0, qword_100008150);
  sub_100003A60(v0, (uint64_t)qword_100008150);
  return sub_100003B60();
}

uint64_t sub_1000031F8()
{
  v3 = (uint64_t (__cdecl *)())((char *)&dword_100008030 + dword_100008030);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100003AFC;
  return v3();
}

uint64_t sub_100003298()
{
  v3 = (uint64_t (__cdecl *)())((char *)&dword_100008028 + dword_100008028);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100003338;
  return v3();
}

uint64_t sub_100003338(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100003434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_100003518;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100003518()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000360C(uint64_t a1)
{
  unint64_t v2 = sub_100003774();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000036B8()
{
  unint64_t result = qword_100008000[0];
  if (!qword_100008000[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConditionalEngineLighthouseExtension()
{
  return &type metadata for ConditionalEngineLighthouseExtension;
}

uint64_t sub_100003720()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100003774()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t sub_1000037C8()
{
  return _swift_task_switch(sub_1000037E4, 0, 0);
}

uint64_t sub_1000037E4()
{
  if (qword_100008040 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100003B70();
  sub_100003A60(v1, (uint64_t)qword_100008150);
  unint64_t v2 = sub_100003B50();
  os_log_type_t v3 = sub_100003B80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "ConditionalEngineLighthouseExtension shouldRun", v4, 2u);
    swift_slowDealloc();
  }

  objc_allocWithZone((Class)sub_100003B20());
  uint64_t v5 = sub_100003B10();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

uint64_t sub_100003914()
{
  return _swift_task_switch(sub_100003930, 0, 0);
}

uint64_t sub_100003930()
{
  if (qword_100008040 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100003B70();
  sub_100003A60(v1, (uint64_t)qword_100008150);
  unint64_t v2 = sub_100003B50();
  os_log_type_t v3 = sub_100003B80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "ConditionalEngineLighthouseExtension doWork", v4, 2u);
    swift_slowDealloc();
  }

  objc_allocWithZone((Class)sub_100003B20());
  uint64_t v5 = sub_100003B10();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

uint64_t sub_100003A60(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003A98(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003B00()
{
  return static AppExtension.main()();
}

uint64_t sub_100003B10()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100003B20()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100003B50()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003B60()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003B70()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003B80()
{
  return static os_log_type_t.default.getter();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
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