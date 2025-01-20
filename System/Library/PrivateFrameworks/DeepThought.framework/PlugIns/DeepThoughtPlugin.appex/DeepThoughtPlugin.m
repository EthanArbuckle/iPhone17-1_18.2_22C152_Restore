uint64_t variable initialization expression of DeepThoughtPlugin.logger()
{
  return Logger.init(subsystem:category:)();
}

uint64_t variable initialization expression of DeepThoughtPlugin.processor()
{
  return 0;
}

uint64_t DeepThoughtPlugin.perform(_:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = type metadata accessor for LighthouseRuntimeProcessorResult();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SiriPenetrationRateMetrics();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = SiriPenetrationRateMetrics.init(bookmarkLocation:)();
  if (!v2)
  {
    v14[1] = v10;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LighthouseRuntimeProcessor<SiriPenetrationRateMetrics>);
    swift_allocObject();
    id v11 = a1;
    uint64_t v12 = LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)();
    if (v12)
    {
      *(void *)(v3 + OBJC_IVAR___DeepThoughtPlugin_processor) = v12;
      swift_retain();
      swift_release();
      LighthouseRuntimeProcessor.process()();
      uint64_t v9 = LighthouseRuntimeProcessorResult.mlrTaskResult.getter();
      swift_release();
    }
    else
    {
      (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for LighthouseRuntimeProcessorResult.notAllowedToProcess(_:), v5);
      uint64_t v9 = LighthouseRuntimeProcessorResult.mlrTaskResult.getter();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

Swift::Void __swiftcall DeepThoughtPlugin.stop()()
{
  uint64_t v1 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "stop was called", v4, 2u);
    swift_slowDealloc();
  }

  if (*(void *)(v1 + OBJC_IVAR___DeepThoughtPlugin_processor))
  {
    swift_retain();
    LighthouseRuntimeProcessor.stop()();
    swift_release();
  }
}

id DeepThoughtPlugin.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id DeepThoughtPlugin.init()()
{
  id v1 = v0;
  Logger.init(subsystem:category:)();
  *(void *)&v1[OBJC_IVAR___DeepThoughtPlugin_processor] = 0;

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for DeepThoughtPlugin();
  return objc_msgSendSuper2(&v3, "init");
}

id DeepThoughtPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeepThoughtPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DeepThoughtPlugin()
{
  uint64_t result = type metadata singleton initialization cache for DeepThoughtPlugin;
  if (!type metadata singleton initialization cache for DeepThoughtPlugin) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ObjC metadata update function for DeepThoughtPlugin()
{
  return type metadata accessor for DeepThoughtPlugin();
}

uint64_t type metadata completion function for DeepThoughtPlugin()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t SiriPenetrationRateMetrics.init(bookmarkLocation:)()
{
  return SiriPenetrationRateMetrics.init(bookmarkLocation:)();
}

uint64_t type metadata accessor for SiriPenetrationRateMetrics()
{
  return type metadata accessor for SiriPenetrationRateMetrics();
}

Swift::Void __swiftcall LighthouseRuntimeProcessor.stop()()
{
}

uint64_t LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)()
{
  return LighthouseRuntimeProcessor.init(task:plugin:enforceDiagnosticCheck:)();
}

uint64_t LighthouseRuntimeProcessor.process()()
{
  return LighthouseRuntimeProcessor.process()();
}

uint64_t LighthouseRuntimeProcessorResult.mlrTaskResult.getter()
{
  return LighthouseRuntimeProcessorResult.mlrTaskResult.getter();
}

uint64_t type metadata accessor for LighthouseRuntimeProcessorResult()
{
  return type metadata accessor for LighthouseRuntimeProcessorResult();
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

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}