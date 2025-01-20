id sub_1000036D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MPSpotlightIndexExtensionHandler();
  return [super dealloc];
}

uint64_t sub_100003788()
{
  return type metadata accessor for MPSpotlightIndexExtensionHandler();
}

uint64_t type metadata accessor for MPSpotlightIndexExtensionHandler()
{
  uint64_t result = qword_1000081D8;
  if (!qword_1000081D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000037DC()
{
  uint64_t result = sub_100003AA8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_100003878(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = sub_100003A58();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(a1 + OBJC_IVAR___MPSpotlightIndexExtensionHandler_featureFlags);
  id result = [v10 callHistorySearchEnabled];
  if (result)
  {
    v12 = sub_100003A88();
    os_log_type_t v13 = sub_100003AB8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, a3, v14, 2u);
      swift_slowDealloc();
    }

    [self setCallsNeedsDeferredReindexingForReason:4];
    if ([v10 voicemailSearchEnabled])
    {
      sub_100003A78();
      sub_100003A48();
      sub_100003A68();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return (id)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t sub_100003A48()
{
  return static SpotlightReindexingReason.spotlightRequested.getter();
}

uint64_t sub_100003A58()
{
  return type metadata accessor for SpotlightReindexingReason();
}

uint64_t sub_100003A68()
{
  return static SpotlightIndexManagerUtilities.setVoicemailsNeedsDeferredReindexing(for:defaults:)();
}

uint64_t sub_100003A78()
{
  return type metadata accessor for SpotlightIndexManagerUtilities();
}

uint64_t sub_100003A88()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003A98()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003AA8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003AB8()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}