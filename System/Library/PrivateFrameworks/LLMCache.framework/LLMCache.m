uint64_t ListResponse.entries.getter()
{
  return swift_bridgeObjectRetain();
}

LLMCache::ListResponse __swiftcall ListResponse.init(entries:)(LLMCache::ListResponse entries)
{
  v1->entries._rawValue = entries.entries._rawValue;
  return entries;
}

uint64_t CacheEntry.llmOutput.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CacheEntry.isExactMatch.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

LLMCache::CacheEntry __swiftcall CacheEntry.init(llmOutput:isExactMatch:)(Swift::String llmOutput, Swift::Bool isExactMatch)
{
  *(Swift::String *)uint64_t v2 = llmOutput;
  *(unsigned char *)(v2 + 16) = isExactMatch;
  result.llmOutput = llmOutput;
  result.isExactMatch = isExactMatch;
  return result;
}

id default argument 0 of static Logger.makeSignpostID(log:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.log;
  return v0;
}

id default argument 1 of static Logger.withSignpost<A>(name:log:completion:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.log;
  return v0;
}

uint64_t default argument 3 of BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)()
{
  return MEMORY[0x263F8EE78];
}

ValueMetadata *type metadata accessor for ListResponse()
{
  return &type metadata for ListResponse;
}

uint64_t destroy for CacheEntry()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for CacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CacheEntry(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CacheEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CacheEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CacheEntry()
{
  return &type metadata for CacheEntry;
}

void AnnotatedCacheEntryBuilder.namespace.setter()
{
}

BOOL Logger.Subsystem.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

unint64_t Logger.Subsystem.rawValue.getter()
{
  return 0xD000000000000017;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Subsystem()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Subsystem()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Subsystem()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Subsystem(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x8000000254463C00;
}

LLMCache::Logger::Category_optional __swiftcall Logger.Category.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = LLMCache_Logger_Category_instrumentation;
  }
  else {
    v4.value = LLMCache_Logger_Category_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t Logger.Category.rawValue.getter(char a1)
{
  if (a1) {
    return 0x656D757274736E49;
  }
  else {
    return 0x6E614D6568636143;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Category(unsigned char *a1, unsigned char *a2)
{
  BOOL v2 = *a1 == 0;
  if (*a1) {
    uint64_t v3 = 0x656D757274736E49;
  }
  else {
    uint64_t v3 = 0x6E614D6568636143;
  }
  if (v2) {
    unint64_t v4 = 0xEC00000072656761;
  }
  else {
    unint64_t v4 = 0xEF6E6F697461746ELL;
  }
  if (*a2) {
    uint64_t v5 = 0x656D757274736E49;
  }
  else {
    uint64_t v5 = 0x6E614D6568636143;
  }
  if (*a2) {
    unint64_t v6 = 0xEF6E6F697461746ELL;
  }
  else {
    unint64_t v6 = 0xEC00000072656761;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Category()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Category()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Category()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Category@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Category(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6E614D6568636143;
  if (*v1) {
    uint64_t v2 = 0x656D757274736E49;
  }
  unint64_t v3 = 0xEC00000072656761;
  if (*v1) {
    unint64_t v3 = 0xEF6E6F697461746ELL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t one-time initialization function for log()
{
  type metadata accessor for OS_os_log();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  static Logger.log = result;
  return result;
}

uint64_t *Logger.log.unsafeMutableAddressor()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  return &static Logger.log;
}

id static Logger.log.getter()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Logger.log;
  return v0;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.logger);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.logger);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v1 = (id)static Logger.log;
  return Logger.init(_:)();
}

uint64_t Logger.logger.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t)static Logger.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for logger, (uint64_t)static Logger.logger, a1);
}

uint64_t one-time initialization function for instrumentation()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.instrumentation);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.instrumentation);
  type metadata accessor for OS_os_log();
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t Logger.instrumentation.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation);
}

uint64_t Logger.logger.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation, a1);
}

uint64_t static Logger.logger.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t static Logger.makeSignpostID(log:)(void *a1)
{
  id v1 = a1;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, MEMORY[0x263F902A0]);
}

uint64_t static Logger.event(_:log:)()
{
  uint64_t v0 = type metadata accessor for OSSignpostID();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_signpost_type_t.event.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static Logger.end(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, MEMORY[0x263F90298]);
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static Logger.withSignpost<A>(name:log:completion:)(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  int v18 = a3;
  v17[0] = a1;
  v17[1] = a2;
  uint64_t v7 = type metadata accessor for OSSignpostID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OS_os_log.signpostsEnabled.getter();
  if ((v12 & 1) == 0) {
    return a5(v12, v13);
  }
  id v14 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  uint64_t v15 = os_signpost(_:dso:log:name:signpostID:)();
  ((void (*)(uint64_t))a5)(v15);
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

unint64_t lazy protocol witness table accessor for type Logger.Subsystem and conformance Logger.Subsystem()
{
  unint64_t result = lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem;
  if (!lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Logger.Category and conformance Logger.Category()
{
  unint64_t result = lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category;
  if (!lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category);
  }
  return result;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t getEnumTagSinglePayload for Logger.Subsystem(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for Logger.Subsystem(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x254435918);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for Logger.Subsystem()
{
  return 0;
}

ValueMetadata *type metadata accessor for Logger.Subsystem()
{
  return &type metadata for Logger.Subsystem;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Category(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Logger.Category(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254435AC4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for Logger.Category(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Logger.Category(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Logger.Category()
{
  return &type metadata for Logger.Category;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

uint64_t BiomeLogEmitter.emitInsertStarted(clientTraceId:namespace:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v63 = v7;
  uint64_t v64 = v8;
  MEMORY[0x270FA5388](v7, v9);
  v62 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v13 = MEMORY[0x270FA5388](v11 - 8, v12);
  v61 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v15);
  v67 = (char *)&v55 - v16;
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v65 = *(void *)(v17 - 8);
  uint64_t v66 = v17;
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v22);
  v24 = (char *)&v55 - v23;
  uint64_t v25 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v69 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25, v26);
  v29 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27, v30);
  v32 = (char *)&v55 - v31;
  char v33 = *a2;
  UUID.init()();
  LOBYTE(v72[0]) = v33;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v3 + 144))(a3, a1, v72);
  LOBYTE(v72[0]) = 3;
  v34 = *(void (**)(uint64_t, void, uint64_t *))(*(void *)v3 + 152);
  v70 = v29;
  v34(a3, 0, v72);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v56 = v21;
  uint64_t v57 = a3;
  uint64_t v60 = v25;
  uint64_t v59 = v74;
  v58 = __swift_project_boxed_opaque_existential_1(v72, v73);
  uint64_t v35 = (uint64_t)v67;
  v68 = v32;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  uint64_t v36 = v65;
  uint64_t v37 = v66;
  v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
  if (v55(v35, 1, v66) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?(v35, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v24, v35, v37);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  v38 = *(void (**)(char *, uint64_t))(v36 + 8);
  v38(v24, v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v72);
  static StreamResource.source()();
  __swift_project_boxed_opaque_existential_1(v72, v73);
  uint64_t v39 = (uint64_t)v61;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if (v55(v39, 1, v37) == 1)
  {
    v40 = v56;
    static Date.now.getter();
    outlined destroy of Date?(v39, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    v40 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v56, v39, v37);
  }
  uint64_t v41 = v64;
  uint64_t v42 = v57;
  dispatch thunk of Source.sendEvent(_:date:)();
  v38(v40, v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v72);
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v43 = type metadata accessor for Logger();
  __swift_project_value_buffer(v43, (uint64_t)static Logger.instrumentation);
  v44 = v62;
  uint64_t v45 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v62, v42, v63);
  v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v72[0] = v49;
    *(_DWORD *)v48 = 136315138;
    uint64_t v50 = UUID.uuidString.getter();
    uint64_t v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v45);
    _os_log_impl(&dword_254432000, v46, v47, "Emitted invocation and insertStarted logging events, cmId: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v49, -1, -1);
    MEMORY[0x25A27A310](v48, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v45);
  }
  v52 = *(void (**)(char *, uint64_t))(v69 + 8);
  uint64_t v53 = v60;
  v52(v70, v60);
  return ((uint64_t (*)(char *, uint64_t))v52)(v68, v53);
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

unint64_t lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry()
{
  unint64_t result = lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry;
  if (!lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry)
  {
    type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry);
  }
  return result;
}

uint64_t BiomeLogEmitter.emitInsertEnded(cmId:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v38 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v4);
  unsigned int v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v37 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v39 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v16);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v41[0]) = 3;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v1 + 152))(a1, 1, v41);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  v34 = v6;
  uint64_t v35 = v15;
  uint64_t v19 = v38;
  uint64_t v36 = v3;
  __swift_project_boxed_opaque_existential_1(v41, v41[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  uint64_t v20 = v37;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v10, 1, v11) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v10, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v14, v10, v11);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v11);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  uint64_t v21 = v19;
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Logger.instrumentation);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v24 = v34;
  uint64_t v25 = v36;
  v23(v34, a1, v36);
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v41[0] = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v30 = UUID.uuidString.getter();
    uint64_t v40 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v36);
    _os_log_impl(&dword_254432000, v26, v27, "Emitted insertEnded logging events, cmId: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v29, -1, -1);
    MEMORY[0x25A27A310](v28, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v25);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v18, v35);
}

uint64_t BiomeLogEmitter.emitInsertFailed(cmId:error:)(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v40 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v39 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v41 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v43[0]) = *a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v2 + 152))(a1, 2, v43);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  uint64_t v36 = v8;
  uint64_t v37 = v17;
  uint64_t v21 = v40;
  uint64_t v38 = v5;
  __swift_project_boxed_opaque_existential_1(v43, v43[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  uint64_t v22 = v39;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v12, 1, v13) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v12, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v16, v12, v13);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  uint64_t v23 = v21;
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Logger.instrumentation);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v26 = v36;
  uint64_t v27 = v38;
  v25(v36, a1, v38);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v43[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = UUID.uuidString.getter();
    uint64_t v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v38);
    _os_log_impl(&dword_254432000, v28, v29, "Emitted insertFailed logging events, cmId: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v31, -1, -1);
    MEMORY[0x25A27A310](v30, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v27);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v37);
}

uint64_t BiomeLogEmitter.emitSearchStarted(clientTraceId:namespace:listRequest:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v64 = v9;
  uint64_t v65 = v10;
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v63 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v15 = MEMORY[0x270FA5388](v13 - 8, v14);
  v62 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v17);
  v68 = (char *)&v56 - v18;
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v66 = *(void *)(v19 - 8);
  uint64_t v67 = v19;
  uint64_t v21 = MEMORY[0x270FA5388](v19, v20);
  uint64_t v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v24);
  uint64_t v26 = (char *)&v56 - v25;
  uint64_t v27 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v70 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27, v28);
  uint64_t v31 = (char *)&v56 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29, v32);
  v34 = (char *)&v56 - v33;
  LOBYTE(a2) = *a2;
  UUID.init()();
  LOBYTE(v73[0]) = (_BYTE)a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v4 + 144))(a4, a1, v73);
  LOBYTE(v73[0]) = 3;
  uint64_t v35 = *(void (**)(uint64_t, void, uint64_t, void, uint64_t *))(*(void *)v4 + 160);
  uint64_t v71 = v31;
  v35(a4, 0, a3, MEMORY[0x263F8EE78], v73);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  uint64_t v57 = v23;
  uint64_t v58 = a4;
  uint64_t v61 = v27;
  uint64_t v60 = v75;
  uint64_t v59 = __swift_project_boxed_opaque_existential_1(v73, v74);
  uint64_t v36 = (uint64_t)v68;
  uint64_t v69 = v34;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  uint64_t v37 = v66;
  uint64_t v38 = v67;
  v56 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48);
  if (v56(v36, 1, v67) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?(v36, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v26, v36, v38);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v37 + 8);
  v39(v26, v38);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
  static StreamResource.source()();
  __swift_project_boxed_opaque_existential_1(v73, v74);
  uint64_t v40 = (uint64_t)v62;
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if (v56(v40, 1, v38) == 1)
  {
    uint64_t v41 = v57;
    static Date.now.getter();
    outlined destroy of Date?(v40, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    uint64_t v41 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v57, v40, v38);
  }
  uint64_t v42 = v65;
  uint64_t v43 = v58;
  dispatch thunk of Source.sendEvent(_:date:)();
  v39(v41, v38);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v73);
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v44 = type metadata accessor for Logger();
  __swift_project_value_buffer(v44, (uint64_t)static Logger.instrumentation);
  uint64_t v45 = v63;
  uint64_t v46 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v63, v43, v64);
  os_log_type_t v47 = Logger.logObject.getter();
  os_log_type_t v48 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    v73[0] = v50;
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v51 = UUID.uuidString.getter();
    uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v46);
    _os_log_impl(&dword_254432000, v47, v48, "Emitted invocation and searchStarted logging events, cmId: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v50, -1, -1);
    MEMORY[0x25A27A310](v49, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v46);
  }
  uint64_t v53 = *(void (**)(char *, uint64_t))(v70 + 8);
  uint64_t v54 = v61;
  v53(v71, v61);
  return ((uint64_t (*)(char *, uint64_t))v53)(v69, v54);
}

uint64_t BiomeLogEmitter.emitSearchEnded(cmId:listRequest:listResponse:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v39 = a3;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v38 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v40 = *(void *)(v19 - 8);
  uint64_t v41 = v19;
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v43[0]) = 3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t *))(*(void *)v3 + 160))(a1, 1, a2, v39, v43);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  uint64_t v36 = a1;
  uint64_t v37 = v6;
  uint64_t v39 = v9;
  uint64_t v23 = v38;
  __swift_project_boxed_opaque_existential_1(v43, v43[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v14);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  uint64_t v24 = v23;
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)static Logger.instrumentation);
  uint64_t v26 = v39;
  uint64_t v27 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v39, v36, v37);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v43[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = UUID.uuidString.getter();
    uint64_t v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v37);
    _os_log_impl(&dword_254432000, v28, v29, "Emitted searchEnded logging events, cmId: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v31, -1, -1);
    MEMORY[0x25A27A310](v30, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v27);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v22, v41);
}

uint64_t BiomeLogEmitter.emitSearchFailed(cmId:listRequest:error:)(uint64_t a1, char *a2, unsigned char *a3)
{
  uint64_t v40 = a2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v39 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for LLMCacheManagerTelemetry();
  uint64_t v41 = *(void *)(v19 - 8);
  uint64_t v42 = v19;
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v22 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v44[0]) = *a3;
  (*(void (**)(uint64_t, uint64_t, char *, void, uint64_t *))(*(void *)v3 + 160))(a1, 2, v40, MEMORY[0x263F8EE78], v44);
  type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry();
  lazy protocol witness table accessor for type Library.Streams.LLMCache.CacheManagerTelemetry and conformance Library.Streams.LLMCache.CacheManagerTelemetry();
  static StreamResource.source()();
  uint64_t v37 = a1;
  uint64_t v38 = v6;
  uint64_t v40 = v9;
  uint64_t v23 = v39;
  __swift_project_boxed_opaque_existential_1(v44, v44[3]);
  LLMCacheManagerTelemetry.writeTimestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    static Date.now.getter();
    outlined destroy of Date?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v14);
  }
  dispatch thunk of Source.sendEvent(_:date:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  uint64_t v24 = v23;
  if (one-time initialization token for instrumentation != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)static Logger.instrumentation);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  uint64_t v27 = v40;
  uint64_t v28 = v38;
  v26(v40, v37, v38);
  os_log_type_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v44[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v33 = UUID.uuidString.getter();
    uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v38);
    _os_log_impl(&dword_254432000, v29, v30, "Emitted searchFailed logging events, cmId: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v32, -1, -1);
    MEMORY[0x25A27A310](v31, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v28);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v42);
}

uint64_t BiomeLogEmitter.buildInvocationTelemetry(cmId:clientTraceId:namespace:)@<X0>(char *a1@<X0>, char *a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  v56 = a2;
  uint64_t v58 = a1;
  uint64_t v68 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v67 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v66 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x270FA5388](v11 - 8, v12);
  v62 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x270FA5388](v14 - 8, v15);
  uint64_t v60 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CacheManagerTarget();
  uint64_t v64 = *(void *)(v17 - 8);
  uint64_t v65 = v17;
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v63 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerRequestInvocation.CacheManagerNamespace?);
  MEMORY[0x270FA5388](v20 - 8, v21);
  uint64_t v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for CacheManagerRequestInvocation();
  uint64_t v61 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69, v24);
  uint64_t v26 = (char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v27 - 8, v28);
  os_log_type_t v30 = (char *)&v56 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59, v31);
  uint64_t v33 = (char *)&v56 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v34 = *a3;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  uint64_t v35 = type metadata accessor for UUID();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = *(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56);
  v37(v30, 0, 1, v35);
  CacheManagerRequestInvocation.clientTraceId.setter();
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v38(v30, v58, v35);
  v37(v30, 0, 1, v35);
  uint64_t v58 = v33;
  CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  CacheManagerRequestInvocation.init()();
  v38(v30, v56, v35);
  v37(v30, 0, 1, v35);
  CacheManagerRequestInvocation.clientTraceId.setter();
  if (v34)
  {
    if (v34 == 1) {
      uint64_t v39 = (unsigned int *)MEMORY[0x263F4F6F0];
    }
    else {
      uint64_t v39 = (unsigned int *)MEMORY[0x263F4F6E8];
    }
  }
  else
  {
    uint64_t v39 = (unsigned int *)MEMORY[0x263F4F6F8];
  }
  uint64_t v40 = *v39;
  uint64_t v41 = type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v23, v40, v41);
  type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v23, 0, 1, v41);
  CacheManagerRequestInvocation.namespace.setter();
  uint64_t v42 = v61;
  uint64_t v43 = v63;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v63, v26, v69);
  uint64_t v45 = v64;
  uint64_t v44 = v65;
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v43, *MEMORY[0x263F4F6A8], v65);
  LLMCacheManagerTelemetry.init()();
  uint64_t v47 = v57;
  uint64_t v46 = v58;
  uint64_t v49 = v59;
  os_log_type_t v48 = v60;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v60, v58, v59);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v49);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  uint64_t v50 = v62;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v62, v43, v44);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v50, 0, 1, v44);
  LLMCacheManagerTelemetry.target.setter();
  uint64_t v51 = v66;
  static Date.now.getter();
  uint64_t v52 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v51, 0, 1, v52);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  uint64_t v53 = v67;
  static MonotonicTimestamp.nowForSuspendingClock()();
  uint64_t v54 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v53, 0, 1, v54);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v26, v69);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v49);
}

uint64_t CacheNamespace.toBiomeCacheManagerNamespace()@<X0>(uint64_t a1@<X8>)
{
  if (*v1)
  {
    if (*v1 == 1) {
      uint64_t v3 = (unsigned int *)MEMORY[0x263F4F6F0];
    }
    else {
      uint64_t v3 = (unsigned int *)MEMORY[0x263F4F6E8];
    }
  }
  else
  {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F4F6F8];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  return v6(a1, v4, v5);
}

uint64_t BiomeLogEmitter.buildInsertTelemetry(cmId:state:error:)@<X0>(char *a1@<X0>, int a2@<W1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  int v86 = a2;
  v88 = a1;
  uint64_t v99 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x270FA5388](v5 - 8, v6);
  v98 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v8 - 8, v9);
  v97 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x270FA5388](v11 - 8, v12);
  v93 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x270FA5388](v14 - 8, v15);
  v92 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CacheManagerTarget();
  uint64_t v95 = *(void *)(v17 - 8);
  uint64_t v96 = v17;
  MEMORY[0x270FA5388](v17, v18);
  v94 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError?);
  MEMORY[0x270FA5388](v20 - 8, v21);
  v83 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for CacheManagerInsert.Failed();
  uint64_t v84 = *(void *)(v23 - 8);
  uint64_t v85 = v23;
  MEMORY[0x270FA5388](v23, v24);
  v82 = (char *)&v80 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError.ErrorType?);
  uint64_t v28 = MEMORY[0x270FA5388](v26 - 8, v27);
  os_log_type_t v30 = (char *)&v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28, v31);
  uint64_t v33 = (char *)&v80 - v32;
  uint64_t v34 = type metadata accessor for CacheManagerError();
  uint64_t v80 = *(void *)(v34 - 8);
  uint64_t v81 = v34;
  MEMORY[0x270FA5388](v34, v35);
  uint64_t v37 = (char *)&v80 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for CacheManagerInsert();
  uint64_t v90 = *(void *)(v38 - 8);
  uint64_t v91 = v38;
  MEMORY[0x270FA5388](v38, v39);
  v100 = (char *)&v80 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v41 - 8, v42);
  uint64_t v44 = (char *)&v80 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  uint64_t v87 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89, v45);
  uint64_t v47 = (char *)&v80 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = *a3;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  uint64_t v49 = type metadata accessor for UUID();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56);
  v51(v44, 0, 1, v49);
  CacheManagerRequestInvocation.clientTraceId.setter();
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v44, v88, v49);
  v51(v44, 0, 1, v49);
  v88 = v47;
  uint64_t v52 = CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  if ((_BYTE)v86)
  {
    if (v86 == 1)
    {
      uint64_t v53 = v100;
      CacheManagerInsert.Ended.init()();
      CacheManagerInsert.Ended.exists.setter();
      uint64_t v54 = (unsigned int *)MEMORY[0x263F4F668];
    }
    else
    {
      MEMORY[0x25A279660](v52);
      switch(v48)
      {
        case 1:
        case 2:
          v55 = (unsigned int *)MEMORY[0x263F4F658];
          goto LABEL_8;
        case 3:
          uint64_t v57 = type metadata accessor for CacheManagerError.ErrorType();
          uint64_t v59 = *(void *)(v57 - 8);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v30, 1, 1, v57);
          (*(void (**)(char *, void, uint64_t))(v59 + 104))(v33, *MEMORY[0x263F4F658], v57);
          outlined destroy of Date?((uint64_t)v30, &demangling cache variable for type metadata for CacheManagerError.ErrorType?);
          break;
        default:
          v55 = (unsigned int *)MEMORY[0x263F4F660];
LABEL_8:
          uint64_t v56 = *v55;
          uint64_t v57 = type metadata accessor for CacheManagerError.ErrorType();
          (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v30, v56, v57);
          type metadata accessor for CacheManagerError.ErrorType();
          uint64_t v58 = *(void *)(v57 - 8);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v58 + 56))(v30, 0, 1, v57);
          (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v33, v30, v57);
          break;
      }
      type metadata accessor for CacheManagerError.ErrorType();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v33, 0, 1, v57);
      uint64_t v60 = MEMORY[0x25A279650](v33);
      uint64_t v61 = v82;
      MEMORY[0x25A2796B0](v60);
      uint64_t v63 = v80;
      uint64_t v62 = v81;
      uint64_t v64 = v83;
      (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v83, v37, v81);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v64, 0, 1, v62);
      MEMORY[0x25A2796A0](v64);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v37, v62);
      uint64_t v53 = v100;
      (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v100, v61, v85);
      uint64_t v54 = (unsigned int *)MEMORY[0x263F4F670];
    }
  }
  else
  {
    uint64_t v53 = v100;
    CacheManagerInsert.Ended.init()();
    CacheManagerInsert.Ended.exists.setter();
    uint64_t v54 = (unsigned int *)MEMORY[0x263F4F678];
  }
  uint64_t v66 = v90;
  uint64_t v65 = v91;
  (*(void (**)(char *, void, uint64_t))(v90 + 104))(v53, *v54, v91);
  uint64_t v67 = v94;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v94, v53, v65);
  uint64_t v69 = v95;
  uint64_t v68 = v96;
  (*(void (**)(char *, void, uint64_t))(v95 + 104))(v67, *MEMORY[0x263F4F6B0], v96);
  LLMCacheManagerTelemetry.init()();
  uint64_t v71 = v87;
  uint64_t v70 = v88;
  uint64_t v72 = v92;
  uint64_t v73 = v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v92, v88, v89);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v72, 0, 1, v73);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  uint64_t v74 = v93;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v93, v67, v68);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v74, 0, 1, v68);
  LLMCacheManagerTelemetry.target.setter();
  uint64_t v75 = v97;
  static Date.now.getter();
  uint64_t v76 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v75, 0, 1, v76);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  v77 = v98;
  static MonotonicTimestamp.nowForSuspendingClock()();
  uint64_t v78 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v77, 0, 1, v78);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v67, v68);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v100, v65);
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v70, v73);
}

uint64_t LLMCacheManagerError.toBiomeCacheManagerErrorType()@<X0>(uint64_t a1@<X8>)
{
  if (*v1) {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F4F658];
  }
  else {
    uint64_t v3 = (unsigned int *)MEMORY[0x263F4F660];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = type metadata accessor for CacheManagerError.ErrorType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  return v6(a1, v4, v5);
}

uint64_t BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, unsigned __int8 *a5@<X4>, uint64_t a6@<X8>)
{
  v113 = a4;
  uint64_t v111 = a3;
  int v133 = a2;
  uint64_t v131 = a6;
  uint64_t v132 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MonotonicTimestamp?);
  MEMORY[0x270FA5388](v7 - 8, v8);
  v130 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v10 - 8, v11);
  v129 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTarget?);
  MEMORY[0x270FA5388](v13 - 8, v14);
  v125 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerTelemetryEventMetadata?);
  MEMORY[0x270FA5388](v16 - 8, v17);
  v124 = (char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for CacheManagerTarget();
  uint64_t v127 = *(void *)(v19 - 8);
  uint64_t v128 = v19;
  MEMORY[0x270FA5388](v19, v20);
  v126 = (char *)&v106 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError?);
  MEMORY[0x270FA5388](v22 - 8, v23);
  v117 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for CacheManagerSearch.Failed();
  uint64_t v118 = *(void *)(v25 - 8);
  uint64_t v119 = v25;
  MEMORY[0x270FA5388](v25, v26);
  v116 = (char *)&v106 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerError.ErrorType?);
  uint64_t v30 = MEMORY[0x270FA5388](v28 - 8, v29);
  v110 = (char *)&v106 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30, v32);
  v112 = (char *)&v106 - v33;
  uint64_t v115 = type metadata accessor for CacheManagerError();
  uint64_t v114 = *(void *)(v115 - 8);
  MEMORY[0x270FA5388](v115, v34);
  uint64_t v36 = (char *)&v106 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x270FA5388](v37 - 8, v38);
  uint64_t v107 = (uint64_t)&v106 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CacheManagerSearch.CacheManagerSearchStrategy?);
  MEMORY[0x270FA5388](v40 - 8, v41);
  uint64_t v43 = (char *)&v106 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = type metadata accessor for CacheManagerSearch.Ended();
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109, v44);
  uint64_t v46 = (char *)&v106 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for CacheManagerSearch();
  uint64_t v122 = *(void *)(v47 - 8);
  uint64_t v123 = v47;
  MEMORY[0x270FA5388](v47, v48);
  v134 = (char *)&v106 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x270FA5388](v50 - 8, v51);
  uint64_t v53 = (char *)&v106 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for CacheManagerTelemetryEventMetadata();
  uint64_t v120 = *(void *)(v54 - 8);
  uint64_t v121 = v54;
  MEMORY[0x270FA5388](v54, v55);
  uint64_t v57 = (char *)&v106 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = *a5;
  CacheManagerTelemetryEventMetadata.init()();
  UUID.init()();
  uint64_t v59 = type metadata accessor for UUID();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56);
  v61(v53, 0, 1, v59);
  CacheManagerRequestInvocation.clientTraceId.setter();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v53, v132, v59);
  v61(v53, 0, 1, v59);
  uint64_t v62 = v57;
  uint64_t v63 = CacheManagerTelemetryEventMetadata.cacheManagerId.setter();
  if (!(_BYTE)v133)
  {
    uint64_t v75 = v134;
    CacheManagerInsert.Ended.init()();
    CacheManagerInsert.Ended.exists.setter();
    uint64_t v76 = (unsigned int *)MEMORY[0x263F4F6A0];
    goto LABEL_21;
  }
  if (v133 == 1)
  {
    uint64_t v64 = v113;
    v135 = v113;
    swift_bridgeObjectRetain();
    specialized MutableCollection<>.sort(by:)(&v135);
    uint64_t v65 = v135;
    CacheManagerSearch.Ended.init()();
    int v66 = *(unsigned __int8 *)(v111 + 16);
    uint64_t v67 = type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy();
    uint64_t v68 = *(void *)(v67 - 8);
    uint64_t v69 = (unsigned int *)MEMORY[0x263F4F680];
    if (!v66) {
      uint64_t v69 = (unsigned int *)MEMORY[0x263F4F688];
    }
    (*(void (**)(char *, void, uint64_t))(*(void *)(v67 - 8) + 104))(v43, *v69, v67);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v43, 0, 1, v67);
    MEMORY[0x25A279720](v43);
    if (v64[2] >> 31)
    {
      __break(1u);
    }
    else
    {
      LOBYTE(v135) = 0;
      CacheManagerSearch.Ended.resultCount.setter();
      unint64_t v70 = v65[2];
      if (!v70)
      {
        CacheManagerSearch.Ended.highestMatchScore.setter();
        uint64_t v71 = type metadata accessor for AnnotatedCacheEntry(0);
        uint64_t v74 = v107;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v107, 1, 1, v71);
        goto LABEL_13;
      }
      uint64_t v71 = type metadata accessor for AnnotatedCacheEntry(0);
      uint64_t v72 = *(void *)(v71 - 8);
      uint64_t v73 = (char *)v65 + ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
      CacheManagerSearch.Ended.highestMatchScore.setter();
      if (v70 <= v65[2])
      {
        uint64_t v74 = v107;
        outlined init with copy of AnnotatedCacheEntry((uint64_t)&v73[*(void *)(v72 + 72) * (v70 - 1)], v107);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v72 + 56))(v74, 0, 1, v71);
LABEL_13:
        swift_release();
        type metadata accessor for AnnotatedCacheEntry(0);
        int v80 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 48))(v74, 1, v71);
        uint64_t v75 = v134;
        if (v80 == 1) {
          outlined destroy of Date?(v74, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
        }
        else {
          outlined destroy of AnnotatedCacheEntry(v74);
        }
        CacheManagerSearch.Ended.lowestMatchScore.setter();
        (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v75, v46, v109);
        uint64_t v76 = (unsigned int *)MEMORY[0x263F4F690];
        goto LABEL_21;
      }
    }
    __break(1u);
    swift_release();
    __break(1u);
    JUMPOUT(0x25443AA10);
  }
  MEMORY[0x25A279660](v63);
  uint64_t v75 = v134;
  v77 = v112;
  uint64_t v78 = (uint64_t)v110;
  switch(v58)
  {
    case 1:
    case 2:
      v79 = (unsigned int *)MEMORY[0x263F4F658];
      goto LABEL_18;
    case 3:
      uint64_t v82 = type metadata accessor for CacheManagerError.ErrorType();
      uint64_t v84 = *(void *)(v82 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v78, 1, 1, v82);
      (*(void (**)(char *, void, uint64_t))(v84 + 104))(v77, *MEMORY[0x263F4F658], v82);
      outlined destroy of Date?(v78, &demangling cache variable for type metadata for CacheManagerError.ErrorType?);
      break;
    default:
      v79 = (unsigned int *)MEMORY[0x263F4F660];
LABEL_18:
      uint64_t v81 = *v79;
      uint64_t v82 = type metadata accessor for CacheManagerError.ErrorType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 104))(v78, v81, v82);
      type metadata accessor for CacheManagerError.ErrorType();
      uint64_t v83 = *(void *)(v82 - 8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v83 + 56))(v78, 0, 1, v82);
      (*(void (**)(char *, uint64_t, uint64_t))(v83 + 32))(v77, v78, v82);
      break;
  }
  type metadata accessor for CacheManagerError.ErrorType();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v77, 0, 1, v82);
  uint64_t v85 = MEMORY[0x25A279650](v77);
  int v86 = v116;
  MEMORY[0x25A279780](v85);
  uint64_t v87 = v114;
  v88 = v117;
  uint64_t v89 = v115;
  (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v117, v36, v115);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v87 + 56))(v88, 0, 1, v89);
  MEMORY[0x25A279770](v88);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v36, v89);
  (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v75, v86, v119);
  uint64_t v76 = (unsigned int *)MEMORY[0x263F4F698];
LABEL_21:
  uint64_t v91 = v122;
  uint64_t v90 = v123;
  (*(void (**)(char *, void, uint64_t))(v122 + 104))(v75, *v76, v123);
  v92 = v126;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v126, v75, v90);
  uint64_t v94 = v127;
  uint64_t v93 = v128;
  (*(void (**)(char *, void, uint64_t))(v127 + 104))(v92, *MEMORY[0x263F4F6B8], v128);
  LLMCacheManagerTelemetry.init()();
  uint64_t v95 = v120;
  uint64_t v96 = v124;
  v97 = v62;
  v98 = v62;
  uint64_t v99 = v121;
  (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v124, v98, v121);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v95 + 56))(v96, 0, 1, v99);
  LLMCacheManagerTelemetry.eventMetadata.setter();
  v100 = v125;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v125, v92, v93);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v94 + 56))(v100, 0, 1, v93);
  LLMCacheManagerTelemetry.target.setter();
  v101 = v129;
  static Date.now.getter();
  uint64_t v102 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v101, 0, 1, v102);
  LLMCacheManagerTelemetry.writeTimestamp.setter();
  v103 = v130;
  static MonotonicTimestamp.nowForSuspendingClock()();
  uint64_t v104 = type metadata accessor for MonotonicTimestamp();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v103, 0, 1, v104);
  LLMCacheManagerTelemetry.monotonicTimestamp.setter();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v92, v93);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v134, v90);
  return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v97, v99);
}

uint64_t SearchStrategy.toBiomeSearchStrategy()@<X0>(uint64_t a1@<X8>)
{
  int v3 = *v1;
  uint64_t v4 = type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104);
  uint64_t v6 = (unsigned int *)MEMORY[0x263F4F680];
  if (!v3) {
    uint64_t v6 = (unsigned int *)MEMORY[0x263F4F688];
  }
  uint64_t v7 = *v6;
  return v5(a1, v7, v4);
}

BOOL static BiomeLogEmitter.State.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void BiomeLogEmitter.State.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int BiomeLogEmitter.State.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BiomeLogEmitter.State(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BiomeLogEmitter.State()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BiomeLogEmitter.State()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BiomeLogEmitter.State()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t BiomeLogEmitter.deinit()
{
  return v0;
}

uint64_t BiomeLogEmitter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t BiomeLogEmitter.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t BiomeLogEmitter.init()()
{
  return v0;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

Swift::Int specialized MutableCollection<>.sort(by:)(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = (void *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v6);
  *a1 = v3;
  return result;
}

uint64_t outlined init with copy of AnnotatedCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of AnnotatedCacheEntry(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State()
{
  unint64_t result = lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State;
  if (!lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BiomeLogEmitter.State and conformance BiomeLogEmitter.State);
  }
  return result;
}

uint64_t type metadata accessor for BiomeLogEmitter()
{
  return self;
}

uint64_t method lookup function for BiomeLogEmitter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BiomeLogEmitter);
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertStarted(clientTraceId:namespace:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertEnded(cmId:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitInsertFailed(cmId:error:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchStarted(clientTraceId:namespace:listRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchEnded(cmId:listRequest:listResponse:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of BiomeLogEmitter.emitSearchFailed(cmId:listRequest:error:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildInvocationTelemetry(cmId:clientTraceId:namespace:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildInsertTelemetry(cmId:state:error:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of BiomeLogEmitter.buildSearchTelemetry(cmId:state:listRequest:listResponse:error:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of BiomeLogEmitter.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t getEnumTagSinglePayload for BiomeLogEmitter.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BiomeLogEmitter.State(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25443B85CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for BiomeLogEmitter.State(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BiomeLogEmitter.State()
{
  return &type metadata for BiomeLogEmitter.State;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v164 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v159 = *(void *)(v164 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v164, v4);
  uint64_t v154 = (uint64_t)&v146 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5, v7);
  uint64_t v165 = (uint64_t)&v146 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v161 = (uint64_t)&v146 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v160 = (uint64_t)&v146 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14, v16);
  uint64_t v156 = (uint64_t)&v146 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17, v19);
  uint64_t v155 = (uint64_t)&v146 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v151 = (uint64_t)&v146 - v24;
  MEMORY[0x270FA5388](v23, v25);
  uint64_t v150 = (uint64_t)&v146 - v26;
  Swift::Int v27 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v27);
  if (result >= v27)
  {
    if (v27 < 0) {
      goto LABEL_154;
    }
    if (v27) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v27, 1, a1);
    }
    return result;
  }
  if (v27 >= 0) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = v27 + 1;
  }
  if (v27 < -1) {
    goto LABEL_162;
  }
  Swift::Int v148 = result;
  if (v27 < 2)
  {
    uint64_t v33 = (char *)MEMORY[0x263F8EE78];
    unint64_t v158 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
    uint64_t v147 = MEMORY[0x263F8EE78];
    if (v27 != 1)
    {
      unint64_t v35 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_120:
      if (v35 >= 2)
      {
        uint64_t v139 = *a1;
        do
        {
          unint64_t v140 = v35 - 2;
          if (v35 < 2) {
            goto LABEL_149;
          }
          if (!v139) {
            goto LABEL_161;
          }
          v141 = v33;
          uint64_t v142 = *(void *)&v33[16 * v140 + 32];
          uint64_t v143 = *(void *)&v33[16 * v35 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)(v139 + *(void *)(v159 + 72) * v142, v139 + *(void *)(v159 + 72) * *(void *)&v33[16 * v35 + 16], v139 + *(void *)(v159 + 72) * v143, v158);
          if (v2) {
            break;
          }
          if (v143 < v142) {
            goto LABEL_150;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v141 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v33);
          }
          if (v140 >= *((void *)v141 + 2)) {
            goto LABEL_151;
          }
          v144 = &v141[16 * v140 + 32];
          *(void *)v144 = v142;
          *((void *)v144 + 1) = v143;
          unint64_t v145 = *((void *)v141 + 2);
          if (v35 > v145) {
            goto LABEL_152;
          }
          memmove(&v141[16 * v35 + 16], &v141[16 * v35 + 32], 16 * (v145 - v35));
          *((void *)v141 + 2) = v145 - 1;
          unint64_t v35 = v145 - 1;
          uint64_t v33 = v141;
        }
        while (v145 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(void *)(v147 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v30 = v29 >> 1;
    uint64_t v31 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v31 + 16) = v30;
    uint64_t v32 = *(unsigned __int8 *)(v159 + 80);
    uint64_t v147 = v31;
    unint64_t v158 = v31 + ((v32 + 32) & ~v32);
  }
  uint64_t v34 = 0;
  uint64_t v33 = (char *)MEMORY[0x263F8EE78];
  v163 = a1;
  while (1)
  {
    uint64_t v36 = v34;
    uint64_t v37 = v34 + 1;
    if (v34 + 1 >= v27)
    {
      Swift::Int v48 = v34 + 1;
    }
    else
    {
      uint64_t v38 = *a1;
      uint64_t v39 = *(void *)(v159 + 72);
      uint64_t v40 = *a1 + v39 * v37;
      uint64_t v157 = v34;
      uint64_t v41 = v150;
      outlined init with copy of AnnotatedCacheEntry(v40, v150);
      uint64_t v42 = v151;
      outlined init with copy of AnnotatedCacheEntry(v38 + v39 * v157, v151);
      uint64_t v43 = *(int *)(v164 + 48);
      if (*(unsigned char *)(v41 + v43 + 8)) {
        double v44 = 0.0;
      }
      else {
        double v44 = *(double *)(v41 + v43);
      }
      uint64_t v45 = v42 + v43;
      if (*(unsigned char *)(v45 + 8)) {
        double v46 = 0.0;
      }
      else {
        double v46 = *(double *)v45;
      }
      outlined destroy of AnnotatedCacheEntry(v42);
      uint64_t v47 = v41;
      uint64_t v36 = v157;
      outlined destroy of AnnotatedCacheEntry(v47);
      Swift::Int v48 = v36 + 2;
      uint64_t v162 = v38;
      uint64_t v166 = v39;
      if (v36 + 2 < v27)
      {
        uint64_t v153 = v2;
        v149 = v33;
        uint64_t v49 = v39 * v37;
        uint64_t v50 = v38;
        Swift::Int v51 = v36 + 2;
        uint64_t v52 = v39 * (v36 + 2);
        while (1)
        {
          Swift::Int v53 = v27;
          uint64_t v54 = v155;
          outlined init with copy of AnnotatedCacheEntry(v50 + v52, v155);
          uint64_t v55 = v156;
          outlined init with copy of AnnotatedCacheEntry(v50 + v49, v156);
          uint64_t v56 = *(int *)(v164 + 48);
          double v57 = *(double *)(v54 + v56);
          if (*(unsigned char *)(v54 + v56 + 8)) {
            double v57 = 0.0;
          }
          uint64_t v58 = v55 + v56;
          double v59 = *(double *)v58;
          if (*(unsigned char *)(v58 + 8)) {
            double v59 = 0.0;
          }
          BOOL v60 = v59 >= v57;
          outlined destroy of AnnotatedCacheEntry(v55);
          outlined destroy of AnnotatedCacheEntry(v54);
          if (v46 < v44 == v60) {
            break;
          }
          v50 += v166;
          ++v51;
          Swift::Int v27 = v53;
          if (v53 == v51)
          {
            Swift::Int v48 = v53;
            a1 = v163;
            uint64_t v33 = v149;
            uint64_t v36 = v157;
            goto LABEL_33;
          }
        }
        a1 = v163;
        uint64_t v33 = v149;
        Swift::Int v48 = v51;
        uint64_t v36 = v157;
        Swift::Int v27 = v53;
LABEL_33:
        uint64_t v2 = v153;
      }
      if (v46 < v44)
      {
        if (v48 < v36) {
          goto LABEL_155;
        }
        if (v36 < v48)
        {
          Swift::Int v152 = v27;
          v149 = v33;
          uint64_t v61 = v36;
          uint64_t v62 = 0;
          uint64_t v63 = v166;
          uint64_t v64 = v166 * (v48 - 1);
          uint64_t v65 = v48 * v166;
          Swift::Int v66 = v61;
          uint64_t v67 = v61 * v166;
          do
          {
            if (v66 != v48 + v62 - 1)
            {
              uint64_t v153 = v2;
              uint64_t v68 = v162;
              if (!v162) {
                goto LABEL_160;
              }
              unint64_t v69 = v162 + v67;
              outlined init with take of AnnotatedCacheEntry(v162 + v67, v154);
              if (v67 < v64 || v69 >= v68 + v65)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v67 != v64)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              outlined init with take of AnnotatedCacheEntry(v154, v68 + v64);
              a1 = v163;
              uint64_t v2 = v153;
              uint64_t v63 = v166;
            }
            ++v66;
            --v62;
            v64 -= v63;
            v65 -= v63;
            v67 += v63;
          }
          while (v66 < v48 + v62);
          uint64_t v33 = v149;
          uint64_t v36 = v157;
          Swift::Int v27 = v152;
        }
      }
    }
    if (v48 < v27)
    {
      if (__OFSUB__(v48, v36)) {
        goto LABEL_153;
      }
      if (v48 - v36 < v148) {
        break;
      }
    }
LABEL_72:
    if (v48 < v36) {
      goto LABEL_148;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v166 = v48;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v33 + 2) + 1, 1, v33);
    }
    unint64_t v88 = *((void *)v33 + 2);
    unint64_t v87 = *((void *)v33 + 3);
    unint64_t v35 = v88 + 1;
    if (v88 >= v87 >> 1) {
      uint64_t v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v87 > 1), v88 + 1, 1, v33);
    }
    *((void *)v33 + 2) = v35;
    uint64_t v89 = v33 + 32;
    uint64_t v90 = &v33[16 * v88 + 32];
    uint64_t v91 = v166;
    *(void *)uint64_t v90 = v36;
    *((void *)v90 + 1) = v91;
    if (v88)
    {
      while (1)
      {
        unint64_t v92 = v35 - 1;
        if (v35 >= 4)
        {
          v97 = &v89[16 * v35];
          uint64_t v98 = *((void *)v97 - 8);
          uint64_t v99 = *((void *)v97 - 7);
          BOOL v103 = __OFSUB__(v99, v98);
          uint64_t v100 = v99 - v98;
          if (v103) {
            goto LABEL_137;
          }
          uint64_t v102 = *((void *)v97 - 6);
          uint64_t v101 = *((void *)v97 - 5);
          BOOL v103 = __OFSUB__(v101, v102);
          uint64_t v95 = v101 - v102;
          char v96 = v103;
          if (v103) {
            goto LABEL_138;
          }
          unint64_t v104 = v35 - 2;
          v105 = &v89[16 * v35 - 32];
          uint64_t v107 = *(void *)v105;
          uint64_t v106 = *((void *)v105 + 1);
          BOOL v103 = __OFSUB__(v106, v107);
          uint64_t v108 = v106 - v107;
          if (v103) {
            goto LABEL_140;
          }
          BOOL v103 = __OFADD__(v95, v108);
          uint64_t v109 = v95 + v108;
          if (v103) {
            goto LABEL_143;
          }
          if (v109 >= v100)
          {
            uint64_t v127 = &v89[16 * v92];
            uint64_t v129 = *(void *)v127;
            uint64_t v128 = *((void *)v127 + 1);
            BOOL v103 = __OFSUB__(v128, v129);
            uint64_t v130 = v128 - v129;
            if (v103) {
              goto LABEL_147;
            }
            BOOL v120 = v95 < v130;
            goto LABEL_109;
          }
        }
        else
        {
          if (v35 != 3)
          {
            uint64_t v121 = *((void *)v33 + 4);
            uint64_t v122 = *((void *)v33 + 5);
            BOOL v103 = __OFSUB__(v122, v121);
            uint64_t v114 = v122 - v121;
            char v115 = v103;
            goto LABEL_103;
          }
          uint64_t v94 = *((void *)v33 + 4);
          uint64_t v93 = *((void *)v33 + 5);
          BOOL v103 = __OFSUB__(v93, v94);
          uint64_t v95 = v93 - v94;
          char v96 = v103;
        }
        if (v96) {
          goto LABEL_139;
        }
        unint64_t v104 = v35 - 2;
        v110 = &v89[16 * v35 - 32];
        uint64_t v112 = *(void *)v110;
        uint64_t v111 = *((void *)v110 + 1);
        BOOL v113 = __OFSUB__(v111, v112);
        uint64_t v114 = v111 - v112;
        char v115 = v113;
        if (v113) {
          goto LABEL_142;
        }
        v116 = &v89[16 * v92];
        uint64_t v118 = *(void *)v116;
        uint64_t v117 = *((void *)v116 + 1);
        BOOL v103 = __OFSUB__(v117, v118);
        uint64_t v119 = v117 - v118;
        if (v103) {
          goto LABEL_145;
        }
        if (__OFADD__(v114, v119)) {
          goto LABEL_146;
        }
        if (v114 + v119 >= v95)
        {
          BOOL v120 = v95 < v119;
LABEL_109:
          if (v120) {
            unint64_t v92 = v104;
          }
          goto LABEL_111;
        }
LABEL_103:
        if (v115) {
          goto LABEL_141;
        }
        uint64_t v123 = &v89[16 * v92];
        uint64_t v125 = *(void *)v123;
        uint64_t v124 = *((void *)v123 + 1);
        BOOL v103 = __OFSUB__(v124, v125);
        uint64_t v126 = v124 - v125;
        if (v103) {
          goto LABEL_144;
        }
        if (v126 < v114) {
          goto LABEL_14;
        }
LABEL_111:
        unint64_t v131 = v92 - 1;
        if (v92 - 1 >= v35)
        {
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        uint64_t v132 = *a1;
        if (!*a1) {
          goto LABEL_159;
        }
        int v133 = v33;
        v134 = &v89[16 * v131];
        uint64_t v135 = *(void *)v134;
        v136 = &v89[16 * v92];
        uint64_t v137 = *((void *)v136 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(v132 + *(void *)(v159 + 72) * *(void *)v134, v132 + *(void *)(v159 + 72) * *(void *)v136, v132 + *(void *)(v159 + 72) * v137, v158);
        if (v2) {
          goto LABEL_131;
        }
        if (v137 < v135) {
          goto LABEL_134;
        }
        if (v92 > *((void *)v133 + 2)) {
          goto LABEL_135;
        }
        *(void *)v134 = v135;
        *(void *)&v89[16 * v131 + 8] = v137;
        unint64_t v138 = *((void *)v133 + 2);
        if (v92 >= v138) {
          goto LABEL_136;
        }
        uint64_t v33 = v133;
        unint64_t v35 = v138 - 1;
        memmove(&v89[16 * v92], v136 + 16, 16 * (v138 - 1 - v92));
        *((void *)v133 + 2) = v138 - 1;
        a1 = v163;
        if (v138 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v35 = 1;
LABEL_14:
    Swift::Int v27 = a1[1];
    uint64_t v34 = v166;
    if (v166 >= v27) {
      goto LABEL_120;
    }
  }
  if (__OFADD__(v36, v148)) {
    goto LABEL_156;
  }
  if (v36 + v148 >= v27) {
    Swift::Int v70 = v27;
  }
  else {
    Swift::Int v70 = v36 + v148;
  }
  if (v70 >= v36)
  {
    if (v48 != v70)
    {
      uint64_t v157 = v36;
      v149 = v33;
      Swift::Int v152 = v70;
      uint64_t v153 = v2;
      uint64_t v71 = *(void *)(v159 + 72);
      uint64_t v166 = v71 * (v48 - 1);
      uint64_t v162 = v71;
      Swift::Int v72 = v48 * v71;
      do
      {
        uint64_t v73 = 0;
        uint64_t v74 = v157;
        while (1)
        {
          Swift::Int v75 = v48;
          uint64_t v76 = *a1;
          uint64_t v77 = v160;
          outlined init with copy of AnnotatedCacheEntry(v72 + v73 + *a1, v160);
          uint64_t v78 = v166 + v73 + v76;
          uint64_t v79 = v161;
          outlined init with copy of AnnotatedCacheEntry(v78, v161);
          uint64_t v80 = *(int *)(v164 + 48);
          double v81 = *(unsigned char *)(v77 + v80 + 8) ? 0.0 : *(double *)(v77 + v80);
          uint64_t v82 = v79 + v80;
          double v83 = *(unsigned char *)(v82 + 8) ? 0.0 : *(double *)v82;
          outlined destroy of AnnotatedCacheEntry(v79);
          outlined destroy of AnnotatedCacheEntry(v77);
          if (v83 >= v81) {
            break;
          }
          uint64_t v84 = *a1;
          if (!*a1) {
            goto LABEL_158;
          }
          uint64_t v85 = v84 + v166 + v73;
          outlined init with take of AnnotatedCacheEntry(v84 + v72 + v73, v165);
          swift_arrayInitWithTakeFrontToBack();
          outlined init with take of AnnotatedCacheEntry(v165, v85);
          a1 = v163;
          v73 -= v162;
          ++v74;
          Swift::Int v48 = v75;
          if (v75 == v74) {
            goto LABEL_59;
          }
        }
        Swift::Int v48 = v75;
LABEL_59:
        ++v48;
        v166 += v162;
        v72 += v162;
      }
      while (v48 != v152);
      Swift::Int v48 = v152;
      uint64_t v2 = v153;
      uint64_t v33 = v149;
      uint64_t v36 = v157;
    }
    goto LABEL_72;
  }
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v30 = a1;
  uint64_t v33 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v8 = MEMORY[0x270FA5388](v33, v7);
  uint64_t v34 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t result = MEMORY[0x270FA5388](v11, v14);
  uint64_t v18 = (char *)&v28 - v17;
  uint64_t v32 = a3;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    uint64_t v31 = *(void *)(v16 + 72);
    uint64_t v35 = v31 * v32;
    uint64_t v36 = v31 * (v32 - 1);
LABEL_5:
    uint64_t v19 = 0;
    uint64_t v20 = v30;
    while (1)
    {
      uint64_t v21 = *a4;
      outlined init with copy of AnnotatedCacheEntry(v35 + v19 + *a4, (uint64_t)v18);
      outlined init with copy of AnnotatedCacheEntry(v36 + v19 + v21, (uint64_t)v13);
      uint64_t v22 = *(int *)(v33 + 48);
      if (v18[v22 + 8]) {
        double v23 = 0.0;
      }
      else {
        double v23 = *(double *)&v18[v22];
      }
      uint64_t v24 = &v13[v22];
      if (v24[8]) {
        double v25 = 0.0;
      }
      else {
        double v25 = *(double *)v24;
      }
      outlined destroy of AnnotatedCacheEntry((uint64_t)v13);
      uint64_t result = outlined destroy of AnnotatedCacheEntry((uint64_t)v18);
      if (v25 >= v23)
      {
LABEL_4:
        v36 += v31;
        v35 += v31;
        if (++v32 == v29) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v26 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v27 = v26 + v36 + v19;
      outlined init with take of AnnotatedCacheEntry(v26 + v35 + v19, v34);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = outlined init with take of AnnotatedCacheEntry(v34, v27);
      v19 -= v31;
      if (v32 == ++v20) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v52 = a1;
  uint64_t v7 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v9, v12);
  uint64_t v15 = (char *)&v51 - v14;
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v19 = (char *)&v51 - v18;
  MEMORY[0x270FA5388](v17, v20);
  uint64_t v22 = (char *)&v51 - v21;
  uint64_t v24 = *(void *)(v23 + 72);
  if (!v24)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  if (a2 - v52 == 0x8000000000000000 && v24 == -1) {
    goto LABEL_76;
  }
  int64_t v25 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v24 == -1) {
    goto LABEL_77;
  }
  uint64_t v26 = (uint64_t)(a2 - v52) / v24;
  unint64_t v54 = a4;
  unint64_t v55 = v52;
  uint64_t v27 = v25 / v24;
  if (v26 >= v25 / v24)
  {
    if ((v27 & 0x8000000000000000) == 0)
    {
      uint64_t v29 = v27 * v24;
      if (a4 < a2 || a2 + v29 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v40 = a4 + v29;
      unint64_t v53 = a4 + v29;
      unint64_t v55 = a2;
      if (v29 >= 1 && v52 < a2)
      {
        uint64_t v42 = -v24;
        do
        {
          outlined init with copy of AnnotatedCacheEntry(v40 + v42, (uint64_t)v15);
          unint64_t v43 = a2 + v42;
          outlined init with copy of AnnotatedCacheEntry(a2 + v42, (uint64_t)v11);
          uint64_t v44 = *(int *)(v7 + 48);
          if (v15[v44 + 8]) {
            double v45 = 0.0;
          }
          else {
            double v45 = *(double *)&v15[v44];
          }
          double v46 = &v11[v44];
          if (v46[8]) {
            double v47 = 0.0;
          }
          else {
            double v47 = *(double *)v46;
          }
          unint64_t v48 = a3 + v42;
          outlined destroy of AnnotatedCacheEntry((uint64_t)v11);
          outlined destroy of AnnotatedCacheEntry((uint64_t)v15);
          if (v47 >= v45)
          {
            unint64_t v49 = v53;
            v53 += v42;
            if (a3 < v49 || v48 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v49)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v43 = a2;
          }
          else
          {
            if (a3 < a2 || v48 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v55 += v42;
          }
          unint64_t v40 = v53;
          if (v53 <= a4) {
            break;
          }
          a2 = v43;
          a3 += v42;
        }
        while (v43 > v52);
      }
      goto LABEL_74;
    }
  }
  else if ((v26 & 0x8000000000000000) == 0)
  {
    uint64_t v28 = v26 * v24;
    if (a4 < v52 || v52 + v28 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v52)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v30 = a4 + v28;
    unint64_t v53 = a4 + v28;
    if (v28 >= 1 && a2 < a3)
    {
      do
      {
        outlined init with copy of AnnotatedCacheEntry(a2, (uint64_t)v22);
        outlined init with copy of AnnotatedCacheEntry(a4, (uint64_t)v19);
        uint64_t v32 = *(int *)(v7 + 48);
        if (v22[v32 + 8]) {
          double v33 = 0.0;
        }
        else {
          double v33 = *(double *)&v22[v32];
        }
        uint64_t v34 = &v19[v32];
        if (v34[8]) {
          double v35 = 0.0;
        }
        else {
          double v35 = *(double *)v34;
        }
        outlined destroy of AnnotatedCacheEntry((uint64_t)v19);
        outlined destroy of AnnotatedCacheEntry((uint64_t)v22);
        unint64_t v36 = v55;
        if (v35 >= v33)
        {
          unint64_t v39 = v54 + v24;
          if (v55 < v54 || v55 >= v39)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v55 != v54)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v54 = v39;
          unint64_t v37 = a2;
        }
        else
        {
          unint64_t v37 = a2 + v24;
          if (v55 < a2 || v55 >= v37)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v55 == a2)
          {
            unint64_t v36 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v55 = v36 + v24;
        a4 = v54;
        if (v54 >= v30) {
          break;
        }
        a2 = v37;
      }
      while (v37 < a3);
    }
LABEL_74:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v55, &v54, (uint64_t *)&v53);
    return 1;
  }
LABEL_78:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with take of AnnotatedCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AnnotatedCacheEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *UniversalEmbeddingProvider.defaultDimension.unsafeMutableAddressor()
{
  return &static UniversalEmbeddingProvider.defaultDimension;
}

uint64_t static UniversalEmbeddingProvider.defaultDimension.getter()
{
  return 512;
}

id UniversalEmbeddingProvider.init()()
{
  id v0 = objc_msgSend(self, sel_service);
  return v0;
}

Swift::Void __swiftcall UniversalEmbeddingProvider.warmup()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v7 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54110]), sel_init);
  objc_msgSend(v8, sel_setExtendedContextLength_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_254463180;
  *(void *)(v9 + 32) = v8;
  aBlock[0] = v9;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  uint64_t v10 = v8;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  aBlock[4] = closure #1 in UniversalEmbeddingProvider.warmup();
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor;
  uint64_t v12 = _Block_copy(aBlock);
  unsigned int v13 = objc_msgSend(v1, sel_prewarmTextRequests_completionHandler_, isa, v12);
  _Block_release(v12);

  if (v13 == -1)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.logger);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_254432000, v15, v16, "Failed to request text embedding prewarming", v17, 2u);
      MEMORY[0x25A27A310](v17, -1, -1);
      uint64_t v18 = v10;
      uint64_t v10 = v15;
    }
    else
    {
      uint64_t v18 = v15;
    }
  }
  id v19 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void closure #1 in UniversalEmbeddingProvider.warmup()(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Logger.logger);
    id v4 = a1;
    id v5 = a1;
    oslog = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v15 = v8;
      *(_DWORD *)id v7 = 136315138;
      swift_getErrorValue();
      uint64_t v9 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, oslog, v6, "Failed to prewarm text embedding, error: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v8, -1, -1);
      MEMORY[0x25A27A310](v7, -1, -1);

      return;
    }
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.logger);
    oslog = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      unsigned int v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v13 = 0;
      _os_log_impl(&dword_254432000, oslog, v12, "Finished prewarming text embedding", v13, 2u);
      MEMORY[0x25A27A310](v13, -1, -1);
    }
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t UniversalEmbeddingProvider.dimension()(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](UniversalEmbeddingProvider.dimension(), 0, 0);
}

uint64_t UniversalEmbeddingProvider.dimension()()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  id v2 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54110]), sel_init);
  v0[7] = v3;
  objc_msgSend(v3, sel_setExtendedContextLength_, 1);
  uint64_t v4 = swift_task_alloc();
  v0[8] = v4;
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  id v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *id v5 = v0;
  v5[1] = UniversalEmbeddingProvider.dimension();
  uint64_t v6 = MEMORY[0x263F8D6C8];
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0x6F69736E656D6964, 0xEB0000000029286ELL, partial apply for closure #1 in UniversalEmbeddingProvider.dimension(), v4, v6);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](UniversalEmbeddingProvider.dimension(), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  uint64_t v1 = *(void *)(v0 + 48);
  id v2 = *(void *)(v0 + 32);
  id v3 = *(void *)(v0 + 40);

  uint64_t v4 = *(void *)(v0 + 16);
  id v5 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v4);
}

void closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = a1;
  id v22 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4, v7);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v8 = swift_allocObject();
  long long v20 = xmmword_254463180;
  *(_OWORD *)(v8 + 16) = xmmword_254463180;
  *(void *)(v8 + 32) = a3;
  aBlock[0] = v8;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  id v9 = a3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v20;
  id v12 = objc_allocWithZone(MEMORY[0x263F54120]);
  unsigned int v13 = (void *)MEMORY[0x25A279A00](0x6F77206F6C6C6568, 0xEB00000000646C72);
  id v14 = objc_msgSend(v12, sel_initWithText_, v13);

  *(void *)(v11 + 32) = v14;
  aBlock[0] = v11;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextInput);
  Class v15 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v21, v4);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v17 + ((v6 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  aBlock[4] = partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.dimension();
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_15;
  uint64_t v18 = _Block_copy(aBlock);
  id v19 = v9;
  swift_release();
  objc_msgSend(v22, sel_performRequests_textInputs_completionHandler_, isa, v15, v18);
  _Block_release(v18);
}

void closure #1 in closure #1 in UniversalEmbeddingProvider.dimension()(int a1, id a2, uint64_t a3, void *a4)
{
  unint64_t v6 = 0x269DF0000uLL;
  if (a2)
  {
    id v8 = a2;
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.logger);
    id v10 = a2;
    id v11 = a2;
    id v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v40 = v15;
      *(_DWORD *)uint64_t v14 = 67109378;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 8) = 2080;
      swift_getErrorValue();
      uint64_t v16 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, v12, v13, "Failed to fetch dimension for request id %d, error: %s", (uint8_t *)v14, 0x12u);
      swift_arrayDestroy();
      uint64_t v18 = v15;
      unint64_t v6 = 0x269DF0000;
      MEMORY[0x25A27A310](v18, -1, -1);
      MEMORY[0x25A27A310](v14, -1, -1);
    }
    else
    {
    }
    uint64_t v40 = 512;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
    CheckedContinuation.resume(returning:)();

    if (a1 == -1) {
      goto LABEL_33;
    }
    return;
  }
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v20 = type metadata accessor for Logger();
  __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
  unint64_t v21 = a4;
  id v22 = Logger.logObject.getter();
  LOBYTE(v23) = static os_log_type_t.default.getter();
  uint64_t v24 = (SEL *)0x2653AC000;
  if (!os_log_type_enabled(v22, (os_log_type_t)v23))
  {

    goto LABEL_18;
  }
  uint64_t v4 = swift_slowAlloc();
  *(_DWORD *)uint64_t v4 = 67109376;
  LODWORD(v40) = a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v4 + 8) = 2048;
  id v25 = objc_msgSend((id)v21, sel_embeddingResults);
  if (v25)
  {
    type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
    unint64_t v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v26 >> 62) {
      goto LABEL_42;
    }
    id v25 = *(id *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
    unint64_t v6 = 0x269DF0000;
  }
  else
  {
  }
  while (1)
  {
    uint64_t v40 = (uint64_t)v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl(&dword_254432000, v22, (os_log_type_t)v23, "Finished fetching dimension for request id %d and got back %ld results", (uint8_t *)v4, 0x12u);
    MEMORY[0x25A27A310](v4, -1, -1);

LABEL_18:
    id v27 = [(id)v21 v24[173]];
    if (!v27) {
      break;
    }
    uint64_t v28 = v27;
    type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
    unint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      id v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v22)
      {
LABEL_31:
        swift_bridgeObjectRelease();
        break;
      }
    }
    else
    {
      id v22 = *(NSObject **)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v22) {
        goto LABEL_31;
      }
    }
    if ((v21 & 0xC000000000000001) != 0)
    {
      id v29 = (id)MEMORY[0x25A279C50](0, v21);
    }
    else
    {
      if (!*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      id v29 = *(id *)(v21 + 32);
    }
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    unint64_t v21 = v30;
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.default.getter();
    unint64_t v33 = 0x2653AC000uLL;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 134217984;
      uint64_t v4 = (uint64_t)(v23 + 12);
      id v34 = objc_msgSend((id)v21, sel_embedding);
      uint64_t v24 = (SEL *)objc_msgSend(v34, sel_type);

      unint64_t v33 = 0x2653AC000;
      uint64_t v40 = (uint64_t)v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_254432000, v31, v32, "Embedding is of type %lu for this hardware", v23, 0xCu);
      MEMORY[0x25A27A310](v23, -1, -1);
    }
    else
    {

      uint64_t v31 = v21;
    }

    id v22 = [(id)v21 *(SEL *)(v33 + 1392)];
    uint64_t v35 = (uint64_t)[v22 count];

    if ((v35 & 0x8000000000000000) == 0)
    {
      uint64_t v40 = v35;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
      CheckedContinuation.resume(returning:)();

      if (a1 != -1) {
        return;
      }
      goto LABEL_33;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain();
    id v25 = (id)_CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease_n();
    unint64_t v6 = 0x269DF0000;
  }
  uint64_t v40 = 512;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
  CheckedContinuation.resume(returning:)();
  if (a1 != -1) {
    return;
  }
LABEL_33:
  if (*(void *)(v6 + 984) != -1) {
    swift_once();
  }
  uint64_t v36 = type metadata accessor for Logger();
  __swift_project_value_buffer(v36, (uint64_t)static Logger.logger);
  unint64_t v37 = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    unint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v39 = 0;
    _os_log_impl(&dword_254432000, v37, v38, "Failed to request text embedding", v39, 2u);
    MEMORY[0x25A27A310](v39, -1, -1);
  }
}

void thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  uint64_t v4 = type metadata accessor for OSSignpostID();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](UniversalEmbeddingProvider.embedding(input:), 0, 0);
}

uint64_t UniversalEmbeddingProvider.embedding(input:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  id v4 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54110]), sel_init);
  v0[10] = v5;
  objc_msgSend(v5, sel_setExtendedContextLength_, 1);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  uint64_t v6[2] = v2;
  v6[3] = v5;
  v6[4] = v3;
  v6[5] = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  *uint64_t v7 = v0;
  v7[1] = UniversalEmbeddingProvider.embedding(input:);
  uint64_t v8 = MEMORY[0x263F06F78];
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000011, 0x8000000254464060, partial apply for closure #1 in UniversalEmbeddingProvider.embedding(input:), v6, v8);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = UniversalEmbeddingProvider.embedding(input:);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = UniversalEmbeddingProvider.embedding(input:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v9;

  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);

  id v4 = *(void *)(v0 + 16);
  id v5 = *(void *)(v0 + 24);
  uint64_t v6 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v7(v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);

  swift_task_dealloc();
  id v4 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a1;
  id v27 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8, v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v12 = swift_allocObject();
  long long v24 = xmmword_254463180;
  *(_OWORD *)(v12 + 16) = xmmword_254463180;
  *(void *)(v12 + 32) = a3;
  aBlock[0] = v12;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextRequest);
  id v13 = a3;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v24;
  id v15 = objc_allocWithZone(MEMORY[0x263F54120]);
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)MEMORY[0x25A279A00](a4, a5);
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_initWithText_, v16);

  *(void *)(v14 + 32) = v17;
  aBlock[0] = v14;
  specialized Array._endMutation()();
  type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextInput);
  Class v18 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v8);
  unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v19, (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(void *)(v20 + ((v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  aBlock[4] = partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int32, @guaranteed Error?) -> ();
  aBlock[3] = &block_descriptor_9;
  unint64_t v21 = _Block_copy(aBlock);
  id v22 = v13;
  swift_release();
  Class v23 = isa;
  objc_msgSend(v27, sel_performRequests_textInputs_completionHandler_, isa, v18, v21);
  _Block_release(v21);
}

void closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(int a1, id a2, uint64_t a3, void *a4)
{
  unint64_t v6 = 0x269DF0000uLL;
  if (!a2)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
    unint64_t v21 = a4;
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v22, v23))
    {

      goto LABEL_18;
    }
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109376;
    LODWORD(v50[0]) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v4 + 8) = 2048;
    id v24 = objc_msgSend((id)v21, sel_embeddingResults);
    if (v24)
    {
      type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
      unint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v25 >> 62) {
        goto LABEL_40;
      }
      id v24 = *(id *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
      unint64_t v6 = 0x269DF0000;
    }
    else
    {
    }
    while (1)
    {
      v50[0] = (uint64_t)v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_254432000, v22, v23, "Finished generating embedding for request id %d and got back %ld results", (uint8_t *)v4, 0x12u);
      MEMORY[0x25A27A310](v4, -1, -1);

LABEL_18:
      id v28 = objc_msgSend((id)v21, sel_embeddingResults);
      if (!v28) {
        goto LABEL_31;
      }
      id v29 = v28;
      type metadata accessor for MADTextRequest(0, &lazy cache variable for type metadata for MADTextEmbeddingResult);
      unint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v21 >> 62)
      {
        swift_bridgeObjectRetain();
        id v22 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (!v22)
        {
LABEL_30:
          swift_bridgeObjectRelease();
LABEL_31:
          lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError();
          uint64_t v44 = swift_allocError();
          *double v45 = 1;
          v50[0] = v44;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
          CheckedContinuation.resume(throwing:)();
          if (a1 != -1) {
            return;
          }
          goto LABEL_32;
        }
      }
      else
      {
        id v22 = *(NSObject **)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v22) {
          goto LABEL_30;
        }
      }
      if ((v21 & 0xC000000000000001) != 0) {
        break;
      }
      if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v30 = *(id *)(v21 + 32);
        goto LABEL_24;
      }
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      id v24 = (id)_CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease_n();
      unint64_t v6 = 0x269DF0000;
    }
    id v30 = (id)MEMORY[0x25A279C50](0, v21);
LABEL_24:
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    os_log_type_t v32 = v31;
    unint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.default.getter();
    unint64_t v35 = 0x2653AC000uLL;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 134217984;
      id v37 = [v32 embedding];
      id v38 = objc_msgSend(v37, sel_type);

      unint64_t v35 = 0x2653AC000;
      v50[0] = (uint64_t)v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl(&dword_254432000, v33, v34, "Embedding is of type %lu for this hardware", v36, 0xCu);
      MEMORY[0x25A27A310](v36, -1, -1);
    }
    else
    {

      unint64_t v33 = v32;
    }

    id v39 = [v32 *(SEL *)(v35 + 1392)];
    id v40 = objc_msgSend(v39, sel_data);

    uint64_t v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v43 = v42;

    v50[0] = v41;
    v50[1] = v43;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
    CheckedContinuation.resume(returning:)();

    if (a1 != -1) {
      return;
    }
    goto LABEL_32;
  }
  id v8 = a2;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.logger);
  id v10 = a2;
  id v11 = a2;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v50[0] = v15;
    *(_DWORD *)uint64_t v14 = 67109378;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 8) = 2080;
    swift_getErrorValue();
    uint64_t v16 = Error.localizedDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v12, v13, "Failed to generate embedding for request id %d, error: %s", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v18 = v15;
    unint64_t v6 = 0x269DF0000;
    MEMORY[0x25A27A310](v18, -1, -1);
    MEMORY[0x25A27A310](v14, -1, -1);
  }
  else
  {
  }
  lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError();
  uint64_t v26 = swift_allocError();
  *id v27 = 1;
  v50[0] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
  CheckedContinuation.resume(throwing:)();

  if (a1 == -1)
  {
LABEL_32:
    if (*(void *)(v6 + 984) != -1) {
      swift_once();
    }
    uint64_t v46 = type metadata accessor for Logger();
    __swift_project_value_buffer(v46, (uint64_t)static Logger.logger);
    double v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v49 = 0;
      _os_log_impl(&dword_254432000, v47, v48, "Failed to request text embedding", v49, 2u);
      MEMORY[0x25A27A310](v49, -1, -1);
    }
  }
}

uint64_t protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider;
  return UniversalEmbeddingProvider.dimension()(v2);
}

uint64_t protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void protocol witness for EmbeddingProviding.warmup() in conformance UniversalEmbeddingProvider()
{
}

uint64_t protocol witness for EmbeddingProviding.embedding(input:) in conformance UniversalEmbeddingProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for EmbeddingProviding.embedding(input:) in conformance UniversalEmbeddingProvider;
  return UniversalEmbeddingProvider.embedding(input:)(a1, a2, v6);
}

{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  id v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  id v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

void partial apply for closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1)
{
  closure #1 in UniversalEmbeddingProvider.dimension()(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

void partial apply for closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1)
{
  closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

ValueMetadata *type metadata accessor for UniversalEmbeddingProvider()
{
  return &type metadata for UniversalEmbeddingProvider;
}

uint64_t sub_25443F53C()
{
  return objectdestroyTm(&demangling cache variable for type metadata for CheckedContinuation<Data, Error>);
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, a2, &demangling cache variable for type metadata for CheckedContinuation<Data, Error>, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:));
}

unint64_t lazy protocol witness table accessor for type EmbeddingError and conformance EmbeddingError()
{
  unint64_t result = lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError;
  if (!lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError;
  if (!lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmbeddingError and conformance EmbeddingError);
  }
  return result;
}

uint64_t type metadata accessor for MADTextRequest(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25443F5F8()
{
  return objectdestroyTm(&demangling cache variable for type metadata for CheckedContinuation<Int, Never>);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = (*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v7 + 8, v6);
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.dimension()(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(a1, a2, &demangling cache variable for type metadata for CheckedContinuation<Int, Never>, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))closure #1 in closure #1 in UniversalEmbeddingProvider.dimension());
}

uint64_t partial apply for closure #1 in closure #1 in UniversalEmbeddingProvider.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a4(a1, a2, v4 + v8, v9);
}

uint64_t ListRequest.searchKey.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ListRequest.strategy.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t ListRequest.loggingTraceId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ListRequest() + 24);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ListRequest()
{
  uint64_t result = type metadata singleton initialization cache for ListRequest;
  if (!type metadata singleton initialization cache for ListRequest) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ListRequest.maxResult.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ListRequest() + 28));
}

uint64_t ListRequest.init(searchKey:strategy:maxResult:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v9 = *a3;
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = v9;
  uint64_t v10 = type metadata accessor for ListRequest();
  uint64_t v11 = a6 + *(int *)(v10 + 24);
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v11, a5, v12);
  *(void *)(a6 + *(int *)(v10 + 28)) = a4;
  return result;
}

uint64_t ListRequest.init(searchKey:strategy:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7 = *a3;
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = v7;
  uint64_t v8 = type metadata accessor for ListRequest();
  uint64_t v9 = a5 + *(int *)(v8 + 24);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a4, v10);
  *(void *)(a5 + *(int *)(v8 + 28)) = 1;
  return result;
}

uint64_t ListRequest.init(searchKey:strategy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v5 = *a3;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = v5;
  uint64_t v6 = type metadata accessor for ListRequest();
  uint64_t result = UUID.init()();
  *(void *)(a4 + *(int *)(v6 + 28)) = 1;
  return result;
}

LLMCache::SearchStrategy_optional __swiftcall SearchStrategy.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SearchStrategy.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *uint64_t v4 = v7;
  return result;
}

uint64_t SearchStrategy.rawValue.getter()
{
  if (*v0) {
    return 0x74614D7463617865;
  }
  else {
    return 0xD000000000000010;
  }
}

unint64_t lazy protocol witness table accessor for type SearchStrategy and conformance SearchStrategy()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy;
  if (!lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchStrategy and conformance SearchStrategy);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SearchStrategy()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SearchStrategy()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SearchStrategy()
{
  return Hasher._finalize()();
}

LLMCache::SearchStrategy_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SearchStrategy(Swift::String *a1)
{
  return SearchStrategy.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SearchStrategy(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000010;
  if (*v1) {
    unint64_t v2 = 0x74614D7463617865;
  }
  unint64_t v3 = 0x8000000254463C40;
  if (*v1) {
    unint64_t v3 = 0xEA00000000006863;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SearchStrategy(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

void *initializeBufferWithCopyOfBuffer for ListRequest(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(void *)((char *)v4 + *(int *)(a3 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t destroy for ListRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithCopy for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t initializeWithTake for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 28)) = *(void *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254440178);
}

uint64_t sub_254440178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ListRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25444023C);
}

uint64_t sub_25444023C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for ListRequest()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SearchStrategy(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25444045CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchStrategy()
{
  return &type metadata for SearchStrategy;
}

uint64_t dispatch thunk of CacheDatabase.delete(entries:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.delete(entries:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of CacheDatabase.describe(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 16) + **(int **)(a5 + 16));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.insert(entries:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.list(namespace:searchKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.list(namespace:searchKey:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.list(namespace:searchKey:)(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of CacheDatabase.listAll(namespace:nextToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 40) + **(int **)(a5 + 40));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  void *v11 = v5;
  v11[1] = dispatch thunk of CacheDatabase.listAll(namespace:nextToken:);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of CacheDatabase.deleteAll(namespace:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CacheDatabase.warmup()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 1819047270;
    }
    else {
      unint64_t v3 = 0xD000000000000012;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0x8000000254463C70;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 1819047270;
      }
      else {
        unint64_t v6 = 0xD000000000000012;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0x8000000254463C70;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    unint64_t v3 = 1953718630;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1953718630)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x74614D7463617865;
  }
  else {
    unint64_t v3 = 0xD000000000000010;
  }
  if (v2) {
    unint64_t v4 = 0x8000000254463C40;
  }
  else {
    unint64_t v4 = 0xEA00000000006863;
  }
  if (a2) {
    unint64_t v5 = 0x74614D7463617865;
  }
  else {
    unint64_t v5 = 0xD000000000000010;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000006863;
  }
  else {
    unint64_t v6 = 0x8000000254463C40;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t LLMCacheManaging.pruneExpiredEntries()()
{
  return MEMORY[0x270FA2498](LLMCacheManaging.pruneExpiredEntries(), 0, 0);
}

{
  uint64_t v0;
  unsigned char *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  uint64_t *v1 = 1;
  swift_willThrow();
  BOOL v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

{
  return MEMORY[0x270FA2498](LLMCacheManaging.pruneExpiredEntries(), 0, 0);
}

unint64_t lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError()
{
  unint64_t result = lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerError and conformance LLMCacheManagerError);
  }
  return result;
}

void *LLMCacheManager.defaultTTLInSeconds.unsafeMutableAddressor()
{
  return &static LLMCacheManager.defaultTTLInSeconds;
}

double static LLMCacheManager.defaultTTLInSeconds.getter()
{
  return 15552000.0;
}

void *LLMCacheManager.defaultPageSize.unsafeMutableAddressor()
{
  return &static LLMCacheManager.defaultPageSize;
}

uint64_t static LLMCacheManager.defaultPageSize.getter()
{
  return 1000;
}

void LLMCacheManager.namespace.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 112);
}

uint64_t LLMCacheManager.db.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of CacheDatabase(v1 + 120, a1);
}

uint64_t outlined init with copy of CacheDatabase(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double LLMCacheManager.ttl.getter()
{
  return *(double *)(v0 + 160);
}

uint64_t LLMCacheManager.logEmitter.getter()
{
  return swift_retain();
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)(unsigned char *a1, uint64_t a2)
{
  uint64_t v42 = v2;
  v41[1] = *MEMORY[0x263EF8340];
  *(void *)(v2 + 144) = a2;
  unint64_t v5 = (void **)(v2 + 120);
  uint64_t v6 = type metadata accessor for URL();
  *(void *)(v2 + 152) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v2 + 160) = v7;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v2 + 168) = v8;
  uint64_t v9 = type metadata accessor for OSSignpostID();
  *(void *)(v2 + 176) = v9;
  *(void *)(v2 + 184) = *(void *)(v9 - 8);
  *(void *)(v2 + 192) = swift_task_alloc();
  *(unsigned char *)(v2 + 224) = *a1;
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v10 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  id v11 = objc_msgSend(self, sel_defaultManager);
  URL._bridgeToObjectiveC()(v12);
  uint64_t v14 = v13;
  *unint64_t v5 = 0;
  unsigned int v15 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v13, 1, 0, v2 + 120);

  uint64_t v16 = *v5;
  if (v15)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, a2, v6);
    unint64_t v17 = self;
    id v18 = v16;
    id v19 = objc_msgSend(v17, sel_service);
    *(void *)(v2 + 40) = &type metadata for UniversalEmbeddingProvider;
    *(void *)(v2 + 48) = &protocol witness table for UniversalEmbeddingProvider;
    *(void *)(v2 + 16) = v19;
    *(void *)(v2 + 200) = type metadata accessor for VectorDatabaseAccess();
    swift_allocObject();
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v2 + 208) = v20;
    *uint64_t v20 = v2;
    v20[1] = LLMCacheManager.__allocating_init(namespace:databasePath:);
    return VectorDatabaseAccess.init(path:embeddingProvider:)(v8, (void *)(v2 + 16));
  }
  else
  {
    id v22 = v16;
    os_log_type_t v23 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    __swift_project_value_buffer(v24, (uint64_t)static Logger.logger);
    id v25 = v23;
    id v26 = v23;
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v41[0] = v30;
      *(_DWORD *)id v29 = 136315138;
      swift_getErrorValue();
      uint64_t v31 = Error.localizedDescription.getter();
      *(void *)(v2 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, v27, v28, "Failed to initialize LLMCacheManager: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v30, -1, -1);
      MEMORY[0x25A27A310](v29, -1, -1);
    }
    else
    {
    }
    uint64_t v34 = *(void *)(v2 + 184);
    uint64_t v33 = *(void *)(v2 + 192);
    uint64_t v35 = *(void *)(v2 + 176);
    uint64_t v36 = *(void *)(v2 + 152);
    uint64_t v37 = *(void *)(v2 + 160);
    uint64_t v38 = *(void *)(v2 + 144);
    swift_willThrow();
    id v39 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v36);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
    swift_task_dealloc();
    swift_task_dealloc();
    id v40 = *(uint64_t (**)(void))(v2 + 8);
    return v40();
  }
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)(uint64_t a1)
{
  uint64_t v33 = v2;
  uint64_t v3 = v1;
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *v2;
  uint64_t v33 = (void *)*v2;
  uint64_t v6 = *v2;
  uint64_t v33 = (void *)*v2;
  swift_task_dealloc();
  if (v3)
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.logger);
    id v8 = v3;
    id v9 = v3;
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v31 = v6;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v32[0] = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      *(void *)(v5 + 136) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, v10, v11, "Failed to initialize LLMCacheManager: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v13, -1, -1);
      uint64_t v16 = v12;
      uint64_t v6 = v31;
      MEMORY[0x25A27A310](v16, -1, -1);
    }
    else
    {
    }
    uint64_t v23 = *(void *)(v5 + 184);
    uint64_t v22 = *(void *)(v5 + 192);
    uint64_t v24 = *(void *)(v5 + 176);
    uint64_t v25 = *(void *)(v5 + 152);
    uint64_t v26 = *(void *)(v5 + 160);
    uint64_t v27 = *(void *)(v5 + 144);
    swift_willThrow();
    id v28 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    id v29 = *(uint64_t (**)(void))(v6 + 8);
    return v29();
  }
  else
  {
    uint64_t v17 = *(void *)(v5 + 200);
    char v18 = *(unsigned char *)(v5 + 224);
    type metadata accessor for BiomeLogEmitter();
    uint64_t v19 = swift_allocObject();
    *(void *)(v5 + 56) = a1;
    uint64_t v20 = v5 + 56;
    *(void *)(v20 + 24) = v17;
    *(void *)(v20 + 32) = &protocol witness table for VectorDatabaseAccess;
    type metadata accessor for LLMCacheManager();
    uint64_t v21 = swift_allocObject();
    *(void *)(v20 + 160) = v21;
    swift_retain();
    swift_defaultActor_initialize();
    *(unsigned char *)(v21 + 112) = v18;
    outlined init with take of ContiguousBytes((long long *)v20, v21 + 120);
    *(void *)(v21 + 160) = 0x416DA9C000000000;
    *(void *)(v21 + 168) = v19;
    swift_release();
    return MEMORY[0x270FA2498](LLMCacheManager.__allocating_init(namespace:databasePath:), v21, 0);
  }
}

uint64_t LLMCacheManager.__allocating_init(namespace:databasePath:)()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_254432000, v2, v3, "LLMCacheManager init completed", v4, 2u);
    MEMORY[0x25A27A310](v4, -1, -1);
  }
  uint64_t v6 = v0[23];
  uint64_t v5 = v0[24];
  uint64_t v7 = v0[22];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[20];
  uint64_t v10 = v0[18];

  id v11 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v13 = v0[27];
  return v12(v13);
}

uint64_t LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(unsigned char *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  char v10 = a4 & 1;
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1(a2, v11);
  MEMORY[0x270FA5388](v13, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  uint64_t v17 = specialized LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(a1, (uint64_t)v15, a3, v10, a5, v5, v11, v12);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v17;
}

uint64_t LLMCacheManager.init(namespace:databaseAccess:ttl:logEmitter:)(char *a1, long long *a2, uint64_t a3, char a4, uint64_t a5)
{
  char v10 = *a1;
  swift_defaultActor_initialize();
  *(unsigned char *)(v5 + 112) = v10;
  outlined init with take of ContiguousBytes(a2, v5 + 120);
  double v11 = *(double *)&a3;
  if (a4) {
    double v11 = 15552000.0;
  }
  *(double *)(v5 + 160) = v11;
  *(void *)(v5 + 168) = a5;
  return v5;
}

uint64_t LLMCacheManager.list(with:)(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  v3[23] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Date();
  v3[24] = v4;
  v3[25] = *(void *)(v4 - 8);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AnnotatedCacheEntry(0);
  v3[28] = v5;
  v3[29] = *(void *)(v5 - 8);
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for UUID();
  v3[37] = v6;
  v3[38] = *(void *)(v6 - 8);
  v3[39] = swift_task_alloc();
  v3[40] = type metadata accessor for ListRequest();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for OSSignpostID();
  v3[44] = v7;
  v3[45] = *(void *)(v7 - 8);
  v3[46] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.list(with:), v2, 0);
}

uint64_t LLMCacheManager.list(with:)()
{
  uint64_t v37 = v0;
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = type metadata accessor for Logger();
  *(void *)(v0 + 376) = __swift_project_value_buffer(v5, (uint64_t)static Logger.logger);
  outlined init with copy of ListRequest(v4, v3, (uint64_t (*)(void))type metadata accessor for ListRequest);
  outlined init with copy of ListRequest(v4, v2, (uint64_t (*)(void))type metadata accessor for ListRequest);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 336);
  char v10 = *(uint64_t **)(v0 + 344);
  if (v8)
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v36 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v13 = *v10;
    unint64_t v14 = v10[1];
    swift_bridgeObjectRetain();
    *(void *)(v0 + 152) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ListRequest);
    *(_WORD *)(v11 + 12) = 2080;
    if (*(unsigned char *)(v9 + 16)) {
      uint64_t v15 = 0x74614D7463617865;
    }
    else {
      uint64_t v15 = 0xD000000000000010;
    }
    if (*(unsigned char *)(v9 + 16)) {
      unint64_t v16 = 0xEA00000000006863;
    }
    else {
      unint64_t v16 = 0x8000000254463C40;
    }
    *(void *)(v0 + 112) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest(v9, (uint64_t (*)(void))type metadata accessor for ListRequest);
    _os_log_impl(&dword_254432000, v6, v7, "LLMCacheManager entering list with search key: %s, strategy: %s...", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v12, -1, -1);
    MEMORY[0x25A27A310](v11, -1, -1);
  }
  else
  {
    outlined destroy of ListRequest(*(void *)(v0 + 344), (uint64_t (*)(void))type metadata accessor for ListRequest);
    outlined destroy of ListRequest(v9, (uint64_t (*)(void))type metadata accessor for ListRequest);
  }

  if (LLMCacheManager.isEnabled()())
  {
    uint64_t v17 = *(void *)(v0 + 320);
    char v18 = *(uint64_t **)(v0 + 168);
    uint64_t v19 = *(void *)(v0 + 176);
    uint64_t v20 = *(void *)(v19 + 168);
    *(void *)(v0 + 384) = v20;
    uint64_t v21 = (char *)v18 + *(int *)(v17 + 24);
    char v35 = *(unsigned char *)(v19 + 112);
    char v22 = v35;
    (*(void (**)(char *, char *, uint64_t *))(*(void *)v20 + 112))(v21, &v35, v18);
    uint64_t v23 = (void *)(v19 + 120);
    uint64_t v24 = *(void *)(v19 + 144);
    uint64_t v25 = *(void *)(v19 + 152);
    __swift_project_boxed_opaque_existential_1(v23, v24);
    *(unsigned char *)(v0 + 472) = v22;
    uint64_t v27 = *v18;
    uint64_t v26 = v18[1];
    uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 + 32)
                                                                              + **(int **)(v25 + 32));
    id v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 392) = v28;
    *id v28 = v0;
    v28[1] = LLMCacheManager.list(with:);
    return v34(v0 + 472, v27, v26, v24, v25);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 360);
    uint64_t v31 = *(void *)(v0 + 368);
    uint64_t v32 = *(void *)(v0 + 352);
    **(void **)(v0 + 160) = MEMORY[0x263F8EE78];
    $defer #1 () in LLMCacheManager.list(with:)();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v31, v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
    return v33();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void (**v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(uint64_t, uint64_t);
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t (*v57)(void *, uint64_t, uint64_t);
  unint64_t v58;
  uint64_t v59;

  uint64_t v4 = v2[50];
  unint64_t v54 = *(void *)(v4 + 16);
  if (v54)
  {
    uint64_t v5 = 0;
    os_log_type_t v48 = v2[41];
    unint64_t v55 = v2[28];
    unint64_t v53 = v2[29];
    unint64_t v49 = v2[21];
    uint64_t v50 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    unint64_t v52 = v4 + v50;
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    os_log_type_t v7 = (void (**)(uint64_t, uint64_t))(v2[25] + 8);
    BOOL v8 = MEMORY[0x263F8EE78];
    uint64_t v51 = v2[50];
    while (1)
    {
      if (v5 >= *(void *)(v4 + 16))
      {
        __break(1u);
        goto LABEL_59;
      }
      uint64_t v56 = (unint64_t)v6;
      uint64_t v58 = v8;
      uint64_t v12 = v2[26];
      uint64_t v11 = v2[27];
      uint64_t v13 = v2[24];
      unint64_t v14 = *(void *)(v53 + 72);
      outlined init with copy of ListRequest(v52 + v14 * v5, v2[36], type metadata accessor for AnnotatedCacheEntry);
      Date.addingTimeInterval(_:)();
      static Date.now.getter();
      uint64_t v15 = static Date.< infix(_:_:)();
      unint64_t v16 = *v7;
      (*v7)(v12, v13);
      v16(v11, v13);
      if ((v15 & 1) == 0) {
        break;
      }
      outlined init with copy of ListRequest(v2[36], v2[35], type metadata accessor for AnnotatedCacheEntry);
      uint64_t v6 = (void *)v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v56 + 16) + 1, 1, v56, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
      }
      BOOL v8 = v58;
      uint64_t v3 = v6[2];
      uint64_t v17 = v6[3];
      if (v3 >= v17 >> 1) {
        uint64_t v6 = (void *)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v3 + 1, 1, (unint64_t)v6, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
      }
      uint64_t v9 = v2[35];
      uint64_t v0 = v2[36];
      uint64_t v6[2] = v3 + 1;
      char v10 = (char *)v6 + v50;
LABEL_4:
      outlined init with take of AnnotatedCacheEntry(v9, (uint64_t)&v10[v3 * v14]);
LABEL_5:
      ++v5;
      outlined destroy of ListRequest(v0, type metadata accessor for AnnotatedCacheEntry);
      uint64_t v4 = v51;
      if (v5 == v54)
      {
        swift_bridgeObjectRelease();
        goto LABEL_43;
      }
    }
    char v18 = v2[41];
    uint64_t v19 = v2[36];
    uint64_t v20 = v2[34];
    uint64_t v21 = v2[21];
    if (*(unsigned char *)(v49 + 16) == 1)
    {
      swift_bridgeObjectRelease();
      outlined init with copy of ListRequest(v19, v20, type metadata accessor for AnnotatedCacheEntry);
      outlined init with copy of ListRequest(v21, v18, (uint64_t (*)(void))type metadata accessor for ListRequest);
    }
    else
    {
      id v1 = 0x8000000254463C40;
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      outlined init with copy of ListRequest(v19, v20, type metadata accessor for AnnotatedCacheEntry);
      outlined init with copy of ListRequest(v21, v18, (uint64_t (*)(void))type metadata accessor for ListRequest);
      if ((v22 & 1) == 0)
      {
LABEL_21:
        uint64_t v26 = v2[36];
        id v28 = v2[33];
        uint64_t v27 = v2[34];
        outlined destroy of ListRequest(v2[41], (uint64_t (*)(void))type metadata accessor for ListRequest);
        outlined destroy of ListRequest(v27, type metadata accessor for AnnotatedCacheEntry);
        outlined init with copy of ListRequest(v26, v28, type metadata accessor for AnnotatedCacheEntry);
        BOOL v8 = v58;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          BOOL v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v58 + 16) + 1, 1, v58, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        uint64_t v6 = (void *)v56;
        uint64_t v3 = *(void *)(v8 + 16);
        id v29 = *(void *)(v8 + 24);
        if (v3 >= v29 >> 1) {
          BOOL v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v3 + 1, 1, v8, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        uint64_t v0 = v2[36];
        uint64_t v9 = v2[33];
        *(void *)(v8 + 16) = v3 + 1;
        char v10 = (char *)(v8 + v50);
        goto LABEL_4;
      }
    }
    uint64_t v23 = *(void **)(v2[34] + *(int *)(v55 + 36));
    uint64_t v3 = v23[2];
    if (!v3) {
      goto LABEL_27;
    }
    uint64_t v0 = *(void *)v2[41];
    uint64_t v24 = *(void *)(v48 + 8);
    uint64_t v25 = v23[4] == v0 && v23[5] == v24;
    if (!v25 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v3 == 1) {
        goto LABEL_27;
      }
      if ((v23[6] != v0 || v23[7] != v24) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        if (v3 != 2)
        {
          uint64_t v6 = v23 + 9;
          uint64_t v30 = 2;
          while (1)
          {
            id v1 = v30 + 1;
            if (__OFADD__(v30, 1)) {
              break;
            }
            uint64_t v31 = *(v6 - 1) == v0 && *v6 == v24;
            if (v31 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
              goto LABEL_21;
            }
            ++v30;
            v6 += 2;
            if (v1 == v3) {
              goto LABEL_27;
            }
          }
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
LABEL_27:
        uint64_t v0 = v2[36];
        uint64_t v3 = v2[34];
        outlined destroy of ListRequest(v2[41], (uint64_t (*)(void))type metadata accessor for ListRequest);
        outlined destroy of ListRequest(v3, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v6 = (void *)v56;
        BOOL v8 = v58;
        goto LABEL_5;
      }
    }
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  BOOL v8 = MEMORY[0x263F8EE78];
LABEL_43:
  v2[52] = v6;
  uint64_t v32 = v2[51];
  uint64_t v33 = v2[21];
  uint64_t v34 = swift_task_alloc();
  *(void *)(v34 + 16) = v33;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:), v34);
  if (v32)
  {
    return swift_release();
  }
  uint64_t v36 = v2[40];
  uint64_t v37 = v2[21];
  swift_task_dealloc();
  uint64_t v0 = specialized Collection.prefix(_:)(*(void *)(v37 + *(int *)(v36 + 28)), v8);
  id v1 = v38;
  uint64_t v3 = v39;
  uint64_t v5 = v40;
  if (v40)
  {
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    uint64_t v42 = swift_dynamicCastClass();
    if (!v42)
    {
      swift_unknownObjectRelease();
      uint64_t v42 = MEMORY[0x263F8EE78];
    }
    uint64_t v43 = *(void *)(v42 + 16);
    swift_release();
    if (__OFSUB__(v5 >> 1, v3)) {
      goto LABEL_60;
    }
    if (v43 == (v5 >> 1) - v3)
    {
      uint64_t v41 = swift_dynamicCastClass();
      swift_bridgeObjectRelease();
      if (!v41)
      {
        swift_unknownObjectRelease();
        uint64_t v41 = MEMORY[0x263F8EE78];
      }
      goto LABEL_55;
    }
LABEL_61:
    swift_unknownObjectRelease();
  }
  uint64_t v41 = specialized _copyCollectionToContiguousArray<A>(_:)(v0, v1, v3, v5);
  swift_bridgeObjectRelease();
LABEL_55:
  v2[53] = v41;
  uint64_t v44 = (void *)v2[22];
  swift_unknownObjectRelease();
  double v45 = v44[18];
  uint64_t v46 = v44[19];
  __swift_project_boxed_opaque_existential_1(v44 + 15, v45);
  double v57 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v46 + 8) + **(int **)(v46 + 8));
  swift_retain();
  swift_bridgeObjectRetain();
  double v47 = (void *)swift_task_alloc();
  v2[54] = v47;
  *double v47 = v2;
  v47[1] = LLMCacheManager.list(with:);
  return v57(v6, v45, v46);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v7;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = LLMCacheManager.list(with:);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 176);
    swift_bridgeObjectRelease();
    uint64_t v4 = LLMCacheManager.list(with:);
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v27;
  unsigned int (**v28)(uint64_t, uint64_t, uint64_t);
  void (**v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (**v30)(uint64_t, uint64_t);
  uint64_t (*v31)(unint64_t, uint64_t, uint64_t);
  unint64_t v32;
  uint64_t v33;

  id v1 = v0[53];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (void *)v0[55];
    uint64_t v4 = v0[29];
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    id v29 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v30 = (uint64_t (**)(uint64_t, uint64_t))(v0[25] + 8);
    uint64_t v27 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    id v28 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    swift_bridgeObjectRetain_n();
    os_log_type_t v7 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v32 = v7;
      BOOL v8 = v0[27];
      uint64_t v9 = v0[24];
      outlined init with copy of ListRequest(v5, v0[32], type metadata accessor for AnnotatedCacheEntry);
      char v10 = AnnotatedCacheEntry.builder()();
      static Date.now.getter();
      uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 376))(v8);
      swift_release();
      uint64_t v12 = (*v30)(v8, v9);
      (*(void (**)(uint64_t))(*(void *)v11 + 440))(v12);
      swift_release();
      if (v3)
      {

        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      unint64_t v14 = v0[32];
      uint64_t v15 = v0[28];
      unint64_t v16 = v0[23];
      (*v29)(v16, v13, 1, v15);
      outlined destroy of ListRequest(v14, type metadata accessor for AnnotatedCacheEntry);
      if ((*v28)(v16, 1, v15) == 1)
      {
        outlined destroy of Date?(v0[23], &demangling cache variable for type metadata for AnnotatedCacheEntry?);
        os_log_type_t v7 = v32;
      }
      else
      {
        char v18 = v0[30];
        uint64_t v17 = v0[31];
        outlined init with take of AnnotatedCacheEntry(v0[23], v17);
        outlined init with take of AnnotatedCacheEntry(v17, v18);
        os_log_type_t v7 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v32 + 16) + 1, 1, v32, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        uint64_t v20 = *(void *)(v7 + 16);
        uint64_t v19 = *(void *)(v7 + 24);
        if (v20 >= v19 >> 1) {
          os_log_type_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1, v7, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        uint64_t v21 = v0[30];
        *(void *)(v7 + 16) = v20 + 1;
        outlined init with take of AnnotatedCacheEntry(v21, v7 + v27 + v20 * v6);
      }
      uint64_t v3 = 0;
      v5 += v6;
      --v2;
    }
    while (v2);
    swift_release_n();
  }
  else
  {
    os_log_type_t v7 = MEMORY[0x263F8EE78];
  }
  v0[56] = v7;
  char v22 = (void *)v0[22];
  uint64_t v23 = v22[18];
  uint64_t v24 = v22[19];
  __swift_project_boxed_opaque_existential_1(v22 + 15, v23);
  uint64_t v31 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(*(void *)(v24 + 24) + **(int **)(v24 + 24));
  uint64_t v25 = (void *)swift_task_alloc();
  v0[57] = v25;
  *uint64_t v25 = v0;
  v25[1] = LLMCacheManager.list(with:);
  return v31(v7, v23, v24);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 464) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 176);
  if (v0) {
    uint64_t v4 = LLMCacheManager.list(with:);
  }
  else {
    uint64_t v4 = LLMCacheManager.list(with:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v13;

  swift_bridgeObjectRelease();
  id v1 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v0 + 384) + 120))(v2, v5, v1);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v5;
  os_log_type_t v7 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5((void (*)(void *__return_ptr, uint64_t))partial apply for closure #2 in LLMCacheManager.list(with:), v6, v1);
  swift_release_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  BOOL v8 = *(void *)(v0 + 360);
  uint64_t v9 = *(void *)(v0 + 368);
  char v10 = *(void *)(v0 + 352);
  **(void **)(v0 + 160) = v7;
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned char *v21;
  uint64_t (*v22)(void);
  uint64_t v24[2];
  void *v25;
  uint64_t v26;

  uint64_t v25 = v0;
  id v1 = (void *)v0[51];
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[51];
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    BOOL v8 = swift_slowAlloc();
    v24[0] = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    v0[11] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v4, v5, "Failed to list: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v8, -1, -1);
    MEMORY[0x25A27A310](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[51];
  }
  uint64_t v12 = (void *)v0[51];
  uint64_t v13 = v0[48];
  uint64_t v15 = v0[45];
  unint64_t v14 = v0[46];
  unint64_t v16 = v0[44];
  char v18 = v0[38];
  uint64_t v17 = v0[39];
  uint64_t v19 = v0[37];
  uint64_t v20 = v0[21];
  LOBYTE(v24[0]) = 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v13 + 128))(v17, v20, v24);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  char *v21 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v36;
  unsigned int (**v37)(uint64_t, uint64_t, uint64_t);
  void (**v38)(uint64_t, void, uint64_t, uint64_t);
  uint64_t (*v39)(unint64_t, uint64_t, uint64_t);
  uint64_t (**v40)(uint64_t, uint64_t);
  uint64_t v41;
  void *v42;
  uint64_t v43;

  uint64_t v42 = v0;
  id v1 = (void *)v0[55];
  swift_bridgeObjectRelease();
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[55];
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    BOOL v8 = swift_slowAlloc();
    uint64_t v41 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    v0[18] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v4, v5, "Failed to delete expired entries, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v8, -1, -1);
    MEMORY[0x25A27A310](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[55];
  }
  uint64_t v12 = v0[53];
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    unint64_t v14 = v0[29];
    uint64_t v15 = v12 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    unint64_t v16 = *(void *)(v14 + 72);
    uint64_t v38 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56);
    id v40 = (uint64_t (**)(uint64_t, uint64_t))(v0[25] + 8);
    uint64_t v36 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v37 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    swift_bridgeObjectRetain_n();
    uint64_t v17 = MEMORY[0x263F8EE78];
    do
    {
      char v18 = v0[27];
      uint64_t v19 = v0[24];
      outlined init with copy of ListRequest(v15, v0[32], type metadata accessor for AnnotatedCacheEntry);
      uint64_t v20 = AnnotatedCacheEntry.builder()();
      static Date.now.getter();
      uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 376))(v18);
      swift_release();
      char v22 = (*v40)(v18, v19);
      (*(void (**)(uint64_t))(*(void *)v21 + 440))(v22);
      swift_release();
      uint64_t v23 = v0[32];
      uint64_t v24 = v0[28];
      uint64_t v25 = v0[23];
      (*v38)(v25, 0, 1, v24);
      outlined destroy of ListRequest(v23, type metadata accessor for AnnotatedCacheEntry);
      if ((*v37)(v25, 1, v24) == 1)
      {
        outlined destroy of Date?(v0[23], &demangling cache variable for type metadata for AnnotatedCacheEntry?);
      }
      else
      {
        uint64_t v27 = v0[30];
        uint64_t v26 = v0[31];
        outlined init with take of AnnotatedCacheEntry(v0[23], v26);
        outlined init with take of AnnotatedCacheEntry(v26, v27);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v17 + 16) + 1, 1, v17, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        id v29 = *(void *)(v17 + 16);
        id v28 = *(void *)(v17 + 24);
        if (v29 >= v28 >> 1) {
          uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1, v17, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
        }
        uint64_t v30 = v0[30];
        *(void *)(v17 + 16) = v29 + 1;
        outlined init with take of AnnotatedCacheEntry(v30, v17 + v36 + v29 * v16);
      }
      v15 += v16;
      --v13;
    }
    while (v13);
    swift_release_n();
  }
  else
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  v0[56] = v17;
  uint64_t v31 = (void *)v0[22];
  uint64_t v32 = v31[18];
  uint64_t v33 = v31[19];
  __swift_project_boxed_opaque_existential_1(v31 + 15, v32);
  id v39 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(*(void *)(v33 + 24) + **(int **)(v33 + 24));
  uint64_t v34 = (void *)swift_task_alloc();
  v0[57] = v34;
  char *v34 = v0;
  v34[1] = LLMCacheManager.list(with:);
  return v39(v17, v32, v33);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  uint64_t v25 = v0;
  id v1 = *(void **)(v0 + 464);
  swift_bridgeObjectRelease();
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 464);
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    BOOL v8 = swift_slowAlloc();
    uint64_t v24 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = Error.localizedDescription.getter();
    *(void *)(v0 + 120) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v4, v5, "Failed to update last accessed time for entries, error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v8, -1, -1);
    MEMORY[0x25A27A310](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 464);
  }
  uint64_t v12 = *(void *)(v0 + 424);
  unint64_t v14 = *(void *)(v0 + 304);
  uint64_t v13 = *(void *)(v0 + 312);
  uint64_t v15 = *(void *)(v0 + 296);
  unint64_t v16 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v0 + 384) + 120))(v13, v16, v12);
  uint64_t v17 = swift_task_alloc();
  *(void *)(v17 + 16) = v16;
  char v18 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5((void (*)(void *__return_ptr, uint64_t))partial apply for closure #2 in LLMCacheManager.list(with:), v17, v12);
  swift_release_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  uint64_t v19 = *(void *)(v0 + 360);
  uint64_t v20 = *(void *)(v0 + 368);
  uint64_t v21 = *(void *)(v0 + 352);
  **(void **)(v0 + 160) = v18;
  $defer #1 () in LLMCacheManager.list(with:)();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t LLMCacheManager.list(with:)(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[50] = a1;
  v3[51] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[22];
  if (v1) {
    uint64_t v5 = LLMCacheManager.list(with:);
  }
  else {
    uint64_t v5 = LLMCacheManager.list(with:);
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

void $defer #1 () in LLMCacheManager.list(with:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_254432000, oslog, v2, "LLMCacheManager leaving list...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2)
{
  v16[2] = a2;
  uint64_t v17 = a1;
  swift_bridgeObjectRetain();
  specialized MutableCollection<>.sort(by:)(closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)partial apply, (uint64_t)v16);
  uint64_t v3 = v17;
  uint64_t v4 = type metadata accessor for ListRequest();
  uint64_t v5 = specialized Collection.prefix(_:)(*(void *)(a2 + *(int *)(v4 + 28)), v3);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v11 = v10;
  if ((v10 & 1) == 0) {
    goto LABEL_2;
  }
  type metadata accessor for __ContiguousArrayStorageBase();
  swift_unknownObjectRetain_n();
  uint64_t v13 = swift_dynamicCastClass();
  if (!v13)
  {
    swift_unknownObjectRelease();
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  uint64_t v14 = *(void *)(v13 + 16);
  swift_release();
  if (__OFSUB__(v11 >> 1, v9))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v14 != (v11 >> 1) - v9)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v12 = specialized _copyCollectionToContiguousArray<A>(_:)(v5, v7, v9, v11);
    goto LABEL_9;
  }
  uint64_t v12 = swift_dynamicCastClass();
  if (!v12)
  {
    swift_unknownObjectRelease();
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v12;
}

uint64_t closure #2 in LLMCacheManager.list(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v8 = (uint64_t *)(a1 + *(int *)(v7 + 32));
  uint64_t v9 = v8[1];
  unint64_t v10 = *(void **)(a1 + *(int *)(v7 + 36));
  uint64_t v11 = v10[2];
  uint64_t v19 = *v8;
  if (!v11) {
    goto LABEL_9;
  }
  BOOL v12 = v10[4] == v5 && v10[5] == v6;
  if (v12 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
  {
LABEL_7:
    char v14 = 1;
LABEL_10:
    *(void *)a3 = v19;
    *(void *)(a3 + 8) = v9;
    *(unsigned char *)(a3 + 16) = v14;
    return swift_bridgeObjectRetain();
  }
  if (v11 == 1)
  {
LABEL_9:
    char v14 = 0;
    goto LABEL_10;
  }
  uint64_t v15 = v10 + 7;
  uint64_t v16 = 1;
  while (1)
  {
    uint64_t v17 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (*(v15 - 1) == v5 && *v15 == v6) {
      goto LABEL_7;
    }
    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      goto LABEL_7;
    }
    char v14 = 0;
    v15 += 2;
    ++v16;
    if (v17 == v11) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay8LLMCache19AnnotatedCacheEntryVG_AF0fG0Vs5NeverOTg5(void (*a1)(void *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0);
    uint64_t v6 = v22;
    uint64_t v8 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
    uint64_t v9 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v18 = *(void *)(v8 + 72);
    while (1)
    {
      a1(v20, v9);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v10 = v20[0];
      uint64_t v11 = v20[1];
      char v12 = v21;
      uint64_t v22 = v6;
      unint64_t v14 = *(void *)(v6 + 16);
      unint64_t v13 = *(void *)(v6 + 24);
      if (v14 >= v13 >> 1)
      {
        uint64_t v16 = v20[0];
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v16;
        uint64_t v6 = v22;
      }
      *(void *)(v6 + 16) = v14 + 1;
      uint64_t v15 = v6 + 24 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v11;
      *(unsigned char *)(v15 + 48) = v12;
      v9 += v18;
      if (!--v5) {
        return v6;
      }
    }
    swift_release();
  }
  return v6;
}

uint64_t LLMCacheManager.isEnabled()()
{
  if (*(unsigned char *)(v0 + 112))
  {
    if (*(unsigned char *)(v0 + 112) == 1)
    {
      swift_beginAccess();
      char v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
      if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
      {
        uint64_t v6 = &type metadata for LLMCacheManagerFeatureFlags;
        unint64_t v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
        char v2 = 1;
LABEL_9:
        v5[0] = v2;
        goto LABEL_10;
      }
    }
    else
    {
      swift_beginAccess();
      char v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
      if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
      {
        uint64_t v6 = &type metadata for LLMCacheManagerFeatureFlags;
        unint64_t v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
        char v2 = 2;
        goto LABEL_9;
      }
    }
LABEL_11:
    char v3 = v1 & 1;
    return v3 & 1;
  }
  swift_beginAccess();
  char v1 = static LLMCacheManagerFeatureFlags.forceEnabled;
  if (static LLMCacheManagerFeatureFlags.forceEnabled != 2) {
    goto LABEL_11;
  }
  uint64_t v6 = &type metadata for LLMCacheManagerFeatureFlags;
  unint64_t v7 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
  v5[0] = 0;
LABEL_10:
  char v3 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  return v3 & 1;
}

uint64_t closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = type metadata accessor for ListRequest();
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v10 = (uint64_t *)((char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8, v11);
  unint64_t v13 = (uint64_t *)((char *)&v38 - v12);
  uint64_t v14 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v16 = MEMORY[0x270FA5388](v14, v15);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v16, v19);
  uint64_t v22 = (char *)&v38 - v21;
  uint64_t v23 = *(int *)(v20 + 36);
  uint64_t v39 = a1;
  uint64_t v24 = *(void **)(a1 + v23);
  LOBYTE(a1) = specialized Sequence<>.contains(_:)(*a3, a3[1], v24);
  outlined init with copy of ListRequest(a2, (uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
  outlined init with copy of ListRequest((uint64_t)a3, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ListRequest);
  if ((a1 & 1) == 0)
  {
    outlined destroy of ListRequest((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ListRequest);
    outlined destroy of ListRequest((uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
LABEL_5:
    char v27 = specialized Sequence<>.contains(_:)(*a3, a3[1], v24);
    outlined init with copy of ListRequest(a2, (uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
    outlined init with copy of ListRequest((uint64_t)a3, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ListRequest);
    if (v27)
    {
      outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ListRequest);
      outlined destroy of ListRequest((uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
    }
    else
    {
      char v28 = specialized Sequence<>.contains(_:)(*v10, v10[1], *(void **)&v18[*(int *)(v14 + 36)]);
      outlined destroy of ListRequest((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ListRequest);
      outlined destroy of ListRequest((uint64_t)v18, type metadata accessor for AnnotatedCacheEntry);
      if (v28)
      {
        char v26 = 0;
        return v26 & 1;
      }
    }
    uint64_t v29 = *(int *)(v14 + 48);
    uint64_t v30 = (double *)(v39 + v29);
    char v31 = *(unsigned char *)(v39 + v29 + 8);
    uint64_t v32 = a2 + v29;
    double v33 = *(double *)(a2 + v29);
    char v34 = *(unsigned char *)(v32 + 8);
    if (v31)
    {
      if ((v34 & 1) == 0)
      {
        double v35 = v33;
        double v36 = 0.0;
LABEL_15:
        char v26 = v35 < v36;
        return v26 & 1;
      }
    }
    else
    {
      double v36 = *v30;
      double v35 = 0.0;
      if (v34) {
        goto LABEL_15;
      }
      double v35 = v33;
      if (v36 != v33) {
        goto LABEL_15;
      }
    }
    char v26 = static Date.> infix(_:_:)();
    return v26 & 1;
  }
  char v25 = specialized Sequence<>.contains(_:)(*v13, v13[1], *(void **)&v22[*(int *)(v14 + 36)]);
  outlined destroy of ListRequest((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ListRequest);
  outlined destroy of ListRequest((uint64_t)v22, type metadata accessor for AnnotatedCacheEntry);
  if (v25) {
    goto LABEL_5;
  }
  char v26 = 1;
  return v26 & 1;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      type metadata accessor for AnnotatedCacheEntry(0);
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t LLMCacheManager.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for InsertRequest();
  v5[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.insert(searchKey:llmOutput:), v4, 0);
}

uint64_t LLMCacheManager.insert(searchKey:llmOutput:)()
{
  char v1 = (void *)v0[8];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v4 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UUID.init()();
  void *v1 = v5;
  v1[1] = v4;
  v1[2] = v3;
  v1[3] = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  *uint64_t v6 = v0;
  v6[1] = LLMCacheManager.insert(searchKey:llmOutput:);
  uint64_t v7 = v0[8];
  return LLMCacheManager.insert(with:)(v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = LLMCacheManager.insert(searchKey:llmOutput:);
  }
  else {
    uint64_t v4 = LLMCacheManager.insert(searchKey:llmOutput:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of ListRequest(*(void *)(v0 + 64), (uint64_t (*)(void))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of ListRequest(*(void *)(v0 + 64), (uint64_t (*)(void))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t LLMCacheManager.insert(with:)(uint64_t a1)
{
  v2[32] = a1;
  v2[33] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for UserID();
  v2[36] = v3;
  v2[37] = *(void *)(v3 - 8);
  v2[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Date();
  v2[41] = v4;
  v2[42] = *(void *)(v4 - 8);
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for UUID();
  v2[49] = v5;
  v2[50] = *(void *)(v5 - 8);
  v2[51] = swift_task_alloc();
  v2[52] = type metadata accessor for InsertRequest();
  v2[53] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for OSSignpostID();
  v2[54] = v6;
  v2[55] = *(void *)(v6 - 8);
  v2[56] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.insert(with:), v1, 0);
}

uint64_t LLMCacheManager.insert(with:)()
{
  uint64_t v35 = v0;
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v0 + 456) = __swift_project_value_buffer(v4, (uint64_t)static Logger.logger);
  outlined init with copy of ListRequest(v3, v2, (uint64_t (*)(void))type metadata accessor for InsertRequest);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(uint64_t **)(v0 + 424);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v34 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v12 = *v8;
    unint64_t v11 = v8[1];
    swift_bridgeObjectRetain();
    *(void *)(v0 + 248) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v11, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of ListRequest((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for InsertRequest);
    _os_log_impl(&dword_254432000, v5, v6, "LLMCacheManager entering insert with search key %s...", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v10, -1, -1);
    MEMORY[0x25A27A310](v9, -1, -1);
  }
  else
  {
    outlined destroy of ListRequest(*(void *)(v0 + 424), (uint64_t (*)(void))type metadata accessor for InsertRequest);
  }

  if (LLMCacheManager.isEnabled()())
  {
    uint64_t v13 = *(void *)(v0 + 416);
    uint64_t v14 = *(void *)(v0 + 256);
    uint64_t v15 = *(void *)(v0 + 264);
    uint64_t v16 = *(void *)(v15 + 168);
    *(void *)(v0 + 464) = v16;
    uint64_t v17 = v14 + *(int *)(v13 + 24);
    LOBYTE(v13) = *(unsigned char *)(v15 + 112);
    *(unsigned char *)(v0 + 553) = v13;
    char v33 = v13;
    (*(void (**)(uint64_t, char *))(*(void *)v16 + 88))(v17, &v33);
    uint64_t v18 = specialized static LLMCacheManager.generateEntryId(searchKey:llmOutput:)(*(void *)v14, *(void *)(v14 + 8), *(void *)(v14 + 16), *(void **)(v14 + 24));
    *(void *)(v0 + 472) = v18;
    uint64_t v19 = (void *)(v15 + 120);
    uint64_t v20 = *(void *)(v15 + 144);
    uint64_t v21 = *(void *)(v15 + 152);
    __swift_project_boxed_opaque_existential_1(v19, v20);
    *(void *)(v0 + 208) = v18;
    uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v24 = v23;
    *(void *)(v0 + 480) = v23;
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 16)
                                                                              + **(int **)(v21 + 16));
    char v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v25;
    *char v25 = v0;
    v25[1] = LLMCacheManager.insert(with:);
    uint64_t v26 = *(void *)(v0 + 384);
    return v32(v26, v22, v24, v20, v21);
  }
  else
  {
    uint64_t v29 = *(void *)(v0 + 440);
    uint64_t v28 = *(void *)(v0 + 448);
    uint64_t v30 = *(void *)(v0 + 432);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v7;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = LLMCacheManager.insert(with:);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 264);
    swift_bridgeObjectRelease();
    uint64_t v4 = LLMCacheManager.insert(with:);
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(void);
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned char *v67;
  uint64_t (*v68)(void);
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t (*v78)();
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void **v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  char v87;
  uint64_t v88;
  void (*v89)(void);
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t, uint64_t);
  uint64_t v92[2];
  uint64_t v93;
  uint64_t v94;

  uint64_t v93 = v0;
  id v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_254432000, v1, v2, "Found an existing cache entry, going to update it by appending new search key", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
  uint64_t v4 = *(void **)(v0 + 496);
  uint64_t v5 = *(void *)(v0 + 352);
  os_log_type_t v6 = *(void *)(v0 + 328);
  BOOL v7 = *(void *)(v0 + 336);
  uint64_t v8 = *(void **)(v0 + 256);

  uint64_t v9 = AnnotatedCacheEntry.builder()();
  static Date.now.getter();
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 384))(v5);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  unint64_t v11 = (*(uint64_t (**)(void, void))(*(void *)v10 + 400))(*v8, v8[1]);
  uint64_t v12 = swift_release();
  (*(void (**)(uint64_t))(*(void *)v11 + 440))(v12);
  if (!v4)
  {
    unint64_t v54 = *(void *)(v0 + 376);
    unint64_t v55 = *(void *)(v0 + 360);
    uint64_t v56 = *(void **)(v0 + 264);
    swift_release();
    double v57 = v56 + 15;
    uint64_t v73 = v56[18];
    uint64_t v74 = v56[19];
    __swift_project_boxed_opaque_existential_1(v57, v73);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    uint64_t v58 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    uint64_t v76 = swift_allocObject();
    *(void *)(v0 + 504) = v76;
    *(_OWORD *)(v76 + 16) = xmmword_254463350;
    outlined init with copy of ListRequest(v54, v76 + v58, type metadata accessor for AnnotatedCacheEntry);
    uint64_t v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 + 24) + **(int **)(v74 + 24));
    uint64_t v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 512) = v77;
    char *v77 = v0;
    uint64_t v78 = LLMCacheManager.insert(with:);
LABEL_18:
    v77[1] = v78;
    return v91(v76, v73, v74);
  }
  uint64_t v13 = v4;
  outlined destroy of ListRequest(*(void *)(v0 + 384), type metadata accessor for AnnotatedCacheEntry);
  swift_release();
  *(void *)(v0 + 240) = v4;
  uint64_t v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(unsigned char *)(v0 + 552) == 2)
  {

    uint64_t v15 = Logger.logObject.getter();
    uint64_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_254432000, v15, v16, "No existing cache entry found, going to insert a new entry", v17, 2u);
      MEMORY[0x25A27A310](v17, -1, -1);
    }
    uint64_t v18 = *(void *)(v0 + 472);
    unint64_t v87 = *(unsigned char *)(v0 + 553);
    uint64_t v19 = *(void *)(v0 + 336);
    double v81 = *(void *)(v0 + 344);
    uint64_t v20 = *(void *)(v0 + 320);
    uint64_t v21 = *(void *)(v0 + 328);
    uint64_t v85 = *(void *)(v0 + 312);
    uint64_t v22 = *(void *)(v0 + 296);
    int v86 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(void *)(v0 + 216) = v18;
    uint64_t v79 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v82 = v23;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    uint64_t v24 = swift_allocObject();
    uint64_t v80 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    char v25 = *(void (**)(void))(v19 + 56);
    v25();
    uint64_t v84 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v25();
    uint64_t v26 = (uint64_t *)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *uint64_t v26 = 0;
    v26[1] = 0;
    char v27 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(void *)char v27 = 0;
    unint64_t v88 = v27;
    *(unsigned char *)(v27 + 8) = 1;
    uint64_t v90 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    uint64_t v89 = *(void (**)(void))(v22 + 56);
    v89();
    uint64_t v28 = v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(void *)uint64_t v28 = 0;
    *(unsigned char *)(v28 + 8) = 1;
    *(void *)(v24 + 16) = v79;
    *(void *)(v24 + 24) = v82;
    *(unsigned char *)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v87;
    double v83 = (void **)(v24 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    char *v83 = (void *)MEMORY[0x263F8EE78];
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
    v29(v20, v81, v21);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v25)(v20, 0, 1, v21);
    outlined init with take of Date?(v20, v85, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v85, v80, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v29(v20, v81, v21);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v25)(v20, 0, 1, v21);
    outlined init with take of Date?(v20, v85, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v85, v84, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    char v31 = v86[2];
    uint64_t v30 = v86[3];
    swift_beginAccess();
    *uint64_t v26 = v31;
    v26[1] = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v32 = *v86;
    char v33 = v86[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v32, v33, *v83) & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v34 = *v83;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      char *v83 = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v34[2] + 1, 1, v34);
        char *v83 = v34;
      }
      uint64_t v37 = v34[2];
      uint64_t v36 = v34[3];
      if (v37 >= v36 >> 1)
      {
        uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v36 > 1), v37 + 1, 1, v34);
        char *v83 = v34;
      }
      v34[2] = v37 + 1;
      uint64_t v38 = &v34[2 * v37];
      v38[4] = v32;
      v38[5] = v33;
      swift_endAccess();
    }
    uint64_t v39 = *(uint64_t **)(v0 + 368);
    uint64_t v41 = *(void *)(v0 + 296);
    id v40 = *(void *)(v0 + 304);
    uint64_t v43 = *(void *)(v0 + 280);
    uint64_t v42 = *(void *)(v0 + 288);
    uint64_t v44 = *(void *)(v0 + 272);
    double v45 = *(void *)(*(void *)(v0 + 264) + 160);
    swift_beginAccess();
    *(void *)unint64_t v88 = v45;
    *(unsigned char *)(v88 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v43, v40, v42);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v89)(v43, 0, 1, v42);
    outlined init with take of Date?(v43, v44, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v44, v90, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    AnnotatedCacheEntryBuilder.build()(v39);
    Swift::Int v70 = *(void *)(v0 + 360);
    unint64_t v69 = *(void *)(v0 + 368);
    uint64_t v71 = *(void **)(v0 + 264);
    swift_release();
    Swift::Int v72 = v71 + 15;
    uint64_t v73 = v71[18];
    uint64_t v74 = v71[19];
    __swift_project_boxed_opaque_existential_1(v72, v73);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    Swift::Int v75 = (*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
    uint64_t v76 = swift_allocObject();
    *(void *)(v0 + 528) = v76;
    *(_OWORD *)(v76 + 16) = xmmword_254463350;
    outlined init with copy of ListRequest(v69, v76 + v75, type metadata accessor for AnnotatedCacheEntry);
    uint64_t v91 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 + 24) + **(int **)(v74 + 24));
    uint64_t v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 536) = v77;
    char *v77 = v0;
    uint64_t v78 = LLMCacheManager.insert(with:);
    goto LABEL_18;
  }

  uint64_t v46 = v4;
  double v47 = v4;
  os_log_type_t v48 = Logger.logObject.getter();
  unint64_t v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v92[0] = v51;
    *(_DWORD *)uint64_t v50 = 136315138;
    swift_getErrorValue();
    unint64_t v52 = Error.localizedDescription.getter();
    *(void *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v53, v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v48, v49, "Failed to insert: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v51, -1, -1);
    MEMORY[0x25A27A310](v50, -1, -1);
  }
  else
  {
  }
  BOOL v60 = *(void *)(v0 + 464);
  uint64_t v62 = *(void *)(v0 + 440);
  uint64_t v61 = *(void *)(v0 + 448);
  uint64_t v63 = *(void *)(v0 + 432);
  uint64_t v65 = *(void *)(v0 + 400);
  uint64_t v64 = *(void *)(v0 + 408);
  Swift::Int v66 = *(void *)(v0 + 392);
  LOBYTE(v92[0]) = 1;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v60 + 104))(v64, v92);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  char *v67 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v68 = *(uint64_t (**)(void))(v0 + 8);
  return v68();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 520) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v4 = LLMCacheManager.insert(with:);
  }
  else {
    uint64_t v4 = LLMCacheManager.insert(with:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  id v1 = *(void *)(v0 + 384);
  outlined destroy of ListRequest(*(void *)(v0 + 376), type metadata accessor for AnnotatedCacheEntry);
  outlined destroy of ListRequest(v1, type metadata accessor for AnnotatedCacheEntry);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v4 = *(void *)(v0 + 392);
  (*(void (**)(uint64_t))(**(void **)(v0 + 464) + 96))(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  os_log_type_t v6 = *(void *)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 448);
  BOOL v7 = *(void *)(v0 + 432);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 544) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v4 = LLMCacheManager.insert(with:);
  }
  else {
    uint64_t v4 = LLMCacheManager.insert(with:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  uint64_t v2 = *(void *)(v0 + 336);
  id v1 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 328);
  outlined destroy of ListRequest(*(void *)(v0 + 368), type metadata accessor for AnnotatedCacheEntry);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);

  uint64_t v5 = *(void *)(v0 + 400);
  uint64_t v4 = *(void *)(v0 + 408);
  os_log_type_t v6 = *(void *)(v0 + 392);
  (*(void (**)(uint64_t))(**(void **)(v0 + 464) + 96))(v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = *(void *)(v0 + 440);
  BOOL v7 = *(void *)(v0 + 448);
  uint64_t v9 = *(void *)(v0 + 432);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned char *v47;
  uint64_t (*v48)(void);
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  void (*v60)(void);
  uint64_t v61;
  uint64_t v62;
  void **v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  void (*v69)(void);
  uint64_t v70;
  char v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73[3];
  uint64_t v74;
  uint64_t v75;

  uint64_t v74 = v0;
  swift_bridgeObjectRelease();
  id v1 = *(void **)(v0 + 496);
  *(void *)(v0 + 240) = v1;
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(unsigned char *)(v0 + 552) == 2)
  {

    uint64_t v3 = Logger.logObject.getter();
    uint64_t v4 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_254432000, v3, v4, "No existing cache entry found, going to insert a new entry", v5, 2u);
      MEMORY[0x25A27A310](v5, -1, -1);
    }
    os_log_type_t v6 = *(void *)(v0 + 472);
    uint64_t v71 = *(unsigned char *)(v0 + 553);
    BOOL v7 = *(void *)(v0 + 336);
    uint64_t v64 = *(void *)(v0 + 344);
    uint64_t v8 = *(void *)(v0 + 328);
    double v59 = *(void *)(v0 + 320);
    Swift::Int v66 = *(void *)(v0 + 312);
    uint64_t v9 = *(void *)(v0 + 296);
    uint64_t v67 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(void *)(v0 + 216) = v6;
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v62 = v11;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    uint64_t v12 = swift_allocObject();
    BOOL v60 = *(void (**)(void))(v7 + 56);
    uint64_t v61 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    v60();
    uint64_t v65 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v60();
    uint64_t v13 = (uint64_t *)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *uint64_t v13 = 0;
    v13[1] = 0;
    uint64_t v14 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(void *)uint64_t v14 = 0;
    uint64_t v68 = v14;
    *(unsigned char *)(v14 + 8) = 1;
    Swift::Int v70 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    unint64_t v69 = *(void (**)(void))(v9 + 56);
    v69();
    uint64_t v15 = v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(void *)uint64_t v15 = 0;
    *(unsigned char *)(v15 + 8) = 1;
    *(void *)(v12 + 16) = v10;
    *(void *)(v12 + 24) = v62;
    *(unsigned char *)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v71;
    uint64_t v63 = (void **)(v12 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    *uint64_t v63 = (void *)MEMORY[0x263F8EE78];
    uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v58(v59, v64, v8);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v60)(v59, 0, 1, v8);
    outlined init with take of Date?(v59, v66, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v66, v61, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v58(v59, v64, v8);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v60)(v59, 0, 1, v8);
    outlined init with take of Date?(v59, v66, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v66, v65, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    uint64_t v16 = v67[2];
    uint64_t v17 = v67[3];
    swift_beginAccess();
    *uint64_t v13 = v16;
    v13[1] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v18 = *v67;
    uint64_t v19 = v67[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v18, v19, *v63) & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v20 = *v63;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v63 = v20;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20[2] + 1, 1, v20);
        *uint64_t v63 = v20;
      }
      uint64_t v23 = v20[2];
      uint64_t v22 = v20[3];
      if (v23 >= v22 >> 1)
      {
        uint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v22 > 1), v23 + 1, 1, v20);
        *uint64_t v63 = v20;
      }
      void v20[2] = v23 + 1;
      uint64_t v24 = &v20[2 * v23];
      v24[4] = v18;
      v24[5] = v19;
      swift_endAccess();
    }
    char v25 = *(uint64_t **)(v0 + 368);
    char v27 = *(void *)(v0 + 296);
    uint64_t v26 = *(void *)(v0 + 304);
    uint64_t v29 = *(void *)(v0 + 280);
    uint64_t v28 = *(void *)(v0 + 288);
    uint64_t v30 = *(void *)(v0 + 272);
    char v31 = *(void *)(*(void *)(v0 + 264) + 160);
    swift_beginAccess();
    *(void *)uint64_t v68 = v31;
    *(unsigned char *)(v68 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v29, v26, v28);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v69)(v29, 0, 1, v28);
    outlined init with take of Date?(v29, v30, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v30, v70, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    AnnotatedCacheEntryBuilder.build()(v25);
    uint64_t v51 = *(void *)(v0 + 360);
    uint64_t v50 = *(void *)(v0 + 368);
    unint64_t v52 = *(void **)(v0 + 264);
    swift_release();
    unint64_t v53 = v52[18];
    unint64_t v54 = v52[19];
    __swift_project_boxed_opaque_existential_1(v52 + 15, v53);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    unint64_t v55 = (*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
    uint64_t v56 = swift_allocObject();
    *(void *)(v0 + 528) = v56;
    *(_OWORD *)(v56 + 16) = xmmword_254463350;
    outlined init with copy of ListRequest(v50, v56 + v55, type metadata accessor for AnnotatedCacheEntry);
    Swift::Int v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 + 24) + **(int **)(v54 + 24));
    double v57 = (void *)swift_task_alloc();
    *(void *)(v0 + 536) = v57;
    *double v57 = v0;
    v57[1] = LLMCacheManager.insert(with:);
    return v72(v56, v53, v54);
  }
  else
  {

    uint64_t v32 = v1;
    char v33 = v1;
    uint64_t v34 = Logger.logObject.getter();
    uint64_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v73[0] = v37;
      *(_DWORD *)uint64_t v36 = 136315138;
      swift_getErrorValue();
      uint64_t v38 = Error.localizedDescription.getter();
      *(void *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, v34, v35, "Failed to insert: %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v37, -1, -1);
      MEMORY[0x25A27A310](v36, -1, -1);
    }
    else
    {
    }
    id v40 = *(void *)(v0 + 464);
    uint64_t v42 = *(void *)(v0 + 440);
    uint64_t v41 = *(void *)(v0 + 448);
    uint64_t v43 = *(void *)(v0 + 432);
    double v45 = *(void *)(v0 + 400);
    uint64_t v44 = *(void *)(v0 + 408);
    uint64_t v46 = *(void *)(v0 + 392);
    LOBYTE(v73[0]) = 1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v40 + 104))(v44, v73);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *double v47 = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v48 = *(uint64_t (**)(void))(v0 + 8);
    return v48();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned char *v48;
  uint64_t (*v49)(void);
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  void (*v61)(void);
  uint64_t v62;
  uint64_t v63;
  void **v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(void);
  uint64_t v71;
  char v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74[3];
  uint64_t v75;
  uint64_t v76;

  Swift::Int v75 = v0;
  id v1 = *(void *)(v0 + 384);
  outlined destroy of ListRequest(*(void *)(v0 + 376), type metadata accessor for AnnotatedCacheEntry);
  outlined destroy of ListRequest(v1, type metadata accessor for AnnotatedCacheEntry);
  uint64_t v2 = *(void **)(v0 + 520);
  *(void *)(v0 + 240) = v2;
  uint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) != 0 && *(unsigned char *)(v0 + 552) == 2)
  {

    uint64_t v4 = Logger.logObject.getter();
    uint64_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_254432000, v4, v5, "No existing cache entry found, going to insert a new entry", v6, 2u);
      MEMORY[0x25A27A310](v6, -1, -1);
    }
    BOOL v7 = *(void *)(v0 + 472);
    Swift::Int v72 = *(unsigned char *)(v0 + 553);
    uint64_t v8 = *(void *)(v0 + 336);
    uint64_t v65 = *(void *)(v0 + 344);
    uint64_t v9 = *(void *)(v0 + 328);
    BOOL v60 = *(void *)(v0 + 320);
    uint64_t v67 = *(void *)(v0 + 312);
    uint64_t v10 = *(void *)(v0 + 296);
    uint64_t v68 = *(uint64_t **)(v0 + 256);

    static Date.now.getter();
    *(void *)(v0 + 216) = v7;
    unint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v63 = v12;
    type metadata accessor for AnnotatedCacheEntryBuilder(0);
    uint64_t v13 = swift_allocObject();
    uint64_t v61 = *(void (**)(void))(v8 + 56);
    uint64_t v62 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
    v61();
    Swift::Int v66 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
    v61();
    uint64_t v14 = (uint64_t *)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
    *uint64_t v14 = 0;
    v14[1] = 0;
    uint64_t v15 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
    *(void *)uint64_t v15 = 0;
    unint64_t v69 = v15;
    *(unsigned char *)(v15 + 8) = 1;
    uint64_t v71 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
    Swift::Int v70 = *(void (**)(void))(v10 + 56);
    v70();
    uint64_t v16 = v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
    *(void *)uint64_t v16 = 0;
    *(unsigned char *)(v16 + 8) = 1;
    *(void *)(v13 + 16) = v11;
    *(void *)(v13 + 24) = v63;
    *(unsigned char *)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v72;
    uint64_t v64 = (void **)(v13 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
    *uint64_t v64 = (void *)MEMORY[0x263F8EE78];
    double v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v59(v60, v65, v9);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v61)(v60, 0, 1, v9);
    outlined init with take of Date?(v60, v67, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v67, v62, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    v59(v60, v65, v9);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v61)(v60, 0, 1, v9);
    outlined init with take of Date?(v60, v67, &demangling cache variable for type metadata for Date?);
    swift_beginAccess();
    outlined assign with take of Date?(v67, v66, &demangling cache variable for type metadata for Date?);
    swift_endAccess();
    uint64_t v17 = v68[2];
    uint64_t v18 = v68[3];
    swift_beginAccess();
    *uint64_t v14 = v17;
    v14[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v19 = *v68;
    uint64_t v20 = v68[1];
    swift_beginAccess();
    if ((specialized Sequence<>.contains(_:)(v19, v20, *v64) & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v21 = *v64;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v64 = v21;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21[2] + 1, 1, v21);
        *uint64_t v64 = v21;
      }
      uint64_t v24 = v21[2];
      uint64_t v23 = v21[3];
      if (v24 >= v23 >> 1)
      {
        uint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v23 > 1), v24 + 1, 1, v21);
        *uint64_t v64 = v21;
      }
      v21[2] = v24 + 1;
      char v25 = &v21[2 * v24];
      v25[4] = v19;
      v25[5] = v20;
      swift_endAccess();
    }
    uint64_t v26 = *(uint64_t **)(v0 + 368);
    uint64_t v28 = *(void *)(v0 + 296);
    char v27 = *(void *)(v0 + 304);
    uint64_t v30 = *(void *)(v0 + 280);
    uint64_t v29 = *(void *)(v0 + 288);
    char v31 = *(void *)(v0 + 272);
    uint64_t v32 = *(void *)(*(void *)(v0 + 264) + 160);
    swift_beginAccess();
    *(void *)unint64_t v69 = v32;
    *(unsigned char *)(v69 + 8) = 0;
    static UserID.defaultUserId.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v30, v27, v29);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v70)(v30, 0, 1, v29);
    outlined init with take of Date?(v30, v31, &demangling cache variable for type metadata for UserID?);
    swift_beginAccess();
    outlined assign with take of Date?(v31, v71, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    AnnotatedCacheEntryBuilder.build()(v26);
    unint64_t v52 = *(void *)(v0 + 360);
    uint64_t v51 = *(void *)(v0 + 368);
    unint64_t v53 = *(void **)(v0 + 264);
    swift_release();
    unint64_t v54 = v53[18];
    unint64_t v55 = v53[19];
    __swift_project_boxed_opaque_existential_1(v53 + 15, v54);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
    uint64_t v56 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    double v57 = swift_allocObject();
    *(void *)(v0 + 528) = v57;
    *(_OWORD *)(v57 + 16) = xmmword_254463350;
    outlined init with copy of ListRequest(v51, v57 + v56, type metadata accessor for AnnotatedCacheEntry);
    uint64_t v73 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 + 24) + **(int **)(v55 + 24));
    uint64_t v58 = (void *)swift_task_alloc();
    *(void *)(v0 + 536) = v58;
    char *v58 = v0;
    v58[1] = LLMCacheManager.insert(with:);
    return v73(v57, v54, v55);
  }
  else
  {

    char v33 = v2;
    uint64_t v34 = v2;
    uint64_t v35 = Logger.logObject.getter();
    uint64_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v74[0] = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_getErrorValue();
      uint64_t v39 = Error.localizedDescription.getter();
      *(void *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_254432000, v35, v36, "Failed to insert: %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v38, -1, -1);
      MEMORY[0x25A27A310](v37, -1, -1);
    }
    else
    {
    }
    uint64_t v41 = *(void *)(v0 + 464);
    uint64_t v43 = *(void *)(v0 + 440);
    uint64_t v42 = *(void *)(v0 + 448);
    uint64_t v44 = *(void *)(v0 + 432);
    uint64_t v46 = *(void *)(v0 + 400);
    double v45 = *(void *)(v0 + 408);
    double v47 = *(void *)(v0 + 392);
    LOBYTE(v74[0]) = 1;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v41 + 104))(v45, v74);
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    char *v48 = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    $defer #1 () in LLMCacheManager.insert(with:)();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
    return v49();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned char *v20;
  uint64_t (*v21)(void);
  uint64_t v23[2];
  uint64_t v24;
  uint64_t v25;

  uint64_t v24 = v0;
  uint64_t v2 = *(void *)(v0 + 336);
  id v1 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 328);
  outlined destroy of ListRequest(*(void *)(v0 + 368), type metadata accessor for AnnotatedCacheEntry);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void **)(v0 + 544);

  uint64_t v5 = v4;
  os_log_type_t v6 = v4;
  BOOL v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v23[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getErrorValue();
    unint64_t v11 = Error.localizedDescription.getter();
    *(void *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v7, v8, "Failed to insert: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v10, -1, -1);
    MEMORY[0x25A27A310](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(void *)(v0 + 464);
  uint64_t v15 = *(void *)(v0 + 440);
  uint64_t v14 = *(void *)(v0 + 448);
  uint64_t v16 = *(void *)(v0 + 432);
  uint64_t v18 = *(void *)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 408);
  uint64_t v19 = *(void *)(v0 + 392);
  LOBYTE(v23[0]) = 1;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v13 + 104))(v17, v23);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *uint64_t v20 = 1;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  $defer #1 () in LLMCacheManager.insert(with:)();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

void $defer #1 () in LLMCacheManager.insert(with:)()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_254432000, oslog, v2, "LLMCacheManager leaving insert...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
}

uint64_t specialized Data.init<A>(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of ContiguousBytes(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  outlined destroy of Date?((uint64_t)v38, &demangling cache variable for type metadata for ContiguousBytes?);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      os_log_type_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      BOOL v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        os_log_type_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        os_log_type_t v6 = 0;
      }
      BOOL v7 = (uint64_t *)v4;
    }
    uint64_t v8 = specialized Data._Representation.init(_:)(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = specialized Data._Representation.init(count:)(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0], v12);
  unint64_t v13 = (unint64_t)specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    outlined consume of Data._Representation?(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t LLMCacheManager.deleteAll()()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.deleteAll(), v0, 0);
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t (*v11)(void);
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v0 + 88) = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  unint64_t v3 = Logger.logObject.getter();
  uint64_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254432000, v3, v4, "LLMCacheManager entering deleteAll...", v5, 2u);
    MEMORY[0x25A27A310](v5, -1, -1);
  }

  if (LLMCacheManager.isEnabled()())
  {
    os_log_type_t v6 = *(void *)(v0 + 56);
    BOOL v7 = *(void *)(v6 + 144);
    uint64_t v8 = *(void *)(v6 + 152);
    __swift_project_boxed_opaque_existential_1((void *)(v6 + 120), v7);
    *(unsigned char *)(v0 + 112) = *(unsigned char *)(v6 + 112);
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 48) + **(int **)(v8 + 48));
    unint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v9;
    *unint64_t v9 = v0;
    v9[1] = LLMCacheManager.deleteAll();
    return v12(v0 + 112, v7, v8);
  }
  else
  {
    $defer #1 () in LLMCacheManager.deleteAll()();
    (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
    swift_task_dealloc();
    Swift::Int v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  unint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = LLMCacheManager.deleteAll();
  }
  else {
    uint64_t v4 = LLMCacheManager.deleteAll();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  $defer #1 () in LLMCacheManager.deleteAll()();
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned char *v16;
  uint64_t (*v17)(void);
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v1;
  unint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (void *)v0[13];
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    unint64_t v19 = v8;
    *(_DWORD *)BOOL v7 = 136315138;
    swift_getErrorValue();
    unint64_t v9 = Error.localizedDescription.getter();
    v0[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v4, v5, "Failed to deleteAll: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v8, -1, -1);
    MEMORY[0x25A27A310](v7, -1, -1);
  }
  else
  {
    Swift::Int v11 = (void *)v0[13];
  }
  uint64_t v12 = (void *)v0[13];
  unint64_t v14 = v0[9];
  unint64_t v13 = v0[10];
  uint64_t v15 = v0[8];
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *uint64_t v16 = 1;
  swift_willThrow();

  $defer #1 () in LLMCacheManager.deleteAll()();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void $defer #1 () in LLMCacheManager.deleteAll()()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_254432000, oslog, v2, "LLMCacheManager leaving deleteAll...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
}

uint64_t LLMCacheManager.warmup()()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.warmup(), v0, 0);
}

{
  void *v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;

  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  v0[11] = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  unint64_t v3 = Logger.logObject.getter();
  uint64_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254432000, v3, v4, "LLMCacheManager entering warmup...", v5, 2u);
    MEMORY[0x25A27A310](v5, -1, -1);
  }

  if (LLMCacheManager.isEnabled()())
  {
    os_log_type_t v6 = (void *)v0[7];
    BOOL v7 = v6[18];
    uint64_t v8 = v6[19];
    __swift_project_boxed_opaque_existential_1(v6 + 15, v7);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v8 + 56) + **(int **)(v8 + 56));
    unint64_t v9 = (void *)swift_task_alloc();
    v0[12] = v9;
    *unint64_t v9 = v0;
    v9[1] = LLMCacheManager.warmup();
    return v15(v7, v8);
  }
  else
  {
    uint64_t v12 = v0[9];
    Swift::Int v11 = v0[10];
    unint64_t v13 = v0[8];
    $defer #1 () in LLMCacheManager.warmup()();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  unint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = LLMCacheManager.warmup();
  }
  else {
    uint64_t v4 = LLMCacheManager.warmup();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  unint64_t v3 = v0[8];
  $defer #1 () in LLMCacheManager.warmup()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned char *v16;
  uint64_t (*v17)(void);
  uint64_t v19;
  void *v20;
  uint64_t v21;

  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v1;
  unint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (void *)v0[13];
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    unint64_t v19 = v8;
    *(_DWORD *)BOOL v7 = 136315138;
    swift_getErrorValue();
    unint64_t v9 = Error.localizedDescription.getter();
    v0[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_254432000, v4, v5, "Failed to warmup: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v8, -1, -1);
    MEMORY[0x25A27A310](v7, -1, -1);
  }
  else
  {
    Swift::Int v11 = (void *)v0[13];
  }
  uint64_t v12 = (void *)v0[13];
  unint64_t v14 = v0[9];
  unint64_t v13 = v0[10];
  uint64_t v15 = v0[8];
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *uint64_t v16 = 1;
  swift_willThrow();

  $defer #1 () in LLMCacheManager.warmup()();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void $defer #1 () in LLMCacheManager.warmup()()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_254432000, oslog, v2, "LLMCacheManager leaving warmup...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
}

uint64_t LLMCacheManager.pruneExpiredEntries()()
{
  v1[10] = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](LLMCacheManager.pruneExpiredEntries(), v0, 0);
}

{
  uint64_t v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  if (one-time initialization token for log != -1) {
    swift_once();
  }
  uint64_t v1 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v0 + 112) = __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  unint64_t v3 = Logger.logObject.getter();
  uint64_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254432000, v3, v4, "LLMCacheManager entering pruneExpiredEntries", v5, 2u);
    MEMORY[0x25A27A310](v5, -1, -1);
  }
  os_log_type_t v6 = *(void *)(v0 + 80);

  *(void *)(v0 + 64) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 72) = 0;
  *(unsigned char *)(v0 + 169) = *(unsigned char *)(v6 + 112);
  swift_beginAccess();
  BOOL v7 = *(unsigned char *)(v0 + 169);
  uint64_t v8 = *(void **)(v0 + 80);
  unint64_t v9 = v8[18];
  unint64_t v10 = v8[19];
  __swift_project_boxed_opaque_existential_1(v8 + 15, v9);
  *(unsigned char *)(v0 + 168) = v7;
  Swift::Int v11 = *(void *)(v0 + 72);
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 40)
                                                                            + **(int **)(v10 + 40));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v12;
  *uint64_t v12 = v0;
  v12[1] = LLMCacheManager.pruneExpiredEntries();
  return v14(v0 + 168, 1000, v11, v9, v10);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v7;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = LLMCacheManager.pruneExpiredEntries();
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    swift_bridgeObjectRelease();
    uint64_t v4 = LLMCacheManager.pruneExpiredEntries();
    unint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  unint64_t v3 = v0[11];
  swift_bridgeObjectRelease();
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  swift_bridgeObjectRelease();
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  unint64_t v3 = v0[11];
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  unint64_t v3 = v0[11];
  $defer #1 () in LLMCacheManager.pruneExpiredEntries()();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t LLMCacheManager.pruneExpiredEntries()(uint64_t a1)
{
  unint64_t v3 = (void *)*v2;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  uint64_t v4 = v3[10];
  if (v1) {
    uint64_t v5 = LLMCacheManager.pruneExpiredEntries();
  }
  else {
    uint64_t v5 = LLMCacheManager.pruneExpiredEntries();
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

void LLMCacheManager.pruneExpiredEntries()()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v0 + 72);
  BOOL v4 = __OFADD__(v3, v2);
  uint64_t v5 = v3 + v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + 72) = v5;
    swift_retain();
    uint64_t v6 = swift_bridgeObjectRetain();
    uint64_t v7 = specialized _ArrayProtocol.filter(_:)(v6);
    swift_release();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    specialized Array.append<A>(contentsOf:)(v7);
    swift_endAccess();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134218240;
      uint64_t v11 = *(void *)(v0 + 64);
      *(void *)(v10 + 4) = *(void *)(v0 + 72);
      *(_WORD *)(v10 + 12) = 2048;
      *(void *)(v10 + 14) = *(void *)(v11 + 16);
      _os_log_impl(&dword_254432000, v8, v9, "Updated offset to %ld, collected %ld expired entries", (uint8_t *)v10, 0x16u);
      MEMORY[0x25A27A310](v10, -1, -1);
    }

    uint64_t v12 = *(void *)(v1 + 16);
    swift_bridgeObjectRelease();
    if (v12)
    {
      char v13 = *(unsigned char *)(v0 + 169);
      unint64_t v14 = *(void **)(v0 + 80);
      uint64_t v15 = v14[18];
      uint64_t v16 = v14[19];
      __swift_project_boxed_opaque_existential_1(v14 + 15, v15);
      *(unsigned char *)(v0 + 168) = v13;
      uint64_t v17 = *(void *)(v0 + 72);
      uint64_t v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 40)
                                                                             + **(int **)(v16 + 40));
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v18;
      *uint64_t v18 = v0;
      v18[1] = LLMCacheManager.pruneExpiredEntries();
      v24(v0 + 168, 1000, v17, v15, v16);
    }
    else
    {
      unint64_t v19 = *(void **)(v0 + 80);
      uint64_t v20 = v19[18];
      uint64_t v21 = v19[19];
      __swift_project_boxed_opaque_existential_1(v19 + 15, v20);
      uint64_t v22 = *(void *)(v0 + 64);
      *(void *)(v0 + 144) = v22;
      unint64_t v25 = (void (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 8) + **(int **)(v21 + 8));
      swift_bridgeObjectRetain();
      BOOL v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v23;
      *BOOL v23 = v0;
      v23[1] = LLMCacheManager.pruneExpiredEntries();
      v25(v22, v20, v21);
    }
  }
}

void $defer #1 () in LLMCacheManager.pruneExpiredEntries()()
{
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v0 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_254432000, oslog, v2, "LLMCacheManager leaving pruneExpiredEntries...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v22, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t LLMCacheManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LLMCacheManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 120);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t LLMCacheManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance LLMCacheManager()
{
  return v0;
}

uint64_t protocol witness for LLMCacheManaging.list(with:) in conformance LLMCacheManager(uint64_t a1, uint64_t a2)
{
  int64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *int64_t v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.list(with:)(a1, a2);
}

uint64_t protocol witness for LLMCacheManaging.insert(with:) in conformance LLMCacheManager(uint64_t a1)
{
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.insert(with:)(a1);
}

uint64_t protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = type metadata accessor for InsertRequest();
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *v4;
  v5[7] = v6;
  v5[8] = v7;
  return MEMORY[0x270FA2498](protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager, v7, 0);
}

uint64_t protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager()
{
  uint64_t v1 = (void *)v0[7];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v4 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  UUID.init()();
  void *v1 = v5;
  v1[1] = v4;
  v1[2] = v3;
  v1[3] = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  *uint64_t v6 = v0;
  v6[1] = protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager;
  uint64_t v7 = v0[7];
  return LLMCacheManager.insert(with:)(v7);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v4 = protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager;
  }
  else {
    uint64_t v4 = protocol witness for LLMCacheManaging.insert(searchKey:llmOutput:) in conformance LLMCacheManager;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of ListRequest(*(void *)(v0 + 56), (uint64_t (*)(void))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of ListRequest(*(void *)(v0 + 56), (uint64_t (*)(void))type metadata accessor for InsertRequest);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t protocol witness for LLMCacheManaging.deleteAll() in conformance LLMCacheManager()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.deleteAll()();
}

uint64_t protocol witness for LLMCacheManaging.warmup() in conformance LLMCacheManager()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return LLMCacheManager.warmup()();
}

uint64_t protocol witness for LLMCacheManaging.pruneExpiredEntries() in conformance LLMCacheManager()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return LLMCacheManager.pruneExpiredEntries()();
}

BOOL static LLMCacheManagerError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LLMCacheManagerError.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int LLMCacheManagerError.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance LLMCacheManagerError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance LLMCacheManagerError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance LLMCacheManagerError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance LLMCacheManagerError()
{
  return MEMORY[0x270F9FB30]();
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int64>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>, type metadata accessor for AnnotatedCacheEntry, type metadata accessor for AnnotatedCacheEntry);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<Asset>, MEMORY[0x263F84768], MEMORY[0x263F84768]);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t type metadata accessor for LLMCacheManager()
{
  return self;
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

Swift::Int specialized MutableCollection<>.sort(by:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v5);
  }
  Swift::Int result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(a1, a2);
  *uint64_t v2 = v5;
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  if (v5 <= 0)
  {
    unint64_t v11 = (void *)MEMORY[0x263F8EE78];
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      size_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return (uint64_t)v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
  uint64_t v8 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v11 = (void *)swift_allocObject();
  size_t v12 = _swift_stdlib_malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v164 = a2;
  v163 = a1;
  uint64_t v155 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v161 = *(void *)(v155 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v155, v5);
  uint64_t v156 = (uint64_t)&v141 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6, v8);
  uint64_t v159 = (uint64_t)&v141 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  uint64_t v14 = (char *)&v141 - v13;
  uint64_t v16 = MEMORY[0x270FA5388](v12, v15);
  uint64_t v18 = (char *)&v141 - v17;
  uint64_t v20 = MEMORY[0x270FA5388](v16, v19);
  unint64_t v22 = (char *)&v141 - v21;
  uint64_t v24 = MEMORY[0x270FA5388](v20, v23);
  uint64_t v26 = (char *)&v141 - v25;
  uint64_t v28 = MEMORY[0x270FA5388](v24, v27);
  unint64_t v30 = (char *)&v141 - v29;
  MEMORY[0x270FA5388](v28, v31);
  uint64_t v146 = (uint64_t)&v141 - v32;
  uint64_t v162 = v2;
  Swift::Int v33 = v2[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v33);
  if (result >= v33)
  {
    if (v33 < 0) {
      goto LABEL_149;
    }
    if (v33) {
      return specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v33, 1, v163);
    }
    return result;
  }
  if (v33 >= 0) {
    uint64_t v35 = v33;
  }
  else {
    uint64_t v35 = v33 + 1;
  }
  if (v33 <= -2) {
    goto LABEL_158;
  }
  Swift::Int v145 = result;
  Swift::Int v36 = v33;
  if (v33 < 2)
  {
    uint64_t v39 = MEMORY[0x263F8EE78];
    unint64_t v160 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v161 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80));
    if (v36 != 1)
    {
      unint64_t v68 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v41 = (char *)MEMORY[0x263F8EE78];
      goto LABEL_111;
    }
    uint64_t v37 = 1;
    uint64_t v142 = v30;
    uint64_t v150 = v26;
    uint64_t v151 = v22;
    uint64_t v154 = v14;
  }
  else
  {
    uint64_t v37 = v33;
    uint64_t v142 = v30;
    uint64_t v150 = v26;
    uint64_t v151 = v22;
    uint64_t v154 = v14;
    uint64_t v38 = v35 >> 1;
    uint64_t v39 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v39 + 16) = v38;
    unint64_t v160 = v39 + ((*(unsigned __int8 *)(v161 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v161 + 80));
  }
  uint64_t v149 = v39;
  uint64_t v40 = 0;
  uint64_t v41 = (char *)MEMORY[0x263F8EE78];
  v144 = v18;
  uint64_t v42 = v37;
  do
  {
    uint64_t v43 = v40;
    uint64_t v44 = v40 + 1;
    if (v40 + 1 >= v42)
    {
      uint64_t v49 = v40 + 1;
      uint64_t v56 = v40;
LABEL_48:
      if (v49 < v56) {
        goto LABEL_148;
      }
      goto LABEL_49;
    }
    uint64_t v158 = v42;
    uint64_t v45 = *v162;
    uint64_t v46 = *(void *)(v161 + 72);
    uint64_t v47 = v146;
    outlined init with copy of ListRequest(*v162 + v46 * v44, v146, type metadata accessor for AnnotatedCacheEntry);
    uint64_t v48 = (uint64_t)v142;
    outlined init with copy of ListRequest(v45 + v46 * v43, (uint64_t)v142, type metadata accessor for AnnotatedCacheEntry);
    LODWORD(v157) = v163(v47, v48);
    if (v4)
    {
      outlined destroy of ListRequest(v48, type metadata accessor for AnnotatedCacheEntry);
      outlined destroy of ListRequest(v47, type metadata accessor for AnnotatedCacheEntry);
LABEL_125:
      swift_bridgeObjectRelease();
      goto LABEL_126;
    }
    outlined destroy of ListRequest(v48, type metadata accessor for AnnotatedCacheEntry);
    outlined destroy of ListRequest(v47, type metadata accessor for AnnotatedCacheEntry);
    uint64_t v143 = v43;
    uint64_t v49 = v43 + 2;
    uint64_t v50 = v158;
    uint64_t v148 = v45;
    if (v43 + 2 < v158)
    {
      v141 = v41;
      uint64_t v51 = v45;
      uint64_t v152 = v46 * v49;
      uint64_t v153 = v46 * v44;
      while (1)
      {
        uint64_t v52 = v49;
        uint64_t v53 = (uint64_t)v150;
        outlined init with copy of ListRequest(v51 + v152, (uint64_t)v150, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v54 = (uint64_t)v151;
        outlined init with copy of ListRequest(v51 + v153, (uint64_t)v151, type metadata accessor for AnnotatedCacheEntry);
        int v55 = v163(v53, v54);
        outlined destroy of ListRequest(v54, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest(v53, type metadata accessor for AnnotatedCacheEntry);
        if ((v157 ^ v55)) {
          break;
        }
        uint64_t v49 = v52 + 1;
        v51 += v46;
        uint64_t v50 = v158;
        if (v158 == v52 + 1)
        {
          uint64_t v49 = v158;
          uint64_t v41 = v141;
          goto LABEL_23;
        }
      }
      uint64_t v41 = v141;
      uint64_t v49 = v52;
      uint64_t v50 = v158;
LABEL_23:
      uint64_t v45 = v148;
    }
    Swift::Int v57 = v145;
    uint64_t v56 = v143;
    if ((v157 & 1) == 0) {
      goto LABEL_37;
    }
    if (v49 < v143) {
      goto LABEL_153;
    }
    if (v143 < v49)
    {
      v141 = v41;
      uint64_t v58 = 0;
      uint64_t v59 = v46 * (v49 - 1);
      uint64_t v60 = v49 * v46;
      uint64_t v61 = v143;
      uint64_t v62 = v143 * v46;
      uint64_t v147 = v46;
      do
      {
        if (v61 != v49 + v58 - 1)
        {
          if (!v45) {
            goto LABEL_156;
          }
          uint64_t v157 = v45 + v59;
          outlined init with take of AnnotatedCacheEntry(v45 + v62, v156);
          if (v62 < v59 || v45 + v62 >= (unint64_t)(v45 + v60))
          {
            uint64_t v63 = v157;
            swift_arrayInitWithTakeFrontToBack();
          }
          else
          {
            uint64_t v63 = v157;
            if (v62 != v59) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          outlined init with take of AnnotatedCacheEntry(v156, v63);
          uint64_t v46 = v147;
          uint64_t v45 = v148;
        }
        ++v61;
        --v58;
        v59 -= v46;
        v60 -= v46;
        v62 += v46;
      }
      while (v61 < v49 + v58);
      uint64_t v41 = v141;
      uint64_t v64 = (uint64_t)v144;
      Swift::Int v57 = v145;
      uint64_t v56 = v143;
      uint64_t v50 = v158;
      if (v49 >= v158) {
        goto LABEL_48;
      }
    }
    else
    {
LABEL_37:
      uint64_t v64 = (uint64_t)v144;
      if (v49 >= v50) {
        goto LABEL_48;
      }
    }
    if (__OFSUB__(v49, v56)) {
      goto LABEL_150;
    }
    if (v49 - v56 >= v57) {
      goto LABEL_48;
    }
    if (__OFADD__(v56, v57)) {
      goto LABEL_151;
    }
    if (v56 + v57 >= v50) {
      uint64_t v65 = v50;
    }
    else {
      uint64_t v65 = v56 + v57;
    }
    if (v65 < v56)
    {
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
    if (v49 == v65) {
      goto LABEL_48;
    }
    uint64_t v158 = v4;
    v141 = v41;
    uint64_t v118 = *(void *)(v161 + 72);
    uint64_t v119 = v118 * (v49 - 1);
    uint64_t v152 = v118;
    uint64_t v120 = v49 * v118;
    uint64_t v143 = v56;
    uint64_t v148 = v65;
    do
    {
      uint64_t v121 = 0;
      uint64_t v122 = v56;
      uint64_t v157 = v49;
      uint64_t v153 = v120;
      while (1)
      {
        uint64_t v124 = *v162;
        outlined init with copy of ListRequest(v120 + v121 + *v162, v64, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v125 = v119;
        uint64_t v126 = v119 + v121 + v124;
        uint64_t v127 = v64;
        uint64_t v128 = (uint64_t)v154;
        outlined init with copy of ListRequest(v126, (uint64_t)v154, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v129 = v158;
        char v130 = v163(v127, v128);
        uint64_t v158 = v129;
        if (v129)
        {
          outlined destroy of ListRequest(v128, type metadata accessor for AnnotatedCacheEntry);
          outlined destroy of ListRequest(v127, type metadata accessor for AnnotatedCacheEntry);
          swift_bridgeObjectRelease();
LABEL_126:
          *(void *)(v149 + 16) = 0;
          return swift_bridgeObjectRelease();
        }
        char v131 = v130;
        uint64_t v132 = v122;
        outlined destroy of ListRequest(v128, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest(v127, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v64 = v127;
        if ((v131 & 1) == 0) {
          break;
        }
        uint64_t v133 = *v162;
        if (!*v162) {
          goto LABEL_155;
        }
        uint64_t v119 = v125;
        uint64_t v120 = v153;
        uint64_t v134 = v133 + v119 + v121;
        outlined init with take of AnnotatedCacheEntry(v133 + v153 + v121, v159);
        swift_arrayInitWithTakeFrontToBack();
        outlined init with take of AnnotatedCacheEntry(v159, v134);
        v121 -= v152;
        uint64_t v122 = v132 + 1;
        uint64_t v123 = v157;
        if (v157 == v132 + 1) {
          goto LABEL_106;
        }
      }
      uint64_t v123 = v157;
      uint64_t v119 = v125;
      uint64_t v120 = v153;
LABEL_106:
      uint64_t v49 = v123 + 1;
      v119 += v152;
      v120 += v152;
      uint64_t v56 = v143;
    }
    while (v49 != v148);
    uint64_t v49 = v148;
    uint64_t v41 = v141;
    uint64_t v4 = v158;
    if (v148 < v143) {
      goto LABEL_148;
    }
LABEL_49:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v41 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v41 + 2) + 1, 1, v41);
    }
    unint64_t v67 = *((void *)v41 + 2);
    unint64_t v66 = *((void *)v41 + 3);
    unint64_t v68 = v67 + 1;
    uint64_t v157 = v49;
    if (v67 >= v66 >> 1) {
      uint64_t v41 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v66 > 1), v67 + 1, 1, v41);
    }
    *((void *)v41 + 2) = v68;
    unint64_t v69 = v41 + 32;
    Swift::Int v70 = &v41[16 * v67 + 32];
    uint64_t v71 = v157;
    *(void *)Swift::Int v70 = v56;
    *((void *)v70 + 1) = v71;
    if (v67)
    {
      while (2)
      {
        unint64_t v72 = v68 - 1;
        if (v68 >= 4)
        {
          uint64_t v77 = &v69[16 * v68];
          uint64_t v78 = *((void *)v77 - 8);
          uint64_t v79 = *((void *)v77 - 7);
          BOOL v83 = __OFSUB__(v79, v78);
          uint64_t v80 = v79 - v78;
          if (v83) {
            goto LABEL_133;
          }
          uint64_t v82 = *((void *)v77 - 6);
          uint64_t v81 = *((void *)v77 - 5);
          BOOL v83 = __OFSUB__(v81, v82);
          uint64_t v75 = v81 - v82;
          char v76 = v83;
          if (v83) {
            goto LABEL_134;
          }
          unint64_t v84 = v68 - 2;
          uint64_t v85 = &v69[16 * v68 - 32];
          uint64_t v87 = *(void *)v85;
          uint64_t v86 = *((void *)v85 + 1);
          BOOL v83 = __OFSUB__(v86, v87);
          uint64_t v88 = v86 - v87;
          if (v83) {
            goto LABEL_136;
          }
          BOOL v83 = __OFADD__(v75, v88);
          uint64_t v89 = v75 + v88;
          if (v83) {
            goto LABEL_139;
          }
          if (v89 >= v80)
          {
            uint64_t v107 = &v69[16 * v72];
            uint64_t v109 = *(void *)v107;
            uint64_t v108 = *((void *)v107 + 1);
            BOOL v83 = __OFSUB__(v108, v109);
            uint64_t v110 = v108 - v109;
            if (v83) {
              goto LABEL_143;
            }
            BOOL v100 = v75 < v110;
          }
          else
          {
LABEL_67:
            if (v76) {
              goto LABEL_135;
            }
            unint64_t v84 = v68 - 2;
            uint64_t v90 = &v69[16 * v68 - 32];
            uint64_t v92 = *(void *)v90;
            uint64_t v91 = *((void *)v90 + 1);
            BOOL v93 = __OFSUB__(v91, v92);
            uint64_t v94 = v91 - v92;
            char v95 = v93;
            if (v93) {
              goto LABEL_138;
            }
            char v96 = &v69[16 * v72];
            uint64_t v98 = *(void *)v96;
            uint64_t v97 = *((void *)v96 + 1);
            BOOL v83 = __OFSUB__(v97, v98);
            uint64_t v99 = v97 - v98;
            if (v83) {
              goto LABEL_141;
            }
            if (__OFADD__(v94, v99)) {
              goto LABEL_142;
            }
            if (v94 + v99 < v75) {
              goto LABEL_79;
            }
            BOOL v100 = v75 < v99;
          }
          if (v100) {
            unint64_t v72 = v84;
          }
        }
        else
        {
          if (v68 == 3)
          {
            uint64_t v74 = *((void *)v41 + 4);
            uint64_t v73 = *((void *)v41 + 5);
            BOOL v83 = __OFSUB__(v73, v74);
            uint64_t v75 = v73 - v74;
            char v76 = v83;
            goto LABEL_67;
          }
          uint64_t v101 = *((void *)v41 + 4);
          uint64_t v102 = *((void *)v41 + 5);
          BOOL v83 = __OFSUB__(v102, v101);
          uint64_t v94 = v102 - v101;
          char v95 = v83;
LABEL_79:
          if (v95) {
            goto LABEL_137;
          }
          BOOL v103 = &v69[16 * v72];
          uint64_t v105 = *(void *)v103;
          uint64_t v104 = *((void *)v103 + 1);
          BOOL v83 = __OFSUB__(v104, v105);
          uint64_t v106 = v104 - v105;
          if (v83) {
            goto LABEL_140;
          }
          if (v106 < v94) {
            goto LABEL_96;
          }
        }
        unint64_t v111 = v72 - 1;
        if (v72 - 1 >= v68)
        {
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
          goto LABEL_152;
        }
        if (!*v162) {
          goto LABEL_154;
        }
        uint64_t v112 = v41;
        BOOL v113 = &v69[16 * v111];
        uint64_t v114 = *(void *)v113;
        char v115 = &v69[16 * v72];
        uint64_t v116 = *((void *)v115 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)(*v162 + *(void *)(v161 + 72) * *(void *)v113, *v162 + *(void *)(v161 + 72) * *(void *)v115, *v162 + *(void *)(v161 + 72) * v116, v160, (uint64_t (*)(char *, char *))v163, v164);
        if (v4) {
          goto LABEL_125;
        }
        if (v116 < v114) {
          goto LABEL_130;
        }
        if (v72 > *((void *)v112 + 2)) {
          goto LABEL_131;
        }
        *(void *)BOOL v113 = v114;
        *(void *)&v69[16 * v111 + 8] = v116;
        unint64_t v117 = *((void *)v112 + 2);
        if (v72 >= v117) {
          goto LABEL_132;
        }
        uint64_t v41 = v112;
        unint64_t v68 = v117 - 1;
        memmove(&v69[16 * v72], v115 + 16, 16 * (v117 - 1 - v72));
        *((void *)v41 + 2) = v117 - 1;
        if (v117 <= 2) {
          goto LABEL_96;
        }
        continue;
      }
    }
    unint64_t v68 = 1;
LABEL_96:
    uint64_t v42 = v162[1];
    uint64_t v40 = v157;
    uint64_t v39 = v149;
  }
  while (v157 < v42);
LABEL_111:
  if (v68 >= 2)
  {
    uint64_t v135 = *v162;
    uint64_t v149 = v39;
    do
    {
      unint64_t v136 = v68 - 2;
      if (v68 < 2) {
        goto LABEL_144;
      }
      if (!v135) {
        goto LABEL_157;
      }
      uint64_t v137 = *(void *)&v41[16 * v136 + 32];
      uint64_t v138 = *(void *)&v41[16 * v68 + 24];
      specialized _merge<A>(low:mid:high:buffer:by:)(v135 + *(void *)(v161 + 72) * v137, v135 + *(void *)(v161 + 72) * *(void *)&v41[16 * v68 + 16], v135 + *(void *)(v161 + 72) * v138, v160, (uint64_t (*)(char *, char *))v163, v164);
      if (v4) {
        goto LABEL_125;
      }
      if (v138 < v137) {
        goto LABEL_145;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v41 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v41);
      }
      if (v136 >= *((void *)v41 + 2)) {
        goto LABEL_146;
      }
      uint64_t v139 = &v41[16 * v136 + 32];
      *(void *)uint64_t v139 = v137;
      *((void *)v139 + 1) = v138;
      unint64_t v140 = *((void *)v41 + 2);
      if (v68 > v140) {
        goto LABEL_147;
      }
      memmove(&v41[16 * v68 + 16], &v41[16 * v68 + 32], 16 * (v140 - v68));
      *((void *)v41 + 2) = v140 - 1;
      unint64_t v68 = v140 - 1;
      uint64_t v39 = v149;
    }
    while (v140 > 2);
  }
  swift_bridgeObjectRelease();
  *(void *)(v39 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v38 = a4;
  uint64_t v32 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v8 = MEMORY[0x270FA5388](v32, v7);
  uint64_t v41 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v37 = (uint64_t)&v29 - v12;
  uint64_t result = MEMORY[0x270FA5388](v11, v13);
  uint64_t v36 = (uint64_t)&v29 - v16;
  uint64_t v31 = a2;
  if (a3 != a2)
  {
    uint64_t v17 = *(void *)(v15 + 72);
    uint64_t v18 = v17 * (a3 - 1);
    uint64_t v33 = v17;
    uint64_t v19 = v17 * a3;
    uint64_t v30 = a1;
LABEL_4:
    uint64_t v20 = 0;
    uint64_t v34 = v19;
    uint64_t v35 = a3;
    while (1)
    {
      uint64_t v22 = *v42;
      uint64_t v39 = v19 + v20;
      uint64_t v40 = a1;
      uint64_t v23 = v36;
      outlined init with copy of ListRequest(v19 + v20 + v22, v36, type metadata accessor for AnnotatedCacheEntry);
      uint64_t v24 = v37;
      outlined init with copy of ListRequest(v18 + v20 + v22, v37, type metadata accessor for AnnotatedCacheEntry);
      uint64_t v25 = v43;
      char v26 = v38(v23, v24);
      outlined destroy of ListRequest(v24, type metadata accessor for AnnotatedCacheEntry);
      uint64_t result = outlined destroy of ListRequest(v23, type metadata accessor for AnnotatedCacheEntry);
      uint64_t v43 = v25;
      if (v25) {
        break;
      }
      if ((v26 & 1) == 0)
      {
        uint64_t v19 = v34;
        uint64_t v21 = v35;
LABEL_11:
        a3 = v21 + 1;
        v18 += v33;
        v19 += v33;
        a1 = v30;
        if (a3 != v31) {
          goto LABEL_4;
        }
        return result;
      }
      uint64_t v27 = *v42;
      if (!*v42)
      {
        __break(1u);
        return result;
      }
      uint64_t v19 = v34;
      uint64_t v28 = v27 + v18 + v20;
      outlined init with take of AnnotatedCacheEntry(v27 + v34 + v20, v41);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = outlined init with take of AnnotatedCacheEntry(v41, v28);
      v20 -= v33;
      a1 = v40 + 1;
      uint64_t v21 = v35;
      if (v35 == v40 + 1) {
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(char *, char *), uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t v59 = a6;
  uint64_t v60 = a5;
  uint64_t v58 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v13 = MEMORY[0x270FA5388](v58, v12);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  uint64_t v21 = (char *)&v53 - v20;
  MEMORY[0x270FA5388](v19, v22);
  uint64_t v25 = (char *)&v53 - v24;
  uint64_t v27 = *(void *)(v26 + 72);
  if (!v27)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (a2 - a1 == 0x8000000000000000 && v27 == -1) {
    goto LABEL_66;
  }
  int64_t v28 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v27 == -1) {
    goto LABEL_67;
  }
  uint64_t v29 = (uint64_t)(a2 - a1) / v27;
  unint64_t v63 = a1;
  unint64_t v62 = a4;
  uint64_t v30 = v28 / v27;
  if (v29 >= v28 / v27)
  {
    if ((v30 & 0x8000000000000000) == 0)
    {
      uint64_t v32 = v27;
      unint64_t v33 = a3;
      uint64_t v34 = v30 * v32;
      uint64_t v35 = v23;
      if (a4 < a2 || a2 + v34 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v42 = a4 + v34;
      unint64_t v61 = a4 + v34;
      unint64_t v63 = a2;
      if (v34 < 1 || a1 >= a2) {
        goto LABEL_63;
      }
      unint64_t v55 = a4;
      unint64_t v56 = (unint64_t)v15;
      uint64_t v44 = -v32;
      unint64_t v53 = a1;
      uint64_t v54 = -v32;
      while (1)
      {
        outlined init with copy of ListRequest(v42 + v44, v35, type metadata accessor for AnnotatedCacheEntry);
        unint64_t v45 = a2;
        a2 += v44;
        uint64_t v25 = (char *)v35;
        uint64_t v21 = (char *)v56;
        outlined init with copy of ListRequest(a2, v56, type metadata accessor for AnnotatedCacheEntry);
        char v46 = v60(v25, v21);
        if (v7) {
          goto LABEL_62;
        }
        char v47 = v46;
        unint64_t v57 = 0;
        unint64_t v48 = v33 + v44;
        outlined destroy of ListRequest((uint64_t)v21, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest((uint64_t)v25, type metadata accessor for AnnotatedCacheEntry);
        uint64_t v35 = (uint64_t)v25;
        if (v47)
        {
          if (v33 < v45 || v48 >= v45)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v50 = v55;
          }
          else
          {
            BOOL v49 = v33 == v45;
            unint64_t v50 = v55;
            if (!v49) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          uint64_t v44 = v54;
          v63 += v54;
        }
        else
        {
          unint64_t v51 = v61;
          v61 += v44;
          if (v33 < v51 || v48 >= v51)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v33 != v51)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          a2 = v45;
          uint64_t v44 = v54;
          unint64_t v50 = v55;
        }
        unint64_t v42 = v61;
        if (v61 > v50)
        {
          unint64_t v33 = v48;
          unint64_t v7 = v57;
          if (a2 > v53) {
            continue;
          }
        }
        goto LABEL_63;
      }
    }
  }
  else
  {
    unint64_t v57 = a3;
    if ((v29 & 0x8000000000000000) == 0)
    {
      uint64_t v31 = v29 * v27;
      if (a4 < a1 || a1 + v31 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a1)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v56 = a4 + v31;
      unint64_t v61 = a4 + v31;
      if (v31 < 1 || a2 >= v57) {
        goto LABEL_63;
      }
      while (1)
      {
        outlined init with copy of ListRequest(a2, (uint64_t)v25, type metadata accessor for AnnotatedCacheEntry);
        outlined init with copy of ListRequest(a4, (uint64_t)v21, type metadata accessor for AnnotatedCacheEntry);
        char v37 = v60(v25, v21);
        if (v6) {
          break;
        }
        char v38 = v37;
        outlined destroy of ListRequest((uint64_t)v21, type metadata accessor for AnnotatedCacheEntry);
        outlined destroy of ListRequest((uint64_t)v25, type metadata accessor for AnnotatedCacheEntry);
        unint64_t v39 = v63;
        if (v38)
        {
          unint64_t v40 = a2 + v27;
          if (v63 < a2 || v63 >= v40)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v63 == a2)
          {
            unint64_t v39 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v41 = v62 + v27;
          if (v63 < v62 || v63 >= v41)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v63 != v62)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v62 = v41;
          unint64_t v40 = a2;
        }
        unint64_t v63 = v39 + v27;
        a4 = v62;
        if (v62 < v56)
        {
          a2 = v40;
          if (v40 < v57) {
            continue;
          }
        }
        goto LABEL_63;
      }
LABEL_62:
      outlined destroy of ListRequest((uint64_t)v21, type metadata accessor for AnnotatedCacheEntry);
      outlined destroy of ListRequest((uint64_t)v25, type metadata accessor for AnnotatedCacheEntry);
LABEL_63:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(&v63, &v62, (uint64_t *)&v61);
      return 1;
    }
  }
LABEL_68:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnnotatedCacheEntry>);
  uint64_t v10 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AnnotatedCacheEntry(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CacheEntry>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)Swift::UInt v1 = xmmword_254463360;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *closure #1 in Data.init<A>(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(void *a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

uint64_t specialized LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(unsigned char *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = a7;
  uint64_t v20 = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(boxed_opaque_existential_1, a2, a7);
  type metadata accessor for LLMCacheManager();
  uint64_t v15 = swift_allocObject();
  LOBYTE(a2) = *a1;
  swift_defaultActor_initialize();
  *(unsigned char *)(v15 + 112) = a2;
  outlined init with take of ContiguousBytes(&v18, v15 + 120);
  double v16 = *(double *)&a3;
  if (a4) {
    double v16 = 15552000.0;
  }
  *(double *)(v15 + 160) = v16;
  *(void *)(v15 + 168) = a5;
  return v15;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(a1, a2, *(uint64_t **)(v2 + 16)) & 1;
}

uint64_t partial apply for closure #2 in LLMCacheManager.list(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return closure #2 in LLMCacheManager.list(with:)(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t outlined destroy of ListRequest(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of ListRequest(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for Insecure.SHA1();
      lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1 and conformance Insecure.SHA1, MEMORY[0x263F04850]);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *specialized Data._Representation.init(_:)(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t specialized static LLMCacheManager.generateEntryId(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v8 = type metadata accessor for Insecure.SHA1();
  uint64_t v61 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Insecure.SHA1Digest();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  double v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v64 = a1;
  *((void *)&v64 + 1) = a2;
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = 45;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = a3;
  v18._object = a4;
  String.append(_:)(v18);
  uint64_t v19 = specialized Data.init<A>(_:)(v64, *((unint64_t *)&v64 + 1));
  unint64_t v21 = v20;
  lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1 and conformance Insecure.SHA1, MEMORY[0x263F04850]);
  dispatch thunk of HashFunction.init()();
  switch(v21 >> 62)
  {
    case 1uLL:
      uint64_t v60 = v13;
      if (v19 >> 32 < (int)v19) {
        goto LABEL_50;
      }
      uint64_t v59 = 0;
      outlined copy of Data._Representation(v19, v21);
      specialized __DataStorage.withUnsafeBytes<A>(in:apply:)((int)v19, v19 >> 32);
      outlined consume of Data._Representation(v19, v21);
      uint64_t v13 = v60;
      break;
    case 2uLL:
      uint64_t v59 = 0;
      uint64_t v60 = v13;
      uint64_t v23 = *(void *)(v19 + 16);
      uint64_t v22 = *(void *)(v19 + 24);
      outlined copy of Data._Representation(v19, v21);
      swift_retain();
      swift_retain();
      uint64_t v24 = v23;
      uint64_t v13 = v60;
      specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(v24, v22);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      *(void *)((char *)&v64 + 6) = 0;
      *(void *)&long long v64 = 0;
      goto LABEL_7;
    default:
      *(void *)&long long v64 = v19;
      WORD4(v64) = v21;
      BYTE10(v64) = BYTE2(v21);
      BYTE11(v64) = BYTE3(v21);
      BYTE12(v64) = BYTE4(v21);
      BYTE13(v64) = BYTE5(v21);
LABEL_7:
      dispatch thunk of HashFunction.update(bufferPointer:)();
LABEL_8:
      outlined consume of Data._Representation(v19, v21);
      break;
  }
  dispatch thunk of HashFunction.finalize()();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v11, v8);
  outlined consume of Data._Representation(v19, v21);
  uint64_t v65 = v12;
  uint64_t v66 = lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(&lazy protocol witness table cache variable for type Insecure.SHA1Digest and conformance Insecure.SHA1Digest, MEMORY[0x263F04830]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64);
  (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 16))(boxed_opaque_existential_1, v16, v12);
  __swift_project_boxed_opaque_existential_1(&v64, v65);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  unint64_t v26 = v62;
  unint64_t v27 = v63;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v64);
  uint64_t v28 = 8;
  uint64_t v29 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v29 + 16) = 8;
  *(void *)(v29 + 32) = 0;
  uint64_t v30 = v29 + 32;
  unint64_t v31 = v27 >> 62;
  uint64_t v32 = v29;
  switch(v27 >> 62)
  {
    case 1uLL:
      uint64_t v33 = (int)v26;
      uint64_t v34 = (uint64_t)v26 >> 32;
      goto LABEL_13;
    case 2uLL:
      uint64_t v33 = *(void *)(v26 + 16);
      uint64_t v34 = *(void *)(v26 + 24);
LABEL_13:
      if (v34 >= v33) {
        goto LABEL_14;
      }
      goto LABEL_49;
    case 3uLL:
      goto LABEL_38;
    default:
      uint64_t v33 = 0;
      uint64_t v34 = BYTE6(v27);
LABEL_14:
      if (v33 == v34)
      {
        uint64_t v28 = 8;
      }
      else
      {
        uint64_t v60 = BYTE6(v27);
        uint64_t v61 = (int)v26;
        unint64_t v58 = v26 >> 8;
        uint64_t v59 = (uint64_t)v26 >> 32;
        unint64_t v56 = v26 >> 24;
        unint64_t v57 = v26 >> 16;
        unint64_t v54 = v26 >> 40;
        unint64_t v55 = HIDWORD(v26);
        unint64_t v52 = HIBYTE(v26);
        unint64_t v53 = HIWORD(v26);
        unint64_t v50 = v27 >> 16;
        unint64_t v51 = v27 >> 8;
        unint64_t v49 = v27 >> 24;
        unint64_t v48 = HIDWORD(v27);
        unint64_t v47 = v27 >> 40;
        do
        {
          if (v33 >= v34)
          {
            __break(1u);
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
LABEL_44:
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
          }
          uint64_t v35 = *(void *)(v32 + 16);
          if (!v35) {
            goto LABEL_40;
          }
          if (v31)
          {
            if (v31 == 1)
            {
              if (v33 < v61 || v33 >= v59) {
                goto LABEL_43;
              }
              uint64_t v36 = __DataStorage._bytes.getter();
              if (!v36) {
                goto LABEL_51;
              }
              uint64_t v37 = v36;
              uint64_t v38 = __DataStorage._offset.getter();
              uint64_t v39 = v33 - v38;
              if (__OFSUB__(v33, v38)) {
                goto LABEL_46;
              }
            }
            else
            {
              if (v33 < *(void *)(v26 + 16)) {
                goto LABEL_45;
              }
              if (v33 >= *(void *)(v26 + 24)) {
                goto LABEL_47;
              }
              uint64_t v41 = __DataStorage._bytes.getter();
              if (!v41) {
                goto LABEL_52;
              }
              uint64_t v37 = v41;
              uint64_t v42 = __DataStorage._offset.getter();
              uint64_t v39 = v33 - v42;
              if (__OFSUB__(v33, v42)) {
                goto LABEL_48;
              }
            }
            char v40 = *(unsigned char *)(v37 + v39);
          }
          else
          {
            if (v33 >= v60) {
              goto LABEL_44;
            }
            LOBYTE(v64) = v26;
            BYTE1(v64) = v58;
            BYTE2(v64) = v57;
            BYTE3(v64) = v56;
            BYTE4(v64) = v55;
            BYTE5(v64) = v54;
            BYTE6(v64) = v53;
            BYTE7(v64) = v52;
            BYTE8(v64) = v27;
            BYTE9(v64) = v51;
            BYTE10(v64) = v50;
            BYTE11(v64) = v49;
            BYTE12(v64) = v48;
            BYTE13(v64) = v47;
            char v40 = *((unsigned char *)&v64 + v33);
          }
          unint64_t v43 = v33 % v35;
          if (v33 % v35 < 0) {
            goto LABEL_41;
          }
          if (v43 >= *(void *)(v32 + 16)) {
            goto LABEL_42;
          }
          ++v33;
          *(unsigned char *)(v30 + v43) ^= v40;
        }
        while (v34 != v33);
        uint64_t v28 = *(void *)(v32 + 16);
      }
LABEL_38:
      *(void *)&long long v64 = 0;
      id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8F8]), sel_initWithBytes_length_, v30, v28);
      swift_bridgeObjectRelease();
      objc_msgSend(v44, sel_getBytes_length_, &v64, 8);

      outlined consume of Data._Representation(v26, v27);
      return v64;
  }
}

uint64_t outlined init with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v3, v5);
  uint64_t v38 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v35 = (char *)v32 - v9;
  uint64_t v37 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v11 = MEMORY[0x270FA5388](v37, v10);
  uint64_t v36 = (uint64_t)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v13);
  double v16 = (char *)v32 - v15;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v39 = MEMORY[0x263F8EE78];
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    uint64_t v19 = *(unsigned __int8 *)(v14 + 80);
    uint64_t v20 = *(void *)(v14 + 72);
    v32[1] = v1;
    uint64_t v33 = (v19 + 32) & ~v19;
    uint64_t v21 = a1 + v33;
    uint64_t v22 = (void (**)(char *, uint64_t))(v4 + 8);
    uint64_t v34 = v3;
    do
    {
      outlined init with copy of ListRequest(v21, (uint64_t)v16, type metadata accessor for AnnotatedCacheEntry);
      uint64_t v23 = v35;
      Date.addingTimeInterval(_:)();
      uint64_t v24 = v38;
      static Date.now.getter();
      char v25 = static Date.< infix(_:_:)();
      unint64_t v26 = *v22;
      unint64_t v27 = v24;
      uint64_t v28 = v34;
      (*v22)(v27, v34);
      v26(v23, v28);
      if (v25)
      {
        outlined init with take of AnnotatedCacheEntry((uint64_t)v16, v36);
        uint64_t v29 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v29 + 16) + 1, 1);
          uint64_t v29 = v39;
        }
        unint64_t v31 = *(void *)(v29 + 16);
        unint64_t v30 = *(void *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v39;
        }
        *(void *)(v29 + 16) = v31 + 1;
        outlined init with take of AnnotatedCacheEntry(v36, v29 + v33 + v31 * v20);
      }
      else
      {
        outlined destroy of ListRequest((uint64_t)v16, type metadata accessor for AnnotatedCacheEntry);
      }
      v21 += v20;
      --v18;
    }
    while (v18);
    return v39;
  }
  return result;
}

uint64_t dispatch thunk of LLMCacheManaging.list(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of LLMCacheManaging.insert(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of LLMCacheManaging.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 24)
                                                                                     + **(int **)(a6 + 24));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of LLMCacheManaging.deleteAll()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManaging.warmup()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 40) + **(int **)(a2 + 40));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManaging.pruneExpiredEntries()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v7(a1, a2);
}

uint64_t method lookup function for LLMCacheManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LLMCacheManager);
}

uint64_t dispatch thunk of LLMCacheManager.__allocating_init(namespace:databaseAccess:ttl:logEmitter:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 120))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of LLMCacheManager.list(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of LLMCacheManager.insert(searchKey:llmOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 152)
                                                                   + **(int **)(*(void *)v4 + 152));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of LLMCacheManager.insert(with:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 160) + **(int **)(*(void *)v1 + 160));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v6(a1);
}

uint64_t dispatch thunk of LLMCacheManager.deleteAll()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 168) + **(int **)(*(void *)v0 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v4();
}

uint64_t dispatch thunk of LLMCacheManager.warmup()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 176) + **(int **)(*(void *)v0 + 176));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.describe(identifier:);
  return v4();
}

uint64_t dispatch thunk of LLMCacheManager.pruneExpiredEntries()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 184) + **(int **)(*(void *)v0 + 184));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v4();
}

unsigned char *storeEnumTagSinglePayload for LLMCacheManagerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254450340);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LLMCacheManagerError()
{
  return &type metadata for LLMCacheManagerError;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t lazy protocol witness table accessor for type Insecure.SHA1 and conformance Insecure.SHA1(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t outlined consume of Data._Representation?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined init with take of ContiguousBytes(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

unint64_t lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags;
  if (!lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags);
  }
  return result;
}

uint64_t closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)partial apply(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in static LLMCacheManager.sortAndFilterListResult(_:request:)(a1, a2) & 1;
}

LLMCache::CacheNamespace_optional __swiftcall CacheNamespace.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  unsigned int v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of CacheNamespace.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 3;
  if (v5 < 3) {
    char v7 = v5;
  }
  *unsigned int v4 = v7;
  return result;
}

uint64_t CacheNamespace.rawValue.getter()
{
  unint64_t v1 = 1819047270;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000012;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1953718630;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CacheNamespace(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace()
{
  unint64_t result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace;
  if (!lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CacheNamespace and conformance CacheNamespace);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CacheNamespace()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CacheNamespace()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CacheNamespace()
{
  return Hasher._finalize()();
}

LLMCache::CacheNamespace_optional protocol witness for RawRepresentable.init(rawValue:) in conformance CacheNamespace(Swift::String *a1)
{
  return CacheNamespace.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CacheNamespace(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE400000000000000;
  unint64_t v5 = 1819047270;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000012;
    unint64_t v4 = 0x8000000254463C70;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1953718630;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for Decodable.init(from:) in conformance CacheNamespace()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CacheNamespace()
{
  return RawRepresentable<>.encode(to:)();
}

unsigned char *storeEnumTagSinglePayload for CacheNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254450A9CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CacheNamespace()
{
  return &type metadata for CacheNamespace;
}

uint64_t VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1, void *a2)
{
  swift_allocObject();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = VectorDatabaseAccess.__allocating_init(path:embeddingProvider:);
  return VectorDatabaseAccess.init(path:embeddingProvider:)(a1, a2);
}

uint64_t VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

void *VectorDatabaseAccess.maxSearchResults.unsafeMutableAddressor()
{
  return &static VectorDatabaseAccess.maxSearchResults;
}

uint64_t static VectorDatabaseAccess.maxSearchResults.getter()
{
  return 8;
}

uint64_t one-time initialization function for jsonEncoder(uint64_t a1)
{
  return one-time initialization function for jsonEncoder(a1, MEMORY[0x263F061E0], MEMORY[0x263F061D8], &static VectorDatabaseAccess.jsonEncoder);
}

uint64_t one-time initialization function for jsonDecoder(uint64_t a1)
{
  return one-time initialization function for jsonEncoder(a1, MEMORY[0x263F06128], MEMORY[0x263F06120], &static VectorDatabaseAccess.jsonDecoder);
}

uint64_t one-time initialization function for jsonEncoder(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

uint64_t *VectorDatabaseAccess.jsonDecoder.unsafeMutableAddressor()
{
  if (one-time initialization token for jsonDecoder != -1) {
    swift_once();
  }
  return &static VectorDatabaseAccess.jsonDecoder;
}

uint64_t static VectorDatabaseAccess.jsonDecoder.getter()
{
  if (one-time initialization token for jsonDecoder != -1) {
    swift_once();
  }
  return swift_retain();
}

const char *VectorDatabaseAccess.dimensionFile.unsafeMutableAddressor()
{
  return "dimension.txt";
}

uint64_t static VectorDatabaseAccess.dimensionFile.getter()
{
  return 0x6F69736E656D6964;
}

const char *VectorDatabaseAccess.defaultClientVersion.unsafeMutableAddressor()
{
  return "DEFAULT";
}

uint64_t static VectorDatabaseAccess.defaultClientVersion.getter()
{
  return 0x544C5541464544;
}

uint64_t VectorDatabaseAccess.embeddingProvider.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of CacheDatabase(v1 + 112, a1);
}

uint64_t VectorDatabaseAccess.vectordb.getter()
{
  return swift_retain();
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)(uint64_t a1, void *a2)
{
  uint64_t v33 = v3;
  uint64_t v4 = v2;
  v3[4] = a1;
  v3[5] = a2;
  v3[6] = v4;
  uint64_t v7 = type metadata accessor for ColumnType();
  v3[7] = v7;
  v3[8] = *(void *)(v7 - 8);
  v3[9] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for VectorDatabaseMetric();
  v3[10] = v8;
  v3[11] = *(void *)(v8 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for VectorDatabaseConfig();
  v3[13] = v9;
  v3[14] = *(void *)(v9 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for VectorDatabaseDataType();
  v3[17] = v10;
  v3[18] = *(void *)(v10 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for URL();
  v3[21] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[22] = v12;
  v3[23] = swift_task_alloc();
  uint64_t v13 = swift_task_alloc();
  v3[24] = v13;
  uint64_t v31 = v4;
  swift_defaultActor_initialize();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  v3[25] = __swift_project_value_buffer(v14, (uint64_t)static Logger.logger);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v3[26] = v15;
  v3[27] = (v12 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v15(v13, a1, v11);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v27 = v3 + 3;
    uint64_t v29 = v3;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v32 = v28;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v19 = URL.absoluteString.getter();
    *unint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v21(v13, v11);
    _os_log_impl(&dword_254432000, v16, v17, "VectorDatabaseAccess directory: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v28, -1, -1);
    uint64_t v22 = v18;
    int v3 = v29;
    MEMORY[0x25A27A310](v22, -1, -1);
  }
  else
  {
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v21(v13, v11);
  }

  v3[28] = v21;
  outlined init with copy of CacheDatabase((uint64_t)a2, v31 + 112);
  uint64_t v23 = a2[3];
  uint64_t v24 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v23);
  unint64_t v30 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v24 + 8) + **(int **)(v24 + 8));
  char v25 = (void *)swift_task_alloc();
  v3[29] = v25;
  *char v25 = v3;
  v25[1] = VectorDatabaseAccess.init(path:embeddingProvider:);
  return v30(v23, v24);
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = a1;
  swift_task_dealloc();
  int v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254432000, v3, v4, "VectorDatabaseAccess using float16 data type for this hardware", v5, 2u);
    MEMORY[0x25A27A310](v5, -1, -1);
  }
  uint64_t v6 = *(void *)(v2 + 160);
  uint64_t v7 = *(void *)(v2 + 136);
  uint64_t v8 = *(void *)(v2 + 144);

  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v6, *MEMORY[0x263F846D8], v7);
  *(void *)(v2 + 256) = static VectorDatabaseConfig.getClientVersion(baseDirectory:)();
  *(void *)(v2 + 264) = v9;
  *(void *)(v2 + 248) = 0;
  uint64_t v21 = *(void *)(v2 + 160);
  uint64_t v10 = *(void *)(v2 + 144);
  uint64_t v19 = *(void *)(v2 + 152);
  uint64_t v20 = *(void *)(v2 + 136);
  uint64_t v11 = *(void *)(v2 + 112);
  uint64_t v22 = *(void *)(v2 + 128);
  uint64_t v23 = *(void *)(v2 + 120);
  uint64_t v12 = *(void *)(v2 + 96);
  uint64_t v24 = *(void *)(v2 + 104);
  uint64_t v14 = *(void *)(v2 + 80);
  uint64_t v13 = *(void *)(v2 + 88);
  uint64_t v16 = *(void *)(v2 + 64);
  uint64_t v15 = *(void **)(v2 + 72);
  uint64_t v18 = *(void *)(v2 + 56);
  uint64_t v25 = *(void *)(v2 + 48);
  (*(void (**)(void))(v2 + 208))();
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v12, *MEMORY[0x263F846B8], v14);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VectorDatabaseAttribute>);
  type metadata accessor for VectorDatabaseAttribute();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_254463350;
  *uint64_t v15 = 0;
  v15[1] = 0;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v15, *MEMORY[0x263F84720], v18);
  VectorDatabaseAttribute.init(name:columnType:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v19, v21, v20);
  swift_bridgeObjectRetain();
  VectorDatabaseConfig.init(baseDirectory:distanceMetric:filterableAttributes:dimension:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:enableFTS:dataType:maxIndexConstructionBatches:readOnly:pretokenizationEnabled:prefixIndices:perConnectionPeakMemory:clientVersion:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v23, v22, v24);
  type metadata accessor for VectorDatabaseClient();
  swift_allocObject();
  *(void *)(v25 + 152) = VectorDatabaseClient.init(config:)();
  return MEMORY[0x270FA2498](VectorDatabaseAccess.init(path:embeddingProvider:), v25, 0);
}

uint64_t VectorDatabaseAccess.init(path:embeddingProvider:)()
{
  uint64_t v42 = v0;
  uint64_t v1 = v0[31];
  specialized static VectorDatabaseAccess.updatePerisistedDimension(_:at:)(v0[30], v0[4]);
  if (v1)
  {
    unint64_t v27 = (void (*)(uint64_t, uint64_t))v0[28];
    uint64_t v3 = v0[20];
    uint64_t v2 = v0[21];
    uint64_t v4 = v0[18];
    uint64_t v5 = v0[16];
    uint64_t v7 = v0[13];
    uint64_t v6 = v0[14];
    uint64_t v28 = v0[5];
    uint64_t v30 = v0[17];
    uint64_t v8 = v0[4];
    swift_release();
    swift_bridgeObjectRelease();
    v27(v8, v2);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v30);
    __swift_destroy_boxed_opaque_existential_1Tm(v28);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    unint64_t v14 = v0[33];
    if (v13)
    {
      uint64_t v15 = v0[32];
      uint64_t v31 = v0[21];
      uint64_t v34 = (void (*)(uint64_t, uint64_t))v0[28];
      uint64_t v35 = v0[18];
      uint64_t v37 = v0[17];
      uint64_t v39 = v0[20];
      uint64_t v16 = v0[14];
      uint64_t v32 = v0[13];
      uint64_t v33 = v0[16];
      uint64_t v29 = v0[4];
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v41 = v18;
      *(_DWORD *)os_log_type_t v17 = 136315138;
      swift_bridgeObjectRetain();
      v0[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v14, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v11, v12, "VectorDatabaseAccess init completed with client version %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v18, -1, -1);
      MEMORY[0x25A27A310](v17, -1, -1);

      v34(v29, v31);
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v33, v32);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v37);
    }
    else
    {
      uint64_t v19 = v0[21];
      uint64_t v40 = v0[20];
      uint64_t v20 = v0[18];
      uint64_t v36 = (void (*)(uint64_t, uint64_t))v0[28];
      uint64_t v38 = v0[17];
      uint64_t v21 = v0[16];
      uint64_t v22 = v0[13];
      uint64_t v23 = v0[14];
      uint64_t v24 = v0[4];

      swift_bridgeObjectRelease_n();
      v36(v24, v19);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v40, v38);
    }
    __swift_destroy_boxed_opaque_existential_1Tm(v0[5]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v26 = v0[6];
    return v25(v26);
  }
}

uint64_t VectorDatabaseAccess.deinit()
{
  uint64_t v1 = v0;
  dispatch thunk of VectorDatabaseClient.cooldown()();
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.logger);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_254432000, v3, v4, "VectorDatabaseAccess deinit completed", v5, 2u);
    MEMORY[0x25A27A310](v5, -1, -1);
  }

  __swift_destroy_boxed_opaque_existential_1Tm(v1 + 112);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t VectorDatabaseAccess.__deallocating_deinit()
{
  VectorDatabaseAccess.deinit();
  return MEMORY[0x270FA2418](v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.delete(entries:)(Swift::OpaquePointer entries)
{
  uint64_t v3 = v2;
  os_log_type_t v4 = v1;
  uint64_t v6 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8, v8);
  uint64_t v10 = (void *)((char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (one-time initialization token for logger != -1) {
LABEL_84:
  }
    swift_once();
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)static Logger.logger);
  BOOL v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_254432000, v13, v14, "VectorDatabaseAccess entering delete...", v15, 2u);
    MEMORY[0x25A27A310](v15, -1, -1);
  }

  uint64_t v16 = (void *)*((void *)entries._rawValue + 2);
  if (!v16) {
    goto LABEL_78;
  }
  v58[1] = v4;
  os_log_type_t v4 = (char *)entries._rawValue
     + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v58[0] = (char *)v63 + 2;
  uint64_t v59 = (char *)v63 + 3;
  uint64_t v60 = v12;
  uint64_t v17 = *(void *)(v7 + 72);
  rawValue = entries._rawValue;
  swift_bridgeObjectRetain();
  entries._rawValue = 0;
  unint64_t v62 = (void *)MEMORY[0x263F8EE78];
  do
  {
    outlined init with copy of AnnotatedCacheEntry((uint64_t)&v4[v17 * (uint64_t)entries._rawValue], (uint64_t)v10);
    uint64_t v18 = *v10;
    unint64_t v19 = v10[1];
    uint64_t v20 = HIBYTE(v19) & 0xF;
    uint64_t v21 = *v10 & 0xFFFFFFFFFFFFLL;
    if ((v19 & 0x2000000000000000) != 0) {
      uint64_t v22 = HIBYTE(v19) & 0xF;
    }
    else {
      uint64_t v22 = *v10 & 0xFFFFFFFFFFFFLL;
    }
    if (!v22)
    {
LABEL_6:
      outlined destroy of AnnotatedCacheEntry((uint64_t)v10);
      goto LABEL_7;
    }
    if ((v19 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v18, v19, 10);
      uint64_t v7 = v45;
      swift_bridgeObjectRelease();
      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_43;
    }
    if ((v19 & 0x2000000000000000) != 0)
    {
      v63[0] = *v10;
      v63[1] = v19 & 0xFFFFFFFFFFFFFFLL;
      if (v18 == 43)
      {
        if (!v20) {
          goto LABEL_83;
        }
        if (v20 == 1) {
          goto LABEL_68;
        }
        if ((BYTE1(v18) - 48) > 9u) {
          goto LABEL_39;
        }
        uint64_t v26 = (BYTE1(v18) - 48);
        if (v20 != 2)
        {
          if ((BYTE2(v18) - 48) > 9u) {
            goto LABEL_39;
          }
          uint64_t v26 = 10 * (BYTE1(v18) - 48) + (BYTE2(v18) - 48);
          uint64_t v27 = v20 - 3;
          if (v20 != 3)
          {
            uint64_t v28 = (unsigned __int8 *)v59;
            while (1)
            {
              unsigned int v29 = *v28 - 48;
              if (v29 > 9) {
                goto LABEL_39;
              }
              uint64_t v30 = 10 * v26;
              if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                goto LABEL_39;
              }
              uint64_t v26 = v30 + v29;
              if (__OFADD__(v30, v29)) {
                goto LABEL_39;
              }
              LOBYTE(v20) = 0;
              ++v28;
              if (!--v27) {
                goto LABEL_42;
              }
            }
          }
        }
      }
      else
      {
        if (v18 == 45)
        {
          if (!v20)
          {
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v20 != 1)
          {
            if ((BYTE1(v18) - 48) > 9u) {
              goto LABEL_39;
            }
            if (v20 == 2)
            {
              LOBYTE(v20) = 0;
              uint64_t v26 = -(uint64_t)(BYTE1(v18) - 48);
              goto LABEL_42;
            }
            if ((BYTE2(v18) - 48) > 9u) {
              goto LABEL_39;
            }
            uint64_t v26 = -10 * (BYTE1(v18) - 48) - (BYTE2(v18) - 48);
            uint64_t v41 = v20 - 3;
            if (v20 != 3)
            {
              uint64_t v42 = (unsigned __int8 *)v59;
              while (1)
              {
                unsigned int v43 = *v42 - 48;
                if (v43 > 9) {
                  goto LABEL_39;
                }
                uint64_t v44 = 10 * v26;
                if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                  goto LABEL_39;
                }
                uint64_t v26 = v44 - v43;
                if (__OFSUB__(v44, v43)) {
                  goto LABEL_39;
                }
                LOBYTE(v20) = 0;
                ++v42;
                if (!--v41) {
                  goto LABEL_42;
                }
              }
            }
            goto LABEL_41;
          }
LABEL_68:
          uint64_t v26 = 0;
LABEL_42:
          if (v20) {
            goto LABEL_6;
          }
          goto LABEL_43;
        }
        if (!v20 || (v18 - 48) > 9u)
        {
LABEL_39:
          uint64_t v26 = 0;
          LOBYTE(v20) = 1;
          goto LABEL_42;
        }
        uint64_t v26 = (v18 - 48);
        if (v20 != 1)
        {
          if ((BYTE1(v18) - 48) > 9u) {
            goto LABEL_39;
          }
          uint64_t v26 = 10 * (v18 - 48) + (BYTE1(v18) - 48);
          uint64_t v37 = v20 - 2;
          if (v20 != 2)
          {
            uint64_t v38 = (unsigned __int8 *)v58[0];
            while (1)
            {
              unsigned int v39 = *v38 - 48;
              if (v39 > 9) {
                goto LABEL_39;
              }
              uint64_t v40 = 10 * v26;
              if ((unsigned __int128)(v26 * (__int128)10) >> 64 != (10 * v26) >> 63) {
                goto LABEL_39;
              }
              uint64_t v26 = v40 + v39;
              if (__OFADD__(v40, v39)) {
                goto LABEL_39;
              }
              LOBYTE(v20) = 0;
              ++v38;
              if (!--v37) {
                goto LABEL_42;
              }
            }
          }
        }
      }
LABEL_41:
      LOBYTE(v20) = 0;
      goto LABEL_42;
    }
    if ((v18 & 0x1000000000000000) != 0) {
      uint64_t v23 = (unsigned __int8 *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v23 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    uint64_t v24 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v23, v21, 10);
    if (v25) {
      goto LABEL_6;
    }
    uint64_t v26 = (uint64_t)v24;
LABEL_43:
    uint64_t v7 = v17;
    uint64_t v31 = v4;
    uint64_t v32 = v16;
    outlined destroy of AnnotatedCacheEntry((uint64_t)v10);
    uint64_t v33 = v3;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v34 = v62;
    }
    else {
      uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v62[2] + 1, 1, v62);
    }
    unint64_t v36 = v34[2];
    unint64_t v35 = v34[3];
    if (v36 >= v35 >> 1) {
      uint64_t v34 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v35 > 1), v36 + 1, 1, v34);
    }
    v34[2] = v36 + 1;
    unint64_t v62 = v34;
    v34[v36 + 4] = v26;
    uint64_t v3 = v33;
    uint64_t v16 = v32;
    os_log_type_t v4 = v31;
    uint64_t v17 = v7;
LABEL_7:
    ++entries._rawValue;
  }
  while (entries._rawValue != v16);
  swift_bridgeObjectRelease();
  if ((void *)v62[2] == v16)
  {
    uint64_t v46 = VectorDatabaseAccess.delete(identifiers:)();
    if (v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_73;
    }
    uint64_t v52 = v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 134218240;
      v63[0] = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v55 + 12) = 2048;
      v63[0] = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_254432000, v53, v54, "Deleted %ld entries successfully when %ld were originally requested", (uint8_t *)v55, 0x16u);
      MEMORY[0x25A27A310](v55, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
LABEL_78:
    unint64_t v48 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v48, v56))
    {
      unint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v57 = 0;
      _os_log_impl(&dword_254432000, v48, v56, "VectorDatabaseAccess leaving delete...", v57, 2u);
      unint64_t v51 = v57;
      goto LABEL_80;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *unint64_t v47 = 0;
    swift_willThrow();
LABEL_73:
    unint64_t v48 = Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v48, v49)) {
      goto LABEL_81;
    }
    unint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v50 = 0;
    _os_log_impl(&dword_254432000, v48, v49, "VectorDatabaseAccess leaving delete...", v50, 2u);
    unint64_t v51 = v50;
LABEL_80:
    MEMORY[0x25A27A310](v51, -1, -1);
  }
LABEL_81:
}

uint64_t VectorDatabaseAccess.delete(identifiers:)()
{
  uint64_t v1 = type metadata accessor for VectorDatabaseError();
  uint64_t v47 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v2);
  os_log_type_t v4 = (unint64_t *)((char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v49 = type metadata accessor for OSSignpostID();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49, v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  uint64_t v48 = dispatch thunk of VectorDatabaseClient.delete(identifiers:)();
  if (v0)
  {
    id v52 = v0;
    id v10 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      uint64_t v11 = v47;
      uint64_t v12 = (*(uint64_t (**)(unint64_t *, uint64_t))(v47 + 88))(v4, v1);
      uint64_t v13 = v12;
      if (v12 == *MEMORY[0x263F84680])
      {

        (*(void (**)(unint64_t *, uint64_t))(v11 + 96))(v4, v1);
        unint64_t v14 = *v4;
        unint64_t v15 = v4[1];
        unint64_t v46 = v14;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v16 = type metadata accessor for Logger();
        __swift_project_value_buffer(v16, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        uint64_t v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v17, v18))
        {
          unint64_t v19 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v51 = v44;
          LODWORD(v45) = v13;
          *(_DWORD *)unint64_t v19 = 136315138;
          unsigned int v43 = v19 + 4;
          swift_bridgeObjectRetain();
          unint64_t v20 = v15;
          unint64_t v21 = v46;
          uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v20, &v51);
          uint64_t v13 = v45;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_254432000, v17, v18, "Failed to delete assets due to deletion failure, error detail: %s", v19, 0xCu);
          uint64_t v22 = v44;
          swift_arrayDestroy();
          MEMORY[0x25A27A310](v22, -1, -1);
          uint64_t v23 = v19;
          uint64_t v11 = v47;
          MEMORY[0x25A27A310](v23, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          unint64_t v20 = v15;
          unint64_t v21 = v46;
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        uint64_t v38 = (uint64_t *)v37;
        *uint64_t v37 = v21;
        v37[1] = v20;
LABEL_21:
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 104))(v38, v13, v1);
        swift_willThrow();
        goto LABEL_22;
      }
      if (v12 == *MEMORY[0x263F84678])
      {

        (*(void (**)(unint64_t *, uint64_t))(v11 + 96))(v4, v1);
        uint64_t v25 = *v4;
        unint64_t v26 = v4[1];
        uint64_t v45 = v25;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v27 = type metadata accessor for Logger();
        __swift_project_value_buffer(v27, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        uint64_t v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc();
          unint64_t v46 = v26;
          uint64_t v31 = (uint8_t *)v30;
          uint64_t v44 = swift_slowAlloc();
          uint64_t v51 = v44;
          unsigned int v43 = v31;
          *(_DWORD *)uint64_t v31 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v32 = v45;
          uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v51);
          uint64_t v11 = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          os_log_type_t v33 = v29;
          uint64_t v34 = v32;
          unint64_t v35 = v43;
          _os_log_impl(&dword_254432000, v28, v33, "Failed to delete assets due to client failure, error detail: %s", v43, 0xCu);
          uint64_t v36 = v44;
          swift_arrayDestroy();
          MEMORY[0x25A27A310](v36, -1, -1);
          unint64_t v26 = v46;
          MEMORY[0x25A27A310](v35, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v34 = v45;
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        uint64_t v38 = v39;
        *unsigned int v39 = v34;
        v39[1] = v26;
        goto LABEL_21;
      }
      (*(void (**)(unint64_t *, uint64_t))(v11 + 8))(v4, v1);
    }
LABEL_22:

    id v40 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    goto LABEL_23;
  }
  id v24 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

LABEL_23:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v49);
  return v48;
}

uint64_t VectorDatabaseAccess.describe(identifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v82 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x270FA5388](v6 - 8, v7);
  BOOL v83 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Asset?);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v12 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Asset();
  uint64_t v85 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13, v14);
  unint64_t v84 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for OSSignpostID();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v86 = v16;
  uint64_t v87 = v17;
  MEMORY[0x270FA5388](v16, v18);
  unint64_t v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v21 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  uint64_t v22 = HIBYTE(a2) & 0xF;
  uint64_t v23 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v24 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v24 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v24) {
    goto LABEL_76;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(a1, a2, 10);
    char v72 = v71;
    swift_bridgeObjectRelease();
    if (v72) {
      goto LABEL_76;
    }
    goto LABEL_38;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v25 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v25 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    unint64_t v26 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v25, v23, 10);
    if ((v27 & 1) == 0)
    {
      uint64_t v28 = (uint64_t)v26;
      goto LABEL_38;
    }
LABEL_76:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v73 = type metadata accessor for Logger();
    __swift_project_value_buffer(v73, (uint64_t)static Logger.logger);
    swift_bridgeObjectRetain_n();
    uint64_t v74 = Logger.logObject.getter();
    os_log_type_t v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      char v76 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      v88[0] = v77;
      *(_DWORD *)char v76 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v74, v75, "Skip describing entry with invalid id %s", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v77, -1, -1);
      MEMORY[0x25A27A310](v76, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v36 = v87;
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *uint64_t v78 = 0;
    goto LABEL_82;
  }
  v88[0] = a1;
  v88[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v22)
    {
LABEL_88:
      __break(1u);
      goto LABEL_89;
    }
    if (v22 == 1) {
      goto LABEL_86;
    }
    if ((BYTE1(a1) - 48) <= 9u)
    {
      uint64_t v28 = (BYTE1(a1) - 48);
      if (v22 == 2) {
        goto LABEL_36;
      }
      if ((BYTE2(a1) - 48) <= 9u)
      {
        uint64_t v28 = 10 * (BYTE1(a1) - 48) + (BYTE2(a1) - 48);
        uint64_t v29 = v22 - 3;
        if (v22 != 3)
        {
          uint64_t v30 = (unsigned __int8 *)v88 + 3;
          while (1)
          {
            unsigned int v31 = *v30 - 48;
            if (v31 > 9) {
              goto LABEL_34;
            }
            uint64_t v32 = 10 * v28;
            if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
              goto LABEL_34;
            }
            uint64_t v28 = v32 + v31;
            if (__OFADD__(v32, v31)) {
              goto LABEL_34;
            }
            LOBYTE(v22) = 0;
            ++v30;
            if (!--v29) {
              goto LABEL_37;
            }
          }
        }
        goto LABEL_36;
      }
    }
LABEL_34:
    uint64_t v28 = 0;
    LOBYTE(v22) = 1;
    goto LABEL_37;
  }
  if (a1 != 45)
  {
    if (!v22 || (a1 - 48) > 9u) {
      goto LABEL_34;
    }
    uint64_t v28 = (a1 - 48);
    if (v22 == 1)
    {
LABEL_36:
      LOBYTE(v22) = 0;
      goto LABEL_37;
    }
    if ((BYTE1(a1) - 48) <= 9u)
    {
      uint64_t v28 = 10 * (a1 - 48) + (BYTE1(a1) - 48);
      uint64_t v59 = v22 - 2;
      if (v22 != 2)
      {
        uint64_t v60 = (unsigned __int8 *)v88 + 2;
        while (1)
        {
          unsigned int v61 = *v60 - 48;
          if (v61 > 9) {
            goto LABEL_34;
          }
          uint64_t v62 = 10 * v28;
          if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
            goto LABEL_34;
          }
          uint64_t v28 = v62 + v61;
          if (__OFADD__(v62, v61)) {
            goto LABEL_34;
          }
          LOBYTE(v22) = 0;
          ++v60;
          if (!--v59) {
            goto LABEL_37;
          }
        }
      }
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  if (!v22)
  {
    __break(1u);
    goto LABEL_88;
  }
  if (v22 != 1)
  {
    if ((BYTE1(a1) - 48) > 9u) {
      goto LABEL_34;
    }
    if (v22 == 2)
    {
      LOBYTE(v22) = 0;
      uint64_t v28 = -(uint64_t)(BYTE1(a1) - 48);
      goto LABEL_37;
    }
    if ((BYTE2(a1) - 48) > 9u) {
      goto LABEL_34;
    }
    uint64_t v28 = -10 * (BYTE1(a1) - 48) - (BYTE2(a1) - 48);
    uint64_t v63 = v22 - 3;
    if (v22 != 3)
    {
      long long v64 = (unsigned __int8 *)v88 + 3;
      while (1)
      {
        unsigned int v65 = *v64 - 48;
        if (v65 > 9) {
          goto LABEL_34;
        }
        uint64_t v66 = 10 * v28;
        if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
          goto LABEL_34;
        }
        uint64_t v28 = v66 - v65;
        if (__OFSUB__(v66, v65)) {
          goto LABEL_34;
        }
        LOBYTE(v22) = 0;
        ++v64;
        if (!--v63) {
          goto LABEL_37;
        }
      }
    }
    goto LABEL_36;
  }
LABEL_86:
  uint64_t v28 = 0;
LABEL_37:
  if (v22) {
    goto LABEL_76;
  }
LABEL_38:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int64>);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_254463350;
  *(void *)(v33 + 32) = v28;
  uint64_t v34 = VectorDatabaseAccess.listAll(identifiers:pagination:)();
  if (v3)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = v86;
    uint64_t v36 = v87;
LABEL_84:
    id v79 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v20, v35);
  }
  uint64_t v37 = v34;
  swift_bridgeObjectRelease();
  if (*(void *)(v37 + 16))
  {
    uint64_t v38 = v85;
    (*(void (**)(char *, unint64_t, uint64_t))(v85 + 16))(v12, v37 + ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80)), v13);
    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v39 = 1;
    uint64_t v38 = v85;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v12, v39, 1, v13);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v12, 1, v13) == 1)
  {
    outlined destroy of Date?((uint64_t)v12, &demangling cache variable for type metadata for Asset?);
    if (one-time initialization token for logger == -1)
    {
LABEL_45:
      uint64_t v40 = type metadata accessor for Logger();
      __swift_project_value_buffer(v40, (uint64_t)static Logger.logger);
      swift_bridgeObjectRetain_n();
      uint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        unsigned int v43 = (uint8_t *)swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        v88[0] = v44;
        *(_DWORD *)unsigned int v43 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_254432000, v41, v42, "Entry with id %s is not found", v43, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A27A310](v44, -1, -1);
        MEMORY[0x25A27A310](v43, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v36 = v87;
      lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
      swift_allocError();
      unsigned char *v58 = 2;
LABEL_82:
      swift_willThrow();
LABEL_83:
      uint64_t v35 = v86;
      goto LABEL_84;
    }
LABEL_89:
    swift_once();
    goto LABEL_45;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v84, v12, v13);
  uint64_t v45 = Asset.payload.getter();
  if (v46 >> 60 == 15)
  {
    uint64_t v50 = type metadata accessor for AnnotatedCacheEntry(0);
    uint64_t v51 = (uint64_t)v83;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v83, 1, 1, v50);
    outlined destroy of Date?(v51, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v52 = type metadata accessor for Logger();
    __swift_project_value_buffer(v52, (uint64_t)static Logger.logger);
    swift_bridgeObjectRetain_n();
    unint64_t v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      v88[0] = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      BOOL v83 = (char *)(v55 + 4);
      swift_bridgeObjectRetain();
      uint64_t v89 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v88);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v53, v54, "Entry with id %s either does not have payload or payload fails to be decoded", v55, 0xCu);
      swift_arrayDestroy();
      uint64_t v57 = v56;
      uint64_t v38 = v85;
      MEMORY[0x25A27A310](v57, -1, -1);
      MEMORY[0x25A27A310](v55, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v36 = v87;
    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    unsigned char *v67 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v84, v13);
    goto LABEL_83;
  }
  unint64_t v47 = v46;
  uint64_t v81 = v13;
  uint64_t v48 = v45;
  if (one-time initialization token for jsonDecoder != -1) {
    swift_once();
  }
  uint64_t v49 = type metadata accessor for AnnotatedCacheEntry(0);
  lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, (void (*)(uint64_t))type metadata accessor for AnnotatedCacheEntry);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  outlined consume of Data._Representation?(v48, v47);
  uint64_t v68 = (uint64_t)v83;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v83, 0, 1, v49);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v84, v81);
  outlined init with take of AnnotatedCacheEntry(v68, v82);
  id v69 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v20, v86);
}

uint64_t Asset.toAnnotatedCachedEntry()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = Asset.payload.getter();
  if (v3 >> 60 == 15)
  {
    uint64_t v4 = type metadata accessor for AnnotatedCacheEntry(0);
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    uint64_t v6 = v4;
    uint64_t v7 = a1;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = v2;
    unint64_t v10 = v3;
    if (one-time initialization token for jsonDecoder != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for AnnotatedCacheEntry(0);
    lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, (void (*)(uint64_t))type metadata accessor for AnnotatedCacheEntry);
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    outlined consume of Data._Representation?(v9, v10);
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v7 = a1;
    uint64_t v8 = 0;
    uint64_t v6 = v11;
  }
  return v5(v7, v8, 1, v6);
}

uint64_t VectorDatabaseAccess.insert(entries:)(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = type metadata accessor for Asset();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ColumnType();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AnnotatedCacheEntry(0);
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](VectorDatabaseAccess.insert(entries:), v1, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  uint64_t v3 = (void *)*v2;
  v3[28] = a1;
  v3[29] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[8];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = VectorDatabaseAccess.insert(entries:);
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v7 = v3[8];
    swift_bridgeObjectRelease();
    uint64_t v5 = VectorDatabaseAccess.insert(entries:);
    uint64_t v6 = v7;
  }
  return MEMORY[0x270FA2498](v5, v6, 0);
}

uint64_t VectorDatabaseAccess.insert(entries:)()
{
  uint64_t v62 = v0;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 160) = __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_254432000, v2, v3, "VectorDatabaseAccess entering insert...", v4, 2u);
    MEMORY[0x25A27A310](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 56);

  uint64_t v6 = *(void *)(v5 + 16);
  *(void *)(v0 + 168) = v6;
  if (!v6)
  {
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v26 = 0;
      _os_log_impl(&dword_254432000, v24, v25, "VectorDatabaseAccess leaving insert...", v26, 2u);
      MEMORY[0x25A27A310](v26, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v27 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_51;
  }
  uint64_t v7 = *(uint64_t **)(v0 + 152);
  uint64_t v8 = *(void *)(v0 + 136);
  uint64_t v9 = *(void *)(v0 + 56);
  int v10 = *(_DWORD *)(v8 + 80);
  *(_DWORD *)(v0 + 244) = v10;
  uint64_t v11 = *(void *)(v8 + 72);
  int v12 = *MEMORY[0x263F84740];
  *(_DWORD *)(v0 + 248) = *MEMORY[0x263F84720];
  *(_DWORD *)(v0 + 252) = v12;
  uint64_t v13 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 184) = 0;
  *(void *)(v0 + 192) = v13;
  *(void *)(v0 + 176) = v11;
  uint64_t v14 = v9 + ((v10 + 32) & ~(unint64_t)v10);
  swift_bridgeObjectRetain();
  uint64_t v15 = outlined init with copy of AnnotatedCacheEntry(v14, (uint64_t)v7);
  uint64_t v17 = *v7;
  unint64_t v18 = v7[1];
  uint64_t v19 = HIBYTE(v18) & 0xF;
  uint64_t v20 = *v7 & 0xFFFFFFFFFFFFLL;
  if ((v18 & 0x2000000000000000) != 0) {
    uint64_t v21 = HIBYTE(v18) & 0xF;
  }
  else {
    uint64_t v21 = *v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v21)
  {
    if ((v18 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v28 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v17, v18, 10);
      LOBYTE(v17) = v60;
      swift_bridgeObjectRelease();
LABEL_41:
      *(void *)(v0 + 200) = v28;
      if ((v17 & 1) == 0)
      {
        uint64_t v34 = *(void *)(*(void *)(v0 + 152) + *(int *)(*(void *)(v0 + 128) + 36));
        *(void *)(v0 + 208) = v34;
        swift_bridgeObjectRetain();
        uint64_t v35 = (void *)swift_task_alloc();
        *(void *)(v0 + 216) = v35;
        *uint64_t v35 = v0;
        v35[1] = VectorDatabaseAccess.insert(entries:);
        uint64_t v20 = *(void *)(v0 + 64);
        v35[2] = v34;
        v35[3] = v20;
        uint64_t v15 = (uint64_t)VectorDatabaseAccess.searchKeyEmbeddings(_:);
        uint64_t v16 = 0;
        return MEMORY[0x270FA2498](v15, v20, v16);
      }
      goto LABEL_45;
    }
    uint64_t v22 = (unsigned char *)(v0 + 240);
    if ((v18 & 0x2000000000000000) == 0)
    {
      if ((v17 & 0x1000000000000000) != 0) {
        uint64_t v23 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v23 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v28 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v23, v20, 10);
      LOBYTE(v17) = v29 & 1;
      goto LABEL_40;
    }
    *(void *)(v0 + 16) = v17;
    *(void *)(v0 + 24) = v18 & 0xFFFFFFFFFFFFFFLL;
    if (v17 == 43)
    {
      if (!v19) {
        goto LABEL_75;
      }
      if (v19 == 1 || (BYTE1(v17) - 48) > 9u) {
        goto LABEL_39;
      }
      uint64_t v28 = (BYTE1(v17) - 48);
      if (v19 != 2)
      {
        if ((BYTE2(v17) - 48) > 9u) {
          goto LABEL_39;
        }
        uint64_t v28 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
        uint64_t v30 = v19 - 3;
        if (v30)
        {
          unsigned int v31 = (unsigned __int8 *)(v0 + 19);
          while (1)
          {
            unsigned int v32 = *v31 - 48;
            if (v32 > 9) {
              goto LABEL_39;
            }
            uint64_t v33 = 10 * v28;
            if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
              goto LABEL_39;
            }
            uint64_t v28 = v33 + v32;
            if (__OFADD__(v33, v32)) {
              goto LABEL_39;
            }
            LOBYTE(v17) = 0;
            ++v31;
            if (!--v30) {
              goto LABEL_40;
            }
          }
        }
      }
    }
    else
    {
      if (v17 == 45)
      {
        if (v19)
        {
          if (v19 != 1 && (BYTE1(v17) - 48) <= 9u)
          {
            if (v19 == 2)
            {
              LOBYTE(v17) = 0;
              uint64_t v28 = -(uint64_t)(BYTE1(v17) - 48);
              *uint64_t v22 = 0;
              goto LABEL_41;
            }
            if ((BYTE2(v17) - 48) <= 9u)
            {
              uint64_t v28 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
              uint64_t v56 = v19 - 3;
              if (!v56) {
                goto LABEL_65;
              }
              uint64_t v57 = (unsigned __int8 *)(v0 + 19);
              while (1)
              {
                unsigned int v58 = *v57 - 48;
                if (v58 > 9) {
                  break;
                }
                uint64_t v59 = 10 * v28;
                if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
                  break;
                }
                uint64_t v28 = v59 - v58;
                if (__OFSUB__(v59, v58)) {
                  break;
                }
                LOBYTE(v17) = 0;
                ++v57;
                if (!--v56) {
                  goto LABEL_40;
                }
              }
            }
          }
LABEL_39:
          uint64_t v28 = 0;
          LOBYTE(v17) = 1;
LABEL_40:
          *uint64_t v22 = v17;
          goto LABEL_41;
        }
        __break(1u);
LABEL_75:
        __break(1u);
        return MEMORY[0x270FA2498](v15, v20, v16);
      }
      if (!v19 || (v17 - 48) > 9u) {
        goto LABEL_39;
      }
      uint64_t v28 = (v17 - 48);
      if (v19 != 1)
      {
        if ((BYTE1(v17) - 48) > 9u) {
          goto LABEL_39;
        }
        uint64_t v28 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
        uint64_t v52 = v19 - 2;
        if (v52)
        {
          unint64_t v53 = (unsigned __int8 *)(v0 + 18);
          while (1)
          {
            unsigned int v54 = *v53 - 48;
            if (v54 > 9) {
              goto LABEL_39;
            }
            uint64_t v55 = 10 * v28;
            if ((unsigned __int128)(v28 * (__int128)10) >> 64 != (10 * v28) >> 63) {
              goto LABEL_39;
            }
            uint64_t v28 = v55 + v54;
            if (__OFADD__(v55, v54)) {
              goto LABEL_39;
            }
            LOBYTE(v17) = 0;
            ++v53;
            if (!--v52) {
              goto LABEL_40;
            }
          }
        }
      }
    }
LABEL_65:
    LOBYTE(v17) = 0;
    *uint64_t v22 = 0;
    goto LABEL_41;
  }
LABEL_45:
  uint64_t v36 = *(void *)(v0 + 152);
  uint64_t v37 = *(void *)(v0 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined init with copy of AnnotatedCacheEntry(v36, v37);
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.error.getter();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = *(uint64_t **)(v0 + 144);
  if (v40)
  {
    os_log_type_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v61 = v43;
    *(_DWORD *)os_log_type_t v42 = 136315138;
    uint64_t v45 = *v41;
    unint64_t v44 = v41[1];
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v44, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of AnnotatedCacheEntry((uint64_t)v41);
    _os_log_impl(&dword_254432000, v38, v39, "Skip inserting entry with invalid id %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v43, -1, -1);
    MEMORY[0x25A27A310](v42, -1, -1);
  }
  else
  {
    outlined destroy of AnnotatedCacheEntry(*(void *)(v0 + 144));
  }

  uint64_t v46 = *(void *)(v0 + 152);
  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *unint64_t v47 = 0;
  swift_willThrow();
  outlined destroy of AnnotatedCacheEntry(v46);
  uint64_t v48 = Logger.logObject.getter();
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v50 = 0;
    _os_log_impl(&dword_254432000, v48, v49, "VectorDatabaseAccess leaving insert...", v50, 2u);
    MEMORY[0x25A27A310](v50, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v27 = *(uint64_t (**)(void))(v0 + 8);
LABEL_51:
  return v27();
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned char *v48;
  unsigned __int8 *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  unsigned __int8 *v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  BOOL v71;
  uint64_t *v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unsigned char *v78;
  uint64_t v79;
  unsigned __int8 *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int8 *v84;
  unsigned int v85;
  uint64_t v86;
  char v87;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  uint64_t v91 = v0;
  uint64_t v1 = *(unsigned int *)(v0 + 248);
  uint64_t v88 = *(_DWORD *)(v0 + 252);
  uint64_t v2 = *(void **)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 104);
  os_log_type_t v3 = *(void *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(VectorDatabaseAttribute, DatabaseValue)>);
  uint64_t v5 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue))
             - 8);
  uint64_t v6 = (*(unsigned __int8 *)(*(void *)v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_254463350;
  uint64_t v8 = (uint64_t *)(v7 + v6 + v5[14]);
  *uint64_t v2 = 0;
  v2[1] = 0;
  (*(void (**)(void *, uint64_t, uint64_t))(v3 + 104))(v2, v1, v4);
  VectorDatabaseAttribute.init(name:columnType:)();
  *uint64_t v8 = UserID.sharedUserId.getter();
  v8[1] = v9;
  int v10 = type metadata accessor for DatabaseValue();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v88, v10);
  specialized Dictionary.init(dictionaryLiteral:)(v7);
  if (one-time initialization token for jsonEncoder != -1) {
    swift_once();
  }
  uint64_t v11 = *(void *)(v0 + 232);
  lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, (void (*)(uint64_t))type metadata accessor for AnnotatedCacheEntry);
  int v12 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (!v11)
  {
    uint64_t v20 = v12;
    uint64_t v21 = v13;
    uint64_t v23 = *(void *)(v0 + 88);
    uint64_t v22 = *(void *)(v0 + 96);
    os_log_type_t v25 = *(void *)(v0 + 72);
    uint64_t v24 = *(void *)(v0 + 80);
    outlined copy of Data._Representation(v12, v13);
    Asset.init(identifier:vectors:attributes:payload:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v22, v25);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v27 = *(void *)(v0 + 192);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      char v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v27 + 16) + 1, 1, v27);
    }
    char v29 = *(void *)(v27 + 16);
    uint64_t v28 = *(void *)(v27 + 24);
    if (v29 >= v28 >> 1) {
      char v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1, v27);
    }
    uint64_t v89 = *(void *)(v0 + 168);
    uint64_t v30 = *(void *)(v0 + 152);
    unsigned int v31 = *(void *)(v0 + 88);
    unsigned int v32 = *(void *)(v0 + 96);
    uint64_t v34 = *(void *)(v0 + 72);
    uint64_t v33 = *(void *)(v0 + 80);
    uint64_t v35 = *(void *)(v0 + 184) + 1;
    *(void *)(v27 + 16) = v29 + 1;
    uint64_t v36 = v27
        + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))
        + *(void *)(v33 + 72) * v29;
    uint64_t v37 = v27;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v33 + 32))(v36, v31, v34);
    outlined consume of Data._Representation(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    outlined destroy of AnnotatedCacheEntry(v30);
    if (v35 == v89)
    {
      swift_bridgeObjectRelease();
      uint64_t v50 = VectorDatabaseAccess.insert(assets:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v51 = Logger.logObject.getter();
      uint64_t v52 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v51, v52))
      {
        unsigned int v54 = *(void *)(v0 + 168);
        uint64_t v55 = swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = 134218240;
        *(void *)(v0 + 40) = v50;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v55 + 12) = 2048;
        *(void *)(v0 + 48) = v54;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_254432000, v51, v52, "Inserted %ld entries successfully when %ld were originally requested", (uint8_t *)v55, 0x16u);
        MEMORY[0x25A27A310](v55, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      uint64_t v56 = Logger.logObject.getter();
      uint64_t v57 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v56, v57))
      {
        unsigned int v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned int v58 = 0;
        _os_log_impl(&dword_254432000, v56, v57, "VectorDatabaseAccess leaving insert...", v58, 2u);
        MEMORY[0x25A27A310](v58, -1, -1);
      }

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_8;
    }
    uint64_t v38 = *(void *)(v0 + 176);
    os_log_type_t v39 = *(void *)(v0 + 184) + 1;
    *(void *)(v0 + 184) = v39;
    *(void *)(v0 + 192) = v37;
    BOOL v40 = *(uint64_t **)(v0 + 152);
    uint64_t v41 = outlined init with copy of AnnotatedCacheEntry(*(void *)(v0 + 56)+ ((*(unsigned __int8 *)(v0 + 244) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 244))+ v38 * v39, (uint64_t)v40);
    uint64_t v43 = *v40;
    unint64_t v44 = v40[1];
    uint64_t v45 = HIBYTE(v44) & 0xF;
    uint64_t v46 = *v40 & 0xFFFFFFFFFFFFLL;
    if ((v44 & 0x2000000000000000) != 0) {
      unint64_t v47 = HIBYTE(v44) & 0xF;
    }
    else {
      unint64_t v47 = *v40 & 0xFFFFFFFFFFFFLL;
    }
    if (!v47) {
      goto LABEL_59;
    }
    if ((v44 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v59 = (uint64_t)specialized _parseInteger<A, B>(ascii:radix:)(v43, v44, 10);
      LOBYTE(v43) = v87;
      swift_bridgeObjectRelease();
LABEL_55:
      *(void *)(v0 + 200) = v59;
      if ((v43 & 1) == 0)
      {
        unsigned int v65 = *(void *)(*(void *)(v0 + 152) + *(int *)(*(void *)(v0 + 128) + 36));
        *(void *)(v0 + 208) = v65;
        swift_bridgeObjectRetain();
        uint64_t v66 = (void *)swift_task_alloc();
        *(void *)(v0 + 216) = v66;
        *uint64_t v66 = v0;
        v66[1] = VectorDatabaseAccess.insert(entries:);
        uint64_t v46 = *(void *)(v0 + 64);
        v66[2] = v65;
        v66[3] = v46;
        uint64_t v41 = (uint64_t)VectorDatabaseAccess.searchKeyEmbeddings(_:);
        os_log_type_t v42 = 0;
        return MEMORY[0x270FA2498](v41, v46, v42);
      }
LABEL_59:
      uint64_t v67 = *(void *)(v0 + 152);
      uint64_t v68 = *(void *)(v0 + 144);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined init with copy of AnnotatedCacheEntry(v67, v68);
      id v69 = Logger.logObject.getter();
      Swift::Int v70 = static os_log_type_t.error.getter();
      char v71 = os_log_type_enabled(v69, v70);
      char v72 = *(uint64_t **)(v0 + 144);
      if (v71)
      {
        uint64_t v73 = (uint8_t *)swift_slowAlloc();
        uint64_t v74 = swift_slowAlloc();
        uint64_t v90 = v74;
        *(_DWORD *)uint64_t v73 = 136315138;
        os_log_type_t v75 = *v72;
        char v76 = v72[1];
        swift_bridgeObjectRetain();
        *(void *)(v0 + 32) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v76, &v90);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined destroy of AnnotatedCacheEntry((uint64_t)v72);
        _os_log_impl(&dword_254432000, v69, v70, "Skip inserting entry with invalid id %s", v73, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A27A310](v74, -1, -1);
        MEMORY[0x25A27A310](v73, -1, -1);
      }
      else
      {
        outlined destroy of AnnotatedCacheEntry(*(void *)(v0 + 144));
      }

      uint64_t v77 = *(void *)(v0 + 152);
      lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
      swift_allocError();
      *uint64_t v78 = 0;
      swift_willThrow();
      outlined destroy of AnnotatedCacheEntry(v77);
      goto LABEL_5;
    }
    uint64_t v48 = (unsigned char *)(v0 + 240);
    if ((v44 & 0x2000000000000000) == 0)
    {
      if ((v43 & 0x1000000000000000) != 0) {
        os_log_type_t v49 = (unsigned __int8 *)((v44 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        os_log_type_t v49 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v59 = (uint64_t)specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v49, v46, 10);
      LOBYTE(v43) = v60 & 1;
      goto LABEL_54;
    }
    *(void *)(v0 + 16) = v43;
    *(void *)(v0 + 24) = v44 & 0xFFFFFFFFFFFFFFLL;
    if (v43 == 43)
    {
      if (!v45) {
        goto LABEL_84;
      }
      if (v45 == 1 || (BYTE1(v43) - 48) > 9u) {
        goto LABEL_53;
      }
      uint64_t v59 = (BYTE1(v43) - 48);
      if (v45 != 2)
      {
        if ((BYTE2(v43) - 48) > 9u) {
          goto LABEL_53;
        }
        uint64_t v59 = 10 * (BYTE1(v43) - 48) + (BYTE2(v43) - 48);
        uint64_t v61 = v45 - 3;
        if (v61)
        {
          uint64_t v62 = (unsigned __int8 *)(v0 + 19);
          while (1)
          {
            uint64_t v63 = *v62 - 48;
            if (v63 > 9) {
              goto LABEL_53;
            }
            long long v64 = 10 * v59;
            if ((unsigned __int128)(v59 * (__int128)10) >> 64 != (10 * v59) >> 63) {
              goto LABEL_53;
            }
            uint64_t v59 = v64 + v63;
            if (__OFADD__(v64, v63)) {
              goto LABEL_53;
            }
            LOBYTE(v43) = 0;
            ++v62;
            if (!--v61) {
              goto LABEL_54;
            }
          }
        }
      }
    }
    else
    {
      if (v43 == 45)
      {
        if (v45)
        {
          if (v45 != 1 && (BYTE1(v43) - 48) <= 9u)
          {
            if (v45 == 2)
            {
              LOBYTE(v43) = 0;
              uint64_t v59 = -(uint64_t)(BYTE1(v43) - 48);
              NSObject *v48 = 0;
              goto LABEL_55;
            }
            if ((BYTE2(v43) - 48) <= 9u)
            {
              uint64_t v59 = -10 * (BYTE1(v43) - 48) - (BYTE2(v43) - 48);
              BOOL v83 = v45 - 3;
              if (!v83) {
                goto LABEL_74;
              }
              unint64_t v84 = (unsigned __int8 *)(v0 + 19);
              while (1)
              {
                uint64_t v85 = *v84 - 48;
                if (v85 > 9) {
                  break;
                }
                uint64_t v86 = 10 * v59;
                if ((unsigned __int128)(v59 * (__int128)10) >> 64 != (10 * v59) >> 63) {
                  break;
                }
                uint64_t v59 = v86 - v85;
                if (__OFSUB__(v86, v85)) {
                  break;
                }
                LOBYTE(v43) = 0;
                ++v84;
                if (!--v83) {
                  goto LABEL_54;
                }
              }
            }
          }
LABEL_53:
          uint64_t v59 = 0;
          LOBYTE(v43) = 1;
LABEL_54:
          NSObject *v48 = v43;
          goto LABEL_55;
        }
        __break(1u);
LABEL_84:
        __break(1u);
        return MEMORY[0x270FA2498](v41, v46, v42);
      }
      if (!v45 || (v43 - 48) > 9u) {
        goto LABEL_53;
      }
      uint64_t v59 = (v43 - 48);
      if (v45 != 1)
      {
        if ((BYTE1(v43) - 48) > 9u) {
          goto LABEL_53;
        }
        uint64_t v59 = 10 * (v43 - 48) + (BYTE1(v43) - 48);
        id v79 = v45 - 2;
        if (v79)
        {
          uint64_t v80 = (unsigned __int8 *)(v0 + 18);
          while (1)
          {
            uint64_t v81 = *v80 - 48;
            if (v81 > 9) {
              goto LABEL_53;
            }
            uint64_t v82 = 10 * v59;
            if ((unsigned __int128)(v59 * (__int128)10) >> 64 != (10 * v59) >> 63) {
              goto LABEL_53;
            }
            uint64_t v59 = v82 + v81;
            if (__OFADD__(v82, v81)) {
              goto LABEL_53;
            }
            LOBYTE(v43) = 0;
            ++v80;
            if (!--v79) {
              goto LABEL_54;
            }
          }
        }
      }
    }
LABEL_74:
    LOBYTE(v43) = 0;
    NSObject *v48 = 0;
    goto LABEL_55;
  }
  uint64_t v14 = *(void *)(v0 + 152);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of AnnotatedCacheEntry(v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_5:
  uint64_t v15 = Logger.logObject.getter();
  uint64_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_254432000, v15, v16, "VectorDatabaseAccess leaving insert...", v17, 2u);
    MEMORY[0x25A27A310](v17, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
LABEL_8:
  return v18();
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  outlined destroy of AnnotatedCacheEntry(*(void *)(v0 + 152));
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_254432000, v1, v2, "VectorDatabaseAccess leaving insert...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue));
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VectorDatabaseAttribute, DatabaseValue>);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  int v10 = &v6[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (VectorDatabaseAttribute, DatabaseValue)(v13, (uint64_t)v6);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for VectorDatabaseAttribute();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v6, v19);
    uint64_t v20 = v8[7];
    uint64_t v21 = type metadata accessor for DatabaseValue();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v17, v10, v21);
    uint64_t v22 = v8[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
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

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](VectorDatabaseAccess.searchKeyEmbeddings(_:), v1, 0);
}

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v1[2];
  v0[4] = v2;
  if (v2)
  {
    uint64_t v3 = (void *)v0[3];
    uint64_t v4 = MEMORY[0x263F8EE78];
    v0[5] = 0;
    v0[6] = v4;
    uint64_t v5 = v3 + 14;
    uint64_t v6 = v1[5];
    v0[7] = v6;
    uint64_t v7 = v1[4];
    uint64_t v8 = v3[17];
    uint64_t v9 = v3[18];
    swift_bridgeObjectRetain();
    __swift_project_boxed_opaque_existential_1(v5, v8);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 24) + **(int **)(v9 + 24));
    swift_bridgeObjectRetain();
    int v10 = (void *)swift_task_alloc();
    v0[8] = v10;
    *int v10 = v0;
    v10[1] = VectorDatabaseAccess.searchKeyEmbeddings(_:);
    return v14(v7, v6, v8, v9);
  }
  else
  {
    unint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v13 = MEMORY[0x263F8EE78];
    return v12(v13);
  }
}

{
  void *v0;
  char isUniquelyReferenced_nonNull_native;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t (*v10)(void *);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;

  outlined copy of Data._Representation(v0[9], v0[10]);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = (void *)v0[6];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (void *)v0[6]);
  }
  uint64_t v4 = v2[2];
  uint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5] + 1;
  v2[2] = v4 + 1;
  uint64_t v9 = &v2[2 * v4];
  v9[4] = v5;
  v9[5] = v6;
  outlined consume of Data._Representation(v5, v6);
  if (v8 == v7)
  {
    swift_bridgeObjectRelease();
    int v10 = (uint64_t (*)(void *))v0[1];
    return v10(v2);
  }
  else
  {
    unint64_t v12 = v0[5] + 1;
    v0[5] = v12;
    v0[6] = v2;
    uint64_t v13 = (void *)v0[3];
    uint64_t v14 = v0[2] + 16 * v12;
    uint64_t v15 = *(void *)(v14 + 40);
    v0[7] = v15;
    char v16 = *(void *)(v14 + 32);
    unint64_t v17 = v13[17];
    uint64_t v18 = v13[18];
    __swift_project_boxed_opaque_existential_1(v13 + 14, v17);
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 + 24) + **(int **)(v18 + 24));
    swift_bridgeObjectRetain();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[8] = v19;
    *uint64_t v19 = v0;
    v19[1] = VectorDatabaseAccess.searchKeyEmbeddings(_:);
    return v20(v16, v15, v17, v18);
  }
}

uint64_t VectorDatabaseAccess.searchKeyEmbeddings(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[9] = a1;
  v4[10] = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    uint64_t v7 = v4[3];
    swift_bridgeObjectRelease();
    return MEMORY[0x270FA2498](VectorDatabaseAccess.searchKeyEmbeddings(_:), v7, 0);
  }
}

uint64_t VectorDatabaseAccess.insert(assets:)()
{
  uint64_t v1 = type metadata accessor for VectorDatabaseError();
  uint64_t v47 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = (unint64_t *)((char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v49 = type metadata accessor for OSSignpostID();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49, v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  uint64_t v48 = dispatch thunk of VectorDatabaseClient.insert(assets:)();
  if (v0)
  {
    id v52 = v0;
    id v10 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      uint64_t v11 = v47;
      uint64_t v12 = (*(uint64_t (**)(unint64_t *, uint64_t))(v47 + 88))(v4, v1);
      uint64_t v13 = v12;
      if (v12 == *MEMORY[0x263F84688])
      {

        (*(void (**)(unint64_t *, uint64_t))(v11 + 96))(v4, v1);
        unint64_t v14 = *v4;
        unint64_t v15 = v4[1];
        unint64_t v46 = v14;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v16 = type metadata accessor for Logger();
        __swift_project_value_buffer(v16, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        unint64_t v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v51 = v44;
          LODWORD(v45) = v13;
          *(_DWORD *)uint64_t v19 = 136315138;
          uint64_t v43 = v19 + 4;
          swift_bridgeObjectRetain();
          unint64_t v20 = v15;
          unint64_t v21 = v46;
          uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v20, &v51);
          uint64_t v13 = v45;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_254432000, v17, v18, "Failed to insert assets due to insertion failure, error detail: %s", v19, 0xCu);
          uint64_t v22 = v44;
          swift_arrayDestroy();
          MEMORY[0x25A27A310](v22, -1, -1);
          BOOL v23 = v19;
          uint64_t v11 = v47;
          MEMORY[0x25A27A310](v23, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          unint64_t v20 = v15;
          unint64_t v21 = v46;
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        uint64_t v38 = (uint64_t *)v37;
        *uint64_t v37 = v21;
        v37[1] = v20;
LABEL_21:
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 104))(v38, v13, v1);
        swift_willThrow();
        goto LABEL_22;
      }
      if (v12 == *MEMORY[0x263F84678])
      {

        (*(void (**)(unint64_t *, uint64_t))(v11 + 96))(v4, v1);
        uint64_t v25 = *v4;
        unint64_t v26 = v4[1];
        uint64_t v45 = v25;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v27 = type metadata accessor for Logger();
        __swift_project_value_buffer(v27, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        uint64_t v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v28, v29))
        {
          uint64_t v30 = swift_slowAlloc();
          unint64_t v46 = v26;
          unsigned int v31 = (uint8_t *)v30;
          uint64_t v44 = swift_slowAlloc();
          uint64_t v51 = v44;
          uint64_t v43 = v31;
          *(_DWORD *)unsigned int v31 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v32 = v45;
          uint64_t v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v51);
          uint64_t v11 = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          os_log_type_t v33 = v29;
          uint64_t v34 = v32;
          uint64_t v35 = v43;
          _os_log_impl(&dword_254432000, v28, v33, "Failed to insert assets due to client failure, error detail: %s", v43, 0xCu);
          uint64_t v36 = v44;
          swift_arrayDestroy();
          MEMORY[0x25A27A310](v36, -1, -1);
          unint64_t v26 = v46;
          MEMORY[0x25A27A310](v35, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v34 = v45;
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        uint64_t v38 = v39;
        *os_log_type_t v39 = v34;
        v39[1] = v26;
        goto LABEL_21;
      }
      (*(void (**)(unint64_t *, uint64_t))(v11 + 8))(v4, v1);
    }
LABEL_22:

    id v40 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    goto LABEL_23;
  }
  id v24 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

LABEL_23:
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v49);
  return v48;
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 128) = a3;
  *(void *)(v4 + 136) = v3;
  *(void *)(v4 + 120) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  *(void *)(v4 + 144) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AnnotatedCacheEntry(0);
  *(void *)(v4 + 152) = v6;
  *(void *)(v4 + 160) = *(void *)(v6 - 8);
  *(void *)(v4 + 168) = swift_task_alloc();
  *(void *)(v4 + 176) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for VectorDatabaseResult();
  *(void *)(v4 + 184) = v7;
  *(void *)(v4 + 192) = *(void *)(v7 - 8);
  *(void *)(v4 + 200) = swift_task_alloc();
  *(void *)(v4 + 208) = swift_task_alloc();
  *(unsigned char *)(v4 + 256) = *a1;
  return MEMORY[0x270FA2498](VectorDatabaseAccess.list(namespace:searchKey:), v3, 0);
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[27] = __swift_project_value_buffer(v1, (uint64_t)static Logger.logger);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_254432000, v2, v3, "VectorDatabaseAccess entering list...", v4, 2u);
    MEMORY[0x25A27A310](v4, -1, -1);
  }
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  v0[28] = inited;
  *(_OWORD *)(inited + 16) = xmmword_254463350;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v5;
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[29] = v8;
  *uint64_t v8 = v0;
  v8[1] = VectorDatabaseAccess.list(namespace:searchKey:);
  uint64_t v9 = v0[17];
  v8[2] = inited;
  v8[3] = v9;
  return MEMORY[0x270FA2498](VectorDatabaseAccess.searchKeyEmbeddings(_:), v9, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void, unint64_t, void);
  void (*v17)(void, unint64_t, void);
  unint64_t v18;
  void (**v19)(uint64_t, uint64_t);
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t (*v55)(void);
  void *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t (*v74)(uint64_t);
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(void, unint64_t, void);
  unint64_t v84;
  uint64_t v85[2];
  uint64_t v86;
  uint64_t v87;

  uint64_t v86 = v0;
  uint64_t v1 = *(void **)(v0 + 240);
  if (!v1[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    uint64_t v7 = static os_log_type_t.error.getter();
    uint64_t v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void *)(v0 + 128);
    if (v8)
    {
      uint64_t v11 = v0 + 120;
      id v10 = *(void *)(v0 + 120);
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v85[0] = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v11 - 8) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v9, v85);
      uint64_t v0 = v81;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v6, v7, "Failed to compute embedding for search key %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v13, -1, -1);
      MEMORY[0x25A27A310](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    *uint64_t v51 = 1;
    swift_willThrow();
    goto LABEL_28;
  }
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v4 = v1[4];
  os_log_type_t v3 = v1[5];
  outlined copy of Data._Representation(v4, v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = VectorDatabaseAccess.search(byVector:)();
  if (v2)
  {
    outlined consume of Data._Representation(v4, v3);
LABEL_28:
    id v52 = Logger.logObject.getter();
    unint64_t v53 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v52, v53))
    {
      unsigned int v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v54 = 0;
      _os_log_impl(&dword_254432000, v52, v53, "VectorDatabaseAccess leaving list...", v54, 2u);
      MEMORY[0x25A27A310](v54, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v55 = *(uint64_t (**)(void))(v0 + 8);
    return v55();
  }
  id v79 = (unint64_t *)(v0 + 88);
  *(void *)(v0 + 88) = MEMORY[0x263F8EE78];
  unint64_t v14 = *(void *)(v5 + 16);
  if (v14)
  {
    os_log_type_t v75 = v4;
    uint64_t v77 = v3;
    unint64_t v15 = *(void *)(v0 + 192);
    unint64_t v17 = *(void (**)(void, unint64_t, void))(v15 + 16);
    v15 += 16;
    uint64_t v16 = v17;
    os_log_type_t v18 = v5 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
    uint64_t v78 = *(void *)(v0 + 160);
    uint64_t v19 = (void (**)(uint64_t, uint64_t))(v15 - 8);
    uint64_t v82 = *(void *)(v15 + 56);
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    BOOL v83 = v17;
    do
    {
      unint64_t v84 = v18;
      v16(*(void *)(v0 + 208), v18, *(void *)(v0 + 184));
      unint64_t v21 = VectorDatabaseResult.payload.getter();
      if (v22 >> 60 == 15)
      {
        v16(*(void *)(v0 + 200), *(void *)(v0 + 208), *(void *)(v0 + 184));
        uint64_t v25 = Logger.logObject.getter();
        unint64_t v26 = static os_log_type_t.error.getter();
        uint64_t v27 = os_log_type_enabled(v25, v26);
        uint64_t v28 = *(void *)(v0 + 200);
        os_log_type_t v29 = *(void *)(v0 + 184);
        if (v27)
        {
          uint64_t v30 = swift_slowAlloc();
          *(_DWORD *)uint64_t v30 = 134217984;
          unsigned int v31 = v14;
          uint64_t v32 = v20;
          os_log_type_t v33 = VectorDatabaseResult.assetIdentifier.getter();
          uint64_t v34 = *v19;
          (*v19)(v28, v29);
          *(void *)(v30 + 4) = v33;
          unint64_t v20 = v32;
          unint64_t v14 = v31;
          uint64_t v0 = v81;
          _os_log_impl(&dword_254432000, v25, v26, "Asset with id %lld either does not have payload or payload fails to be decoded", (uint8_t *)v30, 0xCu);
          MEMORY[0x25A27A310](v30, -1, -1);
        }
        else
        {
          uint64_t v34 = *v19;
          (*v19)(*(void *)(v0 + 200), *(void *)(v0 + 184));
        }
        uint64_t v35 = v84;

        uint64_t v36 = VectorDatabaseResult.assetIdentifier.getter();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20[2] + 1, 1, v20);
        }
        uint64_t v38 = v20[2];
        uint64_t v37 = v20[3];
        if (v38 >= v37 >> 1) {
          unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v37 > 1), v38 + 1, 1, v20);
        }
        void v20[2] = v38 + 1;
        v20[v38 + 4] = v36;
        v34(*(void *)(v0 + 208), *(void *)(v0 + 184));
      }
      else
      {
        BOOL v23 = v21;
        id v24 = v22;
        if (one-time initialization token for jsonDecoder != -1) {
          swift_once();
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, (void (*)(uint64_t))type metadata accessor for AnnotatedCacheEntry);
        dispatch thunk of JSONDecoder.decode<A>(_:from:)();
        os_log_type_t v39 = *(void *)(v0 + 176);
        uint64_t v80 = v20;
        id v40 = *(void *)(v0 + 144);
        (*(void (**)(uint64_t, void, uint64_t, void))(v78 + 56))(v40, 0, 1, *(void *)(v0 + 152));
        outlined init with take of AnnotatedCacheEntry(v40, v39);
        uint64_t v41 = AnnotatedCacheEntry.builder()();
        VectorDatabaseResult.value.getter();
        uint64_t v43 = (*(uint64_t (**)(uint64_t, void))(*(void *)v41 + 432))(v42, 0);
        uint64_t v44 = swift_release();
        (*(void (**)(uint64_t))(*(void *)v43 + 440))(v44);
        swift_release();
        uint64_t v45 = *v79;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v45 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v45 + 16) + 1, 1, v45);
        }
        uint64_t v48 = *(void *)(v45 + 16);
        uint64_t v47 = *(void *)(v45 + 24);
        if (v48 >= v47 >> 1) {
          uint64_t v45 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1, v45);
        }
        uint64_t v49 = *(void *)(v0 + 168);
        uint64_t v50 = *(void *)(v0 + 176);
        *(void *)(v45 + 16) = v48 + 1;
        outlined init with take of AnnotatedCacheEntry(v49, v45+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ *(void *)(v78 + 72) * v48);
        outlined consume of Data._Representation?(v23, v24);
        *(void *)(v0 + 88) = v45;
        outlined destroy of AnnotatedCacheEntry(v50);
        unint64_t v20 = v80;
        uint64_t v35 = v84;
        (*v19)(*(void *)(v0 + 208), *(void *)(v0 + 184));
      }
      uint64_t v16 = v83;
      os_log_type_t v18 = v35 + v82;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v57 = v20;
    uint64_t v4 = v75;
    os_log_type_t v3 = v77;
    if (!v57[2]) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(MEMORY[0x263F8EE78] + 16)) {
LABEL_36:
  }
    VectorDatabaseAccess.delete(identifiers:)();
LABEL_37:
  swift_bridgeObjectRelease();
  unsigned int v58 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  uint64_t v59 = Logger.logObject.getter();
  char v60 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v59, v60))
  {
    char v76 = v4;
    uint64_t v61 = *(unsigned __int8 *)(v0 + 256);
    uint64_t v62 = swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    v85[0] = v63;
    *(_DWORD *)uint64_t v62 = 134218242;
    *(void *)(v0 + 96) = *(void *)(v58 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2080;
    long long v64 = 0xE400000000000000;
    unsigned int v65 = 1819047270;
    if (v61 != 1)
    {
      unsigned int v65 = 0xD000000000000012;
      long long v64 = 0x8000000254463C70;
    }
    if (v61) {
      uint64_t v66 = v65;
    }
    else {
      uint64_t v66 = 1953718630;
    }
    if (v61) {
      uint64_t v67 = v64;
    }
    else {
      uint64_t v67 = 0xE400000000000000;
    }
    *(void *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v67, v85);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_254432000, v59, v60, "Found %ld entries that match the requested search key and namespace %s", (uint8_t *)v62, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v63, -1, -1);
    MEMORY[0x25A27A310](v62, -1, -1);
    uint64_t v68 = v76;
    id v69 = v3;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v68 = v4;
    id v69 = v3;
  }
  outlined consume of Data._Representation(v68, v69);

  swift_beginAccess();
  Swift::Int v70 = *(void *)(v81 + 88);
  char v71 = Logger.logObject.getter();
  char v72 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v71, v72))
  {
    uint64_t v73 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v73 = 0;
    _os_log_impl(&dword_254432000, v71, v72, "VectorDatabaseAccess leaving list...", v73, 2u);
    MEMORY[0x25A27A310](v73, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v74 = *(uint64_t (**)(uint64_t))(v81 + 8);
  return v74(v70);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_254432000, v1, v2, "VectorDatabaseAccess leaving list...", v3, 2u);
    MEMORY[0x25A27A310](v3, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t VectorDatabaseAccess.list(namespace:searchKey:)(uint64_t a1)
{
  os_log_type_t v3 = (void *)*v2;
  v3[30] = a1;
  v3[31] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[17];
    uint64_t v5 = VectorDatabaseAccess.list(namespace:searchKey:);
  }
  else
  {
    uint64_t v6 = v3[17];
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t v5 = VectorDatabaseAccess.list(namespace:searchKey:);
    uint64_t v4 = v6;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t VectorDatabaseAccess.search(byVector:)()
{
  uint64_t v1 = type metadata accessor for VectorDatabaseError();
  uint64_t v43 = *(void *)(v1 - 8);
  uint64_t v44 = v1;
  MEMORY[0x270FA5388](v1, v2);
  uint64_t v4 = (void *)((char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for OSSignpostID();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v9 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  uint64_t v10 = dispatch thunk of VectorDatabaseClient.search(byVector:attributeFilters:limit:includePayload:numberOfProbes:batchSize:numConcurrentReaders:)();
  if (v0)
  {
    id v49 = v0;
    id v11 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v12 = v44;
    if (!swift_dynamicCast())
    {

      uint64_t v16 = v8;
LABEL_23:
      id v36 = (id)static Logger.log;
      static os_signpost_type_t.end.getter();
      os_signpost(_:dso:log:name:signpostID:)();

      (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v46);
      return v10;
    }
    uint64_t v13 = v43;
    uint64_t v14 = (*(uint64_t (**)(unint64_t *, uint64_t))(v43 + 88))(v4, v12);
    uint64_t v15 = v14;
    uint64_t v16 = v8;
    if (v14 == *MEMORY[0x263F84670])
    {

      (*(void (**)(unint64_t *, uint64_t))(v13 + 96))(v4, v12);
      unint64_t v17 = *v4;
      unint64_t v18 = v4[1];
      unint64_t v42 = v17;
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)static Logger.logger);
      swift_bridgeObjectRetain_n();
      unint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v20, v21))
      {

        swift_bridgeObjectRelease_n();
        unint64_t v26 = v42;
        goto LABEL_21;
      }
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v41 = v10;
      uint64_t v24 = v23;
      uint64_t v48 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      id v40 = v22 + 4;
      swift_bridgeObjectRetain();
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v18, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v20, v21, "Failed to search assets due to search failure, error detail: %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v24;
      uint64_t v16 = v8;
      uint64_t v10 = v41;
      unint64_t v26 = v42;
      MEMORY[0x25A27A310](v25, -1, -1);
      uint64_t v27 = v22;
      uint64_t v13 = v43;
    }
    else
    {
      if (v14 != *MEMORY[0x263F84678])
      {
        (*(void (**)(unint64_t *, uint64_t))(v13 + 8))(v4, v12);
LABEL_22:

        goto LABEL_23;
      }

      (*(void (**)(unint64_t *, uint64_t))(v13 + 96))(v4, v12);
      uint64_t v29 = *v4;
      unint64_t v18 = v4[1];
      uint64_t v41 = v29;
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v30 = type metadata accessor for Logger();
      __swift_project_value_buffer(v30, (uint64_t)static Logger.logger);
      swift_bridgeObjectRetain_n();
      unint64_t v20 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v20, v31))
      {

        swift_bridgeObjectRelease_n();
        unint64_t v26 = v41;
        goto LABEL_21;
      }
      uint64_t v32 = swift_slowAlloc();
      unint64_t v42 = v18;
      os_log_type_t v33 = (uint8_t *)v32;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v48 = v39;
      LODWORD(v40) = v15;
      *(_DWORD *)os_log_type_t v33 = 136315138;
      uint64_t v16 = v8;
      v38[1] = v33 + 4;
      swift_bridgeObjectRetain();
      unint64_t v26 = v41;
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &v48);
      uint64_t v15 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_254432000, v20, v31, "Failed to search assets due to client failure, error detail: %s", v33, 0xCu);
      uint64_t v34 = v39;
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v34, -1, -1);
      uint64_t v27 = v33;
      unint64_t v18 = v42;
    }
    MEMORY[0x25A27A310](v27, -1, -1);

LABEL_21:
    lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
    swift_allocError();
    *uint64_t v35 = v26;
    v35[1] = v18;
    (*(void (**)(unint64_t *, uint64_t, uint64_t))(v13 + 104))(v35, v15, v12);
    swift_willThrow();
    goto LABEL_22;
  }
  id v28 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v45 + 8))(v8, v46);
  return v10;
}

uint8_t *VectorDatabaseAccess.listAll(namespace:nextToken:)(unsigned __int8 *a1, uint64_t a2, uint8_t *a3)
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnnotatedCacheEntry?);
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v88 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v84 = *(void *)(v93 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v93, v12);
  uint64_t v87 = (uint64_t)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v86 = (uint64_t)&v81 - v16;
  uint64_t v17 = type metadata accessor for Asset();
  uint64_t v96 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17, v18);
  uint64_t v89 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19, v21);
  uint64_t v90 = (char *)&v81 - v22;
  int v23 = *a1;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)static Logger.logger);
  unint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v97 = v17;
  if (v28)
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_254432000, v26, v27, "VectorDatabaseAccess entering listAll...", v29, 2u);
    uint64_t v30 = v29;
    uint64_t v17 = v97;
    MEMORY[0x25A27A310](v30, -1, -1);
  }

  uint64_t v31 = VectorDatabaseAccess.listAll(identifiers:pagination:)();
  if (v4)
  {
    os_log_type_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v34))
    {
      a3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)a3 = 0;
      _os_log_impl(&dword_254432000, v33, v34, "VectorDatabaseAccess leaving listAll...", a3, 2u);
      MEMORY[0x25A27A310](a3, -1, -1);
    }
  }
  else
  {
    uint64_t v83 = v6;
    int v82 = v23;
    uint64_t v102 = (uint8_t *)MEMORY[0x263F8EE78];
    uint64_t v35 = *(void *)(v31 + 16);
    if (v35)
    {
      uint64_t v94 = *(void (**)(char *, unint64_t, uint64_t))(v96 + 16);
      unint64_t v36 = (*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
      uint64_t v81 = v31;
      unint64_t v37 = v31 + v36;
      uint64_t v98 = (void (**)(char *, uint64_t))(v96 + 8);
      v96 += 16;
      uint64_t v38 = *(void *)(v96 + 56);
      uint64_t v91 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56);
      uint64_t v92 = v38;
      uint64_t v99 = (void *)MEMORY[0x263F8EE78];
      *(void *)&long long v32 = 134217984;
      long long v85 = v32;
      uint64_t v39 = (uint64_t)v88;
      id v40 = v90;
      do
      {
        uint64_t v95 = v35;
        v94(v40, v37, v17);
        uint64_t v42 = Asset.payload.getter();
        if (v43 >> 60 == 15)
        {
          (*v91)(v39, 1, 1, v93);
          outlined destroy of Date?(v39, &demangling cache variable for type metadata for AnnotatedCacheEntry?);
          uint64_t v47 = v89;
          uint64_t v48 = v40;
          uint64_t v49 = v97;
          v94(v89, (unint64_t)v48, v97);
          uint64_t v50 = Logger.logObject.getter();
          os_log_type_t v51 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = v25;
            uint64_t v53 = v5;
            uint64_t v54 = swift_slowAlloc();
            *(_DWORD *)uint64_t v54 = v85;
            uint64_t v55 = Asset.identifier.getter();
            uint64_t v56 = v47;
            uint64_t v57 = *v98;
            (*v98)(v56, v49);
            *(void *)(v54 + 4) = v55;
            _os_log_impl(&dword_254432000, v50, v51, "Asset with id %lld either does not have payload or payload fails to be decoded", (uint8_t *)v54, 0xCu);
            uint64_t v58 = v54;
            uint64_t v5 = v53;
            uint64_t v25 = v52;
            uint64_t v39 = (uint64_t)v88;
            MEMORY[0x25A27A310](v58, -1, -1);
          }
          else
          {
            uint64_t v59 = v47;
            uint64_t v57 = *v98;
            (*v98)(v59, v49);
          }

          id v40 = v90;
          uint64_t v60 = Asset.identifier.getter();
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v61 = v99;
          }
          else {
            uint64_t v61 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v99[2] + 1, 1, v99);
          }
          unint64_t v63 = v61[2];
          unint64_t v62 = v61[3];
          if (v63 >= v62 >> 1) {
            uint64_t v61 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v62 > 1), v63 + 1, 1, v61);
          }
          v61[2] = v63 + 1;
          uint64_t v99 = v61;
          v61[v63 + 4] = v60;
          uint64_t v41 = v95;
        }
        else
        {
          uint64_t v44 = v42;
          unint64_t v45 = v43;
          uint64_t v46 = v93;
          if (one-time initialization token for jsonDecoder != -1) {
            swift_once();
          }
          lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry, (void (*)(uint64_t))type metadata accessor for AnnotatedCacheEntry);
          dispatch thunk of JSONDecoder.decode<A>(_:from:)();
          outlined consume of Data._Representation?(v44, v45);
          (*v91)(v39, 0, 1, v46);
          uint64_t v64 = v86;
          outlined init with take of AnnotatedCacheEntry(v39, v86);
          outlined init with copy of AnnotatedCacheEntry(v64, v87);
          unint64_t v65 = (unint64_t)v102;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v65 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v65 + 16) + 1, 1, v65);
          }
          uint64_t v41 = v95;
          unint64_t v67 = *(void *)(v65 + 16);
          unint64_t v66 = *(void *)(v65 + 24);
          if (v67 >= v66 >> 1) {
            unint64_t v65 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v66 > 1, v67 + 1, 1, v65);
          }
          *(void *)(v65 + 16) = v67 + 1;
          outlined init with take of AnnotatedCacheEntry(v87, v65+ ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80))+ *(void *)(v84 + 72) * v67);
          uint64_t v102 = (uint8_t *)v65;
          outlined destroy of AnnotatedCacheEntry(v86);
          uint64_t v57 = *v98;
        }
        uint64_t v17 = v97;
        v57(v40, v97);
        v37 += v92;
        uint64_t v35 = v41 - 1;
      }
      while (v35);
      swift_bridgeObjectRelease();
      uint64_t v68 = v99;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v68 = (void *)MEMORY[0x263F8EE78];
    }
    if (v68[2]) {
      VectorDatabaseAccess.delete(identifiers:)();
    }
    swift_bridgeObjectRelease();
    id v69 = v102;
    swift_bridgeObjectRetain();
    Swift::Int v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      *(_DWORD *)uint64_t v72 = 134218242;
      uint64_t v100 = *((void *)v69 + 2);
      v101[0] = v73;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v72 + 12) = 2080;
      unint64_t v74 = 0xE400000000000000;
      unint64_t v75 = 1819047270;
      if (v82 != 1)
      {
        unint64_t v75 = 0xD000000000000012;
        unint64_t v74 = 0x8000000254463C70;
      }
      if (v82) {
        uint64_t v76 = v75;
      }
      else {
        uint64_t v76 = 1953718630;
      }
      if (v82) {
        unint64_t v77 = v74;
      }
      else {
        unint64_t v77 = 0xE400000000000000;
      }
      uint64_t v100 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v76, v77, v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_254432000, v70, v71, "Found %ld entries that match the requested namespace %s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v73, -1, -1);
      MEMORY[0x25A27A310](v72, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    a3 = v102;
    os_log_type_t v33 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v33, v78))
    {
      id v79 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v79 = 0;
      _os_log_impl(&dword_254432000, v33, v78, "VectorDatabaseAccess leaving listAll...", v79, 2u);
      MEMORY[0x25A27A310](v79, -1, -1);
    }
  }

  return a3;
}

uint64_t VectorDatabaseAccess.listAll(identifiers:pagination:)()
{
  uint64_t v0 = type metadata accessor for VectorDatabaseError();
  uint64_t v34 = *(void *)(v0 - 8);
  uint64_t v35 = v0;
  MEMORY[0x270FA5388](v0, v1);
  uint64_t v3 = (uint64_t *)&v32[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for OSSignpostID();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = &v32[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v8 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  uint64_t v9 = v36;
  uint64_t v10 = dispatch thunk of VectorDatabaseClient.getAssets(identifiers:attributeFilters:pagination:orderBy:includeVectors:)();
  if (v9)
  {
    uint64_t v11 = v7;
    id v41 = v9;
    id v12 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v13 = v35;
    if (swift_dynamicCast())
    {
      uint64_t v14 = v34;
      uint64_t v15 = (*(uint64_t (**)(uint64_t *, uint64_t))(v34 + 88))(v3, v13);
      if (v15 == *MEMORY[0x263F84678])
      {
        uint64_t v16 = v15;

        (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v3, v13);
        uint64_t v17 = *v3;
        unint64_t v18 = v3[1];
        unint64_t v36 = (void *)v17;
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v19 = type metadata accessor for Logger();
        __swift_project_value_buffer(v19, (uint64_t)static Logger.logger);
        swift_bridgeObjectRetain_n();
        uint64_t v20 = Logger.logObject.getter();
        os_log_type_t v21 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v20, v21))
        {
          uint64_t v22 = swift_slowAlloc();
          unsigned int v33 = v16;
          int v23 = (uint8_t *)v22;
          uint64_t v24 = swift_slowAlloc();
          uint64_t v40 = v24;
          *(_DWORD *)int v23 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v39 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v36, v18, &v40);
          uint64_t v14 = v34;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_254432000, v20, v21, "Failed to get all assets, error detail: %s", v23, 0xCu);
          swift_arrayDestroy();
          uint64_t v25 = v24;
          uint64_t v13 = v35;
          MEMORY[0x25A27A310](v25, -1, -1);
          unint64_t v26 = v23;
          uint64_t v16 = v33;
          MEMORY[0x25A27A310](v26, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v28 = (uint64_t)v36;
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        uint64_t *v29 = v28;
        v29[1] = v18;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 104))(v29, v16, v13);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v3, v13);
      }
    }

    id v30 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v11, v38);
  }
  else
  {
    id v27 = (id)static Logger.log;
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();

    (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v7, v38);
  }
  return v10;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.deleteAll(namespace:)(LLMCache::CacheNamespace a1)
{
  uint64_t v2 = type metadata accessor for VectorDatabaseError();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (void *)((char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.logger);
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_254432000, v8, v9, "VectorDatabaseAccess entering deleteAll...", v10, 2u);
    MEMORY[0x25A27A310](v10, -1, -1);
  }

  dispatch thunk of VectorDatabaseClient.deleteAll()();
  if (v1)
  {
    id v34 = v1;
    id v11 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if (swift_dynamicCast())
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
      if (v12 == *MEMORY[0x263F84678])
      {
        uint64_t v13 = v12;

        (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
        uint64_t v15 = *v6;
        unint64_t v14 = v6[1];
        swift_bridgeObjectRetain_n();
        uint64_t v16 = Logger.logObject.getter();
        os_log_type_t v17 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = swift_slowAlloc();
          uint64_t v31 = v15;
          uint64_t v19 = (uint8_t *)v18;
          uint64_t v30 = swift_slowAlloc();
          uint64_t v33 = v30;
          *(_DWORD *)uint64_t v19 = 136315138;
          v29[1] = v19 + 4;
          swift_bridgeObjectRetain();
          uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v14, &v33);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_254432000, v16, v17, "Failed to delete all assets, error detail: %s", v19, 0xCu);
          uint64_t v20 = v30;
          swift_arrayDestroy();
          MEMORY[0x25A27A310](v20, -1, -1);
          os_log_type_t v21 = v19;
          uint64_t v15 = v31;
          MEMORY[0x25A27A310](v21, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseError and conformance VectorDatabaseError, MEMORY[0x263F84690]);
        swift_allocError();
        *unint64_t v26 = v15;
        v26[1] = v14;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 104))(v26, v13, v2);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v6, v2);
      }
    }

    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_254432000, v22, v27, "VectorDatabaseAccess leaving deleteAll...", v28, 2u);
      uint64_t v25 = v28;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_254432000, v22, v23, "VectorDatabaseAccess leaving deleteAll...", v24, 2u);
      uint64_t v25 = v24;
LABEL_17:
      MEMORY[0x25A27A310](v25, -1, -1);
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VectorDatabaseAccess.warmup()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1) {
    swift_once();
  }
  id v7 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  dispatch thunk of VectorDatabaseClient.warmup(numConcurrentReaders:)();
  id v8 = v1 + 14;
  uint64_t v10 = v1[17];
  uint64_t v9 = v1[18];
  __swift_project_boxed_opaque_existential_1(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9);
  id v11 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t VectorDatabaseAccess.unownedExecutor.getter()
{
  return v0;
}

uint64_t protocol witness for CacheDatabase.delete(entries:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](protocol witness for CacheDatabase.delete(entries:) in conformance VectorDatabaseAccess, v3, 0);
}

uint64_t protocol witness for CacheDatabase.delete(entries:) in conformance VectorDatabaseAccess()
{
  VectorDatabaseAccess.delete(entries:)(v0[2]);
  rawValue = (uint64_t (*)(void))v0[1]._rawValue;
  return rawValue();
}

uint64_t protocol witness for CacheDatabase.describe(identifier:) in conformance VectorDatabaseAccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](protocol witness for CacheDatabase.describe(identifier:) in conformance VectorDatabaseAccess, v5, 0);
}

uint64_t protocol witness for CacheDatabase.describe(identifier:) in conformance VectorDatabaseAccess()
{
  VectorDatabaseAccess.describe(identifier:)(v0[3], v0[4], v0[2]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t protocol witness for CacheDatabase.insert(entries:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return VectorDatabaseAccess.insert(entries:)(a1);
}

uint64_t protocol witness for CacheDatabase.list(namespace:searchKey:) in conformance VectorDatabaseAccess(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *id v7 = v3;
  v7[1] = protocol witness for CacheDatabase.list(namespace:searchKey:) in conformance VectorDatabaseAccess;
  return VectorDatabaseAccess.list(namespace:searchKey:)(a1, a2, a3);
}

uint64_t protocol witness for CacheDatabase.listAll(namespace:nextToken:) in conformance VectorDatabaseAccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return MEMORY[0x270FA2498](protocol witness for CacheDatabase.listAll(namespace:nextToken:) in conformance VectorDatabaseAccess, v5, 0);
}

uint64_t protocol witness for CacheDatabase.listAll(namespace:nextToken:) in conformance VectorDatabaseAccess()
{
  uint64_t v1 = VectorDatabaseAccess.listAll(namespace:nextToken:)(*(unsigned __int8 **)(v0 + 16), *(void *)(v0 + 24), *(uint8_t **)(v0 + 32));
  uint64_t v2 = *(uint64_t (**)(uint8_t *))(v0 + 8);
  return v2(v1);
}

uint64_t protocol witness for CacheDatabase.deleteAll(namespace:) in conformance VectorDatabaseAccess(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](protocol witness for CacheDatabase.deleteAll(namespace:) in conformance VectorDatabaseAccess, v3, 0);
}

uint64_t protocol witness for CacheDatabase.deleteAll(namespace:) in conformance VectorDatabaseAccess(LLMCache::CacheNamespace a1)
{
  VectorDatabaseAccess.deleteAll(namespace:)(a1);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t protocol witness for CacheDatabase.warmup() in conformance VectorDatabaseAccess()
{
  uint64_t v2 = *v0;
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](protocol witness for CacheDatabase.warmup() in conformance VectorDatabaseAccess, v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  VectorDatabaseAccess.warmup()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A279A90](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *specialized _parseInteger<A, B>(ascii:radix:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = static String._copying(_:)();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *specialized closure #1 in FixedWidthInteger.init<A>(_:radix:)(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        _StringObject.sharedUTF8.getter();
LABEL_4:
        JUMPOUT(0x25A279A40);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25A279A40](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x25A279A40]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t specialized Collection.count.getter(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  type metadata accessor for VectorDatabaseAttribute();
  lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseAttribute and conformance VectorDatabaseAttribute, MEMORY[0x263F84700]);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v4 = type metadata accessor for VectorDatabaseAttribute();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v2;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  uint64_t v19 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v13 = v5 + 16;
    unint64_t v12 = v14;
    uint64_t v15 = *(void *)(v13 + 56);
    do
    {
      v12(v8, *(void *)(v21 + 48) + v15 * v10, v4);
      lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(&lazy protocol witness table cache variable for type VectorDatabaseAttribute and conformance VectorDatabaseAttribute, MEMORY[0x263F84700]);
      char v16 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v13 - 8))(v8, v4);
      if (v16) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }
    while (((*(void *)(v19 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t specialized static VectorDatabaseAccess.persistDimension(_:at:)(uint64_t a1)
{
  uint64_t v59 = a1;
  uint64_t v57 = type metadata accessor for String.Encoding();
  uint64_t v1 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57, v2);
  uint64_t v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL.DirectoryHint();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for URL();
  uint64_t v58 = *(void *)(v60 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v60, v10);
  uint64_t v55 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  char v16 = (char *)&v53 - v15;
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = (char *)&v53 - v18;
  strcpy((char *)v61, "dimension.txt");
  HIWORD(v61[1]) = -4864;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x263F06E50], v5);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  swift_bridgeObjectRelease();
  v61[0] = v59;
  v61[0] = dispatch thunk of CustomStringConvertible.description.getter();
  v61[1] = v20;
  static String.Encoding.utf8.getter();
  uint64_t v21 = (void *)v56;
  StringProtocol.write(to:atomically:encoding:)();
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v57);
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)static Logger.logger);
    uint64_t v23 = v58;
    unsigned __int8 v24 = v55;
    uint64_t v25 = v60;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v55, v19, v60);
    id v26 = v21;
    id v27 = v21;
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      v61[0] = v56;
      *(_DWORD *)uint64_t v31 = 134218498;
      uint64_t v62 = v59;
      LODWORD(v59) = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v57 = (uint64_t)v19;
      os_log_t v54 = v28;
      uint64_t v32 = URL.absoluteString.getter();
      uint64_t v62 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v34 = *(void (**)(char *, uint64_t))(v23 + 8);
      v34(v24, v60);
      *(_WORD *)(v31 + 22) = 2080;
      uint64_t v25 = v60;
      swift_getErrorValue();
      uint64_t v35 = Error.localizedDescription.getter();
      uint64_t v62 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, v61);
      uint64_t v19 = (char *)v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      os_log_t v37 = v54;
      _os_log_impl(&dword_254432000, v54, (os_log_type_t)v59, "Failed to persist dimension %ld at path %s, file cannot be created, error: %s", (uint8_t *)v31, 0x20u);
      uint64_t v38 = v56;
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v38, -1, -1);
      MEMORY[0x25A27A310](v31, -1, -1);
    }
    else
    {
      id v34 = *(void (**)(char *, uint64_t))(v23 + 8);
      v34(v24, v25);
    }
    swift_willThrow();
    return ((uint64_t (*)(char *, uint64_t))v34)(v19, v25);
  }
  else
  {
    uint64_t v56 = 0;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v57);
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)static Logger.logger);
    uint64_t v40 = v58;
    uint64_t v41 = v60;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v16, v19, v60);
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v57 = (uint64_t)v19;
      uint64_t v45 = v44;
      uint64_t v46 = swift_slowAlloc();
      v61[0] = v46;
      *(_DWORD *)uint64_t v45 = 134218242;
      uint64_t v62 = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v47 = URL.absoluteString.getter();
      uint64_t v62 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v49 = *(void (**)(char *, uint64_t))(v40 + 8);
      uint64_t v50 = v60;
      v49(v16, v60);
      _os_log_impl(&dword_254432000, v42, v43, "Persisted dimension %ld at path %s, new file created", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v46, -1, -1);
      MEMORY[0x25A27A310](v45, -1, -1);

      return ((uint64_t (*)(uint64_t, uint64_t))v49)(v57, v50);
    }
    else
    {

      uint64_t v52 = *(void (**)(char *, uint64_t))(v40 + 8);
      v52(v16, v41);
      return ((uint64_t (*)(char *, uint64_t))v52)(v19, v41);
    }
  }
}

uint64_t specialized static VectorDatabaseAccess.updatePerisistedDimension(_:at:)(uint64_t a1, uint64_t a2)
{
  v87[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for String.Encoding();
  MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v6 = type metadata accessor for URL.DirectoryHint();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v84 = *(void *)(v11 - 8);
  uint64_t v85 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v11, v12);
  uint64_t v81 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13, v15);
  int v82 = (char *)&v78 - v17;
  MEMORY[0x270FA5388](v16, v18);
  uint64_t v20 = (char *)&v78 - v19;
  strcpy((char *)v87, "dimension.txt");
  HIWORD(v87[1]) = -4864;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F06E50], v6);
  lazy protocol witness table accessor for type String and conformance String();
  URL.appending<A>(component:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_bridgeObjectRelease();
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_defaultManager);
  uint64_t countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  unsigned __int8 v24 = (void *)MEMORY[0x25A279A00](countAndFlagsBits);
  swift_bridgeObjectRelease();
  unsigned int v25 = objc_msgSend(v22, sel_fileExistsAtPath_, v24);

  if (!v25)
  {
    specialized static VectorDatabaseAccess.persistDimension(_:at:)(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v20, v85);
  }
  uint64_t v79 = a2;
  uint64_t v80 = a1;
  static String.Encoding.utf8.getter();
  os_log_t v26 = v83;
  uint64_t v27 = String.init(contentsOf:encoding:)();
  if (v26) {
    return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v20, v85);
  }
  os_log_type_t v29 = v27;
  unint64_t v30 = v28;
  v87[0] = v80;
  if (v27 == dispatch thunk of CustomStringConvertible.description.getter() && v30 == v31)
  {
    swift_bridgeObjectRelease();
    uint64_t v32 = v82;
LABEL_9:
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v35 = type metadata accessor for Logger();
    __swift_project_value_buffer(v35, (uint64_t)static Logger.logger);
    uint64_t v37 = v84;
    uint64_t v36 = v85;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v32, v20, v85);
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      os_log_t v83 = v41;
      *(_DWORD *)uint64_t v40 = 134218242;
      uint64_t v86 = v80;
      v87[0] = (uint64_t)v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v40 + 12) = 2080;
      int v82 = (char *)(v40 + 14);
      uint64_t v42 = URL.absoluteString.getter();
      uint64_t v86 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v37 + 8);
      uint64_t v45 = v85;
      v44(v32, v85);
      _os_log_impl(&dword_254432000, v38, v39, "Dimension %ld at path %s has not changed", (uint8_t *)v40, 0x16u);
      os_log_t v46 = v83;
      swift_arrayDestroy();
      MEMORY[0x25A27A310](v46, -1, -1);
      MEMORY[0x25A27A310](v40, -1, -1);

      return ((uint64_t (*)(char *, uint64_t))v44)(v20, v45);
    }
    else
    {

      uint64_t v47 = *(void (**)(char *, uint64_t))(v37 + 8);
      v47(v32, v36);
      return ((uint64_t (*)(char *, uint64_t))v47)(v20, v36);
    }
  }
  char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t v32 = v82;
  if (v34) {
    goto LABEL_9;
  }
  os_log_t v83 = v29;
  id v48 = objc_msgSend(v21, sel_defaultManager);
  uint64_t v49 = v79;
  URL._bridgeToObjectiveC()(v50);
  uint64_t v52 = v51;
  v87[0] = 0;
  unsigned int v53 = objc_msgSend(v48, sel_removeItemAtURL_error_, v51, v87);

  os_log_t v54 = (void *)v87[0];
  if (!v53) {
    goto LABEL_20;
  }
  id v55 = (id)v87[0];
  id v56 = objc_msgSend(v21, sel_defaultManager);
  URL._bridgeToObjectiveC()(v57);
  uint64_t v59 = v58;
  v87[0] = 0;
  unsigned int v60 = objc_msgSend(v56, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v58, 1, 0, v87);

  os_log_t v54 = (void *)v87[0];
  if (!v60)
  {
LABEL_20:
    id v77 = v54;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v20, v85);
  }
  uint64_t v61 = one-time initialization token for logger;
  id v62 = (id)v87[0];
  BOOL v63 = v61 == -1;
  uint64_t v65 = v84;
  uint64_t v64 = v85;
  if (!v63) {
    swift_once();
  }
  uint64_t v66 = type metadata accessor for Logger();
  __swift_project_value_buffer(v66, (uint64_t)static Logger.logger);
  unint64_t v67 = v81;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v81, v49, v64);
  swift_bridgeObjectRetain();
  uint64_t v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = swift_slowAlloc();
    int v82 = (char *)swift_slowAlloc();
    v87[0] = (uint64_t)v82;
    *(_DWORD *)uint64_t v70 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v86 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v83, v30, v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v70 + 12) = 2080;
    os_log_t v83 = v68;
    os_log_type_t v71 = v81;
    uint64_t v72 = URL.absoluteString.getter();
    uint64_t v86 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v73, v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v74 = *(void (**)(char *, uint64_t))(v84 + 8);
    v74(v71, v64);
    os_log_t v75 = v83;
    _os_log_impl(&dword_254432000, v83, v69, "Removed previous dimension %s and db file at path %s", (uint8_t *)v70, 0x16u);
    uint64_t v76 = v82;
    swift_arrayDestroy();
    MEMORY[0x25A27A310](v76, -1, -1);
    MEMORY[0x25A27A310](v70, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    unint64_t v74 = *(void (**)(char *, uint64_t))(v65 + 8);
    v74(v67, v64);
  }
  specialized static VectorDatabaseAccess.persistDimension(_:at:)(v80);
  return ((uint64_t (*)(char *, uint64_t))v74)(v20, v64);
}

uint64_t type metadata accessor for VectorDatabaseAccess()
{
  return self;
}

uint64_t method lookup function for VectorDatabaseAccess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VectorDatabaseAccess);
}

uint64_t dispatch thunk of VectorDatabaseAccess.__allocating_init(path:embeddingProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 104) + **(int **)(v2 + 104));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = dispatch thunk of CacheDatabase.listAll(namespace:nextToken:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of VectorDatabaseAccess.delete(entries:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.describe(identifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.insert(entries:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = dispatch thunk of CacheDatabase.delete(entries:);
  return v6(a1);
}

uint64_t dispatch thunk of VectorDatabaseAccess.list(namespace:searchKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 160)
                                                          + **(int **)(*(void *)v3 + 160));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = dispatch thunk of CacheDatabase.list(namespace:searchKey:);
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of VectorDatabaseAccess.listAll(namespace:nextToken:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.deleteAll(namespace:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of VectorDatabaseAccess.warmup()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t outlined init with copy of (VectorDatabaseAttribute, DatabaseValue)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VectorDatabaseAttribute, DatabaseValue));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type AnnotatedCacheEntry and conformance AnnotatedCacheEntry(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

BOOL static EmbeddingError.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void EmbeddingError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int EmbeddingError.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of EmbeddingProviding.dimension()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for EmbeddingProviding.dimension() in conformance UniversalEmbeddingProvider;
  return v7(a1, a2);
}

uint64_t dispatch thunk of EmbeddingProviding.warmup()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EmbeddingProviding.embedding(input:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = dispatch thunk of EmbeddingProviding.embedding(input:);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of EmbeddingProviding.embedding(input:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

unsigned char *storeEnumTagSinglePayload for EmbeddingError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25445B9ECLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmbeddingError()
{
  return &type metadata for EmbeddingError;
}

uint64_t NextToken.offset.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NextToken(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NextToken(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NextToken()
{
  return &type metadata for NextToken;
}

uint64_t AnnotatedCacheEntry.builder()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v83 = (uint64_t)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v6);
  int v82 = (char *)&v74 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v91 = (uint64_t)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v89 = (char *)&v74 - v13;
  uint64_t v88 = *(void (**)(uint64_t, uint64_t, uint64_t))v0;
  uint64_t v85 = *(void *)(v0 + 8);
  uint64_t v14 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v15 = *(int *)(v14 + 28);
  uint64_t v92 = v14;
  LODWORD(v86) = *(unsigned __int8 *)(v0 + v15);
  type metadata accessor for AnnotatedCacheEntryBuilder(0);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  uint64_t v87 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void (**)(void))(v19 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v20)(v17, 1, 1, v18);
  uint64_t v90 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime;
  v20();
  uint64_t v21 = v20;
  uint64_t v84 = v20;
  id v22 = (void *)(v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  *id v22 = 0;
  v22[1] = 0;
  uint64_t v23 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  *(void *)uint64_t v23 = 0;
  uint64_t v77 = v23;
  *(unsigned char *)(v23 + 8) = 1;
  uint64_t v24 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
  uint64_t v25 = type metadata accessor for UserID();
  uint64_t v74 = *(void *)(v25 - 8);
  os_log_t v26 = *(void (**)(char *, void, uint64_t, uint64_t))(v74 + 56);
  uint64_t v80 = v24;
  uint64_t v78 = v25;
  uint64_t v76 = v74 + 56;
  os_log_t v75 = v26;
  ((void (*)(uint64_t, uint64_t, uint64_t))v26)(v24, 1, 1);
  uint64_t v27 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  *(void *)uint64_t v27 = 0;
  uint64_t v79 = v27;
  *(unsigned char *)(v27 + 8) = 1;
  uint64_t v28 = v85;
  *(void *)(v16 + 16) = v88;
  *(void *)(v16 + 24) = v28;
  *(unsigned char *)(v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v86;
  uint64_t v81 = v16;
  uint64_t v29 = v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys;
  *(void *)(v16 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys) = MEMORY[0x263F8EE78];
  uint64_t v30 = v1 + *(int *)(v14 + 20);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  uint64_t v86 = v19 + 16;
  uint64_t v88 = v31;
  uint64_t v32 = (uint64_t)v89;
  v31((uint64_t)v89, v30, v18);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v21)(v32, 0, 1, v18);
  uint64_t v33 = v91;
  outlined init with take of Date?(v32, v91, &demangling cache variable for type metadata for Date?);
  uint64_t v34 = v87;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  outlined assign with take of Date?(v33, v34, &demangling cache variable for type metadata for Date?);
  swift_endAccess();
  uint64_t v35 = v92;
  v88(v32, v1 + *(int *)(v92 + 24), v18);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v84)(v32, 0, 1, v18);
  outlined init with take of Date?(v32, v33, &demangling cache variable for type metadata for Date?);
  uint64_t v36 = v90;
  swift_beginAccess();
  outlined assign with take of Date?(v33, v36, &demangling cache variable for type metadata for Date?);
  swift_endAccess();
  uint64_t v37 = v35;
  uint64_t v38 = (uint64_t *)(v1 + *(int *)(v35 + 32));
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  swift_beginAccess();
  *id v22 = v40;
  v22[1] = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = *(int *)(v37 + 36);
  uint64_t v91 = v1;
  uint64_t v42 = *(void *)(v1 + v41);
  uint64_t v43 = *(void *)(v42 + 16);
  if (!v43)
  {
LABEL_32:
    uint64_t v62 = v91;
    uint64_t v63 = v92;
    uint64_t v64 = *(void *)(v91 + *(int *)(v92 + 40));
    uint64_t v65 = v77;
    swift_beginAccess();
    *(void *)uint64_t v65 = v64;
    *(unsigned char *)(v65 + 8) = 0;
    uint64_t v66 = v82;
    uint64_t v67 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v82, v62 + *(int *)(v63 + 44), v78);
    v75(v66, 0, 1, v67);
    uint64_t v68 = (uint64_t)v66;
    uint64_t v69 = v83;
    outlined init with take of Date?(v68, v83, &demangling cache variable for type metadata for UserID?);
    uint64_t v70 = v80;
    swift_beginAccess();
    outlined assign with take of Date?(v69, v70, &demangling cache variable for type metadata for UserID?);
    swift_endAccess();
    uint64_t v71 = v62 + *(int *)(v63 + 48);
    uint64_t v72 = *(void *)v71;
    LOBYTE(v62) = *(unsigned char *)(v71 + 8);
    uint64_t v73 = v79;
    swift_beginAccess();
    *(void *)uint64_t v73 = v72;
    *(unsigned char *)(v73 + 8) = v62;
    return v81;
  }
  uint64_t v44 = v42 + 32;
  uint64_t v90 = *(void *)(v1 + v41);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t v45 = 0;
  while (1)
  {
    uint64_t v47 = (uint64_t *)(v44 + 16 * v45);
    uint64_t v48 = *v47;
    uint64_t v49 = v47[1];
    uint64_t v50 = *(void **)v29;
    uint64_t v51 = *(void *)(*(void *)v29 + 16);
    if (!v51) {
      goto LABEL_12;
    }
    BOOL v52 = v50[4] == v48 && v50[5] == v49;
    if (!v52 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v51 == 1) {
        goto LABEL_12;
      }
      if (v50[6] != v48 || v50[7] != v49)
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if ((result & 1) == 0) {
          break;
        }
      }
    }
LABEL_4:
    if (++v45 == v43)
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
  if (v51 == 2)
  {
LABEL_12:
    swift_beginAccess();
    unsigned int v53 = *(void **)v29;
    swift_bridgeObjectRetain_n();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unsigned int v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v53[2] + 1, 1, v53);
    }
    unint64_t v55 = v53[2];
    unint64_t v54 = v53[3];
    if (v55 >= v54 >> 1) {
      unsigned int v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v54 > 1), v55 + 1, 1, v53);
    }
    v53[2] = v55 + 1;
    os_log_t v46 = &v53[2 * v55];
    v46[4] = v48;
    v46[5] = v49;
    *(void *)uint64_t v29 = v53;
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v58 = v50 + 9;
  uint64_t v59 = 2;
  while (1)
  {
    uint64_t v60 = v59 + 1;
    if (__OFADD__(v59, 1)) {
      break;
    }
    if (*(v58 - 1) == v48 && *v58 == v49) {
      goto LABEL_4;
    }
    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      goto LABEL_4;
    }
    v58 += 2;
    ++v59;
    if (v60 == v51) {
      goto LABEL_12;
    }
  }
  __break(1u);
  return result;
}

LLMCache::CacheEntry __swiftcall AnnotatedCacheEntry.toCacheEntry(searchKey:)(Swift::String searchKey)
{
  object = searchKey._object;
  uint64_t countAndFlagsBits = searchKey._countAndFlagsBits;
  uint64_t v5 = v1;
  uint64_t v6 = type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v7 = (uint64_t *)(v2 + *(int *)(v6 + 32));
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  uint64_t v10 = *(void **)(v2 + *(int *)(v6 + 36));
  uint64_t v11 = v10[2];
  if (!v11) {
    goto LABEL_9;
  }
  BOOL v12 = v10[4] == countAndFlagsBits && v10[5] == (void)object;
  if (v12 || (uint64_t v13 = _stringCompareWithSmolCheck(_:_:expecting:)(), (v13 & 1) != 0))
  {
LABEL_7:
    char v16 = 1;
LABEL_10:
    *(void *)uint64_t v5 = v9;
    *(void *)(v5 + 8) = v8;
    *(unsigned char *)(v5 + 16) = v16;
    uint64_t v13 = swift_bridgeObjectRetain();
    goto _$s8LLMCache19AnnotatedCacheEntryV02tocD09searchKeyAA0cD0VSS_tF;
  }
  if (v11 == 1)
  {
LABEL_9:
    char v16 = 0;
    goto LABEL_10;
  }
  uint64_t v17 = v10 + 7;
  uint64_t v18 = 1;
  while (1)
  {
    uint64_t v19 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (*(v17 - 1) == countAndFlagsBits && *v17 == (void)object) {
      goto LABEL_7;
    }
    uint64_t v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (v13) {
      goto LABEL_7;
    }
    char v16 = 0;
    v17 += 2;
    ++v18;
    if (v19 == v11) {
      goto LABEL_10;
    }
  }
  __break(1u);
_$s8LLMCache19AnnotatedCacheEntryV02tocD09searchKeyAA0cD0VSS_tF:
  result.llmOutput._object = v14;
  result.llmOutput._uint64_t countAndFlagsBits = v13;
  result.isExactMatch = v15;
  return result;
}

uint64_t AnnotatedCacheEntryBuilder.__allocating_init(id:namespace:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = swift_allocObject();
  AnnotatedCacheEntryBuilder.init(id:namespace:)(a1, a2, a3);
  return v6;
}

id one-time initialization function for dateFormatter()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  static AnnotatedCacheEntry.dateFormatter = (uint64_t)result;
  return result;
}

uint64_t *AnnotatedCacheEntry.dateFormatter.unsafeMutableAddressor()
{
  if (one-time initialization token for dateFormatter != -1) {
    swift_once();
  }
  return &static AnnotatedCacheEntry.dateFormatter;
}

id static AnnotatedCacheEntry.dateFormatter.getter()
{
  if (one-time initialization token for dateFormatter != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AnnotatedCacheEntry.dateFormatter;
  return v0;
}

uint64_t AnnotatedCacheEntry.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntry.lastAccessedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 20);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.lastCreatedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 24);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.namespace.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for AnnotatedCacheEntry(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t AnnotatedCacheEntry.llmOutput.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntry.searchKeys.getter()
{
  type metadata accessor for AnnotatedCacheEntry(0);
  return swift_bridgeObjectRetain();
}

double AnnotatedCacheEntry.ttl.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 40));
}

uint64_t AnnotatedCacheEntry.userId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 44);
  uint64_t v4 = type metadata accessor for UserID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t AnnotatedCacheEntry.score.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AnnotatedCacheEntry(0) + 48));
}

Swift::String __swiftcall AnnotatedCacheEntry.getLastAccessedTimeString()()
{
  if (one-time initialization token for dateFormatter != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AnnotatedCacheEntry.dateFormatter;
  type metadata accessor for AnnotatedCacheEntry(0);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v2 = objc_msgSend(v0, sel_stringFromDate_, isa);

  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  uint64_t v6 = v3;
  uint64_t v7 = v5;
  result._object = v7;
  result._uint64_t countAndFlagsBits = v6;
  return result;
}

Swift::String __swiftcall AnnotatedCacheEntry.getLastCreatedTimeString()()
{
  if (one-time initialization token for dateFormatter != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static AnnotatedCacheEntry.dateFormatter;
  type metadata accessor for AnnotatedCacheEntry(0);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v2 = objc_msgSend(v0, sel_stringFromDate_, isa);

  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  uint64_t v6 = v3;
  uint64_t v7 = v5;
  result._object = v7;
  result._uint64_t countAndFlagsBits = v6;
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

unint64_t AnnotatedCacheEntry.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x616572437473616CLL;
      break;
    case 3:
      unint64_t result = 0x63617073656D616ELL;
      break;
    case 4:
      unint64_t result = 0x757074754F6D6C6CLL;
      break;
    case 5:
      unint64_t result = 0x654B686372616573;
      break;
    case 6:
      unint64_t result = 7107700;
      break;
    case 7:
      unint64_t result = 0x644972657375;
      break;
    case 8:
      unint64_t result = 0x65726F6373;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  return AnnotatedCacheEntry.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AnnotatedCacheEntry.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AnnotatedCacheEntry.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance AnnotatedCacheEntry.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance AnnotatedCacheEntry.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AnnotatedCacheEntry.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AnnotatedCacheEntry.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AnnotatedCacheEntry.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AnnotatedCacheEntry.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v13) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for AnnotatedCacheEntry(0);
    LOBYTE(v13) = 1;
    type metadata accessor for Date();
    lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = *(unsigned char *)(v3 + *(int *)(v10 + 28));
    char v14 = 3;
    lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v13 = *(void *)(v3 + *(int *)(v10 + 36));
    char v14 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v13) = 7;
    type metadata accessor for UserID();
    lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type UserID and conformance UserID, MEMORY[0x263F70DF8]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t AnnotatedCacheEntry.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = type metadata accessor for UserID();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v56 = v7;
  uint64_t v57 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  Swift::Bool v15 = (char *)&v45 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AnnotatedCacheEntry.CodingKeys>);
  uint64_t v51 = *(void *)(v16 - 8);
  uint64_t v52 = v16;
  MEMORY[0x270FA5388](v16, v17);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v53 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  MEMORY[0x270FA5388](v53, v20);
  id v22 = (uint64_t *)((char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = a1[3];
  unint64_t v54 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys();
  uint64_t v24 = v55;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v24) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  }
  uint64_t v47 = v6;
  uint64_t v25 = v51;
  LOBYTE(v58) = 0;
  os_log_t v26 = v19;
  *id v22 = KeyedDecodingContainer.decode(_:forKey:)();
  v22[1] = v27;
  LOBYTE(v58) = 1;
  uint64_t v28 = lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
  uint64_t v29 = v56;
  uint64_t v55 = v28;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v30 = (char *)v22 + v53[5];
  os_log_t v46 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
  v46(v30, v15, v29);
  LOBYTE(v58) = 2;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v31 = v53;
  v46((char *)v22 + v53[6], v12, v29);
  char v59 = 3;
  lazy protocol witness table accessor for type CacheNamespace and conformance CacheNamespace();
  uint64_t v32 = v52;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *((unsigned char *)v22 + v31[7]) = v58;
  LOBYTE(v58) = 4;
  uint64_t v33 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v34 = (uint64_t *)((char *)v22 + v31[8]);
  uint64_t *v34 = v33;
  v34[1] = v35;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  char v59 = 5;
  lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  LODWORD(v55) = 1;
  uint64_t v36 = v53;
  *(uint64_t *)((char *)v22 + v53[9]) = v58;
  LOBYTE(v58) = 6;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v37 = (uint64_t)v54;
  *(uint64_t *)((char *)v22 + v36[10]) = v38;
  LOBYTE(v58) = 7;
  lazy protocol witness table accessor for type Date and conformance Date(&lazy protocol witness table cache variable for type UserID and conformance UserID, MEMORY[0x263F70DF8]);
  uint64_t v39 = v47;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v49 + 32))((char *)v22 + v53[11], v39, v50);
  LOBYTE(v58) = 8;
  uint64_t v40 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v42 = v41;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v32);
  uint64_t v43 = (char *)v22 + v53[12];
  *(void *)uint64_t v43 = v40;
  v43[8] = v42 & 1;
  outlined init with copy of AnnotatedCacheEntry((uint64_t)v22, v48);
  __swift_destroy_boxed_opaque_existential_1Tm(v37);
  return outlined destroy of AnnotatedCacheEntry((uint64_t)v22);
}

uint64_t AnnotatedCacheEntry.init(id:lastAccessedTime:lastCreatedTime:namespace:llmOutput:searchKeys:ttl:userId:score:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, char a13)
{
  char v18 = *a5;
  *(void *)a9 = a1;
  *((void *)a9 + 1) = a2;
  uint64_t v19 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  uint64_t v20 = &a9[v19[5]];
  uint64_t v21 = type metadata accessor for Date();
  id v22 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32);
  v22(v20, a3, v21);
  v22(&a9[v19[6]], a4, v21);
  a9[v19[7]] = v18;
  uint64_t v23 = &a9[v19[8]];
  *(void *)uint64_t v23 = a6;
  *((void *)v23 + 1) = a7;
  *(void *)&a9[v19[9]] = a8;
  *(double *)&a9[v19[10]] = a10;
  uint64_t v24 = &a9[v19[11]];
  uint64_t v25 = type metadata accessor for UserID();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(v24, a11, v25);
  uint64_t v27 = &a9[v19[12]];
  *(void *)uint64_t v27 = a12;
  v27[8] = a13 & 1;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance AnnotatedCacheEntry@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AnnotatedCacheEntry.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AnnotatedCacheEntry(void *a1)
{
  return AnnotatedCacheEntry.encode(to:)(a1);
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.id : AnnotatedCacheEntryBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.id.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnnotatedCacheEntryBuilder.lastAccessedTime.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v13, a5);
  uint64_t v14 = *a2 + *a6;
  swift_beginAccess();
  outlined assign with take of Date?((uint64_t)v13, v14, a5);
  return swift_endAccess();
}

uint64_t AnnotatedCacheEntryBuilder.lastCreatedTime.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?, a1);
}

uint64_t AnnotatedCacheEntryBuilder.lastAccessedTime.getter@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return outlined init with copy of Date?(v6, a3, a2);
}

uint64_t AnnotatedCacheEntryBuilder.namespace.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.llmOutput : AnnotatedCacheEntryBuilder(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.llmOutput.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t key path setter for AnnotatedCacheEntryBuilder.searchKeys : AnnotatedCacheEntryBuilder(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AnnotatedCacheEntryBuilder.searchKeys.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AnnotatedCacheEntryBuilder.ttl.getter()
{
  return AnnotatedCacheEntryBuilder.ttl.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl);
}

uint64_t AnnotatedCacheEntryBuilder.userId.getter@<X0>(uint64_t a1@<X8>)
{
  return AnnotatedCacheEntryBuilder.lastAccessedTime.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?, a1);
}

uint64_t AnnotatedCacheEntryBuilder.score.getter()
{
  return AnnotatedCacheEntryBuilder.ttl.getter(&OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score);
}

uint64_t AnnotatedCacheEntryBuilder.ttl.getter(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return *(void *)v2;
}

uint64_t AnnotatedCacheEntryBuilder.init(id:namespace:)(uint64_t a1, uint64_t a2, char *a3)
{
  char v6 = *a3;
  uint64_t v7 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime;
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  v9(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, 1, 1, v8);
  uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  uint64_t v12 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId;
  uint64_t v13 = type metadata accessor for UserID();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  uint64_t v14 = v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = 1;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace) = v6;
  *(void *)(v3 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys) = MEMORY[0x263F8EE78];
  return v3;
}

uint64_t AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for Date?, MEMORY[0x263F07490], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime);
}

uint64_t AnnotatedCacheEntryBuilder.withLastCreatedTime(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for Date?, MEMORY[0x263F07490], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime);
}

uint64_t AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), void *a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v11 = MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11, v14);
  uint64_t v16 = (char *)&v21 - v15;
  uint64_t v17 = a3(0);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  outlined init with take of Date?((uint64_t)v16, (uint64_t)v13, a2);
  uint64_t v19 = v4 + *a4;
  swift_beginAccess();
  outlined assign with take of Date?((uint64_t)v13, v19, a2);
  swift_endAccess();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withLlmOutput(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_llmOutput);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.appendSearchKey(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(*(uint64_t (**)(void))(*(void *)v2 + 272))();
  char v6 = (void **)v5;
  uint64_t v7 = (void *)v5[2];
  if (v7)
  {
    BOOL v8 = v5[4] == a1 && v5[5] == a2;
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return swift_retain();
    }
    if (v7 != (void *)1)
    {
      uint64_t v9 = v6 + 7;
      uint64_t v10 = 1;
      while (1)
      {
        uint64_t v11 = (void *)(v10 + 1);
        if (__OFADD__(v10, 1)) {
          break;
        }
        BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
        if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_7;
        }
        v9 += 2;
        ++v10;
        if (v11 == v7) {
          goto LABEL_17;
        }
      }
      __break(1u);
      goto LABEL_23;
    }
  }
LABEL_17:
  swift_bridgeObjectRelease();
  char v6 = (void **)(v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_searchKeys);
  swift_beginAccess();
  uint64_t v7 = *v6;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *char v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_23:
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7[2] + 1, 1, v7);
    *char v6 = v7;
  }
  unint64_t v15 = v7[2];
  unint64_t v14 = v7[3];
  if (v15 >= v14 >> 1)
  {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1, v7);
    *char v6 = v7;
  }
  v7[2] = v15 + 1;
  uint64_t v16 = &v7[2 * v15];
  v16[4] = a1;
  void v16[5] = a2;
  swift_endAccess();
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withSearchKeys(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 400);
    uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      v3(v5, v6);
      swift_bridgeObjectRelease();
      swift_release();
      v4 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withTtl(_:)(double a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl;
  swift_beginAccess();
  *(double *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 8) = 0;
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.withUserId(_:)(uint64_t a1)
{
  return AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)(a1, &demangling cache variable for type metadata for UserID?, MEMORY[0x263F70DF8], &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId);
}

uint64_t type metadata accessor for AnnotatedCacheEntry(uint64_t a1)
{
  return type metadata accessor for AnnotatedCacheEntry(a1, (uint64_t *)&type metadata singleton initialization cache for AnnotatedCacheEntry);
}

uint64_t type metadata accessor for AnnotatedCacheEntryBuilder(uint64_t a1)
{
  return type metadata accessor for AnnotatedCacheEntry(a1, (uint64_t *)&type metadata singleton initialization cache for AnnotatedCacheEntryBuilder);
}

uint64_t type metadata accessor for AnnotatedCacheEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AnnotatedCacheEntryBuilder.withScore(_:)(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score;
  swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return swift_retain();
}

uint64_t AnnotatedCacheEntryBuilder.build()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v122 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UserID?);
  MEMORY[0x270FA5388](v2 - 8, v3);
  uint64_t v5 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UserID();
  uint64_t v126 = *(void *)(v6 - 8);
  uint64_t v127 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v6, v7);
  uint64_t v121 = (char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v125 = (char *)&v107 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v14 = MEMORY[0x270FA5388](v12 - 8, v13);
  uint64_t v16 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = (char *)&v107 - v18;
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v124 = (char *)&v107 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23, v25);
  uint64_t v123 = (char *)&v107 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26, v28);
  uint64_t v128 = (char *)&v107 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29, v31);
  uint64_t v34 = (char *)&v107 - v33;
  (*(void (**)(uint64_t))(*(void *)v1 + 176))(v32);
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v35(v19, 1, v20) == 1)
  {
    outlined destroy of Date?((uint64_t)v19, &demangling cache variable for type metadata for Date?);
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v36 = type metadata accessor for Logger();
    __swift_project_value_buffer(v36, (uint64_t)static Logger.logger);
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_254432000, v37, v38, "Required cache entry parameter lastAccessedTime is not specified", v39, 2u);
      MEMORY[0x25A27A310](v39, -1, -1);
    }

    lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
    swift_allocError();
    unsigned char *v40 = 1;
    return swift_willThrow();
  }
  uint64_t v119 = v21;
  uint64_t v120 = v34;
  char v42 = v19;
  uint64_t v43 = *(uint64_t (**)(char *, char *, uint64_t))(v21 + 32);
  uint64_t v44 = v43(v34, v42, v20);
  (*(void (**)(uint64_t))(*(void *)v1 + 200))(v44);
  if (v35(v16, 1, v20) != 1)
  {
    unsigned int v53 = v128;
    uint64_t v54 = v43(v128, v16, v20);
    uint64_t v55 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 248))(v54);
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v116 = v55;
      unint64_t v117 = (void (*)(char *, char *, uint64_t))v43;
      uint64_t v118 = v20;
      uint64_t v58 = (uint64_t (**)(void))(*(void *)v1 + 272);
      char v59 = *v58;
      uint64_t v60 = *(void *)((*v58)() + 16);
      uint64_t v61 = swift_bridgeObjectRelease();
      if (v60)
      {
        uint64_t v62 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 296))(v61);
        if (v63)
        {
          swift_bridgeObjectRelease();
          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v78 = type metadata accessor for Logger();
          __swift_project_value_buffer(v78, (uint64_t)static Logger.logger);
          uint64_t v67 = Logger.logObject.getter();
          os_log_type_t v68 = static os_log_type_t.error.getter();
          BOOL v79 = os_log_type_enabled(v67, v68);
          uint64_t v20 = v118;
          uint64_t v70 = v119;
          uint64_t v71 = v120;
          if (!v79) {
            goto LABEL_34;
          }
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v72 = 0;
          uint64_t v73 = "Required cache entry parameter ttl is not specified";
        }
        else
        {
          uint64_t v114 = v62;
          uint64_t v115 = v57;
          (*(void (**)(void))(*(void *)v1 + 320))();
          uint64_t v65 = v126;
          uint64_t v64 = v127;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v126 + 48))(v5, 1, v127) != 1)
          {
            uint64_t v112 = *(uint64_t (**)(char *, char *, uint64_t))(v65 + 32);
            uint64_t v113 = v65 + 32;
            uint64_t v83 = v112(v125, v5, v64);
            uint64_t v84 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 152))(v83);
            uint64_t v110 = v85;
            uint64_t v111 = v84;
            uint64_t v86 = v119;
            uint64_t v87 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
            uint64_t v88 = v118;
            v87(v123, v120, v118);
            uint64_t v89 = ((uint64_t (*)(char *, char *, uint64_t))v87)(v124, v53, v88);
            uint64_t v90 = (*(void *(**)(uint64_t *__return_ptr, uint64_t))(*(void *)v1 + 224))(&v130, v89);
            int v129 = v130;
            uint64_t v109 = ((uint64_t (*)(void *))v59)(v90);
            uint64_t v91 = v125;
            uint64_t v92 = v126;
            uint64_t v93 = v121;
            uint64_t v94 = v127;
            uint64_t v95 = (*(uint64_t (**)(char *, char *, uint64_t))(v126 + 16))(v121, v125, v127);
            uint64_t v108 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 344))(v95);
            char v97 = v96;
            uint64_t v98 = v94;
            (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v94);
            uint64_t v99 = *(void (**)(char *, uint64_t))(v86 + 8);
            v99(v128, v88);
            v99(v120, v88);
            uint64_t v100 = v122;
            uint64_t v101 = v110;
            *uint64_t v122 = v111;
            v100[1] = v101;
            uint64_t v102 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
            BOOL v103 = v117;
            v117((char *)v100 + v102[5], v123, v88);
            v103((char *)v100 + v102[6], v124, v88);
            *((unsigned char *)v100 + v102[7]) = v129;
            uint64_t v104 = (uint64_t *)((char *)v100 + v102[8]);
            uint64_t v105 = v115;
            *uint64_t v104 = v116;
            v104[1] = v105;
            *(uint64_t *)((char *)v100 + v102[9]) = v109;
            *(uint64_t *)((char *)v100 + v102[10]) = v114;
            uint64_t result = v112((char *)v100 + v102[11], v93, v98);
            uint64_t v106 = (char *)v100 + v102[12];
            *(void *)uint64_t v106 = v108;
            v106[8] = v97 & 1;
            return result;
          }
          swift_bridgeObjectRelease();
          outlined destroy of Date?((uint64_t)v5, &demangling cache variable for type metadata for UserID?);
          if (one-time initialization token for logger != -1) {
            swift_once();
          }
          uint64_t v66 = type metadata accessor for Logger();
          __swift_project_value_buffer(v66, (uint64_t)static Logger.logger);
          uint64_t v67 = Logger.logObject.getter();
          os_log_type_t v68 = static os_log_type_t.error.getter();
          BOOL v69 = os_log_type_enabled(v67, v68);
          uint64_t v20 = v118;
          uint64_t v70 = v119;
          uint64_t v71 = v120;
          if (!v69)
          {
LABEL_34:

            lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
            swift_allocError();
            *uint64_t v81 = 1;
            swift_willThrow();
            int v82 = *(void (**)(char *, uint64_t))(v70 + 8);
            v82(v53, v20);
            return ((uint64_t (*)(char *, uint64_t))v82)(v71, v20);
          }
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v72 = 0;
          uint64_t v73 = "Required cache entry parameter userId is not specified";
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (one-time initialization token for logger != -1) {
          swift_once();
        }
        uint64_t v76 = type metadata accessor for Logger();
        __swift_project_value_buffer(v76, (uint64_t)static Logger.logger);
        uint64_t v67 = Logger.logObject.getter();
        os_log_type_t v68 = static os_log_type_t.error.getter();
        BOOL v77 = os_log_type_enabled(v67, v68);
        uint64_t v20 = v118;
        uint64_t v70 = v119;
        uint64_t v71 = v120;
        if (!v77) {
          goto LABEL_34;
        }
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v72 = 0;
        uint64_t v73 = "Required cache entry parameter searchKeys should have at least one value";
      }
    }
    else
    {
      if (one-time initialization token for logger != -1) {
        swift_once();
      }
      uint64_t v74 = type metadata accessor for Logger();
      __swift_project_value_buffer(v74, (uint64_t)static Logger.logger);
      uint64_t v67 = Logger.logObject.getter();
      os_log_type_t v68 = static os_log_type_t.error.getter();
      BOOL v75 = os_log_type_enabled(v67, v68);
      uint64_t v70 = v119;
      uint64_t v71 = v120;
      if (!v75) {
        goto LABEL_34;
      }
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v72 = 0;
      uint64_t v73 = "Required cache entry parameter llmOutput is not specified";
    }
    _os_log_impl(&dword_254432000, v67, v68, v73, v72, 2u);
    uint64_t v80 = v72;
    unsigned int v53 = v128;
    MEMORY[0x25A27A310](v80, -1, -1);
    goto LABEL_34;
  }
  outlined destroy of Date?((uint64_t)v16, &demangling cache variable for type metadata for Date?);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v45 = type metadata accessor for Logger();
  __swift_project_value_buffer(v45, (uint64_t)static Logger.logger);
  os_log_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.error.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v49 = v119;
  uint64_t v50 = v120;
  if (v48)
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v51 = 0;
    _os_log_impl(&dword_254432000, v46, v47, "Required cache entry parameter lastCreatedTime is not specified", v51, 2u);
    MEMORY[0x25A27A310](v51, -1, -1);
  }

  lazy protocol witness table accessor for type LLMCacheManagerError and conformance LLMCacheManagerError();
  swift_allocError();
  *uint64_t v52 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v50, v20);
}

uint64_t AnnotatedCacheEntryBuilder.deinit()
{
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?);
  return v0;
}

uint64_t AnnotatedCacheEntryBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime, &demangling cache variable for type metadata for Date?);
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId, &demangling cache variable for type metadata for UserID?);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t specialized static AnnotatedCacheEntry.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v7 = (int *)type metadata accessor for AnnotatedCacheEntry(0);
  if ((static Date.== infix(_:_:)() & 1) == 0 || (static Date.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  uint64_t v8 = v7[7];
  int v9 = *((unsigned __int8 *)a1 + v8);
  int v10 = *((unsigned __int8 *)a2 + v8);
  if (v9)
  {
    if (v9 == 1)
    {
      unint64_t v11 = 0xE400000000000000;
      unint64_t v12 = 1819047270;
      if (v10) {
        goto LABEL_11;
      }
LABEL_17:
      unint64_t v13 = 0xE400000000000000;
      if (v12 != 1953718630) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    unint64_t v11 = 0x8000000254463C70;
    unint64_t v12 = 0xD000000000000012;
    if (!v10) {
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v11 = 0xE400000000000000;
    unint64_t v12 = 1953718630;
    if (!v10) {
      goto LABEL_17;
    }
  }
LABEL_11:
  if (v10 == 1)
  {
    unint64_t v13 = 0xE400000000000000;
    if (v12 != 1819047270) {
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v13 = 0x8000000254463C70;
    if (v12 != 0xD000000000000012) {
      goto LABEL_22;
    }
  }
LABEL_20:
  if (v11 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
LABEL_22:
  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if ((v14 & 1) == 0) {
    return result;
  }
LABEL_23:
  uint64_t v15 = v7[8];
  uint64_t v16 = *(void *)((char *)a1 + v15);
  uint64_t v17 = *(void *)((char *)a1 + v15 + 8);
  uint64_t v18 = (void *)((char *)a2 + v15);
  if (v16 == *v18 && v17 == v18[1]
    || (v19 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v19 & 1) != 0))
  {
    if ((specialized static Array<A>.== infix(_:_:)(*(void **)((char *)a1 + v7[9]), *(void **)((char *)a2 + v7[9])) & 1) == 0
      || *(double *)((char *)a1 + v7[10]) != *(double *)((char *)a2 + v7[10])
      || (static UserID.== infix(_:_:)() & 1) == 0)
    {
      return 0;
    }
    uint64_t v20 = v7[12];
    uint64_t v21 = (double *)((char *)a1 + v20);
    char v22 = *((unsigned char *)a1 + v20 + 8);
    uint64_t v23 = (double *)((char *)a2 + v20);
    char v24 = *((unsigned char *)a2 + v20 + 8);
    if (v22)
    {
      if ((v24 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (*v21 != *v23) {
        char v24 = 1;
      }
      if (v24) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys;
  if (!lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnnotatedCacheEntry.CodingKeys and conformance AnnotatedCacheEntry.CodingKeys);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Date and conformance Date(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25445F5B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25445F604(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 176))();
}

uint64_t sub_25445F648(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastAccessedTime);
}

uint64_t sub_25445F670(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 200))();
}

uint64_t sub_25445F6B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_lastCreatedTime);
}

void *sub_25445F6DC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 224))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_25445F738(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_namespace);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_25445F788@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25445F7D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 272))();
  *a2 = result;
  return result;
}

uint64_t sub_25445F830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 296))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25445F88C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_ttl);
}

uint64_t sub_25445F898(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 320))();
}

uint64_t sub_25445F8E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for AnnotatedCacheEntryBuilder.lastAccessedTime : AnnotatedCacheEntryBuilder(a1, a2, a3, a4, &demangling cache variable for type metadata for UserID?, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_userId);
}

uint64_t sub_25445F90C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 344))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_25445F968(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_12Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC8LLMCache26AnnotatedCacheEntryBuilder_score);
}

uint64_t keypath_set_12Tm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  char v6 = *((unsigned char *)a1 + 8);
  uint64_t v7 = *a2 + *a5;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v7 = v5;
  *(unsigned char *)(v7 + 8) = v6;
  return result;
}

char *initializeBufferWithCopyOfBuffer for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  char v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *(void *)a2;
    *(void *)char v4 = *(void *)a2;
    char v4 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a3[5];
    int v9 = &a1[v8];
    int v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for Date();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v12(&v4[a3[6]], &a2[a3[6]], v11);
    uint64_t v13 = a3[8];
    v4[a3[7]] = a2[a3[7]];
    char v14 = &v4[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)char v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    uint64_t v17 = a3[10];
    *(void *)&v4[a3[9]] = *(void *)&a2[a3[9]];
    *(void *)&v4[v17] = *(void *)&a2[v17];
    uint64_t v18 = a3[11];
    char v19 = &v4[v18];
    uint64_t v20 = &a2[v18];
    uint64_t v21 = type metadata accessor for UserID();
    char v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22(v19, v20, v21);
    uint64_t v23 = a3[12];
    char v24 = &v4[v23];
    uint64_t v25 = &a2[v23];
    *(void *)char v24 = *(void *)v25;
    v24[8] = v25[8];
  }
  return v4;
}

uint64_t destroy for AnnotatedCacheEntry(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for Date();
  char v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[6], v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[11];
  uint64_t v8 = type metadata accessor for UserID();
  int v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

char *initializeWithCopy for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  int v9 = &a2[v7];
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  uint64_t v13 = &a1[v12];
  char v14 = &a2[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  uint64_t v16 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  uint64_t v17 = a3[11];
  uint64_t v18 = &a1[v17];
  char v19 = &a2[v17];
  uint64_t v20 = type metadata accessor for UserID();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21(v18, v19, v20);
  uint64_t v22 = a3[12];
  uint64_t v23 = &a1[v22];
  char v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v24[8];
  return a1;
}

char *assignWithCopy for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  a1[a3[7]] = a2[a3[7]];
  uint64_t v11 = a3[8];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  uint64_t v14 = a3[11];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  uint64_t v18 = a3[12];
  char v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  char v21 = v20[8];
  *(void *)char v19 = *(void *)v20;
  v19[8] = v21;
  return a1;
}

char *initializeWithTake for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(&a1[a3[6]], &a2[a3[6]], v9);
  uint64_t v11 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v12 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[11];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[12];
  uint64_t v18 = &a1[v17];
  char v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  return a1;
}

char *assignWithTake for AnnotatedCacheEntry(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[6]], &a2[a3[6]], v10);
  uint64_t v12 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = (uint64_t *)&a2[v12];
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  uint64_t v18 = &a1[v17];
  char v19 = &a2[v17];
  uint64_t v20 = type metadata accessor for UserID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[12];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)uint64_t v22 = *(void *)v23;
  v22[8] = v23[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AnnotatedCacheEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25446023C);
}

uint64_t sub_25446023C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for UserID();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 44);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AnnotatedCacheEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25446037C);
}

uint64_t sub_25446037C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for UserID();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 44);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata completion function for AnnotatedCacheEntry()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for UserID();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t ObjC metadata update function for AnnotatedCacheEntryBuilder()
{
  return type metadata accessor for AnnotatedCacheEntryBuilder(0);
}

void type metadata completion function for AnnotatedCacheEntryBuilder()
{
  type metadata accessor for Date?(319, &lazy cache variable for type metadata for Date?, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Date?(319, &lazy cache variable for type metadata for UserID?, MEMORY[0x263F70DF8]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AnnotatedCacheEntryBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnnotatedCacheEntryBuilder);
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.id.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.lastAccessedTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.lastCreatedTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.namespace.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.llmOutput.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.searchKeys.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.ttl.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.userId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.score.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.__allocating_init(id:namespace:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLastAccessedTime(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLastCreatedTime(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withLlmOutput(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.appendSearchKey(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withSearchKeys(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withTtl(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withUserId(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.withScore(_:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 432))(a1, a2 & 1);
}

uint64_t dispatch thunk of AnnotatedCacheEntryBuilder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

void type metadata accessor for Date?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for AnnotatedCacheEntry.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnnotatedCacheEntry.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254460C10);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

void *type metadata accessor for AnnotatedCacheEntry.CodingKeys()
{
  return &unk_2703D1320;
}

uint64_t specialized AnnotatedCacheEntry.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000254464430 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616572437473616CLL && a2 == 0xEF656D6954646574 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x63617073656D616ELL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x757074754F6D6C6CLL && a2 == 0xE900000000000074 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x654B686372616573 && a2 == 0xEA00000000007379 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 7107700 && a2 == 0xE300000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x644972657375 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t InsertRequest.init(searchKey:llmOutput:loggingTraceId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  BOOL v7 = (char *)a6 + *(int *)(type metadata accessor for InsertRequest() + 24);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  return v9(v7, a5, v8);
}

uint64_t type metadata accessor for InsertRequest()
{
  uint64_t result = type metadata singleton initialization cache for InsertRequest;
  if (!type metadata singleton initialization cache for InsertRequest) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t InsertRequest.searchKey.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InsertRequest.llmOutput.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InsertRequest.loggingTraceId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InsertRequest() + 24);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t *initializeBufferWithCopyOfBuffer for InsertRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for InsertRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for InsertRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *assignWithCopy for InsertRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for InsertRequest(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *assignWithTake for InsertRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsertRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2544616B0);
}

uint64_t sub_2544616B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for InsertRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254461774);
}

uint64_t sub_254461774(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for InsertRequest()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *DBColumns.userIdColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.userIdColumnName;
}

uint64_t static DBColumns.userIdColumnName.getter()
{
  return 6580597;
}

void *DBColumns.namespaceColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.namespaceColumnName;
}

uint64_t static DBColumns.namespaceColumnName.getter()
{
  return 29550;
}

void *DBColumns.lastAccessedTimeColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.lastAccessedTimeColumnName;
}

uint64_t static DBColumns.lastAccessedTimeColumnName.getter()
{
  return 7627116;
}

void *DBColumns.ttlColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.ttlColumnName;
}

uint64_t static DBColumns.ttlColumnName.getter()
{
  return 7107700;
}

void *DBColumns.rawSearchKeyColumnName.unsafeMutableAddressor()
{
  return &static DBColumns.rawSearchKeyColumnName;
}

uint64_t static DBColumns.rawSearchKeyColumnName.getter()
{
  return 112;
}

ValueMetadata *type metadata accessor for DBColumns()
{
  return &type metadata for DBColumns;
}

uint64_t LLMCacheManagerFeatureFlags.isEnabled.getter()
{
  char v1 = *v0;
  swift_beginAccess();
  if (static LLMCacheManagerFeatureFlags.forceEnabled == 2)
  {
    uint64_t v5 = &type metadata for LLMCacheManagerFeatureFlags;
    unint64_t v6 = lazy protocol witness table accessor for type LLMCacheManagerFeatureFlags and conformance LLMCacheManagerFeatureFlags();
    v4[0] = v1;
    char v2 = isFeatureEnabled(_:)();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  }
  else
  {
    char v2 = static LLMCacheManagerFeatureFlags.forceEnabled & 1;
  }
  return v2 & 1;
}

char *LLMCacheManagerFeatureFlags.forceEnabled.unsafeMutableAddressor()
{
  return &static LLMCacheManagerFeatureFlags.forceEnabled;
}

uint64_t static LLMCacheManagerFeatureFlags.forceEnabled.getter()
{
  return static LLMCacheManagerFeatureFlags.forceEnabled;
}

uint64_t static LLMCacheManagerFeatureFlags.forceEnabled.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static LLMCacheManagerFeatureFlags.forceEnabled = a1;
  return result;
}

uint64_t (*static LLMCacheManagerFeatureFlags.forceEnabled.modify())()
{
  return static LLMCacheManagerFeatureFlags.forceEnabled.modify;
}

const char *LLMCacheManagerFeatureFlags.domain.getter()
{
  return "SiriCacheManager";
}

const char *LLMCacheManagerFeatureFlags.feature.getter()
{
  char v1 = "FullPlanner";
  if (*v0 != 1) {
    char v1 = "ResponseGeneration";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "FastPlanner";
  }
}

BOOL static LLMCacheManagerFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void LLMCacheManagerFeatureFlags.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int LLMCacheManagerFeatureFlags.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance LLMCacheManagerFeatureFlags()
{
  return "SiriCacheManager";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance LLMCacheManagerFeatureFlags()
{
  Swift::UInt v1 = "FullPlanner";
  if (*v0 != 1) {
    Swift::UInt v1 = "ResponseGeneration";
  }
  if (*v0) {
    return v1;
  }
  else {
    return "FastPlanner";
  }
}

unsigned char *storeEnumTagSinglePayload for LLMCacheManagerFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x254461D28);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LLMCacheManagerFeatureFlags()
{
  return &type metadata for LLMCacheManagerFeatureFlags;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = MEMORY[0x270EEFE68](percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.appending<A>(component:directoryHint:)()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x270EF0090]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x270EF0898]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t type metadata accessor for VectorDatabaseError()
{
  return MEMORY[0x270F83A10]();
}

uint64_t VectorDatabaseClient.init(config:)()
{
  return MEMORY[0x270F83A58]();
}

uint64_t dispatch thunk of VectorDatabaseClient.delete(identifiers:)()
{
  return MEMORY[0x270F83A68]();
}

uint64_t dispatch thunk of VectorDatabaseClient.insert(assets:)()
{
  return MEMORY[0x270F83A70]();
}

uint64_t dispatch thunk of VectorDatabaseClient.search(byVector:attributeFilters:limit:includePayload:numberOfProbes:batchSize:numConcurrentReaders:)()
{
  return MEMORY[0x270F83A80]();
}

uint64_t dispatch thunk of VectorDatabaseClient.warmup(numConcurrentReaders:)()
{
  return MEMORY[0x270F83AA8]();
}

uint64_t dispatch thunk of VectorDatabaseClient.cooldown()()
{
  return MEMORY[0x270F83AB8]();
}

uint64_t dispatch thunk of VectorDatabaseClient.deleteAll()()
{
  return MEMORY[0x270F83AC0]();
}

uint64_t dispatch thunk of VectorDatabaseClient.getAssets(identifiers:attributeFilters:pagination:orderBy:includeVectors:)()
{
  return MEMORY[0x270F83AC8]();
}

uint64_t type metadata accessor for VectorDatabaseClient()
{
  return MEMORY[0x270F83AD0]();
}

uint64_t VectorDatabaseConfig.init(baseDirectory:distanceMetric:filterableAttributes:dimension:averagePartitionSize:batchSize:batchFactor:tradeOffParameterBetweenClusteringAndBalance:enableFTS:dataType:maxIndexConstructionBatches:readOnly:pretokenizationEnabled:prefixIndices:perConnectionPeakMemory:clientVersion:)()
{
  return MEMORY[0x270F83AF8]();
}

uint64_t static VectorDatabaseConfig.getClientVersion(baseDirectory:)()
{
  return MEMORY[0x270F83B18]();
}

uint64_t type metadata accessor for VectorDatabaseConfig()
{
  return MEMORY[0x270F83B20]();
}

uint64_t type metadata accessor for VectorDatabaseMetric()
{
  return MEMORY[0x270F83B38]();
}

uint64_t VectorDatabaseResult.assetIdentifier.getter()
{
  return MEMORY[0x270F83B50]();
}

uint64_t VectorDatabaseResult.value.getter()
{
  return MEMORY[0x270F83B60]();
}

uint64_t VectorDatabaseResult.payload.getter()
{
  return MEMORY[0x270F83B68]();
}

uint64_t type metadata accessor for VectorDatabaseResult()
{
  return MEMORY[0x270F83B70]();
}

uint64_t type metadata accessor for VectorDatabaseDataType()
{
  return MEMORY[0x270F83B78]();
}

uint64_t VectorDatabaseAttribute.init(name:columnType:)()
{
  return MEMORY[0x270F83B88]();
}

uint64_t type metadata accessor for VectorDatabaseAttribute()
{
  return MEMORY[0x270F83B98]();
}

uint64_t type metadata accessor for ColumnType()
{
  return MEMORY[0x270F83BB0]();
}

uint64_t type metadata accessor for DatabaseValue()
{
  return MEMORY[0x270F83BB8]();
}

uint64_t Asset.init(identifier:vectors:attributes:payload:)()
{
  return MEMORY[0x270F83BC0]();
}

uint64_t Asset.identifier.getter()
{
  return MEMORY[0x270F83BD0]();
}

uint64_t Asset.payload.getter()
{
  return MEMORY[0x270F83BF8]();
}

uint64_t type metadata accessor for Asset()
{
  return MEMORY[0x270F83C08]();
}

uint64_t UserID.sharedUserId.getter()
{
  return MEMORY[0x270F69BC0]();
}

uint64_t static UserID.defaultUserId.getter()
{
  return MEMORY[0x270F69BC8]();
}

uint64_t static UserID.== infix(_:_:)()
{
  return MEMORY[0x270F69BD0]();
}

uint64_t type metadata accessor for UserID()
{
  return MEMORY[0x270F69BD8]();
}

uint64_t type metadata accessor for Library.Streams.LLMCache.CacheManagerTelemetry()
{
  return MEMORY[0x270F432D8]();
}

uint64_t static StreamResource.source()()
{
  return MEMORY[0x270F43438]();
}

uint64_t type metadata accessor for CacheManagerError.ErrorType()
{
  return MEMORY[0x270F43450]();
}

uint64_t CacheManagerError.errorType.setter()
{
  return MEMORY[0x270F43458]();
}

uint64_t CacheManagerError.init()()
{
  return MEMORY[0x270F43460]();
}

uint64_t type metadata accessor for CacheManagerError()
{
  return MEMORY[0x270F43468]();
}

uint64_t CacheManagerInsert.Ended.exists.setter()
{
  return MEMORY[0x270F43470]();
}

uint64_t CacheManagerInsert.Ended.init()()
{
  return MEMORY[0x270F43478]();
}

uint64_t CacheManagerInsert.Failed.reason.setter()
{
  return MEMORY[0x270F43480]();
}

uint64_t CacheManagerInsert.Failed.init()()
{
  return MEMORY[0x270F43488]();
}

uint64_t type metadata accessor for CacheManagerInsert.Failed()
{
  return MEMORY[0x270F43490]();
}

uint64_t CacheManagerInsert.Started.exists.setter()
{
  return MEMORY[0x270F43498]();
}

uint64_t CacheManagerInsert.Started.init()()
{
  return MEMORY[0x270F434A0]();
}

uint64_t type metadata accessor for CacheManagerInsert()
{
  return MEMORY[0x270F434A8]();
}

uint64_t type metadata accessor for CacheManagerSearch.CacheManagerSearchStrategy()
{
  return MEMORY[0x270F434B0]();
}

uint64_t CacheManagerSearch.Ended.resultCount.setter()
{
  return MEMORY[0x270F434B8]();
}

uint64_t CacheManagerSearch.Ended.searchStrategy.setter()
{
  return MEMORY[0x270F434C0]();
}

uint64_t CacheManagerSearch.Ended.lowestMatchScore.setter()
{
  return MEMORY[0x270F434C8]();
}

uint64_t CacheManagerSearch.Ended.highestMatchScore.setter()
{
  return MEMORY[0x270F434D0]();
}

uint64_t CacheManagerSearch.Ended.init()()
{
  return MEMORY[0x270F434D8]();
}

uint64_t type metadata accessor for CacheManagerSearch.Ended()
{
  return MEMORY[0x270F434E0]();
}

uint64_t CacheManagerSearch.Failed.reason.setter()
{
  return MEMORY[0x270F434E8]();
}

uint64_t CacheManagerSearch.Failed.init()()
{
  return MEMORY[0x270F434F0]();
}

uint64_t type metadata accessor for CacheManagerSearch.Failed()
{
  return MEMORY[0x270F434F8]();
}

uint64_t CacheManagerSearch.Started.exists.setter()
{
  return MEMORY[0x270F43500]();
}

uint64_t CacheManagerSearch.Started.init()()
{
  return MEMORY[0x270F43508]();
}

uint64_t type metadata accessor for CacheManagerSearch()
{
  return MEMORY[0x270F43510]();
}

uint64_t type metadata accessor for CacheManagerTarget()
{
  return MEMORY[0x270F43518]();
}

uint64_t static MonotonicTimestamp.nowForSuspendingClock()()
{
  return MEMORY[0x270F43530]();
}

uint64_t type metadata accessor for MonotonicTimestamp()
{
  return MEMORY[0x270F43558]();
}

uint64_t LLMCacheManagerTelemetry.eventMetadata.setter()
{
  return MEMORY[0x270F43588]();
}

uint64_t LLMCacheManagerTelemetry.writeTimestamp.getter()
{
  return MEMORY[0x270F43590]();
}

uint64_t LLMCacheManagerTelemetry.writeTimestamp.setter()
{
  return MEMORY[0x270F43598]();
}

uint64_t LLMCacheManagerTelemetry.monotonicTimestamp.setter()
{
  return MEMORY[0x270F435A0]();
}

uint64_t LLMCacheManagerTelemetry.target.setter()
{
  return MEMORY[0x270F435A8]();
}

uint64_t LLMCacheManagerTelemetry.init()()
{
  return MEMORY[0x270F435B0]();
}

uint64_t type metadata accessor for LLMCacheManagerTelemetry()
{
  return MEMORY[0x270F435B8]();
}

uint64_t type metadata accessor for CacheManagerRequestInvocation.CacheManagerNamespace()
{
  return MEMORY[0x270F435C0]();
}

uint64_t CacheManagerRequestInvocation.clientTraceId.setter()
{
  return MEMORY[0x270F435C8]();
}

uint64_t CacheManagerRequestInvocation.namespace.setter()
{
  return MEMORY[0x270F435D0]();
}

uint64_t CacheManagerRequestInvocation.init()()
{
  return MEMORY[0x270F435D8]();
}

uint64_t type metadata accessor for CacheManagerRequestInvocation()
{
  return MEMORY[0x270F435E0]();
}

uint64_t CacheManagerTelemetryEventMetadata.cacheManagerId.setter()
{
  return MEMORY[0x270F435E8]();
}

uint64_t CacheManagerTelemetryEventMetadata.rowId.setter()
{
  return MEMORY[0x270F435F0]();
}

uint64_t CacheManagerTelemetryEventMetadata.init()()
{
  return MEMORY[0x270F435F8]();
}

uint64_t type metadata accessor for CacheManagerTelemetryEventMetadata()
{
  return MEMORY[0x270F43600]();
}

uint64_t dispatch thunk of Source.sendEvent(_:date:)()
{
  return MEMORY[0x270F44200]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t type metadata accessor for Insecure.SHA1Digest()
{
  return MEMORY[0x270EEB0B8]();
}

uint64_t type metadata accessor for Insecure.SHA1()
{
  return MEMORY[0x270EEB0E0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.init(contentsOf:encoding:)()
{
  return MEMORY[0x270EF1870]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB00]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return MEMORY[0x270EF2568]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F280]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F438]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x270F9F920]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}