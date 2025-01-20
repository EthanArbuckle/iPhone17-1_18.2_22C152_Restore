uint64_t static SearchToolExtension.$main()()
{
  lazy protocol witness table accessor for type SearchToolExtension and conformance SearchToolExtension();
  return static AppExtension.main()();
}

unint64_t lazy protocol witness table accessor for type SearchToolExtension and conformance SearchToolExtension()
{
  unint64_t result = lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension;
  if (!lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension;
  if (!lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SearchToolExtension and conformance SearchToolExtension);
  }
  return result;
}

uint64_t protocol witness for AppExtension.configuration.getter in conformance SearchToolExtension(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SearchToolExtension and conformance SearchToolExtension();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t associated type witness table accessor for AppExtension.Configuration : AppExtensionConfiguration in SearchToolExtension()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SearchToolExtension()
{
  return &type metadata for SearchToolExtension;
}

uint64_t one-time initialization function for title()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  __swift_allocate_value_buffer(v0, static DoNotUseThisExtensionIntent.title);
  __swift_project_value_buffer(v0, (uint64_t)static DoNotUseThisExtensionIntent.title);
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t DoNotUseThisExtensionIntent.title.unsafeMutableAddressor()
{
  if (one-time initialization token for title != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();

  return __swift_project_value_buffer(v0, (uint64_t)static DoNotUseThisExtensionIntent.title);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static DoNotUseThisExtensionIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for title != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static DoNotUseThisExtensionIntent.title.setter(uint64_t a1)
{
  if (one-time initialization token for title != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static DoNotUseThisExtensionIntent.title);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static DoNotUseThisExtensionIntent.title.modify())()
{
  if (one-time initialization token for title != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for LocalizedStringResource();
  __swift_project_value_buffer(v0, (uint64_t)static DoNotUseThisExtensionIntent.title);
  swift_beginAccess();
  return static DoNotUseThisExtensionIntent.title.modify;
}

char *DoNotUseThisExtensionIntent.assistantOnly.unsafeMutableAddressor()
{
  return &static DoNotUseThisExtensionIntent.assistantOnly;
}

uint64_t static DoNotUseThisExtensionIntent.assistantOnly.getter()
{
  return static DoNotUseThisExtensionIntent.assistantOnly;
}

uint64_t static DoNotUseThisExtensionIntent.assistantOnly.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static DoNotUseThisExtensionIntent.assistantOnly = a1;
  return result;
}

uint64_t (*static DoNotUseThisExtensionIntent.assistantOnly.modify())()
{
  return static DoNotUseThisExtensionIntent.assistantOnly.modify;
}

uint64_t DoNotUseThisExtensionIntent.perform()(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return _swift_task_switch(DoNotUseThisExtensionIntent.perform(), 0, 0);
}

uint64_t DoNotUseThisExtensionIntent.perform()()
{
  v20 = v0;
  if (one-time initialization token for stextension != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logging.stextension);
  uint64_t v2 = (void *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_1(v3))
  {
    uint64_t v4 = (_WORD *)swift_slowAlloc();
    *uint64_t v4 = 0;
    OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v5, v6, "SearchToolExtension testing log");
    OUTLINED_FUNCTION_0((uint64_t)v4);
  }

  type metadata accessor for ToolDatabase();
  ToolDatabase.__allocating_init()();
  ToolDatabase.actions.getter();
  swift_bridgeObjectRetain_n();
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)v9 = 136315138;
    type metadata accessor for ToolDefinition();
    swift_bridgeObjectRetain();
    uint64_t v10 = Array.description.getter();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "SearchToolExtension actions: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0(v18);
    OUTLINED_FUNCTION_0((uint64_t)v9);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  type metadata accessor for ToolDefinition();
  uint64_t v13 = Array.description.getter();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  v0[2] = v13;
  v0[3] = v15;
  lazy protocol witness table accessor for type String and conformance String();
  static IntentResult.result<A>(value:)();
  swift_release();
  swift_bridgeObjectRelease();
  v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t protocol witness for static AppIntent.openAppWhenRun.getter in conformance DoNotUseThisExtensionIntent()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t protocol witness for static AppIntent.authenticationPolicy.getter in conformance DoNotUseThisExtensionIntent()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t protocol witness for static AppIntent.isDiscoverable.getter in conformance DoNotUseThisExtensionIntent()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t protocol witness for static AppIntent.parameterSummary.getter in conformance DoNotUseThisExtensionIntent()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t protocol witness for static AppIntent.description.getter in conformance DoNotUseThisExtensionIntent()
{
  return static AppIntent.description.getter();
}

uint64_t protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent;
  return DoNotUseThisExtensionIntent.perform()(a1);
}

uint64_t protocol witness for AppIntent.perform() in conformance DoNotUseThisExtensionIntent()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t protocol witness for static PersistentlyIdentifiable.persistentIdentifier.getter in conformance DoNotUseThisExtensionIntent(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
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

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
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
    ObjectType = &type metadata for _StringGuts;
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
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)_StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t lazy protocol witness table accessor for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent()
{
  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent;
  if (!lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DoNotUseThisExtensionIntent and conformance DoNotUseThisExtensionIntent);
  }
  return result;
}

uint64_t associated type witness table accessor for AppIntent.PerformResult : IntentResult in DoNotUseThisExtensionIntent()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t associated type witness table accessor for AppIntent.SummaryContent : ParameterSummary in DoNotUseThisExtensionIntent()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for DoNotUseThisExtensionIntent()
{
  return &type metadata for DoNotUseThisExtensionIntent;
}

unint64_t lazy protocol witness table accessor for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>()
{
  unint64_t result = lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>;
  if (!lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for IntentResultContainer<String, Never, Never, Never>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IntentResultContainer<String, Never, Never, Never> and conformance IntentResultContainer<A, B, C, D>);
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
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

uint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

BOOL OUTLINED_FUNCTION_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t Logging.stextension.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for stextension, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.stextension);
}

uint64_t one-time initialization function for interface(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.interface);
}

uint64_t Logging.interface.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for interface, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.interface);
}

uint64_t static Logging.interface.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for interface, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.interface, a1);
}

uint64_t one-time initialization function for search(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.search);
}

uint64_t Logging.search.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for search, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.search);
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for search, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.search, a1);
}

uint64_t one-time initialization function for searchComponents(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.searchComponents);
}

uint64_t Logging.searchComponents.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for searchComponents, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.searchComponents);
}

uint64_t static Logging.searchComponents.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for searchComponents, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.searchComponents, a1);
}

uint64_t one-time initialization function for utilities(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.utilities);
}

uint64_t Logging.utilities.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for utilities, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.utilities);
}

uint64_t static Logging.utilities.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for utilities, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.utilities, a1);
}

uint64_t one-time initialization function for stextension(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.stextension);
}

uint64_t static Logging.stextension.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for stextension, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.stextension, a1);
}

uint64_t one-time initialization function for memoryCreationQU(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.memoryCreationQU);
}

uint64_t Logging.memoryCreationQU.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for memoryCreationQU, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.memoryCreationQU);
}

uint64_t static Logging.memoryCreationQU.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for memoryCreationQU, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.memoryCreationQU, a1);
}

uint64_t one-time initialization function for llmQU(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.llmQU);
}

uint64_t Logging.llmQU.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for llmQU, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.llmQU);
}

uint64_t static Logging.llmQU.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for llmQU, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.llmQU, a1);
}

uint64_t one-time initialization function for visual(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.visual);
}

uint64_t Logging.visual.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for visual, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.visual);
}

uint64_t static Logging.visual.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for visual, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.visual, a1);
}

uint64_t one-time initialization function for hallucination(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.hallucination);
}

uint64_t Logging.hallucination.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for hallucination, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.hallucination);
}

uint64_t static Logging.hallucination.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for hallucination, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.hallucination, a1);
}

uint64_t one-time initialization function for answerSynthesis(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.answerSynthesis);
}

uint64_t Logging.answerSynthesis.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for answerSynthesis, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.answerSynthesis);
}

uint64_t static Logging.answerSynthesis.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for answerSynthesis, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.answerSynthesis, a1);
}

uint64_t one-time initialization function for uiPlugin(uint64_t a1)
{
  return one-time initialization function for interface(a1, static Logging.uiPlugin);
}

uint64_t one-time initialization function for interface(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t Logging.uiPlugin.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for uiPlugin, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.uiPlugin);
}

uint64_t static Logging.uiPlugin.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for uiPlugin, (uint64_t (*)(void))&type metadata accessor for Logger, (uint64_t)static Logging.uiPlugin, a1);
}

uint64_t one-time initialization function for searchSignposter(uint64_t a1)
{
  return one-time initialization function for searchSignposter(a1, static Logging.searchSignposter, &one-time initialization token for search, (uint64_t)static Logging.search);
}

uint64_t Logging.searchSignposter.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for searchSignposter, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static Logging.searchSignposter);
}

uint64_t static Logging.searchSignposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for searchSignposter, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static Logging.searchSignposter, a1);
}

uint64_t one-time initialization function for searchComponentSignposter(uint64_t a1)
{
  return one-time initialization function for searchSignposter(a1, static Logging.searchComponentSignposter, &one-time initialization token for searchComponents, (uint64_t)static Logging.searchComponents);
}

uint64_t one-time initialization function for searchSignposter(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v11, a2);
  __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v7, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return OSSignposter.init(logger:)();
}

uint64_t Logging.searchComponentSignposter.unsafeMutableAddressor()
{
  return Logging.stextension.unsafeMutableAddressor(&one-time initialization token for searchComponentSignposter, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static Logging.searchComponentSignposter);
}

uint64_t Logging.stextension.unsafeMutableAddressor(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return __swift_project_value_buffer(v5, a3);
}

uint64_t static Logging.searchComponentSignposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logging.interface.getter(&one-time initialization token for searchComponentSignposter, (uint64_t (*)(void))&type metadata accessor for OSSignposter, (uint64_t)static Logging.searchComponentSignposter, a1);
}

uint64_t static Logging.interface.getter@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t static IntentResult.result<A>(value:)()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t static AppExtension.main()()
{
  return static AppExtension.main()();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
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

uint64_t type metadata accessor for ToolDefinition()
{
  return type metadata accessor for ToolDefinition();
}

uint64_t ToolDatabase.actions.getter()
{
  return ToolDatabase.actions.getter();
}

uint64_t ToolDatabase.__allocating_init()()
{
  return ToolDatabase.__allocating_init()();
}

uint64_t type metadata accessor for ToolDatabase()
{
  return type metadata accessor for ToolDatabase();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}