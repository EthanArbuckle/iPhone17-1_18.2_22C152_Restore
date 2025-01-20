int main(int argc, const char **argv, const char **envp)
{
  os_transaction_create();
  sub_100003540();
  swift_unknownObjectRelease();
  dispatch_main();
}

id sub_100003540()
{
  uint64_t v0 = sub_100003770();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000036D0();
  sub_100003740();
  sub_100003750();
  v4 = sub_100003760();
  os_log_type_t v5 = sub_100003780();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting knowledgeconstructiond", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003730();
  return [self registerForLaunchEvents];
}

unint64_t sub_1000036D0()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for KnowledgeConstructionDaemon()
{
  return &type metadata for KnowledgeConstructionDaemon;
}

uint64_t sub_100003730()
{
  return static KnowledgeConstructionSystem.start()();
}

uint64_t sub_100003740()
{
  return static Daemon.enterSandbox(identifier:macOSProfile:)();
}

uint64_t sub_100003750()
{
  return static Logging.mdlog.getter();
}

uint64_t sub_100003760()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003770()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003780()
{
  return static os_log_type_t.default.getter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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