uint64_t sub_1000036CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;
  long long v11;
  uint64_t v12;
  void *v13;

  v1 = v0;
  v2 = sub_100003C40();
  v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003C20();
  v6 = sub_100003C30();
  v7 = sub_100003C50();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing XPC Service", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v12 = sub_100003BF0();
  v13 = &protocol witness table for ImageProcessingImplementation;
  sub_100003B54((uint64_t *)&v11);
  sub_100003BE0();
  sub_100003BB8(&v11, v1 + 16);
  return v1;
}

void sub_100003844()
{
  swift_allocObject();
  sub_1000036CC();
  sub_100003B14((unint64_t *)&unk_100008160);
  v0 = (void *)sub_100003BD0();
  swift_release();
}

uint64_t sub_1000038D4()
{
  sub_100003AC4(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_10000390C()
{
  sub_100003A80((void *)(*(void *)v0 + 16), *(void *)(*(void *)v0 + 40));
  return sub_100003C00();
}

uint64_t sub_10000396C()
{
  sub_100003A80((void *)(*(void *)v0 + 16), *(void *)(*(void *)v0 + 40));
  return sub_100003C10();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for FinanceImageProcessingService()
{
  return self;
}

uint64_t sub_100003A4C()
{
  return sub_100003B14(&qword_100008158);
}

void *sub_100003A80(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100003AC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003B14(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FinanceImageProcessingService();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_100003B54(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100003BB8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100003BD0()
{
  return ImageProcessingXPCService.listener.getter();
}

uint64_t sub_100003BE0()
{
  return ImageProcessingImplementation.init()();
}

uint64_t sub_100003BF0()
{
  return type metadata accessor for ImageProcessingImplementation();
}

uint64_t sub_100003C00()
{
  return dispatch thunk of ImageProcessingXPCServiceProviding.backgroundColor(forImageWithData:)();
}

uint64_t sub_100003C10()
{
  return dispatch thunk of ImageProcessingXPCServiceProviding.renderThumbnail(with:size:scale:options:)();
}

uint64_t sub_100003C20()
{
  return static Logger.financeStore.getter();
}

uint64_t sub_100003C30()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003C40()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003C50()
{
  return static os_log_type_t.default.getter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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