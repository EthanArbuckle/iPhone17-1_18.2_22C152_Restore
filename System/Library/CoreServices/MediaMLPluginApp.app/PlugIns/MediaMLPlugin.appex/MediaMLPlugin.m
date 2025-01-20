uint64_t one-time initialization function for logger()
{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataValidation", 0xEuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static MediaMLPlugin.logger);
  __swift_project_value_buffer(v1, (uint64_t)static MediaMLPlugin.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaMLPluginApp.MediaMLPlugin", 0x28uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Plugin", 6uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static SQLiteDB.logger);
  __swift_project_value_buffer(v1, (uint64_t)static SQLiteDB.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sql", 3uLL, 1);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

Swift::Bool __swiftcall checkValidInterfaceType(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  char v11 = 0;
  kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v10)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v8;
      char v7 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      char v7 = 1;
    }
    uint64_t v4 = v6;
    char v5 = v7;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v9);
    uint64_t v4 = 0;
    char v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v4 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    return 0;
  }
  char v11 = 1;
  return 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String()
{
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

Swift::Bool __swiftcall checkValidThroughputTrue(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  char v10 = 0;
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v9)
  {
    if (swift_dynamicCast())
    {
      double v5 = v7;
      char v6 = 0;
    }
    else
    {
      double v5 = 0.0;
      char v6 = 1;
    }
    double v3 = v5;
    char v4 = v6;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    double v3 = 0.0;
    char v4 = 1;
  }
  if (v4) {
    return 0;
  }
  if (v3 <= 0.0) {
    return 0;
  }
  char v10 = 1;
  return 1;
}

Swift::Bool __swiftcall validateAppName(text:)(Swift::String text)
{
  v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  v12 = 0;
  Swift::String v20 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Za-z0-9./]{1,155}$", 0x16uLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v19);
  uint64_t v9 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v18 = v2;
    uint64_t v16 = 0;
    uint64_t v17 = String.count.getter();
    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v13 = 0;
    uint64_t v14 = v17;
    id v7 = objc_msgSend(v9, "matchesInString:options:range:", v6, v15, 0, v17);

    type metadata accessor for NSTextCheckingResult();
    v12 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v10[1] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v10[0] = v11;
    BOOL v5 = v11 != 0;
    outlined destroy of NSTextCheckingResult?(v10);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

unint64_t type metadata accessor for NSRegularExpression()
{
  uint64_t v2 = lazy cache variable for type metadata for NSRegularExpression;
  if (!lazy cache variable for type metadata for NSRegularExpression)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpression);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for NSRegularExpressionOptions()
{
  uint64_t v4 = lazy cache variable for type metadata for NSRegularExpressionOptions;
  if (!lazy cache variable for type metadata for NSRegularExpressionOptions)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpressionOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSRegularExpression.__allocating_init(pattern:options:)(NSRegularExpression *__return_ptr retstr, Swift::String pattern, NSRegularExpressionOptions options)
{
  uint64_t countAndFlagsBits = pattern._countAndFlagsBits;
  object = pattern._object;
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  @nonobjc NSRegularExpression.init(pattern:options:)(countAndFlagsBits, (uint64_t)object, options);
}

uint64_t type metadata accessor for NSMatchingOptions()
{
  uint64_t v4 = lazy cache variable for type metadata for NSMatchingOptions;
  if (!lazy cache variable for type metadata for NSMatchingOptions)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSMatchingOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

unint64_t type metadata accessor for NSTextCheckingResult()
{
  uint64_t v2 = lazy cache variable for type metadata for NSTextCheckingResult;
  if (!lazy cache variable for type metadata for NSTextCheckingResult)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSTextCheckingResult);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [NSTextCheckingResult]()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of NSTextCheckingResult?(id *a1)
{
}

Swift::Bool __swiftcall validateSessionID(text:)(Swift::String text)
{
  v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  v12 = 0;
  Swift::String v20 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}$", 0x3EuLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v19);
  uint64_t v9 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v18 = v2;
    uint64_t v16 = 0;
    uint64_t v17 = String.count.getter();
    swift_bridgeObjectRetain();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v13 = 0;
    uint64_t v14 = v17;
    id v7 = objc_msgSend(v9, "matchesInString:options:range:", v6, v15, 0, v17);

    type metadata accessor for NSTextCheckingResult();
    v12 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v10[1] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v10[0] = v11;
    BOOL v5 = v11 != 0;
    outlined destroy of NSTextCheckingResult?(v10);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

Swift::Bool __swiftcall validateSSID(text:)(Swift::String text)
{
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  object = text._object;
  v27 = partial apply for closure #1 in validateSSID(text:);
  uint64_t v33 = 0;
  uint64_t v28 = 0;
  Swift::String v35 = text;
  char v34 = 0;
  Swift::Int v29 = String.count.getter();
  BOOL v31 = *maxSSIDLength.unsafeMutableAddressor() >= v29;
  swift_bridgeObjectRetain();
  if (v31)
  {
    Swift::Int v24 = String.count.getter();
    BOOL v25 = v24 < *minSSIDLength.unsafeMutableAddressor();
  }
  else
  {
    BOOL v25 = 1;
  }
  BOOL v23 = v25;
  swift_bridgeObjectRelease();
  if (v25)
  {
    int v22 = 0;
  }
  else
  {
    uint64_t v15 = &type metadata for String;
    uint64_t v14 = _allocateUninitializedArray<A>(_:)();
    uint64_t v13 = v1;
    uint64_t v11 = 6;
    int v12 = 1;
    Swift::String *v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("select", 6uLL, 1);
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1);
    char v3 = v12;
    v13[1] = v2;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop table", 0xAuLL, v3 & 1);
    uint64_t v5 = v14;
    v13[2] = v4;
    _finalizeUninitializedArray<A>(_:)();
    uint64_t v16 = v5;
    uint64_t v33 = v5;
    uint64_t v32 = v5;
    swift_bridgeObjectRetain();
    uint64_t v17 = &v9;
    uint64_t v18 = 32;
    __chkstk_darwin();
    NSString v6 = (char *)&v9 - v18;
    NSRegularExpressionOptions v19 = v6;
    *((void *)v6 + 2) = countAndFlagsBits;
    *((void *)v6 + 3) = v7;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    int v21 = Sequence.contains(where:)();
    int v9 = v21;
    swift_bridgeObjectRelease();
    int v10 = v9 ^ 1;
    char v34 = (v9 ^ 1) & 1;
    swift_bridgeObjectRelease();
    int v22 = v10;
  }
  return v22 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t closure #1 in validateSSID(text:)()
{
  String.lowercased()();
  lazy protocol witness table accessor for type String and conformance String();
  lazy protocol witness table accessor for type String and conformance String();
  char v1 = BidirectionalCollection<>.starts<A>(with:)();
  outlined destroy of String();
  return v1 & 1;
}

uint64_t partial apply for closure #1 in validateSSID(text:)()
{
  return closure #1 in validateSSID(text:)() & 1;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

Swift::Bool __swiftcall checkValidTextInputs(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  v186 = partial apply for implicit closure #1 in checkValidTextInputs(data:);
  v187 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v188 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v189 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v190 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v191 = partial apply for implicit closure #2 in checkValidTextInputs(data:);
  v192 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v194 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v195 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v196 = partial apply for implicit closure #3 in checkValidTextInputs(data:);
  v197 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v198 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v199 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v262 = 0;
  char v261 = 0;
  uint64_t v256 = 0;
  v257 = 0;
  uint64_t v201 = 0;
  uint64_t v244 = 0;
  v245 = 0;
  uint64_t v227 = 0;
  v228 = 0;
  uint64_t v202 = type metadata accessor for Logger();
  uint64_t v203 = *(void *)(v202 - 8);
  uint64_t v204 = v202 - 8;
  unint64_t v205 = (*(void *)(v203 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(rawValue);
  v206 = (char *)&v59 - v205;
  unint64_t v207 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v1);
  v208 = (char *)&v59 - v207;
  unint64_t v209 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  v210 = (char *)&v59 - v209;
  uint64_t v262 = v5;
  char v261 = 0;
  Swift::String v211 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v213 = &v258;
  Swift::String v258 = v211;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v260)
  {
    if (swift_dynamicCast())
    {
      uint64_t v184 = v214;
      v185 = v215;
    }
    else
    {
      uint64_t v184 = 0;
      v185 = 0;
    }
    uint64_t v182 = v184;
    v183 = v185;
  }
  else
  {
    v60 = 0;
    outlined destroy of Any?((uint64_t)v259);
    uint64_t v182 = (uint64_t)v60;
    v183 = v60;
  }
  v180 = v183;
  uint64_t v181 = v182;
  if (!v183)
  {
    int v116 = 0;
    return v116 & 1;
  }
  uint64_t v178 = v181;
  v179 = v180;
  v6._uint64_t countAndFlagsBits = v181;
  v6._object = v180;
  v176 = v180;
  uint64_t v177 = v181;
  uint64_t v256 = v181;
  v257 = v180;
  if (validateAppName(text:)(v6))
  {
    Swift::String v174 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v175 = &v246;
    Swift::String v246 = v174;
    Dictionary.subscript.getter();
    outlined destroy of String();
    if (v248)
    {
      if (swift_dynamicCast())
      {
        uint64_t v172 = v216;
        v173 = v217;
      }
      else
      {
        uint64_t v172 = 0;
        v173 = 0;
      }
      uint64_t v170 = v172;
      v171 = v173;
    }
    else
    {
      v87 = 0;
      outlined destroy of Any?((uint64_t)v247);
      uint64_t v170 = (uint64_t)v87;
      v171 = v87;
    }
    v168 = v171;
    uint64_t v169 = v170;
    if (!v171)
    {
      swift_bridgeObjectRelease();
      int v116 = 0;
      return v116 & 1;
    }
    uint64_t v166 = v169;
    v167 = v168;
    v7._uint64_t countAndFlagsBits = v169;
    v7._object = v168;
    v164 = v168;
    uint64_t v165 = v169;
    uint64_t v244 = v169;
    v245 = v168;
    if (validateSessionID(text:)(v7))
    {
      Swift::String v162 = *kMediaML_interfaceType.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v163 = &v235;
      Swift::String v235 = v162;
      Dictionary.subscript.getter();
      outlined destroy of String();
      if (v236[3])
      {
        if (swift_dynamicCast())
        {
          uint64_t v160 = v218;
          int v161 = 0;
        }
        else
        {
          uint64_t v160 = 0;
          int v161 = 1;
        }
        uint64_t v158 = v160;
        int v159 = v161;
      }
      else
      {
        uint64_t v114 = 0;
        outlined destroy of Any?((uint64_t)v236);
        uint64_t v158 = v114;
        int v159 = 1;
      }
      int v157 = v159;
      uint64_t v156 = v158;
      Swift::Int v8 = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
      uint64_t v231 = v156;
      char v232 = v157 & 1;
      Swift::Int v233 = v8;
      char v234 = 0;
      if (!((v157 & 1) == 0
          && (outlined init with copy of Int?((uint64_t)&v231, (uint64_t)v219), (v234 & 1) == 0)
          && v219[0] == v233))
        goto LABEL_45;
      Swift::String v153 = *kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      v154 = &v229;
      Swift::String v229 = v153;
      Dictionary.subscript.getter();
      outlined destroy of String();
      if (v230[3])
      {
        if (swift_dynamicCast())
        {
          uint64_t v151 = v219[2];
          v152 = (void *)v219[3];
        }
        else
        {
          uint64_t v151 = 0;
          v152 = 0;
        }
        uint64_t v149 = v151;
        v150 = v152;
      }
      else
      {
        v115 = 0;
        outlined destroy of Any?((uint64_t)v230);
        uint64_t v149 = (uint64_t)v115;
        v150 = v115;
      }
      v147 = v150;
      uint64_t v148 = v149;
      if (v150)
      {
        uint64_t v145 = v148;
        v146 = v147;
        v9._uint64_t countAndFlagsBits = v148;
        v9._object = v147;
        v143 = v147;
        uint64_t v144 = v148;
        uint64_t v227 = v148;
        v228 = v147;
        if (validateSSID(text:)(v9))
        {
          swift_bridgeObjectRelease();
LABEL_45:
          char v261 = 1;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          int v116 = 1;
          return v116 & 1;
        }
        int v10 = v210;
        uint64_t v11 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v10, v11, v202);
        swift_bridgeObjectRetain();
        uint64_t v131 = 32;
        uint64_t v132 = 7;
        uint64_t v12 = swift_allocObject();
        uint64_t v13 = v143;
        uint64_t v133 = v12;
        *(void *)(v12 + 16) = v144;
        *(void *)(v12 + 24) = v13;
        v141 = Logger.logObject.getter();
        int v142 = static os_log_type_t.error.getter();
        v128 = &v225;
        uint64_t v225 = 12;
        unint64_t v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v127 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v129 = v226;
        uint64_t v130 = 17;
        uint64_t v135 = swift_allocObject();
        *(unsigned char *)(v135 + 16) = 32;
        uint64_t v136 = swift_allocObject();
        *(unsigned char *)(v136 + 16) = 8;
        uint64_t v14 = swift_allocObject();
        uint64_t v15 = v133;
        uint64_t v134 = v14;
        *(void *)(v14 + 16) = v196;
        *(void *)(v14 + 24) = v15;
        uint64_t v16 = swift_allocObject();
        uint64_t v17 = v134;
        uint64_t v138 = v16;
        *(void *)(v16 + 16) = v197;
        *(void *)(v16 + 24) = v17;
        uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v137 = _allocateUninitializedArray<A>(_:)();
        v139 = v18;
        swift_retain();
        uint64_t v19 = v135;
        uint64_t v20 = v139;
        *v139 = v198;
        v20[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
        swift_retain();
        uint64_t v21 = v136;
        int v22 = v139;
        v139[2] = v199;
        v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
        swift_retain();
        BOOL v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v138;
        Swift::Int v24 = v139;
        v139[4] = v200;
        v24[5] = v23;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v141, (os_log_type_t)v142))
        {
          uint64_t v25 = v201;
          v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v120 = createStorage<A>(capacity:type:)(0);
          uint64_t v121 = createStorage<A>(capacity:type:)(1);
          v122 = &v224;
          v224 = v119;
          v123 = &v223;
          uint64_t v223 = v120;
          v124 = &v222;
          uint64_t v222 = v121;
          serialize(_:at:)(2, &v224);
          serialize(_:at:)(1, v122);
          v220 = v198;
          uint64_t v221 = v135;
          closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
          uint64_t v125 = v25;
          if (v25)
          {
            __break(1u);
          }
          else
          {
            v220 = v199;
            uint64_t v221 = v136;
            closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)&v224, (uint64_t)&v223, (uint64_t)&v222);
            uint64_t v117 = 0;
            v220 = v200;
            uint64_t v221 = v138;
            closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)&v224, (uint64_t)&v223, (uint64_t)&v222);
            _os_log_impl((void *)&_mh_execute_header, v141, (os_log_type_t)v142, "ssid in data directory failed validation: %s", v119, v129);
            destroyStorage<A>(_:count:)(v120);
            destroyStorage<A>(_:count:)(v121);
            UnsafeMutablePointer.deallocate()();
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v203 + 8))(v210, v202);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v116 = 0;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v116 = 0;
      }
    }
    else
    {
      v26 = v208;
      uint64_t v27 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v26, v27, v202);
      swift_bridgeObjectRetain();
      uint64_t v102 = 32;
      uint64_t v103 = 7;
      uint64_t v28 = swift_allocObject();
      Swift::Int v29 = v164;
      uint64_t v104 = v28;
      *(void *)(v28 + 16) = v165;
      *(void *)(v28 + 24) = v29;
      v112 = Logger.logObject.getter();
      int v113 = static os_log_type_t.error.getter();
      v99 = &v242;
      uint64_t v242 = 12;
      unint64_t v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v98 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v100 = v243;
      uint64_t v101 = 17;
      uint64_t v106 = swift_allocObject();
      *(unsigned char *)(v106 + 16) = 32;
      uint64_t v107 = swift_allocObject();
      *(unsigned char *)(v107 + 16) = 8;
      uint64_t v30 = swift_allocObject();
      uint64_t v31 = v104;
      uint64_t v105 = v30;
      *(void *)(v30 + 16) = v191;
      *(void *)(v30 + 24) = v31;
      uint64_t v32 = swift_allocObject();
      uint64_t v33 = v105;
      uint64_t v109 = v32;
      *(void *)(v32 + 16) = v192;
      *(void *)(v32 + 24) = v33;
      uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v108 = _allocateUninitializedArray<A>(_:)();
      v110 = v34;
      swift_retain();
      uint64_t v35 = v106;
      v36 = v110;
      *v110 = v193;
      v36[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
      swift_retain();
      uint64_t v37 = v107;
      v38 = v110;
      v110[2] = v194;
      v38[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
      swift_retain();
      v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
      v40 = v110;
      v110[4] = v195;
      v40[5] = v39;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v112, (os_log_type_t)v113))
      {
        uint64_t v41 = v201;
        v90 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v91 = createStorage<A>(capacity:type:)(0);
        uint64_t v92 = createStorage<A>(capacity:type:)(1);
        v93 = &v241;
        v241 = v90;
        v94 = &v240;
        uint64_t v240 = v91;
        v95 = &v239;
        uint64_t v239 = v92;
        serialize(_:at:)(2, &v241);
        serialize(_:at:)(1, v93);
        v237 = v193;
        uint64_t v238 = v106;
        closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)v93, (uint64_t)v94, (uint64_t)v95);
        uint64_t v96 = v41;
        if (v41)
        {
          __break(1u);
        }
        else
        {
          v237 = v194;
          uint64_t v238 = v107;
          closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)&v241, (uint64_t)&v240, (uint64_t)&v239);
          uint64_t v88 = 0;
          v237 = v195;
          uint64_t v238 = v109;
          closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)&v241, (uint64_t)&v240, (uint64_t)&v239);
          _os_log_impl((void *)&_mh_execute_header, v112, (os_log_type_t)v113, "sessionID in data directory failed validation: %s", v90, v100);
          destroyStorage<A>(_:count:)(v91);
          destroyStorage<A>(_:count:)(v92);
          UnsafeMutablePointer.deallocate()();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v203 + 8))(v208, v202);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v116 = 0;
    }
  }
  else
  {
    v42 = v206;
    uint64_t v43 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v42, v43, v202);
    swift_bridgeObjectRetain();
    uint64_t v75 = 32;
    uint64_t v76 = 7;
    uint64_t v44 = swift_allocObject();
    v45 = v176;
    uint64_t v77 = v44;
    *(void *)(v44 + 16) = v177;
    *(void *)(v44 + 24) = v45;
    v85 = Logger.logObject.getter();
    int v86 = static os_log_type_t.error.getter();
    v72 = &v254;
    uint64_t v254 = 12;
    unint64_t v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v73 = v255;
    uint64_t v74 = 17;
    uint64_t v79 = swift_allocObject();
    *(unsigned char *)(v79 + 16) = 32;
    uint64_t v80 = swift_allocObject();
    *(unsigned char *)(v80 + 16) = 8;
    uint64_t v46 = swift_allocObject();
    uint64_t v47 = v77;
    uint64_t v78 = v46;
    *(void *)(v46 + 16) = v186;
    *(void *)(v46 + 24) = v47;
    uint64_t v48 = swift_allocObject();
    uint64_t v49 = v78;
    uint64_t v82 = v48;
    *(void *)(v48 + 16) = v187;
    *(void *)(v48 + 24) = v49;
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v81 = _allocateUninitializedArray<A>(_:)();
    v83 = v50;
    swift_retain();
    uint64_t v51 = v79;
    v52 = v83;
    *v83 = v188;
    v52[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v51;
    swift_retain();
    uint64_t v53 = v80;
    v54 = v83;
    v83[2] = v189;
    v54[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
    swift_retain();
    v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v82;
    v56 = v83;
    v83[4] = v190;
    v56[5] = v55;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v85, (os_log_type_t)v86))
    {
      uint64_t v57 = v201;
      v63 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v64 = createStorage<A>(capacity:type:)(0);
      uint64_t v65 = createStorage<A>(capacity:type:)(1);
      v66 = &v253;
      v253 = v63;
      v67 = &v252;
      uint64_t v252 = v64;
      v68 = &v251;
      uint64_t v251 = v65;
      serialize(_:at:)(2, &v253);
      serialize(_:at:)(1, v66);
      v249 = v188;
      uint64_t v250 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v249, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
      uint64_t v69 = v57;
      if (v57)
      {
        __break(1u);
      }
      else
      {
        v249 = v189;
        uint64_t v250 = v80;
        closure #1 in osLogInternal(_:log:type:)(&v249, (uint64_t)&v253, (uint64_t)&v252, (uint64_t)&v251);
        uint64_t v61 = 0;
        v249 = v190;
        uint64_t v250 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v249, (uint64_t)&v253, (uint64_t)&v252, (uint64_t)&v251);
        _os_log_impl((void *)&_mh_execute_header, v85, (os_log_type_t)v86, "AppName in data directory failed validation: %s", v63, v73);
        destroyStorage<A>(_:count:)(v64);
        destroyStorage<A>(_:count:)(v65);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v203 + 8))(v206, v202);
    swift_bridgeObjectRelease();
    int v116 = 0;
  }
  return v116 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in checkValidTextInputs(data:)()
{
}

uint64_t sub_100006BF4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in checkValidTextInputs(data:)();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in checkValidTextInputs(data:)()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in checkValidTextInputs(data:)()
{
}

Swift::Bool __swiftcall checkValidNumericInputRange(data:)(Swift::OpaquePointer data)
{
  uint64_t v546 = __chkstk_darwin(data._rawValue);
  v477 = partial apply for implicit closure #11 in checkValidNumericInputRange(data:);
  v478 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  v479 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v480 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v481 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
  v482 = partial apply for implicit closure #13 in checkValidNumericInputRange(data:);
  v483 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v484 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v485 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v486 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v487 = partial apply for implicit closure #15 in checkValidNumericInputRange(data:);
  v488 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v489 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v490 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v491 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v492 = partial apply for implicit closure #17 in checkValidNumericInputRange(data:);
  v493 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v494 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v495 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v496 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v497 = partial apply for implicit closure #19 in checkValidNumericInputRange(data:);
  v498 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v499 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v500 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v501 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v502 = partial apply for implicit closure #21 in checkValidNumericInputRange(data:);
  v503 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v504 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v505 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v506 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v507 = partial apply for implicit closure #23 in checkValidNumericInputRange(data:);
  v508 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
  v509 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v510 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v512 = partial apply for implicit closure #25 in checkValidNumericInputRange(data:);
  v513 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  v514 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v515 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v516 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v517 = partial apply for implicit closure #27 in checkValidNumericInputRange(data:);
  v518 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v519 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v520 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v521 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  uint64_t v678 = 0;
  char v677 = 0;
  Swift::Int v670 = 0;
  Swift::Int v663 = 0;
  Swift::Int v656 = 0;
  Swift::Int v650 = 0;
  Swift::Int v644 = 0;
  Swift::Int v638 = 0;
  double v632 = 0.0;
  double v626 = 0.0;
  Swift::Int v620 = 0;
  uint64_t v522 = 0;
  uint64_t v523 = type metadata accessor for Logger();
  uint64_t v524 = *(void *)(v523 - 8);
  uint64_t v525 = v523 - 8;
  uint64_t v526 = *(void *)(v524 + 64);
  unint64_t v527 = (v526 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(v546);
  v528 = (char *)&v145 - v527;
  unint64_t v529 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v1);
  v530 = (char *)&v145 - v529;
  unint64_t v531 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v3);
  v532 = (char *)&v145 - v531;
  unint64_t v533 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v5);
  v534 = (char *)&v145 - v533;
  unint64_t v535 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = __chkstk_darwin(v7);
  v536 = (char *)&v145 - v535;
  unint64_t v537 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = __chkstk_darwin(v9);
  v538 = (char *)&v145 - v537;
  unint64_t v539 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = __chkstk_darwin(v11);
  v540 = (char *)&v145 - v539;
  unint64_t v541 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = __chkstk_darwin(v13);
  v542 = (char *)&v145 - v541;
  unint64_t v543 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = __chkstk_darwin(v15);
  v544 = (char *)&v145 - v543;
  uint64_t v678 = v17;
  char v677 = 0;
  Swift::String v545 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v547 = &v673;
  Swift::String v673 = v545;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v675)
  {
    if (swift_dynamicCast())
    {
      Swift::Int v475 = v548;
      int v476 = 0;
    }
    else
    {
      Swift::Int v475 = 0;
      int v476 = 1;
    }
    Swift::Int v473 = v475;
    int v474 = v476;
  }
  else
  {
    Swift::Int v145 = 0;
    outlined destroy of Any?((uint64_t)v674);
    Swift::Int v473 = v145;
    int v474 = 1;
  }
  Swift::Int v671 = v473;
  char v672 = v474 & 1;
  if (v474) {
    Swift::Int v676 = 0;
  }
  else {
    Swift::Int v676 = v671;
  }
  Swift::Int v470 = v676;
  Swift::Int v670 = v676;
  Swift::String v471 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v472 = &v666;
  Swift::String v666 = v471;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v668)
  {
    if (swift_dynamicCast())
    {
      Swift::Int v468 = v549;
      int v469 = 0;
    }
    else
    {
      Swift::Int v468 = 0;
      int v469 = 1;
    }
    Swift::Int v466 = v468;
    int v467 = v469;
  }
  else
  {
    Swift::Int v146 = 0;
    outlined destroy of Any?((uint64_t)v667);
    Swift::Int v466 = v146;
    int v467 = 1;
  }
  Swift::Int v664 = v466;
  char v665 = v467 & 1;
  if (v467) {
    Swift::Int v669 = 0;
  }
  else {
    Swift::Int v669 = v664;
  }
  Swift::Int v463 = v669;
  Swift::Int v663 = v669;
  Swift::String v464 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v465 = &v659;
  Swift::String v659 = v464;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v661)
  {
    if (swift_dynamicCast())
    {
      Swift::Int v461 = v550;
      int v462 = 0;
    }
    else
    {
      Swift::Int v461 = 0;
      int v462 = 1;
    }
    Swift::Int v459 = v461;
    int v460 = v462;
  }
  else
  {
    Swift::Int v147 = 0;
    outlined destroy of Any?((uint64_t)v660);
    Swift::Int v459 = v147;
    int v460 = 1;
  }
  Swift::Int v657 = v459;
  char v658 = v460 & 1;
  if (v460) {
    Swift::Int v662 = 0;
  }
  else {
    Swift::Int v662 = v657;
  }
  Swift::Int v456 = v662;
  Swift::Int v656 = v662;
  Swift::String v457 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v458 = &v653;
  Swift::String v653 = v457;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v654[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v454 = v551;
      int v455 = 0;
    }
    else
    {
      Swift::Int v454 = 0;
      int v455 = 1;
    }
    Swift::Int v452 = v454;
    int v453 = v455;
  }
  else
  {
    Swift::Int v148 = 0;
    outlined destroy of Any?((uint64_t)v654);
    Swift::Int v452 = v148;
    int v453 = 1;
  }
  Swift::Int v651 = v452;
  char v652 = v453 & 1;
  if (v453) {
    Swift::Int v655 = 0;
  }
  else {
    Swift::Int v655 = v651;
  }
  Swift::Int v449 = v655;
  Swift::Int v650 = v655;
  Swift::String v450 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v451 = &v647;
  Swift::String v647 = v450;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v648[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v447 = v552;
      int v448 = 0;
    }
    else
    {
      Swift::Int v447 = 0;
      int v448 = 1;
    }
    Swift::Int v445 = v447;
    int v446 = v448;
  }
  else
  {
    Swift::Int v149 = 0;
    outlined destroy of Any?((uint64_t)v648);
    Swift::Int v445 = v149;
    int v446 = 1;
  }
  Swift::Int v645 = v445;
  char v646 = v446 & 1;
  if (v446) {
    Swift::Int v649 = 0;
  }
  else {
    Swift::Int v649 = v645;
  }
  Swift::Int v442 = v649;
  Swift::Int v644 = v649;
  Swift::String v443 = *kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v444 = &v641;
  Swift::String v641 = v443;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v642[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v440 = v553;
      int v441 = 0;
    }
    else
    {
      Swift::Int v440 = 0;
      int v441 = 1;
    }
    Swift::Int v438 = v440;
    int v439 = v441;
  }
  else
  {
    Swift::Int v150 = 0;
    outlined destroy of Any?((uint64_t)v642);
    Swift::Int v438 = v150;
    int v439 = 1;
  }
  Swift::Int v639 = v438;
  char v640 = v439 & 1;
  if (v439) {
    Swift::Int v643 = 0;
  }
  else {
    Swift::Int v643 = v639;
  }
  Swift::Int v435 = v643;
  Swift::Int v638 = v643;
  Swift::String v436 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v437 = &v635;
  Swift::String v635 = v436;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v636[3])
  {
    if (swift_dynamicCast())
    {
      double v433 = v554;
      int v434 = 0;
    }
    else
    {
      double v433 = 0.0;
      int v434 = 1;
    }
    double v431 = v433;
    int v432 = v434;
  }
  else
  {
    double v151 = 0.0;
    outlined destroy of Any?((uint64_t)v636);
    double v431 = v151;
    int v432 = 1;
  }
  double v633 = v431;
  char v634 = v432 & 1;
  if (v432) {
    double v637 = 0.0;
  }
  else {
    double v637 = v633;
  }
  Swift::Double v428 = v637;
  double v632 = v637;
  Swift::String v429 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v430 = &v629;
  Swift::String v629 = v429;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v630[3])
  {
    if (swift_dynamicCast())
    {
      double v426 = v555;
      int v427 = 0;
    }
    else
    {
      double v426 = 0.0;
      int v427 = 1;
    }
    double v424 = v426;
    int v425 = v427;
  }
  else
  {
    double v152 = 0.0;
    outlined destroy of Any?((uint64_t)v630);
    double v424 = v152;
    int v425 = 1;
  }
  double v627 = v424;
  char v628 = v425 & 1;
  if (v425) {
    double v631 = 0.0;
  }
  else {
    double v631 = v627;
  }
  Swift::Double v421 = v631;
  double v626 = v631;
  Swift::String v422 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v423 = &v623;
  Swift::String v623 = v422;
  Dictionary.subscript.getter();
  outlined destroy of String();
  if (v624[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v419 = v556;
      int v420 = 0;
    }
    else
    {
      Swift::Int v419 = 0;
      int v420 = 1;
    }
    Swift::Int v417 = v419;
    int v418 = v420;
  }
  else
  {
    Swift::Int v153 = 0;
    outlined destroy of Any?((uint64_t)v624);
    Swift::Int v417 = v153;
    int v418 = 1;
  }
  Swift::Int v621 = v417;
  char v622 = v418 & 1;
  if (v418) {
    Swift::Int v625 = 0;
  }
  else {
    Swift::Int v625 = v621;
  }
  Swift::Int v416 = v625;
  Swift::Int v620 = v625;
  if (v470 <= 0 && v470 >= *minSignalStrength.unsafeMutableAddressor())
  {
    if (v463 <= 0 && v463 >= *minSignalStrength.unsafeMutableAddressor())
    {
      if (v456 <= 0 && v456 >= *minSignalStrength.unsafeMutableAddressor())
      {
        if (v449 <= 0 && v449 >= *minSignalStrength.unsafeMutableAddressor())
        {
          if (v442 <= 0 && v442 >= *minNoise.unsafeMutableAddressor())
          {
            if (v435 >= 0 && *maxBars.unsafeMutableAddressor() >= v435)
            {
              if (v428 >= 0.0 && v428 <= *maxRxRate.unsafeMutableAddressor())
              {
                if (v421 >= 0.0 && v421 <= *maxTxRate.unsafeMutableAddressor())
                {
                  if (v416 > 0 && *maxThroughput.unsafeMutableAddressor() >= v416)
                  {
                    char v677 = 1;
                    int v406 = 1;
                  }
                  else
                  {
                    uint64_t v18 = v544;
                    uint64_t v19 = logger.unsafeMutableAddressor();
                    (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v18, v19, v523);
                    uint64_t v395 = 7;
                    uint64_t v396 = swift_allocObject();
                    *(void *)(v396 + 16) = v416;
                    v404 = Logger.logObject.getter();
                    int v405 = static os_log_type_t.error.getter();
                    v391 = &v562;
                    uint64_t v562 = 12;
                    unint64_t v389 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    unint64_t v390 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    lazy protocol witness table accessor for type Int and conformance Int();
                    UnsignedInteger<>.init<A>(_:)();
                    uint32_t v392 = v563;
                    uint64_t v393 = 17;
                    uint64_t v398 = swift_allocObject();
                    *(unsigned char *)(v398 + 16) = 0;
                    uint64_t v399 = swift_allocObject();
                    *(unsigned char *)(v399 + 16) = 8;
                    uint64_t v394 = 32;
                    uint64_t v20 = swift_allocObject();
                    uint64_t v21 = v396;
                    uint64_t v397 = v20;
                    *(void *)(v20 + 16) = v517;
                    *(void *)(v20 + 24) = v21;
                    uint64_t v22 = swift_allocObject();
                    uint64_t v23 = v397;
                    uint64_t v401 = v22;
                    *(void *)(v22 + 16) = v518;
                    *(void *)(v22 + 24) = v23;
                    uint64_t v403 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                    uint64_t v400 = _allocateUninitializedArray<A>(_:)();
                    v402 = v24;
                    swift_retain();
                    uint64_t v25 = v398;
                    v26 = v402;
                    *v402 = v519;
                    v26[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v25;
                    swift_retain();
                    uint64_t v27 = v399;
                    uint64_t v28 = v402;
                    v402[2] = v520;
                    v28[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v27;
                    swift_retain();
                    Swift::Int v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v401;
                    uint64_t v30 = v402;
                    v402[4] = v521;
                    v30[5] = v29;
                    _finalizeUninitializedArray<A>(_:)();
                    swift_bridgeObjectRelease();
                    if (os_log_type_enabled(v404, (os_log_type_t)v405))
                    {
                      uint64_t v31 = v522;
                      v382 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                      uint64_t v380 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                      uint64_t v381 = 0;
                      uint64_t v383 = createStorage<A>(capacity:type:)(0);
                      uint64_t v384 = createStorage<A>(capacity:type:)(v381);
                      v385 = &v561;
                      v561 = v382;
                      v386 = &v560;
                      uint64_t v560 = v383;
                      v387 = &v559;
                      uint64_t v559 = v384;
                      serialize(_:at:)(0, &v561);
                      serialize(_:at:)(1, v385);
                      v557 = v519;
                      uint64_t v558 = v398;
                      closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)v385, (uint64_t)v386, (uint64_t)v387);
                      uint64_t v388 = v31;
                      if (v31)
                      {
                        __break(1u);
                      }
                      else
                      {
                        v557 = v520;
                        uint64_t v558 = v399;
                        closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)&v561, (uint64_t)&v560, (uint64_t)&v559);
                        uint64_t v379 = 0;
                        v557 = v521;
                        uint64_t v558 = v401;
                        closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)&v561, (uint64_t)&v560, (uint64_t)&v559);
                        _os_log_impl((void *)&_mh_execute_header, v404, (os_log_type_t)v405, "throughput_true in data directory failed validation: %ld", v382, v392);
                        uint64_t v378 = 0;
                        destroyStorage<A>(_:count:)(v383);
                        destroyStorage<A>(_:count:)(v384);
                        UnsafeMutablePointer.deallocate()();
                        swift_release();
                        swift_release();
                        swift_release();
                      }
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();
                    }

                    (*(void (**)(char *, uint64_t))(v524 + 8))(v544, v523);
                    int v406 = 0;
                  }
                }
                else
                {
                  uint64_t v32 = v542;
                  uint64_t v33 = logger.unsafeMutableAddressor();
                  (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v32, v33, v523);
                  uint64_t v367 = 7;
                  uint64_t v368 = swift_allocObject();
                  *(Swift::Double *)(v368 + 16) = v421;
                  v376 = Logger.logObject.getter();
                  int v377 = static os_log_type_t.error.getter();
                  v363 = &v569;
                  uint64_t v569 = 12;
                  unint64_t v361 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  unint64_t v362 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  lazy protocol witness table accessor for type Int and conformance Int();
                  UnsignedInteger<>.init<A>(_:)();
                  uint32_t v364 = v570;
                  uint64_t v365 = 17;
                  uint64_t v370 = swift_allocObject();
                  *(unsigned char *)(v370 + 16) = 0;
                  uint64_t v371 = swift_allocObject();
                  *(unsigned char *)(v371 + 16) = 8;
                  uint64_t v366 = 32;
                  uint64_t v34 = swift_allocObject();
                  uint64_t v35 = v368;
                  uint64_t v369 = v34;
                  *(void *)(v34 + 16) = v512;
                  *(void *)(v34 + 24) = v35;
                  uint64_t v36 = swift_allocObject();
                  uint64_t v37 = v369;
                  uint64_t v373 = v36;
                  *(void *)(v36 + 16) = v513;
                  *(void *)(v36 + 24) = v37;
                  uint64_t v375 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                  uint64_t v372 = _allocateUninitializedArray<A>(_:)();
                  v374 = v38;
                  swift_retain();
                  uint64_t v39 = v370;
                  v40 = v374;
                  *v374 = v514;
                  v40[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39;
                  swift_retain();
                  uint64_t v41 = v371;
                  v42 = v374;
                  v374[2] = v515;
                  v42[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v41;
                  swift_retain();
                  uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v373;
                  uint64_t v44 = v374;
                  v374[4] = v516;
                  v44[5] = v43;
                  _finalizeUninitializedArray<A>(_:)();
                  swift_bridgeObjectRelease();
                  if (os_log_type_enabled(v376, (os_log_type_t)v377))
                  {
                    uint64_t v45 = v522;
                    v354 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                    uint64_t v352 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                    uint64_t v353 = 0;
                    uint64_t v355 = createStorage<A>(capacity:type:)(0);
                    uint64_t v356 = createStorage<A>(capacity:type:)(v353);
                    v357 = &v568;
                    v568 = v354;
                    v358 = &v567;
                    uint64_t v567 = v355;
                    v359 = &v566;
                    uint64_t v566 = v356;
                    serialize(_:at:)(0, &v568);
                    serialize(_:at:)(1, v357);
                    v564 = v514;
                    uint64_t v565 = v370;
                    closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)v357, (uint64_t)v358, (uint64_t)v359);
                    uint64_t v360 = v45;
                    if (v45)
                    {
                      __break(1u);
                    }
                    else
                    {
                      v564 = v515;
                      uint64_t v565 = v371;
                      closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)&v568, (uint64_t)&v567, (uint64_t)&v566);
                      uint64_t v351 = 0;
                      v564 = v516;
                      uint64_t v565 = v373;
                      closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)&v568, (uint64_t)&v567, (uint64_t)&v566);
                      _os_log_impl((void *)&_mh_execute_header, v376, (os_log_type_t)v377, "txRate in data directory failed validation: %f", v354, v364);
                      uint64_t v350 = 0;
                      destroyStorage<A>(_:count:)(v355);
                      destroyStorage<A>(_:count:)(v356);
                      UnsafeMutablePointer.deallocate()();
                      swift_release();
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    swift_release();
                    swift_release();
                    swift_release();
                  }

                  (*(void (**)(char *, uint64_t))(v524 + 8))(v542, v523);
                  int v406 = 0;
                }
              }
              else
              {
                uint64_t v46 = v540;
                uint64_t v47 = logger.unsafeMutableAddressor();
                (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v46, v47, v523);
                uint64_t v339 = 7;
                uint64_t v340 = swift_allocObject();
                *(Swift::Double *)(v340 + 16) = v428;
                v348 = Logger.logObject.getter();
                int v349 = static os_log_type_t.error.getter();
                v335 = &v576;
                uint64_t v576 = 12;
                unint64_t v333 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                unint64_t v334 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                lazy protocol witness table accessor for type Int and conformance Int();
                UnsignedInteger<>.init<A>(_:)();
                uint32_t v336 = v577;
                uint64_t v337 = 17;
                uint64_t v342 = swift_allocObject();
                *(unsigned char *)(v342 + 16) = 0;
                uint64_t v343 = swift_allocObject();
                *(unsigned char *)(v343 + 16) = 8;
                uint64_t v338 = 32;
                uint64_t v48 = swift_allocObject();
                uint64_t v49 = v340;
                uint64_t v341 = v48;
                *(void *)(v48 + 16) = v507;
                *(void *)(v48 + 24) = v49;
                uint64_t v50 = swift_allocObject();
                uint64_t v51 = v341;
                uint64_t v345 = v50;
                *(void *)(v50 + 16) = v508;
                *(void *)(v50 + 24) = v51;
                uint64_t v347 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                uint64_t v344 = _allocateUninitializedArray<A>(_:)();
                v346 = v52;
                swift_retain();
                uint64_t v53 = v342;
                v54 = v346;
                *v346 = v509;
                v54[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
                swift_retain();
                uint64_t v55 = v343;
                v56 = v346;
                v346[2] = v510;
                v56[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v55;
                swift_retain();
                uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v345;
                v58 = v346;
                v346[4] = v511;
                v58[5] = v57;
                _finalizeUninitializedArray<A>(_:)();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v348, (os_log_type_t)v349))
                {
                  uint64_t v59 = v522;
                  v326 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                  uint64_t v324 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  uint64_t v325 = 0;
                  uint64_t v327 = createStorage<A>(capacity:type:)(0);
                  uint64_t v328 = createStorage<A>(capacity:type:)(v325);
                  v329 = &v575;
                  v575 = v326;
                  v330 = &v574;
                  uint64_t v574 = v327;
                  v331 = &v573;
                  uint64_t v573 = v328;
                  serialize(_:at:)(0, &v575);
                  serialize(_:at:)(1, v329);
                  v571 = v509;
                  uint64_t v572 = v342;
                  closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)v329, (uint64_t)v330, (uint64_t)v331);
                  uint64_t v332 = v59;
                  if (v59)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v571 = v510;
                    uint64_t v572 = v343;
                    closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)&v575, (uint64_t)&v574, (uint64_t)&v573);
                    uint64_t v323 = 0;
                    v571 = v511;
                    uint64_t v572 = v345;
                    closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)&v575, (uint64_t)&v574, (uint64_t)&v573);
                    _os_log_impl((void *)&_mh_execute_header, v348, (os_log_type_t)v349, "rxRate in data directory failed validation: %f", v326, v336);
                    uint64_t v322 = 0;
                    destroyStorage<A>(_:count:)(v327);
                    destroyStorage<A>(_:count:)(v328);
                    UnsafeMutablePointer.deallocate()();
                    swift_release();
                    swift_release();
                    swift_release();
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                }

                (*(void (**)(char *, uint64_t))(v524 + 8))(v540, v523);
                int v406 = 0;
              }
            }
            else
            {
              v60 = v538;
              uint64_t v61 = logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v60, v61, v523);
              uint64_t v311 = 7;
              uint64_t v312 = swift_allocObject();
              *(void *)(v312 + 16) = v435;
              v320 = Logger.logObject.getter();
              int v321 = static os_log_type_t.error.getter();
              v307 = &v583;
              uint64_t v583 = 12;
              unint64_t v305 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              unint64_t v306 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              uint32_t v308 = v584;
              uint64_t v309 = 17;
              uint64_t v314 = swift_allocObject();
              *(unsigned char *)(v314 + 16) = 0;
              uint64_t v315 = swift_allocObject();
              *(unsigned char *)(v315 + 16) = 8;
              uint64_t v310 = 32;
              uint64_t v62 = swift_allocObject();
              uint64_t v63 = v312;
              uint64_t v313 = v62;
              *(void *)(v62 + 16) = v502;
              *(void *)(v62 + 24) = v63;
              uint64_t v64 = swift_allocObject();
              uint64_t v65 = v313;
              uint64_t v317 = v64;
              *(void *)(v64 + 16) = v503;
              *(void *)(v64 + 24) = v65;
              uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              uint64_t v316 = _allocateUninitializedArray<A>(_:)();
              v318 = v66;
              swift_retain();
              uint64_t v67 = v314;
              v68 = v318;
              *v318 = v504;
              v68[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v67;
              swift_retain();
              uint64_t v69 = v315;
              unint64_t v70 = v318;
              v318[2] = v505;
              v70[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v69;
              swift_retain();
              unint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v317;
              v72 = v318;
              v318[4] = v506;
              v72[5] = v71;
              _finalizeUninitializedArray<A>(_:)();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v320, (os_log_type_t)v321))
              {
                uint64_t v73 = v522;
                v298 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                uint64_t v296 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                uint64_t v297 = 0;
                uint64_t v299 = createStorage<A>(capacity:type:)(0);
                uint64_t v300 = createStorage<A>(capacity:type:)(v297);
                v301 = &v582;
                v582 = v298;
                v302 = &v581;
                uint64_t v581 = v299;
                v303 = &v580;
                uint64_t v580 = v300;
                serialize(_:at:)(0, &v582);
                serialize(_:at:)(1, v301);
                v578 = v504;
                uint64_t v579 = v314;
                closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)v301, (uint64_t)v302, (uint64_t)v303);
                uint64_t v304 = v73;
                if (v73)
                {
                  __break(1u);
                }
                else
                {
                  v578 = v505;
                  uint64_t v579 = v315;
                  closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)&v582, (uint64_t)&v581, (uint64_t)&v580);
                  uint64_t v295 = 0;
                  v578 = v506;
                  uint64_t v579 = v317;
                  closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)&v582, (uint64_t)&v581, (uint64_t)&v580);
                  _os_log_impl((void *)&_mh_execute_header, v320, (os_log_type_t)v321, "bars in data directory failed validation: %ld", v298, v308);
                  uint64_t v294 = 0;
                  destroyStorage<A>(_:count:)(v299);
                  destroyStorage<A>(_:count:)(v300);
                  UnsafeMutablePointer.deallocate()();
                  swift_release();
                  swift_release();
                  swift_release();
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
              }

              (*(void (**)(char *, uint64_t))(v524 + 8))(v538, v523);
              int v406 = 0;
            }
          }
          else
          {
            uint64_t v74 = v536;
            uint64_t v75 = logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v74, v75, v523);
            uint64_t v283 = 7;
            uint64_t v284 = swift_allocObject();
            *(void *)(v284 + 16) = v442;
            v292 = Logger.logObject.getter();
            int v293 = static os_log_type_t.error.getter();
            v279 = &v590;
            uint64_t v590 = 12;
            unint64_t v277 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            unint64_t v278 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            uint32_t v280 = v591;
            uint64_t v281 = 17;
            uint64_t v286 = swift_allocObject();
            *(unsigned char *)(v286 + 16) = 0;
            uint64_t v287 = swift_allocObject();
            *(unsigned char *)(v287 + 16) = 8;
            uint64_t v282 = 32;
            uint64_t v76 = swift_allocObject();
            uint64_t v77 = v284;
            uint64_t v285 = v76;
            *(void *)(v76 + 16) = v497;
            *(void *)(v76 + 24) = v77;
            uint64_t v78 = swift_allocObject();
            uint64_t v79 = v285;
            uint64_t v289 = v78;
            *(void *)(v78 + 16) = v498;
            *(void *)(v78 + 24) = v79;
            uint64_t v291 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            uint64_t v288 = _allocateUninitializedArray<A>(_:)();
            v290 = v80;
            swift_retain();
            uint64_t v81 = v286;
            uint64_t v82 = v290;
            *v290 = v499;
            v82[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
            swift_retain();
            uint64_t v83 = v287;
            uint64_t v84 = v290;
            v290[2] = v500;
            v84[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v83;
            swift_retain();
            v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v289;
            int v86 = v290;
            v290[4] = v501;
            v86[5] = v85;
            _finalizeUninitializedArray<A>(_:)();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v292, (os_log_type_t)v293))
            {
              uint64_t v87 = v522;
              v270 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              uint64_t v268 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              uint64_t v269 = 0;
              uint64_t v271 = createStorage<A>(capacity:type:)(0);
              uint64_t v272 = createStorage<A>(capacity:type:)(v269);
              v273 = &v589;
              v589 = v270;
              v274 = &v588;
              uint64_t v588 = v271;
              v275 = &v587;
              uint64_t v587 = v272;
              serialize(_:at:)(0, &v589);
              serialize(_:at:)(1, v273);
              v585 = v499;
              uint64_t v586 = v286;
              closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)v273, (uint64_t)v274, (uint64_t)v275);
              uint64_t v276 = v87;
              if (v87)
              {
                __break(1u);
              }
              else
              {
                v585 = v500;
                uint64_t v586 = v287;
                closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)&v589, (uint64_t)&v588, (uint64_t)&v587);
                uint64_t v267 = 0;
                v585 = v501;
                uint64_t v586 = v289;
                closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)&v589, (uint64_t)&v588, (uint64_t)&v587);
                _os_log_impl((void *)&_mh_execute_header, v292, (os_log_type_t)v293, "noise in data directory failed validation: %ld", v270, v280);
                uint64_t v266 = 0;
                destroyStorage<A>(_:count:)(v271);
                destroyStorage<A>(_:count:)(v272);
                UnsafeMutablePointer.deallocate()();
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            (*(void (**)(char *, uint64_t))(v524 + 8))(v536, v523);
            int v406 = 0;
          }
        }
        else
        {
          uint64_t v88 = v534;
          uint64_t v89 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v88, v89, v523);
          uint64_t v255 = 7;
          uint64_t v256 = swift_allocObject();
          *(void *)(v256 + 16) = v449;
          v264 = Logger.logObject.getter();
          int v265 = static os_log_type_t.error.getter();
          uint64_t v251 = &v597;
          uint64_t v597 = 12;
          unint64_t v249 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v250 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v252 = v598;
          uint64_t v253 = 17;
          uint64_t v258 = swift_allocObject();
          *(unsigned char *)(v258 + 16) = 0;
          uint64_t v259 = swift_allocObject();
          *(unsigned char *)(v259 + 16) = 8;
          uint64_t v254 = 32;
          uint64_t v90 = swift_allocObject();
          uint64_t v91 = v256;
          uint64_t v257 = v90;
          *(void *)(v90 + 16) = v492;
          *(void *)(v90 + 24) = v91;
          uint64_t v92 = swift_allocObject();
          uint64_t v93 = v257;
          uint64_t v261 = v92;
          *(void *)(v92 + 16) = v493;
          *(void *)(v92 + 24) = v93;
          uint64_t v263 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v260 = _allocateUninitializedArray<A>(_:)();
          uint64_t v262 = v94;
          swift_retain();
          uint64_t v95 = v258;
          uint64_t v96 = v262;
          *uint64_t v262 = v494;
          v96[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v95;
          swift_retain();
          uint64_t v97 = v259;
          unint64_t v98 = v262;
          v262[2] = v495;
          v98[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v97;
          swift_retain();
          v99 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v261;
          uint32_t v100 = v262;
          v262[4] = v496;
          v100[5] = v99;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v264, (os_log_type_t)v265))
          {
            uint64_t v101 = v522;
            uint64_t v242 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v241 = 0;
            uint64_t v243 = createStorage<A>(capacity:type:)(0);
            uint64_t v244 = createStorage<A>(capacity:type:)(v241);
            v245 = &v596;
            v596 = v242;
            Swift::String v246 = &v595;
            uint64_t v595 = v243;
            v247 = &v594;
            uint64_t v594 = v244;
            serialize(_:at:)(0, &v596);
            serialize(_:at:)(1, v245);
            v592 = v494;
            uint64_t v593 = v258;
            closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)v245, (uint64_t)v246, (uint64_t)v247);
            uint64_t v248 = v101;
            if (v101)
            {
              __break(1u);
            }
            else
            {
              v592 = v495;
              uint64_t v593 = v259;
              closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)&v596, (uint64_t)&v595, (uint64_t)&v594);
              uint64_t v239 = 0;
              v592 = v496;
              uint64_t v593 = v261;
              closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)&v596, (uint64_t)&v595, (uint64_t)&v594);
              _os_log_impl((void *)&_mh_execute_header, v264, (os_log_type_t)v265, "rscp in data directory failed validation: %ld", v242, v252);
              uint64_t v238 = 0;
              destroyStorage<A>(_:count:)(v243);
              destroyStorage<A>(_:count:)(v244);
              UnsafeMutablePointer.deallocate()();
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v524 + 8))(v534, v523);
          int v406 = 0;
        }
      }
      else
      {
        uint64_t v102 = v532;
        uint64_t v103 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v102, v103, v523);
        uint64_t v227 = 7;
        uint64_t v228 = swift_allocObject();
        *(void *)(v228 + 16) = v456;
        v236 = Logger.logObject.getter();
        int v237 = static os_log_type_t.error.getter();
        uint64_t v223 = &v604;
        uint64_t v604 = 12;
        unint64_t v221 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v222 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v224 = v605;
        uint64_t v225 = 17;
        uint64_t v230 = swift_allocObject();
        *(unsigned char *)(v230 + 16) = 0;
        uint64_t v231 = swift_allocObject();
        *(unsigned char *)(v231 + 16) = 8;
        uint64_t v226 = 32;
        uint64_t v104 = swift_allocObject();
        uint64_t v105 = v228;
        uint64_t v229 = v104;
        *(void *)(v104 + 16) = v487;
        *(void *)(v104 + 24) = v105;
        uint64_t v106 = swift_allocObject();
        uint64_t v107 = v229;
        uint64_t v233 = v106;
        *(void *)(v106 + 16) = v488;
        *(void *)(v106 + 24) = v107;
        uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v232 = _allocateUninitializedArray<A>(_:)();
        char v234 = v108;
        swift_retain();
        uint64_t v109 = v230;
        v110 = v234;
        *char v234 = v489;
        v110[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
        swift_retain();
        uint64_t v111 = v231;
        v112 = v234;
        v234[2] = v490;
        v112[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v111;
        swift_retain();
        int v113 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v233;
        uint64_t v114 = v234;
        v234[4] = v491;
        v114[5] = v113;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v236, (os_log_type_t)v237))
        {
          uint64_t v115 = v522;
          uint64_t v214 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v213 = 0;
          uint64_t v215 = createStorage<A>(capacity:type:)(0);
          uint64_t v216 = createStorage<A>(capacity:type:)(v213);
          v217 = &v603;
          v603 = v214;
          uint64_t v218 = &v602;
          uint64_t v602 = v215;
          v219 = &v601;
          uint64_t v601 = v216;
          serialize(_:at:)(0, &v603);
          serialize(_:at:)(1, v217);
          v599 = v489;
          uint64_t v600 = v230;
          closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219);
          uint64_t v220 = v115;
          if (v115)
          {
            __break(1u);
          }
          else
          {
            v599 = v490;
            uint64_t v600 = v231;
            closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)&v603, (uint64_t)&v602, (uint64_t)&v601);
            uint64_t v211 = 0;
            v599 = v491;
            uint64_t v600 = v233;
            closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)&v603, (uint64_t)&v602, (uint64_t)&v601);
            _os_log_impl((void *)&_mh_execute_header, v236, (os_log_type_t)v237, "rsrq in data directory failed validation: %ld", v214, v224);
            uint64_t v210 = 0;
            destroyStorage<A>(_:count:)(v215);
            destroyStorage<A>(_:count:)(v216);
            UnsafeMutablePointer.deallocate()();
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v524 + 8))(v532, v523);
        int v406 = 0;
      }
    }
    else
    {
      int v116 = v530;
      uint64_t v117 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v116, v117, v523);
      uint64_t v199 = 7;
      uint64_t v200 = swift_allocObject();
      *(void *)(v200 + 16) = v463;
      v208 = Logger.logObject.getter();
      int v209 = static os_log_type_t.error.getter();
      v195 = &v611;
      uint64_t v611 = 12;
      unint64_t v193 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v194 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v196 = v612;
      uint64_t v197 = 17;
      uint64_t v202 = swift_allocObject();
      *(unsigned char *)(v202 + 16) = 0;
      uint64_t v203 = swift_allocObject();
      *(unsigned char *)(v203 + 16) = 8;
      uint64_t v198 = 32;
      uint64_t v118 = swift_allocObject();
      uint64_t v119 = v200;
      uint64_t v201 = v118;
      *(void *)(v118 + 16) = v482;
      *(void *)(v118 + 24) = v119;
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v201;
      uint64_t v205 = v120;
      *(void *)(v120 + 16) = v483;
      *(void *)(v120 + 24) = v121;
      uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v204 = _allocateUninitializedArray<A>(_:)();
      v206 = v122;
      swift_retain();
      uint64_t v123 = v202;
      v124 = v206;
      char *v206 = v484;
      v124[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v123;
      swift_retain();
      uint64_t v125 = v203;
      unint64_t v126 = v206;
      v206[2] = v485;
      v126[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v125;
      swift_retain();
      unint64_t v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v205;
      v128 = v206;
      v206[4] = v486;
      v128[5] = v127;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v208, (os_log_type_t)v209))
      {
        uint64_t v129 = v522;
        v186 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v185 = 0;
        uint64_t v187 = createStorage<A>(capacity:type:)(0);
        uint64_t v188 = createStorage<A>(capacity:type:)(v185);
        v189 = &v610;
        v610 = v186;
        v190 = &v609;
        uint64_t v609 = v187;
        v191 = &v608;
        uint64_t v608 = v188;
        serialize(_:at:)(0, &v610);
        serialize(_:at:)(1, v189);
        v606 = v484;
        uint64_t v607 = v202;
        closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)v189, (uint64_t)v190, (uint64_t)v191);
        uint64_t v192 = v129;
        if (v129)
        {
          __break(1u);
        }
        else
        {
          v606 = v485;
          uint64_t v607 = v203;
          closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)&v610, (uint64_t)&v609, (uint64_t)&v608);
          uint64_t v183 = 0;
          v606 = v486;
          uint64_t v607 = v205;
          closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)&v610, (uint64_t)&v609, (uint64_t)&v608);
          _os_log_impl((void *)&_mh_execute_header, v208, (os_log_type_t)v209, "rsrp in data directory failed validation: %ld", v186, v196);
          uint64_t v182 = 0;
          destroyStorage<A>(_:count:)(v187);
          destroyStorage<A>(_:count:)(v188);
          UnsafeMutablePointer.deallocate()();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v524 + 8))(v530, v523);
      int v406 = 0;
    }
  }
  else
  {
    uint64_t v130 = v528;
    uint64_t v131 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v130, v131, v523);
    uint64_t v171 = 7;
    uint64_t v172 = swift_allocObject();
    *(void *)(v172 + 16) = v470;
    v180 = Logger.logObject.getter();
    int v181 = static os_log_type_t.error.getter();
    v167 = &v618;
    uint64_t v618 = 12;
    unint64_t v165 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v168 = v619;
    uint64_t v169 = 17;
    uint64_t v174 = swift_allocObject();
    *(unsigned char *)(v174 + 16) = 0;
    uint64_t v175 = swift_allocObject();
    *(unsigned char *)(v175 + 16) = 8;
    uint64_t v170 = 32;
    uint64_t v132 = swift_allocObject();
    uint64_t v133 = v172;
    uint64_t v173 = v132;
    *(void *)(v132 + 16) = v477;
    *(void *)(v132 + 24) = v133;
    uint64_t v134 = swift_allocObject();
    uint64_t v135 = v173;
    uint64_t v177 = v134;
    *(void *)(v134 + 16) = v478;
    *(void *)(v134 + 24) = v135;
    uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v176 = _allocateUninitializedArray<A>(_:)();
    uint64_t v178 = v136;
    swift_retain();
    uint64_t v137 = v174;
    uint64_t v138 = v178;
    *uint64_t v178 = v479;
    v138[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v137;
    swift_retain();
    uint64_t v139 = v175;
    uint64_t v140 = v178;
    v178[2] = v480;
    v140[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v139;
    swift_retain();
    v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v177;
    int v142 = v178;
    v178[4] = v481;
    v142[5] = v141;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v180, (os_log_type_t)v181))
    {
      uint64_t v143 = v522;
      uint64_t v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v157 = 0;
      uint64_t v159 = createStorage<A>(capacity:type:)(0);
      uint64_t v160 = createStorage<A>(capacity:type:)(v157);
      int v161 = &v617;
      v617 = v158;
      Swift::String v162 = &v616;
      uint64_t v616 = v159;
      v163 = &v615;
      uint64_t v615 = v160;
      serialize(_:at:)(0, &v617);
      serialize(_:at:)(1, v161);
      v613 = v479;
      uint64_t v614 = v174;
      closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163);
      uint64_t v164 = v143;
      if (v143)
      {
        __break(1u);
      }
      else
      {
        v613 = v480;
        uint64_t v614 = v175;
        closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)&v617, (uint64_t)&v616, (uint64_t)&v615);
        uint64_t v155 = 0;
        v613 = v481;
        uint64_t v614 = v177;
        closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)&v617, (uint64_t)&v616, (uint64_t)&v615);
        _os_log_impl((void *)&_mh_execute_header, v180, (os_log_type_t)v181, "rssi in data directory failed validation: %ld", v158, v168);
        uint64_t v154 = 0;
        destroyStorage<A>(_:count:)(v159);
        destroyStorage<A>(_:count:)(v160);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v524 + 8))(v528, v523);
    int v406 = 0;
  }
  return v406 & 1;
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v7 = String._bridgeToObjectiveC()();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  id v9 = [v6 initWithPattern:v7 options:a3 error:v10];
  id v3 = 0;

  if (v9)
  {

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
    return (id)v5;
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSMatchingOptions()
{
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSMatchingOptions()
{
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSMatchingOptions()
{
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSMatchingOptions()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSMatchingOptions()
{
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSMatchingOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSRegularExpressionOptions()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSRegularExpressionOptions protocol witness for OptionSet.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, NSRegularExpressionOptions *a2@<X8>)
{
  NSRegularExpressionOptions result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSMatchingOptions()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSMatchingOptions()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSMatchingOptions protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, NSMatchingOptions *a2@<X8>)
{
  NSMatchingOptions result = NSMatchingOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSRegularExpressionOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSRegularExpressionOptions result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSRegularExpressionOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSRegularExpressionOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

NSMatchingOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSMatchingOptions result = NSMatchingOptions.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSMatchingOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSMatchingOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)();
  }
  else {
    return 0;
  }
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

void destroyStorage<A>(_:count:)(uint64_t a1)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    UnsafeMutablePointer.deallocate()();
  }
}

Swift::Void __swiftcall Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  uint64_t v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v21, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = _StringObject.sharedUTF8.getter();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  uint64_t v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return specialized ContiguousArray.init()();
  }
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = specialized Array.count.getter(*v3);
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void specialized Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = a2;
  }
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v5 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v3 = (size_t)v5 + _swift_stdlib_malloc_size(v5);
      swift_retain();
      v5[2] = a1;
      v5[3] = 2 * (v3 - (void)(v5 + 4));
    }
    else
    {
      swift_retain();
      v5[2] = a1;
      v5[3] = 2 * v6;
    }
    swift_release();
    return v5;
  }
  else
  {
    swift_retain();
    return &_swiftEmptyArrayStorage;
  }
}

void *specialized ContiguousArray.init()()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v15 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v15 < a2)
    {
      if ((unsigned __int128)(v15 * (__int128)2) >> 64 != (2 * v15) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v15 < a2) {
        uint64_t v10 = a2;
      }
      else {
        uint64_t v10 = 2 * v15;
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  int64_t v9 = *(void *)(a4 + 16);
  if (v10 < v9) {
    uint64_t v8 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v8 = v10;
  }
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v7 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v5 = (size_t)v7 + _swift_stdlib_malloc_size(v7);
      swift_retain();
      v7[2] = v9;
      v7[3] = 2 * (v5 - (void)(v7 + 4));
    }
    else
    {
      swift_retain();
      v7[2] = v9;
      v7[3] = 2 * v8;
    }
    swift_release();
    uint64_t v6 = (char *)v7;
  }
  else
  {
    swift_retain();
    uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v9, v6 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v9, v6 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v6;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000C730()
{
  return swift_deallocObject();
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_10000C764()
{
  return swift_deallocObject();
}

unsigned char **closure #1 in OSLogArguments.append(_:)partial apply(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_10000C798()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000C7E4()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000C830()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_10000C87C()
{
  return swift_deallocObject();
}

uint64_t sub_10000C8B0()
{
  return swift_deallocObject();
}

uint64_t sub_10000C8E4()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000C930()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000C97C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_10000C9C8()
{
  return swift_deallocObject();
}

uint64_t sub_10000C9FC()
{
  return swift_deallocObject();
}

uint64_t sub_10000CA30()
{
  return swift_deallocObject();
}

uint64_t sub_10000CA7C()
{
  return swift_deallocObject();
}

uint64_t outlined init with copy of Int?(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_10000CAE4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in checkValidNumericInputRange(data:)()
{
  return implicit closure #11 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000CB18()
{
  return swift_deallocObject();
}

uint64_t sub_10000CB4C()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  char v14 = partial apply for closure #1 in serialize<A>(_:at:);
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v20, v14, (uint64_t)v22, v21, (uint64_t)&type metadata for Never, (uint64_t)&type metadata for () + 8, (uint64_t)&protocol witness table for Never, v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = __chkstk_darwin();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10000CE7C()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_10000CEC8()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

uint64_t sub_10000CFF8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in checkValidNumericInputRange(data:)()
{
  return implicit closure #13 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000D02C()
{
  return swift_deallocObject();
}

uint64_t sub_10000D060()
{
  return swift_deallocObject();
}

uint64_t sub_10000D094()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_10000D0E0()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

uint64_t sub_10000D194()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #15 in checkValidNumericInputRange(data:)()
{
  return implicit closure #15 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000D1C8()
{
  return swift_deallocObject();
}

uint64_t sub_10000D1FC()
{
  return swift_deallocObject();
}

uint64_t sub_10000D230()
{
  return swift_deallocObject();
}

uint64_t sub_10000D27C()
{
  return swift_deallocObject();
}

uint64_t sub_10000D330()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in checkValidNumericInputRange(data:)()
{
  return implicit closure #17 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000D364()
{
  return swift_deallocObject();
}

uint64_t sub_10000D398()
{
  return swift_deallocObject();
}

uint64_t sub_10000D3CC()
{
  return swift_deallocObject();
}

uint64_t sub_10000D418()
{
  return swift_deallocObject();
}

uint64_t sub_10000D4CC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #19 in checkValidNumericInputRange(data:)()
{
  return implicit closure #19 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000D500()
{
  return swift_deallocObject();
}

uint64_t sub_10000D534()
{
  return swift_deallocObject();
}

uint64_t sub_10000D568()
{
  return swift_deallocObject();
}

uint64_t sub_10000D5B4()
{
  return swift_deallocObject();
}

uint64_t sub_10000D668()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #21 in checkValidNumericInputRange(data:)()
{
  return implicit closure #21 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000D69C()
{
  return swift_deallocObject();
}

uint64_t sub_10000D6D0()
{
  return swift_deallocObject();
}

uint64_t sub_10000D704()
{
  return swift_deallocObject();
}

uint64_t sub_10000D750()
{
  return swift_deallocObject();
}

uint64_t sub_10000D804()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #23 in checkValidNumericInputRange(data:)()
{
  return implicit closure #23 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_10000D838()
{
  return swift_deallocObject();
}

uint64_t sub_10000D86C()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000D8C8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_10000D980()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_10000D9CC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #25 in checkValidNumericInputRange(data:)()
{
  return implicit closure #25 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_10000DA00()
{
  return swift_deallocObject();
}

uint64_t sub_10000DA34()
{
  return swift_deallocObject();
}

uint64_t sub_10000DA68()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000DAB4()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_10000DB00()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #27 in checkValidNumericInputRange(data:)()
{
  return implicit closure #27 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_10000DB34()
{
  return swift_deallocObject();
}

uint64_t sub_10000DB68()
{
  return swift_deallocObject();
}

uint64_t sub_10000DB9C()
{
  return swift_deallocObject();
}

uint64_t sub_10000DBE8()
{
  return swift_deallocObject();
}

unint64_t base witness table accessor for RawRepresentable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for RawRepresentable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
    return WitnessTable;
  }
  return v2;
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View()
{
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  uint64_t v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

Swift::Double __swiftcall getMean(nums:)(Swift::OpaquePointer nums)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence.reduce<A>(_:_:)();
  double v2 = Double.init(_:)(v3);
  return v2 / (double)specialized Array.count.getter();
}

double implicit closure #1 in getMean(nums:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type [Double] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

Swift::Double __swiftcall getMedian(nums:)(Swift::OpaquePointer nums)
{
  uint64_t v9 = specialized Array.count.getter() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence<>.sorted()();
  if (specialized Array.count.getter() % 2)
  {
    specialized Array.subscript.getter();
    Swift::Double v5 = Double.init(_:)(v4);
    swift_bridgeObjectRelease();
    return v5;
  }
  specialized Array.subscript.getter();
  double v8 = result;
  if (!__OFSUB__(v9, 1))
  {
    specialized Array.subscript.getter();
    Swift::Double v6 = Double.init(_:)((v8 + v3) / 2.0);
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

{
  Swift::Double result;
  Swift::Double v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = specialized Array.count.getter() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  lazy protocol witness table accessor for type [Int] and conformance [A]();
  Sequence<>.sorted()();
  if (specialized Array.count.getter() % 2)
  {
    Swift::Double v4 = (double)specialized Array.subscript.getter();
    swift_bridgeObjectRelease();
    return v4;
  }
  Swift::Double v6 = specialized Array.subscript.getter();
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    double v8 = specialized Array.subscript.getter();
    if (!__OFADD__(v6, v8))
    {
      swift_bridgeObjectRelease();
      return (double)((v6 + v8) / 2);
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [Int] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t getSteadyList(windowSize:rssiThreshold:rssiList:)(uint64_t a1)
{
  uint64_t v15 = specialized Array.count.getter();
  uint64_t v13 = a1 / 2;
  uint64_t v25 = _allocateUninitializedArray<A>(_:)();
  if (v15 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  specialized Collection<>.makeIterator()();
  while (1)
  {
    uint64_t result = specialized IndexingIterator.next()();
    uint64_t v12 = result;
    if (v2)
    {
      swift_bridgeObjectRetain();
      outlined destroy of [Int]();
      return v25;
    }
    if (v13 < v15)
    {
      if (result >= v13)
      {
        if (__OFSUB__(result, v13)) {
          goto LABEL_49;
        }
        uint64_t result = max<A>(_:_:)();
        uint64_t v24 = v18;
        if (__OFADD__(v12, v13)) {
          goto LABEL_50;
        }
        if (__OFSUB__(v15, 1)) {
          goto LABEL_51;
        }
        min<A>(_:_:)();
        uint64_t v23 = v17;
      }
      else
      {
        uint64_t v24 = 0;
        if (__OFADD__(result, v13)) {
          goto LABEL_52;
        }
        if (__OFSUB__(v15, 1)) {
          goto LABEL_53;
        }
        min<A>(_:_:)();
        uint64_t v23 = v16;
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (__OFSUB__(v15, 1)) {
        goto LABEL_54;
      }
      uint64_t v23 = v15 - 1;
    }
    if (v23 < v24)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
    lazy protocol witness table accessor for type [Int] and conformance [A]();
    lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
    MutableCollection.subscript.getter();
    outlined destroy of [Int]();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
    lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
    Sequence<>.max()();
    if (v22)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = v21;
    }
    uint64_t result = Sequence<>.min()();
    if (v20)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      uint64_t v10 = v19;
    }
    if (__OFSUB__(v11, v10)) {
      break;
    }
    abs<A>(_:)();
    specialized Array.append(_:)();
    swift_unknownObjectRelease();
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Int]()
{
}

unint64_t lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>;
  if (!lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ClosedRange<Int>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Int>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t getFlatList(durationThreshold:steadyList:)(uint64_t a1)
{
  uint64_t v30 = specialized Array.count.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  uint64_t result = v30;
  uint64_t v34 = v1;
  char v33 = 0;
  uint64_t v32 = 0;
  if (v30 < a1)
  {
LABEL_93:
    swift_bridgeObjectRetain();
    outlined destroy of [(start: Int, end: Int, count: Int)]();
    return v34;
  }
  if (!__OFSUB__(v30, 2))
  {
    if (v30 - 2 < 0)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    specialized Collection<>.makeIterator()();
    while (1)
    {
      uint64_t v31 = specialized IndexingIterator.next()();
      if (v4) {
        goto LABEL_93;
      }
      BOOL v28 = specialized Array.subscript.getter() != 0;
      uint64_t result = swift_bridgeObjectRetain();
      if (v28)
      {
        BOOL v27 = 0;
      }
      else
      {
        if (__OFADD__(v31, 1)) {
          goto LABEL_107;
        }
        BOOL v27 = specialized Array.subscript.getter() == 1;
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (v27)
      {
        char v33 = 0;
        if (__OFADD__(v31, 1)) {
          goto LABEL_106;
        }
        uint64_t v32 = v31 + 1;
      }
      else
      {
        BOOL v26 = specialized Array.subscript.getter() != 1;
        uint64_t result = swift_bridgeObjectRetain();
        if (v26)
        {
          BOOL v25 = 0;
        }
        else
        {
          if (__OFADD__(v31, 1)) {
            goto LABEL_105;
          }
          BOOL v25 = specialized Array.subscript.getter() == 0;
        }
        uint64_t result = swift_bridgeObjectRelease();
        if (v25)
        {
          char v33 = 0;
          if (__OFSUB__(v31, v32)) {
            goto LABEL_102;
          }
          if (v31 - v32 >= a1)
          {
            if (__OFSUB__(v31, v32)) {
              goto LABEL_103;
            }
            if (__OFADD__(v31 - v32, 1)) {
              goto LABEL_104;
            }
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
            uint64_t result = Array.append(_:)();
          }
        }
        else
        {
          BOOL v24 = specialized Array.subscript.getter() != 1;
          uint64_t result = swift_bridgeObjectRetain();
          if (v24)
          {
            BOOL v23 = 0;
          }
          else
          {
            if (__OFADD__(v31, 1)) {
              goto LABEL_101;
            }
            BOOL v23 = specialized Array.subscript.getter() == 1;
          }
          uint64_t result = swift_bridgeObjectRelease();
          if (v23)
          {
            char v33 = 1;
          }
          else
          {
            BOOL v22 = specialized Array.subscript.getter() != 0;
            uint64_t result = swift_bridgeObjectRetain();
            if (v22)
            {
              BOOL v21 = 0;
            }
            else
            {
              if (__OFADD__(v31, 1)) {
                goto LABEL_100;
              }
              BOOL v21 = specialized Array.subscript.getter() == 0;
            }
            uint64_t result = swift_bridgeObjectRelease();
            if (v21) {
              char v33 = 0;
            }
          }
        }
      }
      if (__OFSUB__(v30, 2)) {
        goto LABEL_95;
      }
      if (v31 == v30 - 2 && (v33 & 1) == 1)
      {
        uint64_t v19 = v30 - 1;
        if (__OFSUB__(v30, 1)) {
          goto LABEL_98;
        }
        if (__OFSUB__(v19, v32)) {
          goto LABEL_99;
        }
        BOOL v18 = v19 - v32 >= a1;
      }
      else
      {
        BOOL v18 = 0;
      }
      if (v18)
      {
        if (__OFSUB__(v30, 1)) {
          goto LABEL_96;
        }
        if (__OFSUB__(v30, v32)) {
          goto LABEL_97;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
        Array.append(_:)();
      }
    }
  }
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  __break(1u);
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
  return result;
}

uint64_t getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
  uint64_t v27 = _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  if (Array.count.getter() > 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
    lazy protocol witness table accessor for type [(start: Int, end: Int, count: Int)] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[(start: Int, end: Int, count: Int)]>);
      IndexingIterator.next()();
      if (v26) {
        break;
      }
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
      lazy protocol witness table accessor for type [Double] and conformance [A]();
      lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Double>);
      lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>();
      uint64_t nums = Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
      lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
      uint64_t v15 = Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      uint64_t v14 = Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      uint64_t v13 = Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      uint64_t v12 = Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v25 < v24)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [String]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<String>);
      lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>();
      Array.init<A>(_:)();
      Swift::Double v7 = getMedian(nums:)((Swift::OpaquePointer)nums);
      Swift::Double v8 = getMedian(nums:)((Swift::OpaquePointer)v15);
      Swift::Double v9 = getMedian(nums:)((Swift::OpaquePointer)v14);
      Swift::Double v10 = getMedian(nums:)((Swift::OpaquePointer)v13);
      Swift::Double v11 = getMedian(nums:)((Swift::OpaquePointer)v12);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      Sequence<>.min()();
      if (v23)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        uint64_t v6 = v22;
      }
      Sequence<>.min()();
      if (v21)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        uint64_t v5 = v20;
      }
      lazy protocol witness table accessor for type [String] and conformance [A]();
      Sequence<>.min()();
      if (v19)
      {
        uint64_t v3 = v18;
        uint64_t v4 = v19;
      }
      else
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      uint64_t v17 = specialized Array.count.getter();
      specialized _allocateUninitializedArray<A>(_:)();
      uint64_t v2 = v0;
      v0[3] = &type metadata for Double;
      *(Swift::Double *)uint64_t v0 = v7;
      v0[7] = &type metadata for Double;
      *((Swift::Double *)v0 + 4) = v8;
      v0[11] = &type metadata for Double;
      *((Swift::Double *)v0 + 8) = v9;
      v0[15] = &type metadata for Double;
      *((Swift::Double *)v0 + 12) = v10;
      v0[19] = &type metadata for Double;
      *((Swift::Double *)v0 + 16) = v11;
      v0[23] = &type metadata for Int;
      v0[20] = v6;
      v0[27] = &type metadata for Int;
      v0[24] = v5;
      swift_bridgeObjectRetain();
      v2[31] = &type metadata for String;
      v2[28] = v3;
      v2[29] = v4;
      v2[35] = &type metadata for Int;
      v2[32] = v17;
      _finalizeUninitializedArray<A>(_:)();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [[Any]]);
      Array.append(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    outlined destroy of IndexingIterator<[(start: Int, end: Int, count: Int)]>();
  }
  swift_bridgeObjectRetain();
  outlined destroy of [[Any]]();
  return v27;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [[Any]]()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Double]()
{
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Double>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [String]()
{
}

unint64_t lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<String>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t preprocessData(rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)()
{
  getSteadyList(windowSize:rssiThreshold:rssiList:)(7);
  getFlatList(durationThreshold:steadyList:)(3);
  uint64_t v1 = getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t PluginErrors.description.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataFrame is wrong and doesn't contain required columns", 0x37uLL, 1)._countAndFlagsBits;
}

uint64_t PluginErrors.errorDescription.getter()
{
  return PluginErrors.description.getter();
}

uint64_t static PluginErrors.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t PluginErrors.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t PluginErrors.hashValue.getter()
{
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors()
{
  uint64_t v2 = lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors;
  if (!lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors;
  if (!lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors;
  if (!lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type PluginErrors and conformance PluginErrors);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PluginErrors()
{
  return static PluginErrors.__derived_enum_equals(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance PluginErrors()
{
  return PluginErrors.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PluginErrors()
{
  return PluginErrors.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PluginErrors(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance PluginErrors()
{
  return PluginErrors.errorDescription.getter();
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance PluginErrors()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance PluginErrors()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance PluginErrors()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PluginErrors()
{
  return PluginErrors.description.getter();
}

uint64_t protocol witness for Error._domain.getter in conformance PluginErrors()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance PluginErrors()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance PluginErrors()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance PluginErrors()
{
  return Error._getEmbeddedNSError()();
}

void reportErrorMetrics(interfaceType:validationMeanAbsPercentError:trainingMeanAbsPercentError:rmseError:experimentID:deploymentID:treatmentID:carrierCount:appCount:sessionCount:ssidCount:trainingDataCount:)(Swift::Int a1, uint64_t a2, void *a3, Swift::Int32 a4, uint64_t a5, void *a6, Swift::Int a7, Swift::Int a8, double a9, double a10, Swift::Double a11, Swift::Int a12, Swift::Int a13, Swift::Int a14)
{
  string._uint64_t countAndFlagsBits = a2;
  string._object = a3;
  v23._uint64_t countAndFlagsBits = a5;
  v23._object = a6;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML.ValidationError", 0x21uLL, 1);
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, NSObject));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v24 = v14;
  *uint64_t v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("InterfaceType", 0xDuLL, 1);
  type metadata accessor for NSNumber();
  v24[1]._uint64_t countAndFlagsBits = (uint64_t)NSNumber.__allocating_init(value:)(a1).super.super.isa;
  *(Swift::String *)((char *)v24 + 24) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("InterfaceType_string", 0x14uLL, 1);
  v24[2]._object = NSNumber.__allocating_init(value:)(a1).super.super.isa;
  v24[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ValidationError_MAPE", 0x14uLL, 1);
  v24[4]._uint64_t countAndFlagsBits = (uint64_t)NSNumber.__allocating_init(value:)(a9 * 1000.0).super.super.isa;
  *(Swift::String *)((char *)v24 + 72) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TrainingError_MAPE", 0x12uLL, 1);
  v24[5]._object = NSNumber.__allocating_init(value:)(a10 * 1000.0).super.super.isa;
  v24[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ValidationError_RMSE", 0x14uLL, 1);
  v24[7]._uint64_t countAndFlagsBits = (uint64_t)NSNumber.__allocating_init(value:)(a11).super.super.isa;
  *(Swift::String *)((char *)v24 + 120) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CarrierCount", 0xCuLL, 1);
  v24[8]._object = NSNumber.__allocating_init(value:)(a7).super.super.isa;
  v24[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("AppCount", 8uLL, 1);
  v24[10]._uint64_t countAndFlagsBits = (uint64_t)NSNumber.__allocating_init(value:)(a8).super.super.isa;
  *(Swift::String *)((char *)v24 + 168) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SessionCount", 0xCuLL, 1);
  v24[11]._object = NSNumber.__allocating_init(value:)(a12).super.super.isa;
  v24[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SSIDCount", 9uLL, 1);
  v24[13]._uint64_t countAndFlagsBits = (uint64_t)NSNumber.__allocating_init(value:)(a13).super.super.isa;
  *(Swift::String *)((char *)v24 + 216) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TrainingDataCount", 0x11uLL, 1);
  v24[14]._object = NSNumber.__allocating_init(value:)(a14).super.super.isa;
  v24[15] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trialExperimentId", 0x11uLL, 1);
  type metadata accessor for NSString();
  swift_bridgeObjectRetain();
  v24[16]._uint64_t countAndFlagsBits = (uint64_t)NSString.__allocating_init(string:)(string);
  *(Swift::String *)((char *)v24 + 264) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trialDeploymentId", 0x11uLL, 1);
  v24[17]._object = NSNumber.__allocating_init(value:)(a4).super.super.isa;
  v24[18] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trialTreatmentId", 0x10uLL, 1);
  swift_bridgeObjectRetain();
  v24[19]._uint64_t countAndFlagsBits = (uint64_t)NSString.__allocating_init(string:)(v23);
  _finalizeUninitializedArray<A>(_:)();
  type metadata accessor for NSObject();
  Dictionary.init(dictionaryLiteral:)();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
}

unint64_t type metadata accessor for NSNumber()
{
  uint64_t v2 = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    return ObjCClassMetadata;
  }
  return v2;
}

NSNumber __swiftcall NSNumber.__allocating_init(value:)(Swift::Int value)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSNumber)@nonobjc NSNumber.init(value:)(value);
}

NSNumber __swiftcall NSNumber.__allocating_init(value:)(Swift::Double value)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSNumber)@nonobjc NSNumber.init(value:)();
}

unint64_t type metadata accessor for NSString()
{
  uint64_t v2 = lazy cache variable for type metadata for NSString;
  if (!lazy cache variable for type metadata for NSString)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSString);
    return ObjCClassMetadata;
  }
  return v2;
}

NSString __swiftcall NSString.__allocating_init(string:)(Swift::String string)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc NSString.init(string:)();
}

NSNumber __swiftcall NSNumber.__allocating_init(value:)(Swift::Int32 value)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSNumber)@nonobjc NSNumber.init(value:)(value);
}

unint64_t type metadata accessor for NSObject()
{
  uint64_t v2 = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t MediaMLPlugin.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MediaMLPlugin.logger);
}

uint64_t static MediaMLPlugin.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MediaMLPlugin.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of MediaMLPlugin.dbPath@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  uint64_t v1 = (char *)&v4 - v5;
  Swift::Double v10 = (char *)&v4 - v5;
  uint64_t v2 = mediaMLDataDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v1, v2, v11);
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rawdata.db", 0xAuLL, 1)._object;
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t MediaMLPlugin.dbPath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR___MediaMLPlugin_dbPath;
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t MediaMLPlugin.database.getter()
{
  uint64_t v19 = 0;
  Swift::Double v7 = partial apply for implicit closure #1 in MediaMLPlugin.database.getter;
  uint64_t v8 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  uint64_t v9 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  Swift::Double v10 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  uint64_t v11 = closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v12 = partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v13 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v17 = &v3[-v16];
  unint64_t v18 = (*(void *)(*(void *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v19);
  uint64_t v25 = &v3[-v18];
  uint64_t v31 = v0;
  type metadata accessor for SQLiteDB();
  uint64_t v20 = OBJC_IVAR___MediaMLPlugin_dbPath;
  uint64_t v24 = type metadata accessor for URL();
  uint64_t v22 = *(void *)(v24 - 8);
  uint64_t v23 = v24 - 8;
  (*(void (**)(unsigned char *, uint64_t))(v22 + 16))(v25, v21 + v20);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v24);
  uint64_t v26 = SQLiteDB.__allocating_init(_:)(v25);
  uint64_t v27 = 0;
  uint64_t v5 = v26;
  uint64_t v29 = v26;
  swift_retain();
  uint64_t v4 = &v28;
  uint64_t v28 = v5;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  uint64_t v6 = OSAllocatedUnfairLock<A>.init(initialState:)((uint64_t)v4, v1);
  swift_release();
  return v6;
}

uint64_t OSAllocatedUnfairLock<A>.init(initialState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v10 = a2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = a2 - 8;
  unint64_t v3 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(a1);
  uint64_t v4 = (uint64_t)&v3 - v3;
  (*(void (**)(void))(v5 + 16))();
  uint64_t v9 = OSAllocatedUnfairLock.init(uncheckedState:)(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v7);
  return v9;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in MediaMLPlugin.database.getter()
{
}

uint64_t sub_10001264C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaMLPlugin.database.getter()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in MediaMLPlugin.database.getter();
  return result;
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t MediaMLPlugin.checkAndPruneProcessedWifiDB()()
{
  v1[27] = v0;
  v1[13] = v1;
  v1[14] = 0;
  v1[16] = 0;
  v1[18] = 0;
  v1[19] = 0;
  v1[20] = 0;
  v1[21] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[28] = v2;
  v1[29] = *(void *)(v2 - 8);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[14] = v0;
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedWifiDB(), 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[35];
  uint64_t v2 = v0[34];
  unint64_t v3 = v0[32];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB());
  v0[36] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  void *v0;
  Swift::Int *v1;
  uint64_t v2;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  os_log_t oslog;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *buf;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint32_t size;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  os_log_type_t v61;
  Swift::Int v62;
  Swift::Int v63;
  uint64_t v64;
  Swift::Int v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  void *v71;
  uint64_t v72;

  unint64_t v71 = v0;
  v0[13] = v0;
  uint64_t v65 = v0[17];
  v0[19] = v65;
  if (v65 < *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor())
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v18 = *(uint64_t (**)(void))(*(void *)(v64 + 104) + 8);
    return v18();
  }
  uint64_t v1 = MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor();
  uint64_t v63 = v65 - *v1;
  if (__OFSUB__(v65, *v1))
  {
    __break(1u);
LABEL_35:
    __break(1u);
    return _swift_task_switch(v1, v2);
  }
  uint64_t v1 = MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor();
  uint64_t v62 = v63 + *v1;
  uint64_t v4 = __OFADD__(v63, *v1);
  *(void *)(v64 + 296) = v63 + *v1;
  if (v4) {
    goto LABEL_35;
  }
  uint64_t v5 = *(void *)(v64 + 248);
  v52 = *(void *)(v64 + 224);
  uint64_t v51 = *(void *)(v64 + 232);
  *(void *)(v64 + 160) = v62;
  uint64_t v50 = swift_allocObject();
  *(void *)(v64 + 304) = v50;
  *(void *)(v64 + 168) = v50 + 16;
  *(void *)(v50 + 16) = *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  uint64_t v6 = MediaMLPlugin.logger.unsafeMutableAddressor();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  *(void *)(v64 + 312) = v7;
  *(void *)(v64 + 320) = (v51 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v5, v6, v52);
  v54 = swift_allocObject();
  *(void *)(v54 + 16) = v62;
  v60 = Logger.logObject.getter();
  uint64_t v61 = static os_log_type_t.info.getter();
  *(void *)(v64 + 176) = 12;
  *(void *)(v64 + 328) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v64 + 336) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v64 + 344) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v64 + 504);
  v56 = swift_allocObject();
  *(unsigned char *)(v56 + 16) = 0;
  uint64_t v57 = swift_allocObject();
  *(unsigned char *)(v57 + 16) = 8;
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = partial apply for implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedWifiDB();
  *(void *)(v55 + 24) = v54;
  v58 = swift_allocObject();
  *(void *)(v58 + 16) = _sSiIegd_SiIegr_TRTA_0;
  *(void *)(v58 + 24) = v55;
  *(void *)(v64 + 352) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v59 = v8;
  swift_retain();
  *uint64_t v59 = closure #1 in OSLogArguments.append(_:)partial apply;
  v59[1] = v56;
  swift_retain();
  v59[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v59[3] = v57;
  swift_retain();
  v59[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v59[5] = v58;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v9 = *(void *)(v64 + 288);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v48 = createStorage<A>(capacity:type:)(0);
    uint64_t v49 = createStorage<A>(capacity:type:)(0);
    v66 = buf;
    uint64_t v67 = v48;
    v68 = v49;
    serialize(_:at:)(0, &v66);
    serialize(_:at:)(1, &v66);
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    unint64_t v70 = v56;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    if (v9) {
      return result;
    }
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    unint64_t v70 = v57;
    closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    unint64_t v70 = v58;
    closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "processedWiFi raw data too large, deleting %ld rows", buf, size);
    destroyStorage<A>(_:count:)(v48);
    destroyStorage<A>(_:count:)(v49);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = 0;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = *(void *)(v64 + 288);
  }
  *(void *)(v64 + 360) = v46;
  uint64_t v44 = *(void *)(v64 + 248);
  uint64_t v45 = *(void *)(v64 + 224);
  uint64_t v43 = *(void *)(v64 + 232);

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  *(void *)(v64 + 368) = v11;
  *(void *)(v64 + 376) = (v43 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v11(v44, v45);
  if (v62 < *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor())
  {
    v42 = *(void *)(v64 + 264);
    *(Swift::String *)(v64 + 384) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedwifi LIMIT ?", 0x21uLL, 1);
    uint64_t v12 = swift_task_alloc();
    uint64_t v2 = v42;
    *(void *)(v64 + 400) = v12;
    *(void *)(v12 + 16) = v62;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedWifiDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v39 = *(void *)(v64 + 304);
  v40 = *(void *)(v64 + 296);
  swift_beginAccess();
  uint64_t v41 = *(void *)(v39 + 16);
  swift_endAccess();
  if (v41 >= v40)
  {
    *(void *)(v64 + 448) = v46;
    uint64_t v19 = *(void *)(v64 + 264);
    uint64_t v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
    uint64_t v2 = v19;
    *(Swift::String *)(v64 + 456) = v17;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedWifiDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 312);
  uint64_t v31 = *(void *)(v64 + 304);
  uint64_t v13 = *(void *)(v64 + 240);
  uint64_t v28 = *(void *)(v64 + 224);
  uint64_t v14 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v29(v13, v14, v28);
  swift_retain();
  oslog = (os_log_t)Logger.logObject.getter();
  v38 = static os_log_type_t.debug.getter();
  *(void *)(v64 + 184) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v30 = *(_DWORD *)(v64 + 508);
  char v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = swift_allocObject();
  *(unsigned char *)(v34 + 16) = 8;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB();
  *(void *)(v32 + 24) = v31;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v35 + 24) = v32;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v36 = v15;
  swift_retain();
  *uint64_t v36 = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[1] = v33;
  swift_retain();
  v36[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[3] = v34;
  swift_retain();
  v36[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v36[5] = v35;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(oslog, v38))
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v24 = v46;
LABEL_25:
    *(void *)(v64 + 416) = v24;
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v64 + 368);
    uint64_t v23 = *(void *)(v64 + 264);
    uint64_t v20 = *(void *)(v64 + 240);
    uint64_t v21 = *(void *)(v64 + 224);

    v22(v20, v21);
    unint64_t v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedwifi LIMIT ?", 0x21uLL, 1);
    uint64_t v2 = v23;
    *(Swift::String *)(v64 + 424) = v16;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedWifiDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v25 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v26 = createStorage<A>(capacity:type:)(0);
  uint64_t v27 = createStorage<A>(capacity:type:)(0);
  *(void *)(v64 + 192) = v25;
  *(void *)(v64 + 200) = v26;
  *(void *)(v64 + 208) = v27;
  serialize(_:at:)(0, (unsigned char **)(v64 + 192));
  serialize(_:at:)(1, (unsigned char **)(v64 + 192));
  *(void *)(v64 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
  *(void *)(v64 + 96) = v33;
  uint64_t result = closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
  if (!v46)
  {
    *(void *)(v64 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
    *(void *)(v64 + 96) = v34;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
    *(void *)(v64 + 88) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    *(void *)(v64 + 96) = v35;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "Deleting %ldth rows", v25, v30);
    destroyStorage<A>(_:count:)(v26);
    destroyStorage<A>(_:count:)(v27);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v24 = 0;
    goto LABEL_25;
  }
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[49];
  uint64_t v2 = v0[48];
  unint64_t v3 = v0[45];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #3 in MediaMLPlugin.checkAndPruneProcessedWifiDB());
  v0[51] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  *(void *)(v0 + 104) = v0;
  *(void *)(v0 + 448) = *(void *)(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 264);
  *(Swift::String *)(v0 + 456) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedWifiDB(), v2);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[54];
  uint64_t v2 = v0[53];
  unint64_t v3 = v0[52];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #4 in MediaMLPlugin.checkAndPruneProcessedWifiDB());
  v0[55] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  Swift::Int *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::Int v38;
  uint64_t v39;

  uint64_t v36 = *(void *)(v0 + 304);
  *(void *)(v0 + 104) = v0;
  swift_beginAccess();
  uint64_t v37 = *(void *)(v36 + 16);
  swift_endAccess();
  uint64_t v1 = DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  v38 = v37 + *v1;
  if (__OFADD__(v37, *v1))
  {
    __break(1u);
    return _swift_task_switch(v1, v2);
  }
  uint64_t v11 = *(void *)(v35 + 304);
  swift_beginAccess();
  *(void *)(v11 + 16) = v38;
  swift_endAccess();
  uint64_t v20 = *(void *)(v35 + 440);
  uint64_t v12 = *(void *)(v35 + 304);
  uint64_t v13 = *(void *)(v35 + 296);
  swift_beginAccess();
  uint64_t v14 = *(void *)(v12 + 16);
  swift_endAccess();
  if (v14 >= v13)
  {
    *(void *)(v35 + 448) = v20;
    uint64_t v10 = *(void *)(v35 + 264);
    uint64_t v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
    uint64_t v2 = v10;
    *(Swift::String *)(v35 + 456) = v9;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedWifiDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 312);
  uint64_t v27 = *(void *)(v35 + 304);
  uint64_t v4 = *(void *)(v35 + 240);
  uint64_t v24 = *(void *)(v35 + 224);
  uint64_t v5 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v25(v4, v5, v24);
  swift_retain();
  char v33 = Logger.logObject.getter();
  uint64_t v34 = static os_log_type_t.debug.getter();
  *(void *)(v35 + 184) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v26 = *(_DWORD *)(v35 + 508);
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 0;
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = 8;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB();
  *(void *)(v28 + 24) = v27;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v31 + 24) = v28;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v32 = v6;
  swift_retain();
  *uint64_t v32 = closure #1 in OSLogArguments.append(_:)partial apply;
  v32[1] = v29;
  swift_retain();
  v32[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v32[3] = v30;
  swift_retain();
  v32[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v32[5] = v31;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v33, v34))
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = v20;
LABEL_11:
    *(void *)(v35 + 416) = v19;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v35 + 368);
    unint64_t v18 = *(void *)(v35 + 264);
    uint64_t v15 = *(void *)(v35 + 240);
    unint64_t v16 = *(void *)(v35 + 224);

    v17(v15, v16);
    uint64_t v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedwifi LIMIT ?", 0x21uLL, 1);
    uint64_t v2 = v18;
    *(Swift::String *)(v35 + 424) = v8;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedWifiDB();
    return _swift_task_switch(v1, v2);
  }
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v22 = createStorage<A>(capacity:type:)(0);
  uint64_t v23 = createStorage<A>(capacity:type:)(0);
  *(void *)(v35 + 192) = buf;
  *(void *)(v35 + 200) = v22;
  *(void *)(v35 + 208) = v23;
  serialize(_:at:)(0, (unsigned char **)(v35 + 192));
  serialize(_:at:)(1, (unsigned char **)(v35 + 192));
  *(void *)(v35 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
  *(void *)(v35 + 96) = v29;
  uint64_t result = closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
  if (!v20)
  {
    *(void *)(v35 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
    *(void *)(v35 + 96) = v30;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
    *(void *)(v35 + 88) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    *(void *)(v35 + 96) = v31;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Deleting %ldth rows", buf, v26);
    destroyStorage<A>(_:count:)(v22);
    destroyStorage<A>(_:count:)(v23);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = 0;
    goto LABEL_11;
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v1 = *(Swift::String *)(v0 + 456);
  *(void *)(v0 + 104) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 472) = v2;
  if (v2)
  {
    unint64_t v3 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  return _swift_task_switch(v3, 0);
}

{
  Swift::String *v0;
  void *object;
  uint64_t v3;

  object = v0[16]._object;
  v0[6]._object = v0;
  v0[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedWifiDB(), object);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v1 = *(Swift::String *)(v0 + 480);
  *(void *)(v0 + 104) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 496) = v2;
  if (v2)
  {
    unint64_t v3 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = MediaMLPlugin.checkAndPruneProcessedWifiDB();
  }
  return _swift_task_switch(v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 104) = v0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 104) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[36];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[51];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[55];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[59];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[62];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

void MediaMLPlugin.checkAndPruneProcessedWifiDB()()
{
  uint64_t v1 = (void *)v0[27];
  v0[13] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.checkAndPruneProcessedWifiDB(), 0, v11, v2, v2);
  v0[32] = 0;
  swift_release();
  object = v10[7]._object;
  v10[16]._object = object;
  if (object)
  {
    v10[8]._uint64_t countAndFlagsBits = (uint64_t)object;
    v10[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from processedwifi", 0x22uLL, 1);
    _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedWifiDB(), object);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    uint64_t v7 = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = v7;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (void (*)(void))*((void *)v10[6]._object + 1);
    v5();
  }
}

void *closure #1 in MediaMLPlugin.checkAndPruneProcessedWifiDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

void OSAllocatedUnfairLock.withLock<A>(_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void *, _UNKNOWN **))(*(void *)a1 + 160))(v7, &type metadata for Int, &protocol witness table for Int);
  if (v2)
  {
    swift_errorRelease();
    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t closure #3 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  v3[3] = &type metadata for Int;
  v3[4] = &protocol witness table for Int;
  *Swift::String v3 = a2;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 16);
  swift_endAccess();
  return v3;
}

uint64_t closure #4 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v6 = v2;
  Swift::Int v3 = *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  v6[3] = (Swift::Int)&type metadata for Int;
  v6[4] = (Swift::Int)&protocol witness table for Int;
  *uint64_t v6 = v3;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t MediaMLPlugin.checkAndPruneProcessedCellDB()()
{
  v1[27] = v0;
  v1[13] = v1;
  v1[14] = 0;
  v1[16] = 0;
  v1[18] = 0;
  v1[19] = 0;
  v1[20] = 0;
  v1[21] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[28] = v2;
  v1[29] = *(void *)(v2 - 8);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[14] = v0;
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedCellDB(), 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[35];
  uint64_t v2 = v0[34];
  Swift::Int v3 = v0[32];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB());
  v0[36] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  void *v0;
  Swift::Int *v1;
  uint64_t v2;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint32_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  os_log_t oslog;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *buf;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint32_t size;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  os_log_type_t v61;
  Swift::Int v62;
  Swift::Int v63;
  uint64_t v64;
  Swift::Int v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  void *v71;
  uint64_t v72;

  unint64_t v71 = v0;
  v0[13] = v0;
  uint64_t v65 = v0[17];
  v0[19] = v65;
  if (v65 < *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor())
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v18 = *(uint64_t (**)(void))(*(void *)(v64 + 104) + 8);
    return v18();
  }
  uint64_t v1 = MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor();
  uint64_t v63 = v65 - *v1;
  if (__OFSUB__(v65, *v1))
  {
    __break(1u);
LABEL_35:
    __break(1u);
    return _swift_task_switch(v1, v2);
  }
  uint64_t v1 = MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor();
  uint64_t v62 = v63 + *v1;
  uint64_t v4 = __OFADD__(v63, *v1);
  *(void *)(v64 + 296) = v63 + *v1;
  if (v4) {
    goto LABEL_35;
  }
  char v5 = *(void *)(v64 + 248);
  v52 = *(void *)(v64 + 224);
  uint64_t v51 = *(void *)(v64 + 232);
  *(void *)(v64 + 160) = v62;
  uint64_t v50 = swift_allocObject();
  *(void *)(v64 + 304) = v50;
  *(void *)(v64 + 168) = v50 + 16;
  *(void *)(v50 + 16) = *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  uint64_t v6 = MediaMLPlugin.logger.unsafeMutableAddressor();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
  *(void *)(v64 + 312) = v7;
  *(void *)(v64 + 320) = (v51 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v5, v6, v52);
  v54 = swift_allocObject();
  *(void *)(v54 + 16) = v62;
  v60 = Logger.logObject.getter();
  uint64_t v61 = static os_log_type_t.info.getter();
  *(void *)(v64 + 176) = 12;
  *(void *)(v64 + 328) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v64 + 336) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v64 + 344) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v64 + 504);
  v56 = swift_allocObject();
  *(unsigned char *)(v56 + 16) = 0;
  uint64_t v57 = swift_allocObject();
  *(unsigned char *)(v57 + 16) = 8;
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = partial apply for implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedCellDB();
  *(void *)(v55 + 24) = v54;
  v58 = swift_allocObject();
  *(void *)(v58 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v58 + 24) = v55;
  *(void *)(v64 + 352) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v59 = v8;
  swift_retain();
  *uint64_t v59 = closure #1 in OSLogArguments.append(_:)partial apply;
  v59[1] = v56;
  swift_retain();
  v59[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v59[3] = v57;
  swift_retain();
  v59[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v59[5] = v58;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v9 = *(void *)(v64 + 288);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v48 = createStorage<A>(capacity:type:)(0);
    uint64_t v49 = createStorage<A>(capacity:type:)(0);
    v66 = buf;
    uint64_t v67 = v48;
    v68 = v49;
    serialize(_:at:)(0, &v66);
    serialize(_:at:)(1, &v66);
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    unint64_t v70 = v56;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    if (v9) {
      return result;
    }
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    unint64_t v70 = v57;
    closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    unint64_t v70 = v58;
    closure #1 in osLogInternal(_:log:type:)(&v69, (uint64_t)&v66, (uint64_t)&v67, (uint64_t)&v68);
    _os_log_impl((void *)&_mh_execute_header, v60, v61, "processedcell data too large, deleting %ld rows", buf, size);
    destroyStorage<A>(_:count:)(v48);
    destroyStorage<A>(_:count:)(v49);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = 0;
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = *(void *)(v64 + 288);
  }
  *(void *)(v64 + 360) = v46;
  uint64_t v44 = *(void *)(v64 + 248);
  uint64_t v45 = *(void *)(v64 + 224);
  uint64_t v43 = *(void *)(v64 + 232);

  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  *(void *)(v64 + 368) = v11;
  *(void *)(v64 + 376) = (v43 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v11(v44, v45);
  if (v62 < *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor())
  {
    v42 = *(void *)(v64 + 264);
    *(Swift::String *)(v64 + 384) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedcell LIMIT ?", 0x21uLL, 1);
    uint64_t v12 = swift_task_alloc();
    uint64_t v2 = v42;
    *(void *)(v64 + 400) = v12;
    *(void *)(v12 + 16) = v62;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedCellDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v39 = *(void *)(v64 + 304);
  v40 = *(void *)(v64 + 296);
  swift_beginAccess();
  uint64_t v41 = *(void *)(v39 + 16);
  swift_endAccess();
  if (v41 >= v40)
  {
    *(void *)(v64 + 448) = v46;
    uint64_t v19 = *(void *)(v64 + 264);
    uint64_t v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
    uint64_t v2 = v19;
    *(Swift::String *)(v64 + 456) = v17;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedCellDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 312);
  uint64_t v31 = *(void *)(v64 + 304);
  MediaMLPlugin::SQLError v13 = *(void *)(v64 + 240);
  uint64_t v28 = *(void *)(v64 + 224);
  uint64_t v14 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v29(v13, v14, v28);
  swift_retain();
  oslog = (os_log_t)Logger.logObject.getter();
  v38 = static os_log_type_t.debug.getter();
  *(void *)(v64 + 184) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v30 = *(_DWORD *)(v64 + 508);
  char v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = swift_allocObject();
  *(unsigned char *)(v34 + 16) = 8;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB();
  *(void *)(v32 + 24) = v31;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v35 + 24) = v32;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v36 = v15;
  swift_retain();
  *uint64_t v36 = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[1] = v33;
  swift_retain();
  v36[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[3] = v34;
  swift_retain();
  v36[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v36[5] = v35;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(oslog, v38))
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v24 = v46;
LABEL_25:
    *(void *)(v64 + 416) = v24;
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v64 + 368);
    uint64_t v23 = *(void *)(v64 + 264);
    uint64_t v20 = *(void *)(v64 + 240);
    uint64_t v21 = *(void *)(v64 + 224);

    v22(v20, v21);
    unint64_t v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedcell LIMIT ?", 0x21uLL, 1);
    uint64_t v2 = v23;
    *(Swift::String *)(v64 + 424) = v16;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedCellDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v25 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v26 = createStorage<A>(capacity:type:)(0);
  uint64_t v27 = createStorage<A>(capacity:type:)(0);
  *(void *)(v64 + 192) = v25;
  *(void *)(v64 + 200) = v26;
  *(void *)(v64 + 208) = v27;
  serialize(_:at:)(0, (unsigned char **)(v64 + 192));
  serialize(_:at:)(1, (unsigned char **)(v64 + 192));
  *(void *)(v64 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
  *(void *)(v64 + 96) = v33;
  uint64_t result = closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
  if (!v46)
  {
    *(void *)(v64 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
    *(void *)(v64 + 96) = v34;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
    *(void *)(v64 + 88) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    *(void *)(v64 + 96) = v35;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 88), v64 + 192, v64 + 200, v64 + 208);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "Deleting %ldth rows", v25, v30);
    destroyStorage<A>(_:count:)(v26);
    destroyStorage<A>(_:count:)(v27);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v24 = 0;
    goto LABEL_25;
  }
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[49];
  uint64_t v2 = v0[48];
  Swift::Int v3 = v0[45];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #3 in MediaMLPlugin.checkAndPruneProcessedCellDB());
  v0[51] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  *(void *)(v0 + 104) = v0;
  *(void *)(v0 + 448) = *(void *)(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 264);
  *(Swift::String *)(v0 + 456) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedCellDB(), v2);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[54];
  uint64_t v2 = v0[53];
  Swift::Int v3 = v0[52];
  v0[13] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #4 in MediaMLPlugin.checkAndPruneProcessedCellDB());
  v0[55] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  Swift::Int *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::Int v38;
  uint64_t v39;

  uint64_t v36 = *(void *)(v0 + 304);
  *(void *)(v0 + 104) = v0;
  swift_beginAccess();
  uint64_t v37 = *(void *)(v36 + 16);
  swift_endAccess();
  uint64_t v1 = DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  v38 = v37 + *v1;
  if (__OFADD__(v37, *v1))
  {
    __break(1u);
    return _swift_task_switch(v1, v2);
  }
  uint64_t v11 = *(void *)(v35 + 304);
  swift_beginAccess();
  *(void *)(v11 + 16) = v38;
  swift_endAccess();
  uint64_t v20 = *(void *)(v35 + 440);
  uint64_t v12 = *(void *)(v35 + 304);
  MediaMLPlugin::SQLError v13 = *(void *)(v35 + 296);
  swift_beginAccess();
  uint64_t v14 = *(void *)(v12 + 16);
  swift_endAccess();
  if (v14 >= v13)
  {
    *(void *)(v35 + 448) = v20;
    uint64_t v10 = *(void *)(v35 + 264);
    uint64_t v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
    uint64_t v2 = v10;
    *(Swift::String *)(v35 + 456) = v9;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedCellDB();
    return _swift_task_switch(v1, v2);
  }
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 312);
  uint64_t v27 = *(void *)(v35 + 304);
  uint64_t v4 = *(void *)(v35 + 240);
  uint64_t v24 = *(void *)(v35 + 224);
  char v5 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v25(v4, v5, v24);
  swift_retain();
  char v33 = Logger.logObject.getter();
  uint64_t v34 = static os_log_type_t.debug.getter();
  *(void *)(v35 + 184) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v26 = *(_DWORD *)(v35 + 508);
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 0;
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = 8;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB();
  *(void *)(v28 + 24) = v27;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v31 + 24) = v28;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v32 = v6;
  swift_retain();
  *uint64_t v32 = closure #1 in OSLogArguments.append(_:)partial apply;
  v32[1] = v29;
  swift_retain();
  v32[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v32[3] = v30;
  swift_retain();
  v32[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v32[5] = v31;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v33, v34))
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = v20;
LABEL_11:
    *(void *)(v35 + 416) = v19;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v35 + 368);
    unint64_t v18 = *(void *)(v35 + 264);
    uint64_t v15 = *(void *)(v35 + 240);
    unint64_t v16 = *(void *)(v35 + 224);

    v17(v15, v16);
    uint64_t v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM processedcell LIMIT ?", 0x21uLL, 1);
    uint64_t v2 = v18;
    *(Swift::String *)(v35 + 424) = v8;
    uint64_t v1 = (Swift::Int *)MediaMLPlugin.checkAndPruneProcessedCellDB();
    return _swift_task_switch(v1, v2);
  }
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v22 = createStorage<A>(capacity:type:)(0);
  uint64_t v23 = createStorage<A>(capacity:type:)(0);
  *(void *)(v35 + 192) = buf;
  *(void *)(v35 + 200) = v22;
  *(void *)(v35 + 208) = v23;
  serialize(_:at:)(0, (unsigned char **)(v35 + 192));
  serialize(_:at:)(1, (unsigned char **)(v35 + 192));
  *(void *)(v35 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
  *(void *)(v35 + 96) = v29;
  uint64_t result = closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
  if (!v20)
  {
    *(void *)(v35 + 88) = closure #1 in OSLogArguments.append(_:)partial apply;
    *(void *)(v35 + 96) = v30;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
    *(void *)(v35 + 88) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    *(void *)(v35 + 96) = v31;
    closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 88), v35 + 192, v35 + 200, v35 + 208);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Deleting %ldth rows", buf, v26);
    destroyStorage<A>(_:count:)(v22);
    destroyStorage<A>(_:count:)(v23);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v19 = 0;
    goto LABEL_11;
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v1 = *(Swift::String *)(v0 + 456);
  *(void *)(v0 + 104) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 472) = v2;
  if (v2)
  {
    Swift::Int v3 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    Swift::Int v3 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  return _swift_task_switch(v3, 0);
}

{
  Swift::String *v0;
  void *object;
  uint64_t v3;

  object = v0[16]._object;
  v0[6]._object = v0;
  v0[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedCellDB(), object);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  uint64_t v1 = *(Swift::String *)(v0 + 480);
  *(void *)(v0 + 104) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 496) = v2;
  if (v2)
  {
    Swift::Int v3 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    Swift::Int v3 = MediaMLPlugin.checkAndPruneProcessedCellDB();
  }
  return _swift_task_switch(v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 104) = v0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 104) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[36];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[51];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[55];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[59];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v0[13] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0[62];
  swift_errorRetain();
  v0[18] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

void MediaMLPlugin.checkAndPruneProcessedCellDB()()
{
  uint64_t v1 = (void *)v0[27];
  v0[13] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.checkAndPruneProcessedCellDB(), 0, v11, v2, v2);
  v0[32] = 0;
  swift_release();
  object = v10[7]._object;
  v10[16]._object = object;
  if (object)
  {
    v10[8]._uint64_t countAndFlagsBits = (uint64_t)object;
    v10[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from processedcell", 0x22uLL, 1);
    _swift_task_switch(MediaMLPlugin.checkAndPruneProcessedCellDB(), object);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    uint64_t v7 = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = v7;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    char v5 = (void (*)(void))*((void *)v10[6]._object + 1);
    v5();
  }
}

void *closure #1 in MediaMLPlugin.checkAndPruneProcessedCellDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void *, _UNKNOWN **))(*(void *)a1 + 160))(v7, &type metadata for Int, &protocol witness table for Int);
  if (v2)
  {
    swift_errorRelease();
    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t closure #3 in MediaMLPlugin.checkAndPruneProcessedCellDB()(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  v3[3] = &type metadata for Int;
  v3[4] = &protocol witness table for Int;
  *Swift::String v3 = a2;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB()(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 16);
  swift_endAccess();
  return v3;
}

uint64_t closure #4 in MediaMLPlugin.checkAndPruneProcessedCellDB()(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v6 = v2;
  Swift::Int v3 = *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor();
  v6[3] = (Swift::Int)&type metadata for Int;
  v6[4] = (Swift::Int)&protocol witness table for Int;
  *uint64_t v6 = v3;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t MediaMLPlugin.cleanRawWiFiDataFromDB()()
{
  v1[6] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[5] = 0;
  v1[3] = v0;
  return _swift_task_switch(MediaMLPlugin.cleanRawWiFiDataFromDB(), 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  Swift::Int v3 = v0[7];
  v0[2] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in MediaMLPlugin.cleanRawWiFiDataFromDB());
  v0[11] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.cleanRawWiFiDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.cleanRawWiFiDataFromDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  uint64_t v3;

  uint64_t countAndFlagsBits = v0[4]._countAndFlagsBits;
  v0[1]._uint64_t countAndFlagsBits = (uint64_t)v0;
  v0[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return _swift_task_switch(MediaMLPlugin.cleanRawWiFiDataFromDB(), countAndFlagsBits);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[13];
  uint64_t v2 = v0[12];
  Swift::Int v3 = v0[11];
  v0[2] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #3 in MediaMLPlugin.cleanRawWiFiDataFromDB());
  v0[14] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.cleanRawWiFiDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.cleanRawWiFiDataFromDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

void MediaMLPlugin.cleanRawWiFiDataFromDB()()
{
  uint64_t v1 = (void *)v0[6];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.cleanRawWiFiDataFromDB(), 0, v11, v2, v2);
  v0[7] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 64) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 72) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM wifi", 0x10uLL, 1);
    _swift_task_switch(MediaMLPlugin.cleanRawWiFiDataFromDB(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    char v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

void *closure #1 in MediaMLPlugin.cleanRawWiFiDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.cleanRawWiFiDataFromDB()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
}

uint64_t closure #3 in MediaMLPlugin.cleanRawWiFiDataFromDB()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
}

uint64_t MediaMLPlugin.cleanRawCellDataFromDB()()
{
  v1[6] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[5] = 0;
  v1[3] = v0;
  return _swift_task_switch(MediaMLPlugin.cleanRawCellDataFromDB(), 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  Swift::String v3 = v0[7];
  v0[2] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in MediaMLPlugin.cleanRawCellDataFromDB());
  v0[11] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.cleanRawCellDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.cleanRawCellDataFromDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  uint64_t v3;

  uint64_t countAndFlagsBits = v0[4]._countAndFlagsBits;
  v0[1]._uint64_t countAndFlagsBits = (uint64_t)v0;
  v0[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return _swift_task_switch(MediaMLPlugin.cleanRawCellDataFromDB(), countAndFlagsBits);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[13];
  uint64_t v2 = v0[12];
  Swift::String v3 = v0[11];
  v0[2] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #3 in MediaMLPlugin.cleanRawCellDataFromDB());
  v0[14] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.cleanRawCellDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.cleanRawCellDataFromDB();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

void MediaMLPlugin.cleanRawCellDataFromDB()()
{
  uint64_t v1 = (void *)v0[6];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.cleanRawCellDataFromDB(), 0, v11, v2, v2);
  v0[7] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 64) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 72) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM cell", 0x10uLL, 1);
    _swift_task_switch(MediaMLPlugin.cleanRawCellDataFromDB(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    char v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

void *closure #1 in MediaMLPlugin.cleanRawCellDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.cleanRawCellDataFromDB()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
}

uint64_t closure #3 in MediaMLPlugin.cleanRawCellDataFromDB()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(a1);
}

uint64_t MediaMLPlugin.getRawCellDataFromDB()(uint64_t a1)
{
  v2[15] = v1;
  v2[14] = a1;
  v2[4] = v2;
  v2[5] = 0;
  v2[7] = 0;
  v2[13] = 0;
  v2[5] = v1;
  return _swift_task_switch(MediaMLPlugin.getRawCellDataFromDB(), 0);
}

void MediaMLPlugin.getRawCellDataFromDB()()
{
  uint64_t v1 = (void *)v0[15];
  v0[4] = v0;
  uint64_t v19 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getRawCellDataFromDB(), 0, v19, v2, v2);
  v0[16] = 0;
  swift_release();
  uint64_t v17 = v18[6];
  v18[17] = v17;
  if (v17)
  {
    v18[7] = v17;
    v18[2] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v18[3] = v3;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\t\t\t\t\t\t\t\t\t\t\t  WITH CTE AS (SELECT carrier, app_name, rssi/", 0x39uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v18[8] = *cell_signal_binsize.unsafeMutableAddressor();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" as binned_rssi, rsrp/", 0x16uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    v18[9] = *cell_signal_binsize.unsafeMutableAddressor();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" as binned_rsrp, rsrq/", 0x16uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v6);
    swift_bridgeObjectRelease();
    v18[10] = *cell_signal_binsize.unsafeMutableAddressor();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" as binned_rsrq, rscp/", 0x16uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v7);
    swift_bridgeObjectRelease();
    v18[11] = *cell_signal_binsize.unsafeMutableAddressor();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" as binned_rscp, snr/", 0x15uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v8);
    swift_bridgeObjectRelease();
    v18[12] = *cell_snr_binsize.unsafeMutableAddressor();
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" as binned_snr, bars, throughput_true FROM cell) SELECT carrier, app_name, binned_rssi, binned_rsrp, binned_rsrq, binned_rscp, binned_snr, bars, throughput_true, COUNT(throughput_true) OVER (partition by carrier, carrier, app_name, binned_rssi, binned_rsrp, binned_rscp, binned_rsrq, binned_snr, bars) as rowcount FROM CTE", 0x142uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v18[18] = String.init(stringInterpolation:)();
    v18[19] = v10;
    _swift_task_switch(MediaMLPlugin.getRawCellDataFromDB(), v17);
  }
  else
  {
    Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v21 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v11);
    Swift::Int32 code = v21.code;
    uint64_t desc_8 = v21.desc.value._countAndFlagsBits;
    object = v21.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v12 = code;
    *(void *)(v12 + 8) = desc_8;
    *(void *)(v12 + 16) = object;
    swift_willThrow();
    MediaMLPlugin::SQLError v13 = *(void (**)(void))(v18[4] + 8);
    v13();
  }
}

uint64_t MediaMLPlugin.getRawCellDataFromDB()()
{
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[18];
  uint64_t v1 = v0[16];
  v0[4] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getRawCellDataFromDB());
  v0[20] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getRawCellDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getRawCellDataFromDB();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[20];
  v0[4] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[13] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[4] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getRawCellDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getRawCellDataFromDB()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v95 = 0;
  uint64_t v107 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getRawCellDataFromDB();
  uint64_t v125 = 0;
  uint64_t v124 = 0;
  uint64_t v96 = &v123;
  uint64_t v123 = 0;
  uint64_t v97 = &v122;
  uint64_t v122 = 0;
  unint64_t v98 = &v121;
  uint64_t v121 = 0;
  v99 = &v120;
  uint64_t v120 = 0;
  uint32_t v100 = &v119;
  uint64_t v119 = 0;
  uint64_t v101 = &v118;
  uint64_t v118 = 0;
  uint64_t v102 = &v117;
  uint64_t v117 = 0;
  uint64_t v103 = &v116;
  uint64_t v116 = 0;
  uint64_t v104 = &v115;
  uint64_t v115 = 0;
  uint64_t v105 = &v114;
  uint64_t v114 = 0;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = v73 - 8;
  unint64_t v76 = (*(void *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v73);
  uint64_t v77 = (char *)&v16 - v76;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = v78 - 8;
  unint64_t v81 = (*(void *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v78);
  uint64_t v82 = (char *)&v16 - v81;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = v83 - 8;
  unint64_t v86 = (*(void *)(v84 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v95);
  uint64_t v87 = (char *)&v16 - v86;
  uint64_t v88 = type metadata accessor for DataFrame();
  uint64_t v89 = *(void *)(v88 - 8);
  uint64_t v90 = v88 - 8;
  unint64_t v91 = (*(void *)(v89 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v95);
  uint64_t v92 = (char *)&v16 - v91;
  uint64_t v125 = (char *)&v16 - v91;
  uint64_t v124 = a1;
  uint64_t v93 = &type metadata for String;
  uint64_t v123 = _allocateUninitializedArray<A>(_:)();
  uint64_t v122 = _allocateUninitializedArray<A>(_:)();
  v94 = &type metadata for Int;
  uint64_t v121 = _allocateUninitializedArray<A>(_:)();
  uint64_t v120 = _allocateUninitializedArray<A>(_:)();
  uint64_t v119 = _allocateUninitializedArray<A>(_:)();
  uint64_t v118 = _allocateUninitializedArray<A>(_:)();
  uint64_t v117 = _allocateUninitializedArray<A>(_:)();
  uint64_t v116 = _allocateUninitializedArray<A>(_:)();
  uint64_t v115 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v106;
  uint64_t v114 = v3;
  v110[2] = v96;
  v110[3] = v97;
  v110[4] = v98;
  v110[5] = v99;
  v110[6] = v100;
  v110[7] = v101;
  v110[8] = v102;
  v110[9] = v103;
  v110[10] = v104;
  v110[11] = v105;
  (*(void (**)(uint64_t (*)(uint64_t), void *))(*(void *)a1 + 144))(v107, v110);
  uint64_t v108 = v4;
  uint64_t v109 = v4;
  if (v4)
  {
    uint64_t v16 = v109;
    outlined destroy of [Int]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = &v123;
  }
  else
  {
    DataFrame.init()();
    uint64_t v5 = kMediaML_carrier.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v5->_countAndFlagsBits;
    object = v5->_object;
    swift_bridgeObjectRetain();
    unint64_t v71 = &v123;
    uint64_t v17 = v123;
    swift_bridgeObjectRetain();
    uint64_t v19 = &v113;
    uint64_t v113 = v17;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v25 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v26 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v84 + 8);
    uint64_t v27 = v84 + 8;
    v28(v87, v83);
    uint64_t v6 = kMediaML_appName.unsafeMutableAddressor();
    uint64_t v21 = v6->_countAndFlagsBits;
    uint64_t v23 = v6->_object;
    swift_bridgeObjectRetain();
    unint64_t v70 = &v122;
    uint64_t v22 = v122;
    swift_bridgeObjectRetain();
    v112[1] = v22;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v28(v87, v83);
    Swift::String v7 = kMediaML_binnedRssi.unsafeMutableAddressor();
    uint64_t v32 = v7->_countAndFlagsBits;
    uint64_t v30 = v7->_object;
    swift_bridgeObjectRetain();
    uint64_t v69 = &v121;
    uint64_t v29 = v121;
    swift_bridgeObjectRetain();
    uint64_t v31 = v112;
    v112[0] = v29;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    unint64_t v58 = lazy protocol witness table accessor for type [Int] and conformance [A]();
    uint64_t v59 = &type metadata for Int;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v61 = *(void (**)(char *, uint64_t))(v79 + 8);
    uint64_t v60 = v79 + 8;
    v61(v82, v78);
    Swift::String v8 = kMediaML_binnedRsrp.unsafeMutableAddressor();
    uint64_t v33 = v8->_countAndFlagsBits;
    uint64_t v35 = v8->_object;
    swift_bridgeObjectRetain();
    v68 = &v120;
    uint64_t v34 = v120;
    swift_bridgeObjectRetain();
    v111[5] = v34;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    Swift::String v9 = kMediaML_binnedRsrq.unsafeMutableAddressor();
    uint64_t v36 = v9->_countAndFlagsBits;
    v38 = v9->_object;
    swift_bridgeObjectRetain();
    uint64_t v67 = &v119;
    uint64_t v37 = v119;
    swift_bridgeObjectRetain();
    v111[4] = v37;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    uint64_t v10 = kMediaML_binnedRscp.unsafeMutableAddressor();
    uint64_t v39 = v10->_countAndFlagsBits;
    uint64_t v41 = v10->_object;
    swift_bridgeObjectRetain();
    v66 = &v118;
    uint64_t v40 = v118;
    swift_bridgeObjectRetain();
    v111[3] = v40;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    Swift::String v11 = kMediaML_binnedSnr.unsafeMutableAddressor();
    uint64_t v42 = v11->_countAndFlagsBits;
    uint64_t v44 = v11->_object;
    swift_bridgeObjectRetain();
    uint64_t v65 = &v117;
    uint64_t v43 = v117;
    swift_bridgeObjectRetain();
    v111[2] = v43;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    uint64_t v12 = kMediaML_bars.unsafeMutableAddressor();
    uint64_t v45 = v12->_countAndFlagsBits;
    uint64_t v47 = v12->_object;
    swift_bridgeObjectRetain();
    uint64_t v64 = &v116;
    uint64_t v46 = v116;
    swift_bridgeObjectRetain();
    v111[1] = v46;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    MediaMLPlugin::SQLError v13 = kMediaML_throughputTrue.unsafeMutableAddressor();
    uint64_t v52 = v13->_countAndFlagsBits;
    uint64_t v49 = v13->_object;
    swift_bridgeObjectRetain();
    uint64_t v63 = &v115;
    uint64_t v48 = v115;
    swift_bridgeObjectRetain();
    uint64_t v50 = v111;
    v111[0] = v48;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v53 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v77, v73);
    uint64_t v14 = kMediaML_count.unsafeMutableAddressor();
    uint64_t v54 = v14->_countAndFlagsBits;
    v56 = v14->_object;
    swift_bridgeObjectRetain();
    uint64_t v62 = &v114;
    uint64_t v55 = v114;
    swift_bridgeObjectRetain();
    v110[12] = v55;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v61(v82, v78);
    (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v72, v92, v88);
    outlined destroy of [Int]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = v71;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getRawCellDataFromDB()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v16)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v15)
    {
      SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(3, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(4, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(5, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(6, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(7, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(8, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
      SQLiteDB.Row.get<A>(at:)(9, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name not of type String", 0x1BuLL, 1);
      MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 code = v18.code;
      uint64_t countAndFlagsBits = v18.desc.value._countAndFlagsBits;
      object = v18.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v9 = swift_allocError();
      *(_DWORD *)uint64_t v5 = code;
      *(void *)(v5 + 8) = countAndFlagsBits;
      *(void *)(v5 + 16) = object;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier not of type String", 0x1AuLL, 1);
    MediaMLPlugin::SQLError v17 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v12 = v17.code;
    uint64_t desc_8 = v17.desc.value._countAndFlagsBits;
    Swift::String v11 = v17.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v13 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v12;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v11;
    swift_willThrow();
    return v13;
  }
}

uint64_t MediaMLPlugin.getRawWiFiDataFromDB()(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v2[3] = v1;
  return _swift_task_switch(MediaMLPlugin.getRawWiFiDataFromDB(), 0);
}

void MediaMLPlugin.getRawWiFiDataFromDB()()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getRawWiFiDataFromDB(), 0, v11, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 80) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT session_id, timestamp, app_name, ssid, hour, dow, rssi, cca, noise, snr, tx_rate, rx_rate, throughput_true FROM wifi", 0x7BuLL, 1);
    _swift_task_switch(MediaMLPlugin.getRawWiFiDataFromDB(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    uint64_t v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

uint64_t MediaMLPlugin.getRawWiFiDataFromDB()()
{
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  uint64_t v1 = v0[9];
  v0[2] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getRawWiFiDataFromDB());
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getRawWiFiDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getRawWiFiDataFromDB();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[13];
  v0[2] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[6] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getRawWiFiDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getRawWiFiDataFromDB()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v94 = a2;
  uint64_t v118 = 0;
  uint64_t v133 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getRawWiFiDataFromDB();
  uint64_t v154 = 0;
  uint64_t v153 = 0;
  uint64_t v119 = &v152;
  uint64_t v152 = 0;
  uint64_t v120 = &v151;
  uint64_t v151 = 0;
  uint64_t v121 = &v150;
  uint64_t v150 = 0;
  uint64_t v124 = &v149;
  uint64_t v149 = 0;
  uint64_t v122 = &v148;
  uint64_t v148 = 0;
  uint64_t v123 = &v147;
  uint64_t v147 = 0;
  uint64_t v125 = &v146;
  uint64_t v146 = 0;
  unint64_t v126 = &v145;
  uint64_t v145 = 0;
  unint64_t v127 = &v144;
  uint64_t v144 = 0;
  v128 = &v143;
  uint64_t v143 = 0;
  uint64_t v129 = &v142;
  uint64_t v142 = 0;
  uint64_t v130 = &v141;
  uint64_t v141 = 0;
  uint64_t v131 = &v140;
  uint64_t v140 = 0;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v96 = *(void *)(v95 - 8);
  uint64_t v97 = v95 - 8;
  unint64_t v98 = (*(void *)(v96 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v95);
  v99 = (char *)v19 - v98;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v101 = *(void *)(v100 - 8);
  uint64_t v102 = v100 - 8;
  unint64_t v103 = (*(void *)(v101 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v100);
  uint64_t v104 = (char *)v19 - v103;
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v106 = *(void *)(v105 - 8);
  uint64_t v107 = v105 - 8;
  unint64_t v108 = (*(void *)(v106 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v118);
  uint64_t v109 = (char *)v19 - v108;
  uint64_t v110 = type metadata accessor for DataFrame();
  uint64_t v111 = *(void *)(v110 - 8);
  uint64_t v112 = v110 - 8;
  unint64_t v113 = (*(void *)(v111 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v118);
  uint64_t v114 = (char *)v19 - v113;
  uint64_t v154 = (char *)v19 - v113;
  uint64_t v153 = a1;
  uint64_t v115 = &type metadata for String;
  uint64_t v152 = _allocateUninitializedArray<A>(_:)();
  uint64_t v117 = &type metadata for Double;
  uint64_t v151 = _allocateUninitializedArray<A>(_:)();
  uint64_t v150 = _allocateUninitializedArray<A>(_:)();
  uint64_t v149 = _allocateUninitializedArray<A>(_:)();
  uint64_t v116 = &type metadata for Int;
  uint64_t v148 = _allocateUninitializedArray<A>(_:)();
  uint64_t v147 = _allocateUninitializedArray<A>(_:)();
  uint64_t v146 = _allocateUninitializedArray<A>(_:)();
  uint64_t v145 = _allocateUninitializedArray<A>(_:)();
  uint64_t v144 = _allocateUninitializedArray<A>(_:)();
  uint64_t v143 = _allocateUninitializedArray<A>(_:)();
  uint64_t v142 = _allocateUninitializedArray<A>(_:)();
  uint64_t v141 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v132;
  uint64_t v140 = v3;
  v136[2] = v119;
  v136[3] = v120;
  v136[4] = v121;
  v136[5] = v122;
  v136[6] = v123;
  v136[7] = v124;
  v136[8] = v125;
  v136[9] = v126;
  v136[10] = v127;
  v136[11] = v128;
  v136[12] = v129;
  v136[13] = v130;
  v136[14] = v131;
  (*(void (**)(uint64_t (*)(uint64_t), void *))(*(void *)a1 + 144))(v133, v136);
  uint64_t v134 = v4;
  uint64_t v135 = v4;
  if (v4)
  {
    v19[1] = v135;
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    outlined destroy of [String]();
    outlined destroy of [Double]();
    uint64_t result = &v152;
  }
  else
  {
    DataFrame.init()();
    int v72 = 1;
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id", 0xAuLL, 1);
    uint64_t countAndFlagsBits = v5._countAndFlagsBits;
    object = v5._object;
    uint64_t v93 = &v152;
    uint64_t v20 = v152;
    swift_bridgeObjectRetain();
    uint64_t v22 = &v139;
    uint64_t v139 = v20;
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v35 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v36 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v38 = *(void (**)(char *, uint64_t))(v106 + 8);
    uint64_t v37 = v106 + 8;
    v38(v109, v105);
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("timestamp", 9uLL, v72 & 1);
    uint64_t v27 = v6._countAndFlagsBits;
    unint64_t v25 = v6._object;
    uint64_t v92 = &v151;
    uint64_t v24 = v151;
    swift_bridgeObjectRetain();
    uint64_t v26 = &v138;
    uint64_t v138 = v24;
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    unint64_t v77 = lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v78 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v80 = *(void (**)(char *, uint64_t))(v101 + 8);
    uint64_t v79 = v101 + 8;
    v80(v104, v100);
    Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name", 8uLL, v72 & 1);
    uint64_t v28 = v7._countAndFlagsBits;
    uint64_t v30 = v7._object;
    unint64_t v91 = &v150;
    uint64_t v29 = v150;
    swift_bridgeObjectRetain();
    v137[2] = v29;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v38(v109, v105);
    Builtin::Word v46 = 4;
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid", 4uLL, v72 & 1);
    uint64_t v31 = v8._countAndFlagsBits;
    uint64_t v33 = v8._object;
    uint64_t v90 = &v149;
    uint64_t v32 = v149;
    swift_bridgeObjectRetain();
    v137[1] = v32;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v38(v109, v105);
    Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", v46, v72 & 1);
    uint64_t v42 = v9._countAndFlagsBits;
    uint64_t v40 = v9._object;
    uint64_t v89 = &v148;
    uint64_t v39 = v148;
    swift_bridgeObjectRetain();
    uint64_t v41 = v137;
    v137[0] = v39;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    unint64_t v61 = lazy protocol witness table accessor for type [Int] and conformance [A]();
    uint64_t v62 = &type metadata for Int;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v64 = *(void (**)(char *, uint64_t))(v96 + 8);
    uint64_t v63 = v96 + 8;
    v64(v99, v95);
    Builtin::Word v56 = 3;
    Swift::String v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dow", 3uLL, v72 & 1);
    uint64_t v43 = v10._countAndFlagsBits;
    uint64_t v45 = v10._object;
    uint64_t v88 = &v147;
    uint64_t v44 = v147;
    swift_bridgeObjectRetain();
    v136[23] = v44;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v99, v95);
    Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", v46, v72 & 1);
    uint64_t v47 = v11._countAndFlagsBits;
    uint64_t v49 = v11._object;
    uint64_t v87 = &v146;
    uint64_t v48 = v146;
    swift_bridgeObjectRetain();
    v136[22] = v48;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v99, v95);
    Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cca", v56, v72 & 1);
    uint64_t v50 = v12._countAndFlagsBits;
    uint64_t v52 = v12._object;
    unint64_t v86 = &v145;
    uint64_t v51 = v145;
    swift_bridgeObjectRetain();
    v136[21] = v51;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v99, v95);
    Swift::String v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("noise", 5uLL, v72 & 1);
    uint64_t v53 = v13._countAndFlagsBits;
    uint64_t v55 = v13._object;
    uint64_t v85 = &v144;
    uint64_t v54 = v144;
    swift_bridgeObjectRetain();
    v136[20] = v54;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v99, v95);
    Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("snr", v56, v72 & 1);
    uint64_t v57 = v14._countAndFlagsBits;
    uint64_t v59 = v14._object;
    uint64_t v84 = &v143;
    uint64_t v58 = v143;
    swift_bridgeObjectRetain();
    v136[19] = v58;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v99, v95);
    Builtin::Word v68 = 7;
    Swift::String v15 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tx_rate", 7uLL, v72 & 1);
    uint64_t v65 = v15._countAndFlagsBits;
    uint64_t v67 = v15._object;
    uint64_t v83 = &v142;
    uint64_t v66 = v142;
    swift_bridgeObjectRetain();
    v136[18] = v66;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v80(v104, v100);
    Swift::String v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rx_rate", v68, v72 & 1);
    uint64_t v69 = v16._countAndFlagsBits;
    unint64_t v71 = v16._object;
    uint64_t v82 = &v141;
    uint64_t v70 = v141;
    swift_bridgeObjectRetain();
    v136[17] = v70;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v80(v104, v100);
    Swift::String v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("throughput_true", 0xFuLL, v72 & 1);
    uint64_t v73 = v17._countAndFlagsBits;
    uint64_t v75 = v17._object;
    unint64_t v81 = &v140;
    uint64_t v74 = v140;
    swift_bridgeObjectRetain();
    v136[16] = v74;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v80(v104, v100);
    (*(void (**)(uint64_t, char *, uint64_t))(v111 + 32))(v94, v114, v110);
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    outlined destroy of [String]();
    outlined destroy of [Double]();
    uint64_t result = v93;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getRawWiFiDataFromDB()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v23)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
    SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v22)
    {
      SQLiteDB.Row.get<A>(at:)(3, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
      if (v21)
      {
        SQLiteDB.Row.get<A>(at:)(4, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(5, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(6, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(7, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(8, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(9, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(10, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        SQLiteDB.Row.get<A>(at:)(11, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        SQLiteDB.Row.get<A>(at:)(12, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid not of type String", 0x17uLL, 1);
        MediaMLPlugin::SQLError v26 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v6);
        Swift::Int32 code = v26.code;
        uint64_t countAndFlagsBits = v26.desc.value._countAndFlagsBits;
        object = v26.desc.value._object;
        lazy protocol witness table accessor for type SQLError and conformance SQLError();
        uint64_t v11 = swift_allocError();
        *(_DWORD *)uint64_t v7 = code;
        *(void *)(v7 + 8) = countAndFlagsBits;
        *(void *)(v7 + 16) = object;
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name not of type String", 0x1BuLL, 1);
      MediaMLPlugin::SQLError v25 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 v14 = v25.code;
      uint64_t v12 = v25.desc.value._countAndFlagsBits;
      Swift::String v13 = v25.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v15 = swift_allocError();
      *(_DWORD *)uint64_t v5 = v14;
      *(void *)(v5 + 8) = v12;
      *(void *)(v5 + 16) = v13;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id not of type String", 0x1DuLL, 1);
    MediaMLPlugin::SQLError v24 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v18 = v24.code;
    uint64_t desc_8 = v24.desc.value._countAndFlagsBits;
    Swift::String v17 = v24.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v19 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v18;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v17;
    swift_willThrow();
    return v19;
  }
}

uint64_t MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 1072) = v2;
  *(void *)(v3 + 1064) = a2;
  *(void *)(v3 + 1056) = a1;
  *(void *)(v3 + 768) = v3;
  *(void *)(v3 + 776) = 0;
  *(void *)(v3 + 784) = 0;
  *(void *)(v3 + 800) = 0;
  *(void *)(v3 + 856) = 0;
  *(void *)(v3 + 888) = 0;
  *(void *)(v3 + 656) = 0;
  *(void *)(v3 + 664) = 0;
  *(void *)(v3 + 672) = 0;
  *(unsigned char *)(v3 + 680) = 0;
  *(void *)(v3 + 920) = 0;
  *(void *)(v3 + 720) = 0;
  *(void *)(v3 + 728) = 0;
  *(void *)(v3 + 752) = 0;
  *(void *)(v3 + 760) = 0;
  *(void *)(v3 + 936) = 0;
  *(void *)(v3 + 952) = 0;
  *(void *)(v3 + 968) = 0;
  *(void *)(v3 + 984) = 0;
  *(void *)(v3 + 1000) = 0;
  *(void *)(v3 + 1016) = 0;
  *(void *)(v3 + 1032) = 0;
  *(void *)(v3 + 1048) = 0;
  uint64_t v4 = type metadata accessor for AnyColumn();
  *(void *)(v3 + 1080) = v4;
  *(void *)(v3 + 1088) = *(void *)(v4 - 8);
  *(void *)(v3 + 1096) = swift_task_alloc();
  *(void *)(v3 + 1104) = swift_task_alloc();
  *(void *)(v3 + 1112) = swift_task_alloc();
  *(void *)(v3 + 1120) = swift_task_alloc();
  *(void *)(v3 + 1128) = swift_task_alloc();
  *(void *)(v3 + 1136) = swift_task_alloc();
  *(void *)(v3 + 1144) = swift_task_alloc();
  *(void *)(v3 + 1152) = swift_task_alloc();
  *(void *)(v3 + 1160) = swift_task_alloc();
  *(void *)(v3 + 1168) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  *(void *)(v3 + 1176) = v5;
  *(void *)(v3 + 1184) = *(void *)(v5 - 8);
  *(void *)(v3 + 1192) = swift_task_alloc();
  *(void *)(v3 + 1200) = swift_task_alloc();
  *(void *)(v3 + 1208) = swift_task_alloc();
  *(void *)(v3 + 1216) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Order?);
  *(void *)(v3 + 1224) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of DataFrameProtocol.grouped(by:)>>.0);
  *(void *)(v3 + 1232) = v6;
  *(void *)(v3 + 1240) = *(void *)(v6 - 8);
  *(void *)(v3 + 1248) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame();
  *(void *)(v3 + 1256) = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  *(void *)(v3 + 1264) = v9;
  *(void *)(v3 + 1272) = *(void *)(v9 + 64);
  *(void *)(v3 + 1280) = swift_task_alloc();
  *(void *)(v3 + 1288) = swift_task_alloc();
  *(void *)(v3 + 1296) = swift_task_alloc();
  *(void *)(v3 + 1304) = swift_task_alloc();
  *(void *)(v3 + 1312) = swift_task_alloc();
  *(void *)(v3 + 1320) = swift_task_alloc();
  *(void *)(v3 + 1328) = swift_task_alloc();
  *(void *)(v3 + 1336) = swift_task_alloc();
  *(void *)(v3 + 1344) = swift_task_alloc();
  *(void *)(v3 + 1352) = swift_task_alloc();
  *(void *)(v3 + 1360) = swift_task_alloc();
  *(void *)(v3 + 1368) = swift_task_alloc();
  *(void *)(v3 + 776) = a2;
  *(void *)(v3 + 784) = v2;
  return _swift_task_switch(MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:), 0);
}

void MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  uint64_t v214 = v0;
  Swift::String v1 = *(void **)(v0 + 1072);
  *(void *)(v0 + 768) = v0;
  uint64_t v202 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:), 0, v202, v2, v2);
  swift_release();
  uint64_t v200 = *(void *)(v201 + 792);
  *(void *)(v201 + 1376) = v200;
  if (!v200)
  {
    Swift::String v34 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v216 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v34);
    Swift::Int32 code = v216.code;
    uint64_t desc_8 = v216.desc.value._countAndFlagsBits;
    object = v216.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v35 = code;
    *(void *)(v35 + 8) = desc_8;
    *(void *)(v35 + 16) = object;
    swift_willThrow();
LABEL_69:
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
    uint64_t v36 = *(void (**)(void))(*(void *)(v201 + 768) + 8);
    v36();
    return;
  }
  uint64_t v195 = *(void *)(v201 + 1368);
  uint64_t v197 = *(void *)(v201 + 1256);
  uint64_t v196 = *(void *)(v201 + 1064);
  uint64_t v194 = *(void *)(v201 + 1264);
  *(void *)(v201 + 800) = v200;
  Swift::String v193 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v199 = DataFrame.containsColumn(_:)(v193);
  swift_bridgeObjectRelease();
  uint64_t v198 = *(void (**)(uint64_t, uint64_t, uint64_t))(v194 + 16);
  *(void *)(v201 + 1384) = v198;
  *(void *)(v201 + 1392) = (v194 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v198(v195, v196, v197);
  if (v199)
  {
    Swift::String v190 = *kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v191 = DataFrame.containsColumn(_:)(v190);
    swift_bridgeObjectRelease();
    Swift::Bool v192 = v191;
  }
  else
  {
    Swift::Bool v192 = 0;
  }
  uint64_t v3 = *(void *)(v201 + 1368);
  uint64_t v187 = *(void *)(v201 + 1360);
  uint64_t v189 = *(void *)(v201 + 1256);
  uint64_t v188 = *(void *)(v201 + 1064);
  uint64_t v4 = *(void *)(v201 + 1264) + 8;
  v186 = *(void (**)(uint64_t))v4;
  *(void *)(v201 + 1400) = *(void *)v4;
  *(void *)(v201 + 1408) = v4 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v186(v3);
  v198(v187, v188, v189);
  if (v192)
  {
    Swift::String v183 = *kMediaML_binnedRssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v184 = DataFrame.containsColumn(_:)(v183);
    swift_bridgeObjectRelease();
    Swift::Bool v185 = v184;
  }
  else
  {
    Swift::Bool v185 = 0;
  }
  uint64_t v180 = *(void *)(v201 + 1352);
  uint64_t v182 = *(void *)(v201 + 1256);
  uint64_t v181 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1360));
  v198(v180, v181, v182);
  if (v185)
  {
    Swift::String v177 = *kMediaML_binnedRsrp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v178 = DataFrame.containsColumn(_:)(v177);
    swift_bridgeObjectRelease();
    Swift::Bool v179 = v178;
  }
  else
  {
    Swift::Bool v179 = 0;
  }
  uint64_t v174 = *(void *)(v201 + 1344);
  uint64_t v176 = *(void *)(v201 + 1256);
  uint64_t v175 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1352));
  v198(v174, v175, v176);
  if (v179)
  {
    Swift::String v171 = *kMediaML_binnedRsrq.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v172 = DataFrame.containsColumn(_:)(v171);
    swift_bridgeObjectRelease();
    Swift::Bool v173 = v172;
  }
  else
  {
    Swift::Bool v173 = 0;
  }
  uint64_t v168 = *(void *)(v201 + 1336);
  uint64_t v170 = *(void *)(v201 + 1256);
  uint64_t v169 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1344));
  v198(v168, v169, v170);
  if (v173)
  {
    Swift::String v165 = *kMediaML_binnedRscp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v166 = DataFrame.containsColumn(_:)(v165);
    swift_bridgeObjectRelease();
    Swift::Bool v167 = v166;
  }
  else
  {
    Swift::Bool v167 = 0;
  }
  uint64_t v162 = *(void *)(v201 + 1328);
  uint64_t v164 = *(void *)(v201 + 1256);
  uint64_t v163 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1336));
  v198(v162, v163, v164);
  if (v167)
  {
    Swift::String v159 = *kMediaML_binnedSnr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v160 = DataFrame.containsColumn(_:)(v159);
    swift_bridgeObjectRelease();
    Swift::Bool v161 = v160;
  }
  else
  {
    Swift::Bool v161 = 0;
  }
  uint64_t v156 = *(void *)(v201 + 1320);
  uint64_t v158 = *(void *)(v201 + 1256);
  uint64_t v157 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1328));
  v198(v156, v157, v158);
  if (v161)
  {
    Swift::String v153 = *kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v154 = DataFrame.containsColumn(_:)(v153);
    swift_bridgeObjectRelease();
    Swift::Bool v155 = v154;
  }
  else
  {
    Swift::Bool v155 = 0;
  }
  uint64_t v150 = *(void *)(v201 + 1312);
  uint64_t v152 = *(void *)(v201 + 1256);
  uint64_t v151 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1320));
  v198(v150, v151, v152);
  if (v155)
  {
    Swift::String v147 = *kMediaML_count.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v148 = DataFrame.containsColumn(_:)(v147);
    swift_bridgeObjectRelease();
    Swift::Bool v149 = v148;
  }
  else
  {
    Swift::Bool v149 = 0;
  }
  uint64_t v144 = *(void *)(v201 + 1304);
  uint64_t v146 = *(void *)(v201 + 1256);
  uint64_t v145 = *(void *)(v201 + 1064);
  v186(*(void *)(v201 + 1312));
  v198(v144, v145, v146);
  if (!v149)
  {
    ((void (*)(void, void))v186)(*(void *)(v201 + 1304), *(void *)(v201 + 1256));
LABEL_65:
    uint64_t v32 = *(void *)(v201 + 1192);
    uint64_t v48 = *(void *)(v201 + 1176);
    uint64_t v47 = *(void *)(v201 + 1184);
    uint64_t v33 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16))(v32, v33, v48);
    uint64_t v51 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    *(void *)(v201 + 808) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v49 = *(_DWORD *)(v201 + 684);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v52 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v51, v50))
    {
      uint64_t v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v44 = createStorage<A>(capacity:type:)(0);
      uint64_t v45 = createStorage<A>(capacity:type:)(0);
      *(void *)(v201 + 816) = v43;
      *(void *)(v201 + 824) = v44;
      *(void *)(v201 + 832) = v45;
      serialize(_:at:)(0, (unsigned char **)(v201 + 816));
      serialize(_:at:)(0, (unsigned char **)(v201 + 816));
      *(void *)(v201 + 840) = v52;
      Builtin::Word v46 = (void *)swift_task_alloc();
      v46[2] = v201 + 816;
      v46[3] = v201 + 824;
      v46[4] = v201 + 832;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl((void *)&_mh_execute_header, v51, v50, "GetAndSavePreProcessedCellData: DataFrame did not contain all required columns", v43, v49);
      destroyStorage<A>(_:count:)(v44);
      destroyStorage<A>(_:count:)(v45);
      UnsafeMutablePointer.deallocate()();
    }
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void *)(v201 + 1192);
    uint64_t v42 = *(void *)(v201 + 1176);
    uint64_t v40 = *(void *)(v201 + 1184);

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v42);
    lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
    swift_allocError();
    swift_willThrow();
    swift_release();
    goto LABEL_69;
  }
  Swift::String v142 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v143 = DataFrame.containsColumn(_:)(v142);
  swift_bridgeObjectRelease();
  ((void (*)(void, void))v186)(*(void *)(v201 + 1304), *(void *)(v201 + 1256));
  if (!v143) {
    goto LABEL_65;
  }
  uint64_t v136 = *(void *)(v201 + 1256);
  uint64_t v139 = *(void *)(v201 + 1248);
  uint64_t v140 = *(void *)(v201 + 1232);
  uint64_t v137 = *(void *)(v201 + 1224);
  uint64_t v138 = *(void *)(v201 + 1240);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v135 = v5;
  uint64_t v6 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v6, v135);
  uint64_t v7 = kMediaML_carrier.unsafeMutableAddressor();
  outlined init with copy of String(v7, v135 + 2);
  Swift::String v8 = kMediaML_binnedRssi.unsafeMutableAddressor();
  outlined init with copy of String(v8, v135 + 4);
  uint64_t v9 = kMediaML_binnedRsrp.unsafeMutableAddressor();
  outlined init with copy of String(v9, v135 + 6);
  Swift::String v10 = kMediaML_binnedRsrq.unsafeMutableAddressor();
  outlined init with copy of String(v10, v135 + 8);
  uint64_t v11 = kMediaML_binnedRscp.unsafeMutableAddressor();
  outlined init with copy of String(v11, v135 + 10);
  uint64_t v12 = kMediaML_binnedSnr.unsafeMutableAddressor();
  outlined init with copy of String(v12, v135 + 12);
  Swift::String v13 = kMediaML_bars.unsafeMutableAddressor();
  outlined init with copy of String(v13, v135 + 14);
  Swift::Int32 v14 = kMediaML_count.unsafeMutableAddressor();
  outlined init with copy of String(v14, v135 + 16);
  _finalizeUninitializedArray<A>(_:)();
  DataFrameProtocol.grouped(by:)();
  swift_bridgeObjectRelease();
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  *(double *)(v201 + 848) = 0.5;
  uint64_t v15 = type metadata accessor for Order();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v137, 1);
  *(void *)(v201 + 688) = v136;
  *(void *)(v201 + 696) = &protocol witness table for DataFrame;
  swift_getOpaqueTypeConformance2();
  lazy protocol witness table accessor for type Double and conformance Double();
  RowGroupingProtocol.quantiles<A>(_:_:quantile:order:)();
  outlined destroy of Order?(v137);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v139, v140);
  uint64_t v16 = DataFrame.shape.getter();
  uint64_t v141 = v16;
  *(void *)(v201 + 856) = v16;
  if (__OFSUB__(v16, 1))
  {
    __break(1u);
    goto _swift_task_switch;
  }
  *(void *)(v201 + 872) = v16 - 1;
  *(void *)(v201 + 880) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
  min<A>(_:_:)();
  uint64_t v134 = *(void *)(v201 + 864);
  *(void *)(v201 + 888) = v134;
  if (v141 > 0)
  {
    uint64_t v115 = *(void *)(v201 + 1296);
    uint64_t v117 = *(void *)(v201 + 1288);
    uint64_t v118 = *(void *)(v201 + 1256);
    uint64_t v19 = *(void *)(v201 + 1216);
    uint64_t v112 = *(void *)(v201 + 1176);
    uint64_t v114 = *(void *)(v201 + 1264);
    uint64_t v111 = *(void *)(v201 + 1184);
    uint64_t v20 = MediaMLPlugin.logger.unsafeMutableAddressor();
    unint64_t v113 = *(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16);
    v113(v19, v20, v112);
    v198(v117, v115, v118);
    int v116 = *(_DWORD *)(v114 + 80);
    uint64_t v121 = swift_allocObject();
    uint64_t v119 = *(void (**)(unint64_t, uint64_t, uint64_t))(v114 + 32);
    v119(v121 + ((v116 + 16) & ~(unint64_t)v116), v117, v118);
    v198(v117, v115, v118);
    uint64_t v123 = swift_allocObject();
    v119(v123 + ((v116 + 16) & ~(unint64_t)v116), v117, v118);
    oslog = Logger.logObject.getter();
    os_log_type_t v133 = static os_log_type_t.info.getter();
    *(void *)(v201 + 904) = 22;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v201 + 1492);
    uint64_t v125 = swift_allocObject();
    *(unsigned char *)(v125 + 16) = 0;
    uint64_t v126 = swift_allocObject();
    *(unsigned char *)(v126 + 16) = 8;
    uint64_t v122 = swift_allocObject();
    *(void *)(v122 + 16) = partial apply for implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
    *(void *)(v122 + 24) = v121;
    uint64_t v127 = swift_allocObject();
    *(void *)(v127 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v127 + 24) = v122;
    uint64_t v128 = swift_allocObject();
    *(unsigned char *)(v128 + 16) = 0;
    uint64_t v129 = swift_allocObject();
    *(unsigned char *)(v129 + 16) = 8;
    uint64_t v124 = swift_allocObject();
    *(void *)(v124 + 16) = partial apply for implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
    *(void *)(v124 + 24) = v123;
    uint64_t v130 = swift_allocObject();
    *(void *)(v130 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v130 + 24) = v124;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v131 = v21;
    swift_retain();
    *uint64_t v131 = closure #1 in OSLogArguments.append(_:)partial apply;
    v131[1] = v125;
    swift_retain();
    v131[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v131[3] = v126;
    swift_retain();
    v131[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v131[5] = v127;
    swift_retain();
    v131[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v131[7] = v128;
    swift_retain();
    v131[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v131[9] = v129;
    swift_retain();
    v131[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v131[11] = v130;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v133))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v109 = createStorage<A>(capacity:type:)(0);
      uint64_t v110 = createStorage<A>(capacity:type:)(0);
      int v209 = buf;
      uint64_t v210 = v109;
      uint64_t v211 = v110;
      serialize(_:at:)(0, &v209);
      serialize(_:at:)(2, &v209);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v213 = v125;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v213 = v126;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v213 = v127;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v213 = v128;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v213 = v129;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      uint64_t v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v213 = v130;
      closure #1 in osLogInternal(_:log:type:)(&v212, (uint64_t)&v209, (uint64_t)&v210, (uint64_t)&v211);
      _os_log_impl((void *)&_mh_execute_header, oslog, v133, "Processed cell data, shape =%ld,%ld", buf, size);
      destroyStorage<A>(_:count:)(v109);
      destroyStorage<A>(_:count:)(v110);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v96 = *(void *)(v201 + 1216);
    uint64_t v22 = *(void *)(v201 + 1208);
    uint64_t v98 = *(void *)(v201 + 1176);
    uint64_t v95 = *(void *)(v201 + 1184);

    uint64_t v97 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
    v97(v96, v98);
    uint64_t v23 = MediaMLPlugin.logger.unsafeMutableAddressor();
    v113(v22, v23, v98);
    uint64_t v100 = swift_allocObject();
    *(void *)(v100 + 16) = v134;
    log = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.debug.getter();
    *(void *)(v201 + 912) = 12;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v99 = *(_DWORD *)(v201 + 1496);
    uint64_t v102 = swift_allocObject();
    *(unsigned char *)(v102 + 16) = 0;
    uint64_t v103 = swift_allocObject();
    *(unsigned char *)(v103 + 16) = 8;
    uint64_t v101 = swift_allocObject();
    *(void *)(v101 + 16) = partial apply for implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
    *(void *)(v101 + 24) = v100;
    uint64_t v104 = swift_allocObject();
    *(void *)(v104 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v104 + 24) = v101;
    _allocateUninitializedArray<A>(_:)();
    uint64_t v105 = v24;
    swift_retain();
    *uint64_t v105 = closure #1 in OSLogArguments.append(_:)partial apply;
    v105[1] = v102;
    swift_retain();
    v105[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v105[3] = v103;
    swift_retain();
    v105[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v105[5] = v104;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v107))
    {
      uint64_t v92 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v93 = createStorage<A>(capacity:type:)(0);
      uint64_t v94 = createStorage<A>(capacity:type:)(0);
      uint64_t v204 = v92;
      uint64_t v205 = v93;
      uint64_t v206 = v94;
      serialize(_:at:)(0, &v204);
      serialize(_:at:)(1, &v204);
      uint64_t v207 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v208 = v102;
      closure #1 in osLogInternal(_:log:type:)(&v207, (uint64_t)&v204, (uint64_t)&v205, (uint64_t)&v206);
      uint64_t v207 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v208 = v103;
      closure #1 in osLogInternal(_:log:type:)(&v207, (uint64_t)&v204, (uint64_t)&v205, (uint64_t)&v206);
      uint64_t v207 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v208 = v104;
      closure #1 in osLogInternal(_:log:type:)(&v207, (uint64_t)&v204, (uint64_t)&v205, (uint64_t)&v206);
      _os_log_impl((void *)&_mh_execute_header, log, v107, "Writing %ld rows into processedcell table", v92, v99);
      destroyStorage<A>(_:count:)(v93);
      destroyStorage<A>(_:count:)(v94);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v90 = *(void *)(v201 + 1208);
    uint64_t v91 = *(void *)(v201 + 1176);

    v97(v90, v91);
    if (v134 < 0) {
      goto LABEL_58;
    }
    *(void *)(v201 + 656) = specialized Collection<>.makeIterator()();
    *(void *)(v201 + 664) = v25;
    *(void *)(v201 + 672) = v26;
    *(unsigned char *)(v201 + 680) = v27 & 1;
    *(void *)(v201 + 1416) = 0;
    uint64_t v203 = specialized IndexingIterator.next()();
    if ((v28 & 1) == 0)
    {
      uint64_t v87 = *(void *)(v201 + 1168);
      uint64_t v88 = *(void *)(v201 + 1080);
      uint64_t v86 = *(void *)(v201 + 1088);
      *(void *)(v201 + 920) = v203;
      kMediaML_carrier.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
      v89(v87, v88);
      if (!*(void *)(v201 + 72)) {
        goto LABEL_58;
      }
      uint64_t v84 = *(void *)(v201 + 1160);
      uint64_t v85 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 48, v201 + 16);
      swift_dynamicCast();
      uint64_t v82 = *(void *)(v201 + 704);
      uint64_t v83 = *(void *)(v201 + 712);
      *(void *)(v201 + 1424) = v83;
      *(void *)(v201 + 720) = v82;
      *(void *)(v201 + 728) = v83;
      swift_bridgeObjectRelease();
      kMediaML_appName.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v84, v85);
      if (!*(void *)(v201 + 136)) {
        goto LABEL_58;
      }
      uint64_t v80 = *(void *)(v201 + 1152);
      uint64_t v81 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 112, v201 + 80);
      swift_dynamicCast();
      uint64_t v78 = *(void *)(v201 + 736);
      uint64_t v79 = *(void *)(v201 + 744);
      *(void *)(v201 + 1432) = v79;
      *(void *)(v201 + 752) = v78;
      *(void *)(v201 + 760) = v79;
      swift_bridgeObjectRelease();
      kMediaML_binnedRssi.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v80, v81);
      if (!*(void *)(v201 + 200)) {
        goto LABEL_58;
      }
      uint64_t v76 = *(void *)(v201 + 1144);
      uint64_t v77 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 176, v201 + 144);
      swift_dynamicCast();
      uint64_t v75 = *(void *)(v201 + 928);
      *(void *)(v201 + 936) = v75;
      swift_bridgeObjectRelease();
      kMediaML_binnedRsrp.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v76, v77);
      if (!*(void *)(v201 + 264)) {
        goto LABEL_58;
      }
      uint64_t v73 = *(void *)(v201 + 1136);
      uint64_t v74 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 240, v201 + 208);
      swift_dynamicCast();
      uint64_t v72 = *(void *)(v201 + 944);
      *(void *)(v201 + 952) = v72;
      swift_bridgeObjectRelease();
      kMediaML_binnedRsrq.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v73, v74);
      if (!*(void *)(v201 + 328)) {
        goto LABEL_58;
      }
      uint64_t v70 = *(void *)(v201 + 1128);
      uint64_t v71 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 304, v201 + 272);
      swift_dynamicCast();
      uint64_t v69 = *(void *)(v201 + 960);
      *(void *)(v201 + 968) = v69;
      swift_bridgeObjectRelease();
      kMediaML_binnedRscp.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v70, v71);
      if (!*(void *)(v201 + 392)) {
        goto LABEL_58;
      }
      uint64_t v67 = *(void *)(v201 + 1120);
      uint64_t v68 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 368, v201 + 336);
      swift_dynamicCast();
      uint64_t v66 = *(void *)(v201 + 976);
      *(void *)(v201 + 984) = v66;
      swift_bridgeObjectRelease();
      kMediaML_binnedSnr.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v67, v68);
      if (!*(void *)(v201 + 456)) {
        goto LABEL_58;
      }
      uint64_t v64 = *(void *)(v201 + 1112);
      uint64_t v65 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 432, v201 + 400);
      swift_dynamicCast();
      uint64_t v63 = *(void *)(v201 + 992);
      *(void *)(v201 + 1000) = v63;
      swift_bridgeObjectRelease();
      kMediaML_bars.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v64, v65);
      if (!*(void *)(v201 + 520)) {
        goto LABEL_58;
      }
      uint64_t v61 = *(void *)(v201 + 1104);
      uint64_t v62 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 496, v201 + 464);
      swift_dynamicCast();
      uint64_t v60 = *(void *)(v201 + 1008);
      *(void *)(v201 + 1016) = v60;
      swift_bridgeObjectRelease();
      kMediaML_count.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v61, v62);
      if (!*(void *)(v201 + 584)) {
        goto LABEL_58;
      }
      uint64_t v58 = *(void *)(v201 + 1096);
      uint64_t v59 = *(void *)(v201 + 1080);
      outlined init with take of Any(v201 + 560, v201 + 528);
      swift_dynamicCast();
      uint64_t v57 = *(void *)(v201 + 1024);
      *(void *)(v201 + 1032) = v57;
      swift_bridgeObjectRelease();
      kMediaML_medianThroughputTrue.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v89(v58, v59);
      if (!*(void *)(v201 + 648))
      {
LABEL_58:
        _assertionFailure(_:_:file:line:flags:)();
        return;
      }
      uint64_t v56 = *(void *)(v201 + 1376);
      outlined init with take of Any(v201 + 624, v201 + 592);
      swift_dynamicCast();
      uint64_t v55 = *(void *)(v201 + 1040);
      *(void *)(v201 + 1048) = v55;
      swift_bridgeObjectRelease();
      *(Swift::String *)(v201 + 1440) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO processedcell (carrier, app_name, binned_rssi, binned_rsrp, binned_rsrq, binned_rscp, binned_snr, bars, count, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xB1uLL, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v29 = (void *)swift_task_alloc();
      uint64_t v17 = v56;
      *(void *)(v201 + 1456) = v29;
      v29[2] = v82;
      v29[3] = v83;
      v29[4] = v78;
      v29[5] = v79;
      v29[6] = v75;
      v29[7] = v72;
      v29[8] = v69;
      v29[9] = v66;
      v29[10] = v63;
      v29[11] = v60;
      v29[12] = v57;
      v29[13] = v55;
      uint64_t v16 = (uint64_t)MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
_swift_task_switch:
      _swift_task_switch(v16, v17);
      return;
    }
  }
  uint64_t v53 = *(int **)((**(void **)(v201 + 1072) & swift_isaMask) + 0xA0);
  uint64_t v54 = (void (*)(uint64_t))((char *)v53 + *v53);
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v201 + 1472) = v30;
  *uint64_t v30 = *(void *)(v201 + 768);
  v30[1] = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  uint64_t v31 = *(void *)(v201 + 1280);
  v54(v31);
}

uint64_t MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  uint64_t v1 = v0[181];
  uint64_t v2 = v0[180];
  uint64_t v3 = v0[177];
  v0[96] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #2 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:));
  v0[183] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  }
  return _swift_task_switch(v4, 0);
}

{
  void *v0;
  uint64_t v1;
  char v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;

  v0[96] = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[177] = v0[183];
  uint64_t v1 = specialized IndexingIterator.next()();
  if (v2)
  {
    uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)((**(void **)(v43 + 1072) & swift_isaMask) + 0xA0)
                                         + **(int **)((**(void **)(v43 + 1072) & swift_isaMask) + 0xA0));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v43 + 1472) = v5;
    *uint64_t v5 = *(void *)(v43 + 768);
    v5[1] = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
    uint64_t v6 = *(void *)(v43 + 1280);
    return v7(v6);
  }
  else
  {
    uint64_t v40 = *(void *)(v43 + 1168);
    uint64_t v41 = *(void *)(v43 + 1080);
    uint64_t v39 = *(void *)(v43 + 1088);
    *(void *)(v43 + 920) = v1;
    kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v42(v40, v41);
    if (!*(void *)(v43 + 72)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v37 = *(void *)(v43 + 1160);
    v38 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 48, v43 + 16);
    swift_dynamicCast();
    uint64_t v35 = *(void *)(v43 + 704);
    uint64_t v36 = *(void *)(v43 + 712);
    *(void *)(v43 + 1424) = v36;
    *(void *)(v43 + 720) = v35;
    *(void *)(v43 + 728) = v36;
    swift_bridgeObjectRelease();
    kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v37, v38);
    if (!*(void *)(v43 + 136)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v33 = *(void *)(v43 + 1152);
    Swift::String v34 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 112, v43 + 80);
    swift_dynamicCast();
    uint64_t v31 = *(void *)(v43 + 736);
    uint64_t v32 = *(void *)(v43 + 744);
    *(void *)(v43 + 1432) = v32;
    *(void *)(v43 + 752) = v31;
    *(void *)(v43 + 760) = v32;
    swift_bridgeObjectRelease();
    kMediaML_binnedRssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v33, v34);
    if (!*(void *)(v43 + 200)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v29 = *(void *)(v43 + 1144);
    uint64_t v30 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 176, v43 + 144);
    swift_dynamicCast();
    char v28 = *(void *)(v43 + 928);
    *(void *)(v43 + 936) = v28;
    swift_bridgeObjectRelease();
    kMediaML_binnedRsrp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v29, v30);
    if (!*(void *)(v43 + 264)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v26 = *(void *)(v43 + 1136);
    char v27 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 240, v43 + 208);
    swift_dynamicCast();
    uint64_t v25 = *(void *)(v43 + 944);
    *(void *)(v43 + 952) = v25;
    swift_bridgeObjectRelease();
    kMediaML_binnedRsrq.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v26, v27);
    if (!*(void *)(v43 + 328)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v23 = *(void *)(v43 + 1128);
    MediaMLPlugin::SQLError v24 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 304, v43 + 272);
    swift_dynamicCast();
    uint64_t v22 = *(void *)(v43 + 960);
    *(void *)(v43 + 968) = v22;
    swift_bridgeObjectRelease();
    kMediaML_binnedRscp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v23, v24);
    if (!*(void *)(v43 + 392)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v20 = *(void *)(v43 + 1120);
    uint64_t v21 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 368, v43 + 336);
    swift_dynamicCast();
    uint64_t v19 = *(void *)(v43 + 976);
    *(void *)(v43 + 984) = v19;
    swift_bridgeObjectRelease();
    kMediaML_binnedSnr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v20, v21);
    if (!*(void *)(v43 + 456)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v17 = *(void *)(v43 + 1112);
    Swift::Int32 v18 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 432, v43 + 400);
    swift_dynamicCast();
    uint64_t v16 = *(void *)(v43 + 992);
    *(void *)(v43 + 1000) = v16;
    swift_bridgeObjectRelease();
    kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v17, v18);
    if (!*(void *)(v43 + 520)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    Swift::Int32 v14 = *(void *)(v43 + 1104);
    uint64_t v15 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 496, v43 + 464);
    swift_dynamicCast();
    Swift::String v13 = *(void *)(v43 + 1008);
    *(void *)(v43 + 1016) = v13;
    swift_bridgeObjectRelease();
    kMediaML_count.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v14, v15);
    if (!*(void *)(v43 + 584)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v11 = *(void *)(v43 + 1096);
    uint64_t v12 = *(void *)(v43 + 1080);
    outlined init with take of Any(v43 + 560, v43 + 528);
    swift_dynamicCast();
    Swift::String v10 = *(void *)(v43 + 1024);
    *(void *)(v43 + 1032) = v10;
    swift_bridgeObjectRelease();
    kMediaML_medianThroughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.subscript.getter();
    AnyColumn.subscript.getter();
    v42(v11, v12);
    if (*(void *)(v43 + 648))
    {
      uint64_t v9 = *(void *)(v43 + 1376);
      outlined init with take of Any(v43 + 624, v43 + 592);
      swift_dynamicCast();
      Swift::String v8 = *(void *)(v43 + 1040);
      *(void *)(v43 + 1048) = v8;
      swift_bridgeObjectRelease();
      *(Swift::String *)(v43 + 1440) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO processedcell (carrier, app_name, binned_rssi, binned_rsrp, binned_rsrq, binned_rscp, binned_snr, bars, count, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xB1uLL, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v43 + 1456) = v4;
      v4[2] = v35;
      v4[3] = v36;
      v4[4] = v31;
      v4[5] = v32;
      v4[6] = v28;
      v4[7] = v25;
      v4[8] = v22;
      v4[9] = v19;
      v4[10] = v16;
      v4[11] = v13;
      v4[12] = v10;
      v4[13] = v8;
      return _swift_task_switch(MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:), v9);
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 768) = *v1;
  *(void *)(v4 + 1480) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  }
  else
  {
    uint64_t v2 = MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  uint64_t v48 = v0;
  MediaMLPlugin::SQLError v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1384);
  uint64_t v26 = *(void *)(v0 + 1288);
  uint64_t v23 = *(void *)(v0 + 1280);
  uint64_t v22 = *(void *)(v0 + 1264);
  char v27 = *(void *)(v0 + 1256);
  uint64_t v1 = *(void *)(v0 + 1200);
  uint64_t v20 = *(void *)(v0 + 1184);
  uint64_t v21 = *(void *)(v0 + 1176);
  *(void *)(v0 + 768) = v0;
  uint64_t v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v21);
  v24(v26, v23, v27);
  uint64_t v25 = *(_DWORD *)(v22 + 80);
  uint64_t v30 = swift_allocObject();
  char v28 = *(void (**)(unint64_t, uint64_t, uint64_t))(v22 + 32);
  v28(v30 + ((v25 + 16) & ~(unint64_t)v25), v26, v27);
  v24(v26, v23, v27);
  uint64_t v32 = swift_allocObject();
  v28(v32 + ((v25 + 16) & ~(unint64_t)v25), v26, v27);
  uint64_t v41 = Logger.logObject.getter();
  uint64_t v42 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 896) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1488);
  Swift::String v34 = swift_allocObject();
  *(unsigned char *)(v34 + 16) = 0;
  uint64_t v35 = swift_allocObject();
  *(unsigned char *)(v35 + 16) = 8;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = partial apply for implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  *(void *)(v31 + 24) = v30;
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v36 + 24) = v31;
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37 + 16) = 0;
  v38 = swift_allocObject();
  *(unsigned char *)(v38 + 16) = 8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = partial apply for implicit closure #14 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:);
  *(void *)(v33 + 24) = v32;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v39 + 24) = v33;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v40 = v3;
  swift_retain();
  *uint64_t v40 = closure #1 in OSLogArguments.append(_:)partial apply;
  v40[1] = v34;
  swift_retain();
  v40[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v40[3] = v35;
  swift_retain();
  v40[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v40[5] = v36;
  swift_retain();
  v40[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v40[7] = v37;
  swift_retain();
  v40[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v40[9] = v38;
  swift_retain();
  v40[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v40[11] = v39;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v4 = v19[185];
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(0);
    Swift::Int32 v18 = createStorage<A>(capacity:type:)(0);
    uint64_t v43 = buf;
    uint64_t v44 = v17;
    uint64_t v45 = v18;
    serialize(_:at:)(0, &v43);
    serialize(_:at:)(2, &v43);
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v47 = v34;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    if (v4) {
      return result;
    }
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v47 = v35;
    closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v47 = v36;
    closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v47 = v37;
    closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v47 = v38;
    closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    Builtin::Word v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v47 = v39;
    closure #1 in osLogInternal(_:log:type:)(&v46, (uint64_t)&v43, (uint64_t)&v44, (uint64_t)&v45);
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Returning a dataframe of size=%ld,%ld", buf, size);
    destroyStorage<A>(_:count:)(v17);
    destroyStorage<A>(_:count:)(v18);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v19[175];
  Swift::String v10 = (void (*)(uint64_t, uint64_t, uint64_t))v19[173];
  Swift::String v13 = v19[162];
  Swift::Int32 v14 = v19[160];
  uint64_t v11 = v19[157];
  uint64_t v15 = v19[150];
  Swift::String v8 = v19[147];
  uint64_t v9 = v19[132];
  uint64_t v7 = v19[148];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v8);
  v10(v9, v14, v11);
  v12(v14, v11);
  v12(v13, v11);
  swift_release();
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
  uint64_t v6 = *(uint64_t (**)(void))(v19[96] + 8);
  return v6();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  uint64_t v5 = (void (*)(uint64_t, uint64_t))v0[175];
  uint64_t v3 = v0[162];
  uint64_t v4 = v0[157];
  v0[96] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5(v3, v4);
  swift_release();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0[96] + 8);
  return v1();
}

{
  void *v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[175];
  uint64_t v2 = v0[162];
  uint64_t v3 = v0[157];
  v0[96] = v0;
  v1(v2, v3);
  swift_release();
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
  uint64_t v4 = *(uint64_t (**)(void))(v0[96] + 8);
  return v4();
}

void *closure #1 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t closure #2 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v24 = v14;
  swift_bridgeObjectRetain();
  *(void *)(v24 + 24) = &type metadata for String;
  *(void *)(v24 + 32) = &protocol witness table for String;
  *(void *)uint64_t v24 = a2;
  *(void *)(v24 + 8) = a3;
  swift_bridgeObjectRetain();
  *(void *)(v24 + 64) = &type metadata for String;
  *(void *)(v24 + 72) = &protocol witness table for String;
  *(void *)(v24 + 40) = a4;
  *(void *)(v24 + 48) = a5;
  *(void *)(v24 + 104) = &type metadata for Int;
  *(void *)(v24 + 112) = &protocol witness table for Int;
  *(void *)(v24 + 80) = a6;
  *(void *)(v24 + 144) = &type metadata for Int;
  *(void *)(v24 + 152) = &protocol witness table for Int;
  *(void *)(v24 + 120) = a7;
  *(void *)(v24 + 184) = &type metadata for Int;
  *(void *)(v24 + 192) = &protocol witness table for Int;
  *(void *)(v24 + 160) = a8;
  *(void *)(v24 + 224) = &type metadata for Int;
  *(void *)(v24 + 232) = &protocol witness table for Int;
  *(void *)(v24 + 200) = a10;
  *(void *)(v24 + 264) = &type metadata for Int;
  *(void *)(v24 + 272) = &protocol witness table for Int;
  *(void *)(v24 + 240) = a11;
  *(void *)(v24 + 304) = &type metadata for Int;
  *(void *)(v24 + 312) = &protocol witness table for Int;
  *(void *)(v24 + 280) = a12;
  *(void *)(v24 + 344) = &type metadata for Int;
  *(void *)(v24 + 352) = &protocol witness table for Int;
  *(void *)(v24 + 320) = a13;
  *(void *)(v24 + 384) = &type metadata for Double;
  *(void *)(v24 + 392) = &protocol witness table for Double;
  *(double *)(v24 + 360) = a9;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v26) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #14 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t MediaMLPlugin.getProcessedCellDataFromDB()(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v2[3] = v1;
  return _swift_task_switch(MediaMLPlugin.getProcessedCellDataFromDB(), 0);
}

void MediaMLPlugin.getProcessedCellDataFromDB()()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getProcessedCellDataFromDB(), 0, v11, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 80) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WITH CarrierAppNamepair as (SELECT carrier, app_name FROM processedcell GROUP BY carrier, app_name HAVING COUNT(*) > 5)\nSELECT p.carrier, p.app_name, binned_rssi, binned_rsrp, binned_rsrq, binned_rscp, binned_snr, bars, throughput_true\nFROM processedcell p JOIN CarrierAppNamepair c\nON p.carrier = c.carrier AND p.app_name = c.app_name", 0x150uLL, 1);
    _swift_task_switch(MediaMLPlugin.getProcessedCellDataFromDB(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    uint64_t v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

uint64_t MediaMLPlugin.getProcessedCellDataFromDB()()
{
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  uint64_t v1 = v0[9];
  v0[2] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getProcessedCellDataFromDB());
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getProcessedCellDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getProcessedCellDataFromDB();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[13];
  v0[2] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[6] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getProcessedCellDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getProcessedCellDataFromDB()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v90 = 0;
  uint64_t v101 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getProcessedCellDataFromDB();
  uint64_t v118 = 0;
  uint64_t v117 = 0;
  uint64_t v91 = &v116;
  uint64_t v116 = 0;
  uint64_t v92 = &v115;
  uint64_t v115 = 0;
  uint64_t v93 = &v114;
  uint64_t v114 = 0;
  uint64_t v94 = &v113;
  uint64_t v113 = 0;
  uint64_t v95 = &v112;
  uint64_t v112 = 0;
  uint64_t v96 = &v111;
  uint64_t v111 = 0;
  uint64_t v97 = &v110;
  uint64_t v110 = 0;
  uint64_t v98 = &v109;
  uint64_t v109 = 0;
  uint32_t v99 = &v108;
  uint64_t v108 = 0;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v69 = *(void *)(v68 - 8);
  uint64_t v70 = v68 - 8;
  unint64_t v71 = (*(void *)(v69 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v68);
  uint64_t v72 = (char *)v15 - v71;
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = v73 - 8;
  unint64_t v76 = (*(void *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v73);
  uint64_t v77 = (char *)v15 - v76;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = v78 - 8;
  unint64_t v81 = (*(void *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v90);
  uint64_t v82 = (char *)v15 - v81;
  uint64_t v83 = type metadata accessor for DataFrame();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = v83 - 8;
  unint64_t v86 = (*(void *)(v84 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v90);
  uint64_t v87 = (char *)v15 - v86;
  uint64_t v118 = (char *)v15 - v86;
  uint64_t v117 = a1;
  uint64_t v88 = &type metadata for String;
  uint64_t v116 = _allocateUninitializedArray<A>(_:)();
  uint64_t v115 = _allocateUninitializedArray<A>(_:)();
  uint64_t v89 = &type metadata for Int;
  uint64_t v114 = _allocateUninitializedArray<A>(_:)();
  uint64_t v113 = _allocateUninitializedArray<A>(_:)();
  uint64_t v112 = _allocateUninitializedArray<A>(_:)();
  uint64_t v111 = _allocateUninitializedArray<A>(_:)();
  uint64_t v110 = _allocateUninitializedArray<A>(_:)();
  uint64_t v109 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v100;
  uint64_t v108 = v3;
  v104[2] = v91;
  v104[3] = v92;
  v104[4] = v93;
  v104[5] = v94;
  v104[6] = v95;
  v104[7] = v96;
  v104[8] = v97;
  v104[9] = v98;
  v104[10] = v99;
  (*(void (**)(uint64_t (*)(uint64_t), void *))(*(void *)a1 + 144))(v101, v104);
  uint64_t v102 = v4;
  uint64_t v103 = v4;
  if (v4)
  {
    v15[1] = v103;
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = &v116;
  }
  else
  {
    DataFrame.init()();
    uint64_t v5 = kMediaML_carrier.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v5->_countAndFlagsBits;
    object = v5->_object;
    swift_bridgeObjectRetain();
    uint64_t v66 = &v116;
    uint64_t v16 = v116;
    swift_bridgeObjectRetain();
    Swift::Int32 v18 = &v107;
    uint64_t v107 = v16;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v24 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v25 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    char v27 = *(void (**)(char *, uint64_t))(v79 + 8);
    uint64_t v26 = v79 + 8;
    v27(v82, v78);
    uint64_t v6 = kMediaML_appName.unsafeMutableAddressor();
    uint64_t v20 = v6->_countAndFlagsBits;
    uint64_t v22 = v6->_object;
    swift_bridgeObjectRetain();
    uint64_t v65 = &v115;
    uint64_t v21 = v115;
    swift_bridgeObjectRetain();
    v106[1] = v21;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v27(v82, v78);
    uint64_t v7 = kMediaML_binnedRssi.unsafeMutableAddressor();
    uint64_t v31 = v7->_countAndFlagsBits;
    uint64_t v29 = v7->_object;
    swift_bridgeObjectRetain();
    uint64_t v64 = &v114;
    uint64_t v28 = v114;
    swift_bridgeObjectRetain();
    uint64_t v30 = v106;
    v106[0] = v28;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    unint64_t v48 = lazy protocol witness table accessor for type [Int] and conformance [A]();
    uint32_t v49 = &type metadata for Int;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v51 = *(void (**)(char *, uint64_t))(v74 + 8);
    uint64_t v50 = v74 + 8;
    v51(v77, v73);
    Swift::String v8 = kMediaML_binnedRsrp.unsafeMutableAddressor();
    uint64_t v32 = v8->_countAndFlagsBits;
    Swift::String v34 = v8->_object;
    swift_bridgeObjectRetain();
    uint64_t v63 = &v113;
    uint64_t v33 = v113;
    swift_bridgeObjectRetain();
    v105[5] = v33;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v51(v77, v73);
    uint64_t v9 = kMediaML_binnedRsrq.unsafeMutableAddressor();
    uint64_t v35 = v9->_countAndFlagsBits;
    uint64_t v37 = v9->_object;
    swift_bridgeObjectRetain();
    uint64_t v62 = &v112;
    uint64_t v36 = v112;
    swift_bridgeObjectRetain();
    v105[4] = v36;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v51(v77, v73);
    uint64_t v10 = kMediaML_binnedRscp.unsafeMutableAddressor();
    uint64_t v38 = v10->_countAndFlagsBits;
    uint64_t v40 = v10->_object;
    swift_bridgeObjectRetain();
    uint64_t v61 = &v111;
    uint64_t v39 = v111;
    swift_bridgeObjectRetain();
    v105[3] = v39;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v51(v77, v73);
    uint64_t v11 = kMediaML_binnedSnr.unsafeMutableAddressor();
    uint64_t v41 = v11->_countAndFlagsBits;
    uint64_t v43 = v11->_object;
    swift_bridgeObjectRetain();
    uint64_t v60 = &v110;
    uint64_t v42 = v110;
    swift_bridgeObjectRetain();
    v105[2] = v42;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v51(v77, v73);
    uint64_t v12 = kMediaML_bars.unsafeMutableAddressor();
    uint64_t v44 = v12->_countAndFlagsBits;
    Builtin::Word v46 = v12->_object;
    swift_bridgeObjectRetain();
    uint64_t v59 = &v109;
    uint64_t v45 = v109;
    swift_bridgeObjectRetain();
    v105[1] = v45;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v51(v77, v73);
    MediaMLPlugin::SQLError v13 = kMediaML_throughputTrue.unsafeMutableAddressor();
    uint64_t v56 = v13->_countAndFlagsBits;
    uint64_t v53 = v13->_object;
    swift_bridgeObjectRetain();
    uint64_t v58 = &v108;
    uint64_t v52 = v108;
    swift_bridgeObjectRetain();
    uint64_t v54 = v105;
    v105[0] = v52;
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v57 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v72, v68);
    (*(void (**)(uint64_t, char *, uint64_t))(v84 + 32))(v67, v87, v83);
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = v66;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getProcessedCellDataFromDB()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v16)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v15)
    {
      SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(3, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(4, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(5, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(6, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(7, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(8, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appName not of type String", 0x1AuLL, 1);
      MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 code = v18.code;
      uint64_t countAndFlagsBits = v18.desc.value._countAndFlagsBits;
      object = v18.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v9 = swift_allocError();
      *(_DWORD *)uint64_t v5 = code;
      *(void *)(v5 + 8) = countAndFlagsBits;
      *(void *)(v5 + 16) = object;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier not of type String", 0x1AuLL, 1);
    MediaMLPlugin::SQLError v17 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v12 = v17.code;
    uint64_t desc_8 = v17.desc.value._countAndFlagsBits;
    uint64_t v11 = v17.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v13 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v12;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v11;
    swift_willThrow();
    return v13;
  }
}

uint64_t MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 1864) = v2;
  *(void *)(v3 + 1856) = a2;
  *(void *)(v3 + 1848) = a1;
  *(void *)(v3 + 1312) = v3;
  *(void *)(v3 + 1320) = 0;
  *(void *)(v3 + 1328) = 0;
  *(void *)(v3 + 1344) = 0;
  *(void *)(v3 + 1400) = 0;
  *(void *)(v3 + 1408) = 0;
  *(void *)(v3 + 1416) = 0;
  *(void *)(v3 + 1424) = 0;
  *(void *)(v3 + 1432) = 0;
  *(void *)(v3 + 1440) = 0;
  *(void *)(v3 + 1448) = 0;
  *(void *)(v3 + 1456) = 0;
  *(void *)(v3 + 1464) = 0;
  *(void *)(v3 + 1472) = 0;
  *(void *)(v3 + 1480) = 0;
  *(void *)(v3 + 1488) = 0;
  *(void *)(v3 + 1504) = 0;
  *(void *)(v3 + 1520) = 0;
  *(void *)(v3 + 1552) = 0;
  *(void *)(v3 + 1136) = 0;
  *(void *)(v3 + 1144) = 0;
  *(void *)(v3 + 1152) = 0;
  *(unsigned char *)(v3 + 1160) = 0;
  *(void *)(v3 + 1560) = 0;
  *(void *)(v3 + 1584) = 0;
  *(void *)(v3 + 1608) = 0;
  *(void *)(v3 + 1632) = 0;
  *(void *)(v3 + 1656) = 0;
  *(void *)(v3 + 1680) = 0;
  *(void *)(v3 + 1704) = 0;
  *(void *)(v3 + 1728) = 0;
  *(void *)(v3 + 1184) = 0;
  *(void *)(v3 + 1192) = 0;
  *(void *)(v3 + 1200) = 0;
  *(void *)(v3 + 1208) = 0;
  *(void *)(v3 + 1216) = 0;
  *(void *)(v3 + 1224) = 0;
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v3 + 1872) = v4;
  *(void *)(v3 + 1880) = *(void *)(v4 - 8);
  *(void *)(v3 + 1888) = swift_task_alloc();
  *(void *)(v3 + 1896) = swift_task_alloc();
  *(void *)(v3 + 1904) = swift_task_alloc();
  *(void *)(v3 + 1912) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DataFrame.Slice();
  *(void *)(v3 + 1920) = v5;
  *(void *)(v3 + 1928) = *(void *)(v5 - 8);
  *(void *)(v3 + 1936) = swift_task_alloc();
  *(void *)(v3 + 1944) = swift_task_alloc();
  *(void *)(v3 + 1952) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<AnyColumnSlice>);
  *(void *)(v3 + 1960) = swift_task_alloc();
  *(void *)(v3 + 1968) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AnyColumn();
  *(void *)(v3 + 1976) = v6;
  *(void *)(v3 + 1984) = *(void *)(v6 - 8);
  *(void *)(v3 + 1992) = swift_task_alloc();
  *(void *)(v3 + 2000) = swift_task_alloc();
  *(void *)(v3 + 2008) = swift_task_alloc();
  *(void *)(v3 + 2016) = swift_task_alloc();
  *(void *)(v3 + 2024) = swift_task_alloc();
  *(void *)(v3 + 2032) = swift_task_alloc();
  *(void *)(v3 + 2040) = swift_task_alloc();
  *(void *)(v3 + 2048) = swift_task_alloc();
  *(void *)(v3 + 2056) = swift_task_alloc();
  *(void *)(v3 + 2064) = swift_task_alloc();
  *(void *)(v3 + 2072) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for AnyColumnSlice();
  *(void *)(v3 + 2080) = v7;
  *(void *)(v3 + 2088) = *(void *)(v7 - 8);
  *(void *)(v3 + 2096) = swift_task_alloc();
  *(void *)(v3 + 2104) = swift_task_alloc();
  *(void *)(v3 + 2112) = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DataFrame();
  *(void *)(v3 + 2120) = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  *(void *)(v3 + 2128) = v10;
  *(void *)(v3 + 2136) = *(void *)(v10 + 64);
  *(void *)(v3 + 2144) = swift_task_alloc();
  *(void *)(v3 + 2152) = swift_task_alloc();
  *(void *)(v3 + 2160) = swift_task_alloc();
  *(void *)(v3 + 2168) = swift_task_alloc();
  *(void *)(v3 + 2176) = swift_task_alloc();
  *(void *)(v3 + 2184) = swift_task_alloc();
  *(void *)(v3 + 2192) = swift_task_alloc();
  *(void *)(v3 + 2200) = swift_task_alloc();
  *(void *)(v3 + 2208) = swift_task_alloc();
  *(void *)(v3 + 2216) = swift_task_alloc();
  *(void *)(v3 + 1320) = a2;
  *(void *)(v3 + 1328) = v2;
  return _swift_task_switch(MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:), 0);
}

void MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t a1)
{
  uint64_t v2 = __chkstk_darwin(a1);
  v219 = (void *)v1;
  uint64_t v3 = *(void **)(v1 + 1864);
  *(void *)(v1 + 1312) = v1;
  uint64_t v220 = (*(uint64_t (**)(uint64_t))((*v3 & swift_isaMask) + 0x58))(v2);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:), 0, v220, v4, v4);
  swift_release();
  uint64_t v218 = *(void *)(v1 + 1336);
  *(void *)(v1 + 2224) = v218;
  if (!v218)
  {
    Swift::String v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v223 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v32);
    Swift::Int32 code = v223.code;
    uint64_t desc_8 = v223.desc.value._countAndFlagsBits;
    object = v223.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v33 = code;
    *(void *)(v33 + 8) = desc_8;
    *(void *)(v33 + 16) = object;
    swift_willThrow();
LABEL_82:
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
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v34 = *(void (**)(void))(*(void *)(v1 + 1312) + 8);
    v34();
    return;
  }
  uint64_t v213 = *(void *)(v1 + 2216);
  uint64_t v215 = *(void *)(v1 + 2120);
  uint64_t v214 = *(void *)(v1 + 1856);
  uint64_t v212 = *(void *)(v1 + 2128);
  *(void *)(v1 + 1344) = v218;
  Swift::String v211 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v217 = DataFrame.containsColumn(_:)(v211);
  swift_bridgeObjectRelease();
  MediaMLPlugin::SQLError v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v212 + 16);
  *(void *)(v1 + 2232) = v216;
  *(void *)(v1 + 2240) = (v212 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v216(v213, v214, v215);
  if (v217)
  {
    Swift::String v208 = *kMediaML_throughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v209 = DataFrame.containsColumn(_:)(v208);
    swift_bridgeObjectRelease();
    Swift::Bool v210 = v209;
  }
  else
  {
    Swift::Bool v210 = 0;
  }
  uint64_t v5 = *(void *)(v1 + 2216);
  uint64_t v205 = *(void *)(v1 + 2208);
  uint64_t v207 = *(void *)(v1 + 2120);
  uint64_t v206 = *(void *)(v1 + 1856);
  uint64_t v6 = *(void *)(v1 + 2128) + 8;
  uint64_t v204 = *(void (**)(uint64_t))v6;
  *(void *)(v1 + 2248) = *(void *)v6;
  *(void *)(v1 + 2256) = v6 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v204(v5);
  v216(v205, v206, v207);
  if (v210)
  {
    Swift::String v201 = *kMediaML_noise.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v202 = DataFrame.containsColumn(_:)(v201);
    swift_bridgeObjectRelease();
    Swift::Bool v203 = v202;
  }
  else
  {
    Swift::Bool v203 = 0;
  }
  uint64_t v198 = *(void *)(v1 + 2200);
  uint64_t v200 = *(void *)(v1 + 2120);
  uint64_t v199 = *(void *)(v1 + 1856);
  v204(*(void *)(v1 + 2208));
  v216(v198, v199, v200);
  if (v203)
  {
    Swift::String v195 = *kMediaML_txRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v196 = DataFrame.containsColumn(_:)(v195);
    swift_bridgeObjectRelease();
    Swift::Bool v197 = v196;
  }
  else
  {
    Swift::Bool v197 = 0;
  }
  uint64_t v192 = *(void *)(v1 + 2192);
  uint64_t v194 = *(void *)(v1 + 2120);
  uint64_t v193 = *(void *)(v1 + 1856);
  v204(*(void *)(v1 + 2200));
  v216(v192, v193, v194);
  if (v197)
  {
    Swift::String v189 = *kMediaML_rxRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v190 = DataFrame.containsColumn(_:)(v189);
    swift_bridgeObjectRelease();
    Swift::Bool v191 = v190;
  }
  else
  {
    Swift::Bool v191 = 0;
  }
  uint64_t v186 = *(void *)(v1 + 2184);
  uint64_t v188 = *(void *)(v1 + 2120);
  uint64_t v187 = *(void *)(v1 + 1856);
  v204(*(void *)(v1 + 2192));
  v216(v186, v187, v188);
  if (v191)
  {
    Swift::String v183 = *kMediaML_dayOfWeek.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v184 = DataFrame.containsColumn(_:)(v183);
    swift_bridgeObjectRelease();
    Swift::Bool v185 = v184;
  }
  else
  {
    Swift::Bool v185 = 0;
  }
  uint64_t v180 = *(void *)(v1 + 2176);
  uint64_t v182 = *(void *)(v1 + 2120);
  uint64_t v181 = *(void *)(v1 + 1856);
  v204(*(void *)(v1 + 2184));
  v216(v180, v181, v182);
  if (v185)
  {
    Swift::String v177 = *kMediaML_hourOfDay.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v178 = DataFrame.containsColumn(_:)(v177);
    swift_bridgeObjectRelease();
    Swift::Bool v179 = v178;
  }
  else
  {
    Swift::Bool v179 = 0;
  }
  uint64_t v174 = *(void *)(v1 + 2168);
  uint64_t v176 = *(void *)(v1 + 2120);
  uint64_t v175 = *(void *)(v1 + 1856);
  v204(*(void *)(v1 + 2176));
  v216(v174, v175, v176);
  if (!v179)
  {
    ((void (*)(void, void))v204)(*(void *)(v1 + 2168), *(void *)(v1 + 2120));
LABEL_78:
    uint64_t v30 = *(void *)(v1 + 1888);
    uint64_t v46 = *(void *)(v1 + 1872);
    uint64_t v45 = *(void *)(v1 + 1880);
    uint64_t v31 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v30, v31, v46);
    uint32_t v49 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    *(void *)(v1 + 1352) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v47 = *(_DWORD *)(v1 + 1164);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v50 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v49, v48))
    {
      uint64_t v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v42 = createStorage<A>(capacity:type:)(0);
      uint64_t v43 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 1360) = v41;
      *(void *)(v1 + 1368) = v42;
      *(void *)(v1 + 1376) = v43;
      serialize(_:at:)(0, (unsigned char **)(v1 + 1360));
      serialize(_:at:)(0, (unsigned char **)(v1 + 1360));
      *(void *)(v1 + 1384) = v50;
      uint64_t v44 = (void *)swift_task_alloc();
      v44[2] = v1 + 1360;
      v44[3] = v1 + 1368;
      v44[4] = v1 + 1376;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl((void *)&_mh_execute_header, v49, v48, "getAndSavePreProcessedWifiData: DataFrame did not contain all required columns", v41, v47);
      destroyStorage<A>(_:count:)(v42);
      destroyStorage<A>(_:count:)(v43);
      UnsafeMutablePointer.deallocate()();
    }
    swift_bridgeObjectRelease();
    uint64_t v39 = *(void *)(v1 + 1888);
    uint64_t v40 = *(void *)(v1 + 1872);
    uint64_t v38 = *(void *)(v1 + 1880);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
    lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
    swift_allocError();
    swift_willThrow();
    swift_release();
    goto LABEL_82;
  }
  Swift::String v172 = *kMediaML_ssid.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v173 = DataFrame.containsColumn(_:)(v172);
  swift_bridgeObjectRelease();
  ((void (*)(void, void))v204)(*(void *)(v1 + 2168), *(void *)(v1 + 2120));
  if (!v173) {
    goto LABEL_78;
  }
  uint64_t v170 = *(void *)(v1 + 2112);
  uint64_t v165 = *(void *)(v1 + 2104);
  uint64_t v171 = *(void *)(v1 + 2080);
  uint64_t v167 = *(void *)(v1 + 2072);
  uint64_t v168 = *(void *)(v1 + 1976);
  uint64_t v169 = *(void *)(v1 + 2088);
  uint64_t v166 = *(void *)(v1 + 1984);
  kMediaML_sessionID.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  DataFrame.subscript.getter();
  AnyColumn.distinct()();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v166 + 8);
  *(void *)(v1 + 2264) = v7;
  *(void *)(v1 + 2272) = (v166 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v167, v168);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v169 + 16);
  *(void *)(v1 + 2280) = v8;
  *(void *)(v1 + 2288) = (v169 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v165, v170, v171);
  *(void *)(v1 + 2296) = lazy protocol witness table accessor for type AnyColumnSlice and conformance AnyColumnSlice();
  Collection<>.makeIterator()();
LABEL_25:
  IndexingIterator.next()();
  if (*(void *)(v1 + 40) == 1)
  {
    outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v1 + 1968));
    uint64_t v28 = (void *)swift_task_alloc();
    v219[300] = v28;
    *uint64_t v28 = v219[164];
    v28[1] = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
    uint64_t v29 = v219[268];
    MediaMLPlugin.getProcessedWiFiDataFromDB()(v29);
  }
  else
  {
    outlined init with take of Any?((_OWORD *)(v1 + 16), (_OWORD *)(v1 + 48));
    kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    outlined init with copy of Any?(v1 + 48, v1 + 80);
    *(void *)(swift_task_alloc() + 16) = v1 + 80;
    DataFrame.filter<A>(on:_:_:)();
    uint64_t v163 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 2280);
    uint64_t v160 = *(void *)(v1 + 2104);
    uint64_t v162 = *(void *)(v1 + 2096);
    uint64_t v164 = *(void *)(v1 + 2080);
    uint64_t v161 = *(void *)(v1 + 2088);
    swift_task_dealloc();
    outlined destroy of Any?(v1 + 80);
    swift_bridgeObjectRelease();
    kMediaML_ssid.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.Slice.subscript.getter();
    AnyColumnSlice.distinct()();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v161 + 8);
    *(void *)(v1 + 2304) = v9;
    *(void *)(v1 + 2312) = (v161 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v9(v160, v164);
    swift_bridgeObjectRelease();
    v163(v160, v162, v164);
    Collection<>.makeIterator()();
    while (1)
    {
      IndexingIterator.next()();
      if (*(void *)(v1 + 136) == 1)
      {
        uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v1 + 2304);
        uint64_t v53 = *(void *)(v1 + 2096);
        uint64_t v51 = *(void *)(v1 + 2080);
        uint64_t v55 = *(void *)(v1 + 1944);
        uint64_t v56 = *(void *)(v1 + 1920);
        uint64_t v54 = *(void *)(v1 + 1928);
        outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v1 + 1960));
        v52(v53, v51);
        (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v56);
        outlined destroy of Any?(v1 + 48);
        goto LABEL_25;
      }
      outlined init with take of Any?((_OWORD *)(v1 + 112), (_OWORD *)(v1 + 144));
      kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      outlined init with copy of Any?(v1 + 144, v1 + 176);
      *(void *)(swift_task_alloc() + 16) = v1 + 176;
      DataFrame.Slice.filter<A>(on:_:_:)();
      uint64_t v141 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 2232);
      uint64_t v140 = *(void *)(v1 + 2160);
      uint64_t v143 = *(void *)(v1 + 2152);
      uint64_t v144 = *(void *)(v1 + 2120);
      uint64_t v134 = *(void *)(v1 + 1912);
      uint64_t v137 = *(void *)(v1 + 1872);
      uint64_t v139 = *(void *)(v1 + 2128);
      uint64_t v136 = *(void *)(v1 + 1880);
      swift_task_dealloc();
      outlined destroy of Any?(v1 + 176);
      swift_bridgeObjectRelease();
      DataFrame.init(_:)();
      *(void *)(v1 + 1400) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1408) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1416) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1424) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1432) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1440) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1448) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1456) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1464) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1472) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v1 + 1480) = 0;
      uint64_t v135 = DataFrame.shape.getter();
      *(void *)(v1 + 1488) = v135;
      uint64_t v10 = MediaMLPlugin.logger.unsafeMutableAddressor();
      uint64_t v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v136 + 16);
      v138(v134, v10, v137);
      v141(v143, v140, v144);
      int v142 = *(_DWORD *)(v139 + 80);
      uint64_t v147 = swift_allocObject();
      uint64_t v145 = *(void (**)(unint64_t, uint64_t, uint64_t))(v139 + 32);
      v145(v147 + ((v142 + 16) & ~(unint64_t)v142), v143, v144);
      v141(v143, v140, v144);
      uint64_t v149 = swift_allocObject();
      v145(v149 + ((v142 + 16) & ~(unint64_t)v142), v143, v144);
      oslog = Logger.logObject.getter();
      os_log_type_t v159 = static os_log_type_t.debug.getter();
      *(void *)(v1 + 1496) = 22;
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t size = *(_DWORD *)(v1 + 2420);
      uint64_t v151 = swift_allocObject();
      *(unsigned char *)(v151 + 16) = 0;
      uint64_t v152 = swift_allocObject();
      *(unsigned char *)(v152 + 16) = 8;
      uint64_t v148 = swift_allocObject();
      *(void *)(v148 + 16) = partial apply for implicit closure #8 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v148 + 24) = v147;
      uint64_t v153 = swift_allocObject();
      *(void *)(v153 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v153 + 24) = v148;
      uint64_t v154 = swift_allocObject();
      *(unsigned char *)(v154 + 16) = 0;
      uint64_t v155 = swift_allocObject();
      *(unsigned char *)(v155 + 16) = 8;
      uint64_t v150 = swift_allocObject();
      *(void *)(v150 + 16) = partial apply for implicit closure #9 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v150 + 24) = v149;
      uint64_t v156 = swift_allocObject();
      *(void *)(v156 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v156 + 24) = v150;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      _allocateUninitializedArray<A>(_:)();
      uint64_t v157 = v11;
      swift_retain();
      *uint64_t v157 = closure #1 in OSLogArguments.append(_:)partial apply;
      v157[1] = v151;
      swift_retain();
      v157[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v157[3] = v152;
      swift_retain();
      v157[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v157[5] = v153;
      swift_retain();
      v157[6] = closure #1 in OSLogArguments.append(_:)partial apply;
      v157[7] = v154;
      swift_retain();
      v157[8] = closure #1 in OSLogArguments.append(_:)partial apply;
      v157[9] = v155;
      swift_retain();
      v157[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v157[11] = v156;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v159))
      {
        buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v132 = createStorage<A>(capacity:type:)(0);
        uint64_t v133 = createStorage<A>(capacity:type:)(0);
        *(void *)(v1 + 1824) = buf;
        *(void *)(v1 + 1832) = v132;
        *(void *)(v1 + 1840) = v133;
        serialize(_:at:)(0, (unsigned char **)(v1 + 1824));
        serialize(_:at:)(2, (unsigned char **)(v1 + 1824));
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1304) = v151;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1304) = v152;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        *(void *)(v1 + 1304) = v153;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1304) = v154;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1304) = v155;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        *(void *)(v1 + 1296) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        *(void *)(v1 + 1304) = v156;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1296), v1 + 1824, v1 + 1832, v1 + 1840);
        _os_log_impl((void *)&_mh_execute_header, oslog, v159, "Filtered dataframe shape=%ld,%ld", buf, size);
        destroyStorage<A>(_:count:)(v132);
        destroyStorage<A>(_:count:)(v133);
        UnsafeMutablePointer.deallocate()();
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v128 = *(void *)(v1 + 1912);
      uint64_t v129 = *(void *)(v1 + 1872);
      uint64_t v127 = *(void *)(v1 + 1880);

      uint64_t v130 = *(void (**)(uint64_t, uint64_t))(v127 + 8);
      v130(v128, v129);
      while (*(void *)(v1 + 1480) < v135)
      {
        uint64_t v126 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v124 = *(void *)(v1 + 2064);
        uint64_t v125 = *(void *)(v1 + 1976);
        kMediaML_rssi.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v126(v124, v125);
        if (!*(void *)(v1 + 552)) {
          goto LABEL_66;
        }
        uint64_t v123 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v121 = *(void *)(v1 + 2056);
        uint64_t v122 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 528, v1 + 496);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_throughputTrue.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v123(v121, v122);
        if (!*(void *)(v1 + 616)) {
          goto LABEL_66;
        }
        uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v118 = *(void *)(v1 + 2048);
        uint64_t v119 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 592, v1 + 560);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_noise.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v120(v118, v119);
        if (!*(void *)(v1 + 680)) {
          goto LABEL_66;
        }
        uint64_t v117 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v115 = *(void *)(v1 + 2040);
        uint64_t v116 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 656, v1 + 624);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_txRate.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v117(v115, v116);
        if (!*(void *)(v1 + 744)) {
          goto LABEL_66;
        }
        uint64_t v114 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v112 = *(void *)(v1 + 2032);
        uint64_t v113 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 720, v1 + 688);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_rxRate.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v114(v112, v113);
        if (!*(void *)(v1 + 808)) {
          goto LABEL_66;
        }
        uint64_t v111 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v109 = *(void *)(v1 + 2024);
        uint64_t v110 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 784, v1 + 752);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_dayOfWeek.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v111(v109, v110);
        if (!*(void *)(v1 + 872)) {
          goto LABEL_66;
        }
        uint64_t v108 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v106 = *(void *)(v1 + 2016);
        uint64_t v107 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 848, v1 + 816);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_hourOfDay.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v108(v106, v107);
        if (!*(void *)(v1 + 936)) {
          goto LABEL_66;
        }
        uint64_t v105 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v103 = *(void *)(v1 + 2008);
        uint64_t v104 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 912, v1 + 880);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_ssid.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v105(v103, v104);
        if (!*(void *)(v1 + 1000)) {
          goto LABEL_66;
        }
        uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v100 = *(void *)(v1 + 2000);
        uint64_t v101 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 976, v1 + 944);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_appName.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v102(v100, v101);
        if (!*(void *)(v1 + 1064)) {
          goto LABEL_66;
        }
        uint32_t v99 = *(void (**)(uint64_t, uint64_t))(v1 + 2264);
        uint64_t v97 = *(void *)(v1 + 1992);
        uint64_t v98 = *(void *)(v1 + 1976);
        outlined init with take of Any(v1 + 1040, v1 + 1008);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_sessionID.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v99(v97, v98);
        if (!*(void *)(v1 + 1128)) {
          goto LABEL_66;
        }
        outlined init with take of Any(v1 + 1104, v1 + 1072);
        swift_dynamicCast();
        specialized Array.append(_:)();
        uint64_t v12 = swift_bridgeObjectRelease();
        uint64_t v14 = *(void *)(v1 + 1480);
        uint64_t v96 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_86;
        }
        *(void *)(v1 + 1480) = v96;
      }
      uint64_t v16 = *(void *)(v1 + 1904);
      uint64_t v79 = *(void *)(v1 + 1872);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v80 = preprocessData(rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)();
      *(void *)(v1 + 2320) = v80;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v1 + 1504) = v80;
      uint64_t v17 = MediaMLPlugin.logger.unsafeMutableAddressor();
      v138(v16, v17, v79);
      outlined init with copy of Any?(v1 + 48, v1 + 208);
      uint64_t v83 = swift_allocObject();
      outlined init with take of Any?((_OWORD *)(v1 + 208), (_OWORD *)(v83 + 16));
      swift_bridgeObjectRetain();
      uint64_t v81 = swift_allocObject();
      *(void *)(v81 + 16) = v80;
      swift_retain();
      uint64_t v85 = swift_allocObject();
      *(void *)(v85 + 16) = partial apply for implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v85 + 24) = v81;
      swift_release();
      log = Logger.logObject.getter();
      os_log_type_t v95 = static os_log_type_t.debug.getter();
      *(void *)(v1 + 1512) = 22;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v82 = *(_DWORD *)(v1 + 2424);
      uint64_t v87 = swift_allocObject();
      *(unsigned char *)(v87 + 16) = 32;
      uint64_t v88 = swift_allocObject();
      *(unsigned char *)(v88 + 16) = 8;
      uint64_t v84 = swift_allocObject();
      *(void *)(v84 + 16) = partial apply for implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v84 + 24) = v83;
      uint64_t v89 = swift_allocObject();
      *(void *)(v89 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
      *(void *)(v89 + 24) = v84;
      uint64_t v90 = swift_allocObject();
      *(unsigned char *)(v90 + 16) = 32;
      uint64_t v91 = swift_allocObject();
      *(unsigned char *)(v91 + 16) = 8;
      uint64_t v86 = swift_allocObject();
      *(void *)(v86 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
      *(void *)(v86 + 24) = v85;
      uint64_t v92 = swift_allocObject();
      *(void *)(v92 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
      *(void *)(v92 + 24) = v86;
      _allocateUninitializedArray<A>(_:)();
      uint64_t v93 = v18;
      swift_retain();
      *uint64_t v93 = closure #1 in OSLogArguments.append(_:)partial apply;
      v93[1] = v87;
      swift_retain();
      v93[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v93[3] = v88;
      swift_retain();
      v93[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      v93[5] = v89;
      swift_retain();
      v93[6] = closure #1 in OSLogArguments.append(_:)partial apply;
      v93[7] = v90;
      swift_retain();
      v93[8] = closure #1 in OSLogArguments.append(_:)partial apply;
      v93[9] = v91;
      swift_retain();
      v93[10] = closure #1 in OSLogArguments.append(_:)partial apply;
      v93[11] = v92;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(log, v95))
      {
        unint64_t v76 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v77 = createStorage<A>(capacity:type:)(0);
        uint64_t v78 = createStorage<A>(capacity:type:)(2);
        *(void *)(v1 + 1744) = v76;
        *(void *)(v1 + 1752) = v77;
        *(void *)(v1 + 1760) = v78;
        serialize(_:at:)(2, (unsigned char **)(v1 + 1744));
        serialize(_:at:)(2, (unsigned char **)(v1 + 1744));
        *(void *)(v1 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1240) = v87;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        *(void *)(v1 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1240) = v88;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        *(void *)(v1 + 1232) = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
        *(void *)(v1 + 1240) = v89;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        *(void *)(v1 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1240) = v90;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        *(void *)(v1 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1240) = v91;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        *(void *)(v1 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v1 + 1240) = v92;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1232), v1 + 1744, v1 + 1752, v1 + 1760);
        _os_log_impl((void *)&_mh_execute_header, log, v95, "processedData for session=%s %s", v76, v82);
        destroyStorage<A>(_:count:)(v77);
        destroyStorage<A>(_:count:)(v78);
        UnsafeMutablePointer.deallocate()();
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v74 = *(void *)(v1 + 1904);
      uint64_t v75 = *(void *)(v1 + 1872);

      v130(v74, v75);
      *(void *)(v1 + 2328) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
      uint64_t v12 = Array.count.getter();
      *(void *)(v1 + 1520) = v12;
      if (__OFSUB__(v12, 1))
      {
        __break(1u);
LABEL_86:
        __break(1u);
        goto _swift_task_switch;
      }
      *(void *)(v1 + 1536) = v12 - 1;
      *(void *)(v1 + 1544) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
      min<A>(_:_:)();
      uint64_t v73 = *(void *)(v1 + 1528);
      *(void *)(v1 + 1552) = v73;
      if (Array.count.getter() > 0)
      {
        if (v73 < 0) {
          goto LABEL_66;
        }
        *(void *)(v1 + 1136) = specialized Collection<>.makeIterator()();
        *(void *)(v1 + 1144) = v20;
        *(void *)(v1 + 1152) = v21;
        *(unsigned char *)(v1 + 1160) = v22 & 1;
        *(void *)(v1 + 2336) = 0;
        uint64_t v23 = specialized IndexingIterator.next()();
        if ((v24 & 1) == 0) {
          break;
        }
      }
      uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v1 + 2248);
      uint64_t v59 = *(void *)(v1 + 2160);
      uint64_t v57 = *(void *)(v1 + 2120);
      swift_bridgeObjectRelease();
      outlined destroy of [String]();
      outlined destroy of [String]();
      outlined destroy of [String]();
      outlined destroy of [Int]();
      outlined destroy of [Int]();
      outlined destroy of [Double]();
      outlined destroy of [Double]();
      outlined destroy of [Int]();
      outlined destroy of [Double]();
      outlined destroy of [Int]();
      v58(v59, v57);
      outlined destroy of Any?(v1 + 144);
    }
    *(void *)(v1 + 1560) = v23;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v71 = *(void *)(v1 + 1576);
    *(void *)(v1 + 1584) = v71;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    double v72 = *(double *)(v1 + 1600);
    if (((*(void *)&v72 >> 52) & 0x7FFLL) == 0x7FF
      || v72 <= -9.22337204e18
      || v72 >= 9.22337204e18
      || (*(void *)(v1 + 1608) = (uint64_t)v72,
          Array.subscript.getter(),
          Array.subscript.getter(),
          swift_bridgeObjectRelease(),
          swift_dynamicCast(),
          double v70 = *(double *)(v1 + 1624),
          ((*(void *)&v70 >> 52) & 0x7FFLL) == 0x7FF)
      || v70 <= -9.22337204e18
      || v70 >= 9.22337204e18)
    {
LABEL_66:
      _assertionFailure(_:_:file:line:flags:)();
      return;
    }
    uint64_t v69 = *(void *)(v1 + 2224);
    *(void *)(v1 + 1632) = (uint64_t)v70;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v67 = *(void *)(v1 + 1648);
    *(void *)(v1 + 1656) = v67;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v68 = *(void *)(v1 + 1672);
    *(void *)(v1 + 1680) = v68;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v66 = *(void *)(v1 + 1696);
    *(void *)(v1 + 1704) = v66;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v65 = *(void *)(v1 + 1720);
    *(void *)(v1 + 1728) = v65;
    Array.subscript.getter();
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    swift_dynamicCast();
    uint64_t v63 = *(void *)(v1 + 1168);
    uint64_t v64 = *(void *)(v1 + 1176);
    *(void *)(v1 + 2344) = v64;
    *(void *)(v1 + 1184) = v63;
    *(void *)(v1 + 1192) = v64;
    uint64_t v61 = specialized Array.subscript.getter();
    uint64_t v62 = v25;
    *(void *)(v1 + 2352) = v25;
    *(void *)(v1 + 1200) = v61;
    *(void *)(v1 + 1208) = v25;
    uint64_t v221 = specialized Array.subscript.getter();
    uint64_t v60 = v26;
    *(void *)(v1 + 2360) = v26;
    *(void *)(v1 + 1216) = v221;
    *(void *)(v1 + 1224) = v26;
    *(Swift::String *)(v1 + 2368) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO processedwifi (session_id, app_name, ssid, hour, dow, rssi, noise, tx_rate, rx_rate, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0x97uLL, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v27 = (void *)swift_task_alloc();
    uint64_t v13 = v69;
    *(void *)(v1 + 2384) = v27;
    v27[2] = v221;
    v27[3] = v60;
    v27[4] = v61;
    v27[5] = v62;
    v27[6] = v63;
    v27[7] = v64;
    v27[8] = v65;
    v27[9] = v66;
    v27[10] = (uint64_t)v72;
    v27[11] = (uint64_t)v70;
    v27[12] = v67;
    v27[13] = v68;
    v27[14] = v71;
    uint64_t v12 = (uint64_t)MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
_swift_task_switch:
    _swift_task_switch(v12, v13);
  }
}

uint64_t MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  uint64_t v1 = v0[297];
  uint64_t v2 = v0[296];
  uint64_t v3 = v0[292];
  v0[164] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #4 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:));
  v0[299] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t result;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint32_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *log;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  void (*v98)(uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint8_t *buf;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  void (*v113)(uint64_t, uint64_t, uint64_t);
  int v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  NSObject *oslog;
  os_log_type_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t, uint64_t);
  uint64_t v136;
  uint64_t j;
  uint64_t v138;
  uint64_t i;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;

  *(void *)(v0 + 1312) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  for (i = *(void *)(v0 + 2392); ; i = 0)
  {
    *(void *)(v138 + 2336) = i;
    uint64_t v140 = specialized IndexingIterator.next()();
    if ((v16 & 1) == 0) {
      break;
    }
    uint64_t v31 = i;
    while (2)
    {
      uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v138 + 2248);
      uint64_t v30 = *(void *)(v138 + 2160);
      uint64_t v28 = *(void *)(v138 + 2120);
      swift_bridgeObjectRelease();
      outlined destroy of [String]();
      outlined destroy of [String]();
      outlined destroy of [String]();
      outlined destroy of [Int]();
      outlined destroy of [Int]();
      outlined destroy of [Double]();
      outlined destroy of [Double]();
      outlined destroy of [Int]();
      outlined destroy of [Double]();
      outlined destroy of [Int]();
      v29(v30, v28);
      outlined destroy of Any?(v138 + 144);
      for (j = v31; ; j = 0)
      {
        IndexingIterator.next()();
        if (*(void *)(v138 + 136) != 1) {
          break;
        }
        uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v138 + 2304);
        char v24 = *(void *)(v138 + 2096);
        char v22 = *(void *)(v138 + 2080);
        uint64_t v26 = *(void *)(v138 + 1944);
        char v27 = *(void *)(v138 + 1920);
        uint64_t v25 = *(void *)(v138 + 1928);
        outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v138 + 1960));
        v23(v24, v22);
        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
        outlined destroy of Any?(v138 + 48);
        IndexingIterator.next()();
        if (*(void *)(v138 + 40) == 1)
        {
          outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v138 + 1968));
          uint64_t v20 = (void *)swift_task_alloc();
          *(void *)(v138 + 2400) = v20;
          *uint64_t v20 = *(void *)(v138 + 1312);
          v20[1] = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
          uint64_t v21 = *(void *)(v138 + 2144);
          return MediaMLPlugin.getProcessedWiFiDataFromDB()(v21);
        }
        outlined init with take of Any?((_OWORD *)(v138 + 16), (_OWORD *)(v138 + 48));
        kMediaML_sessionID.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        outlined init with copy of Any?(v138 + 48, v138 + 80);
        *(void *)(swift_task_alloc() + 16) = v138 + 80;
        uint64_t result = DataFrame.filter<A>(on:_:_:)();
        if (j) {
          return result;
        }
        uint64_t v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(v138 + 2280);
        uint64_t v132 = *(void *)(v138 + 2104);
        uint64_t v134 = *(void *)(v138 + 2096);
        uint64_t v136 = *(void *)(v138 + 2080);
        uint64_t v133 = *(void *)(v138 + 2088);
        swift_task_dealloc();
        outlined destroy of Any?(v138 + 80);
        swift_bridgeObjectRelease();
        kMediaML_ssid.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.Slice.subscript.getter();
        AnyColumnSlice.distinct()();
        uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
        *(void *)(v138 + 2304) = v2;
        *(void *)(v138 + 2312) = (v133 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v2(v132, v136);
        swift_bridgeObjectRelease();
        v135(v132, v134, v136);
        Collection<>.makeIterator()();
      }
      outlined init with take of Any?((_OWORD *)(v138 + 112), (_OWORD *)(v138 + 144));
      kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      outlined init with copy of Any?(v138 + 144, v138 + 176);
      *(void *)(swift_task_alloc() + 16) = v138 + 176;
      uint64_t result = DataFrame.Slice.filter<A>(on:_:_:)();
      if (j) {
        return result;
      }
      uint64_t v113 = *(void (**)(uint64_t, uint64_t, uint64_t))(v138 + 2232);
      uint64_t v112 = *(void *)(v138 + 2160);
      uint64_t v115 = *(void *)(v138 + 2152);
      uint64_t v116 = *(void *)(v138 + 2120);
      uint64_t v106 = *(void *)(v138 + 1912);
      uint64_t v109 = *(void *)(v138 + 1872);
      uint64_t v111 = *(void *)(v138 + 2128);
      uint64_t v108 = *(void *)(v138 + 1880);
      swift_task_dealloc();
      outlined destroy of Any?(v138 + 176);
      swift_bridgeObjectRelease();
      DataFrame.init(_:)();
      *(void *)(v138 + 1400) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1408) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1416) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1424) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1432) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1440) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1448) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1456) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1464) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1472) = _allocateUninitializedArray<A>(_:)();
      *(void *)(v138 + 1480) = 0;
      uint64_t v107 = DataFrame.shape.getter();
      *(void *)(v138 + 1488) = v107;
      uint64_t v3 = MediaMLPlugin.logger.unsafeMutableAddressor();
      uint64_t v110 = *(void (**)(uint64_t, uint64_t, uint64_t))(v108 + 16);
      v110(v106, v3, v109);
      v113(v115, v112, v116);
      uint64_t v114 = *(_DWORD *)(v111 + 80);
      uint64_t v119 = swift_allocObject();
      uint64_t v117 = *(void (**)(unint64_t, uint64_t, uint64_t))(v111 + 32);
      v117(v119 + ((v114 + 16) & ~(unint64_t)v114), v115, v116);
      v113(v115, v112, v116);
      uint64_t v121 = swift_allocObject();
      v117(v121 + ((v114 + 16) & ~(unint64_t)v114), v115, v116);
      oslog = Logger.logObject.getter();
      uint64_t v131 = static os_log_type_t.debug.getter();
      *(void *)(v138 + 1496) = 22;
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t size = *(_DWORD *)(v138 + 2420);
      uint64_t v123 = swift_allocObject();
      *(unsigned char *)(v123 + 16) = 0;
      uint64_t v124 = swift_allocObject();
      *(unsigned char *)(v124 + 16) = 8;
      uint64_t v120 = swift_allocObject();
      *(void *)(v120 + 16) = partial apply for implicit closure #8 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v120 + 24) = v119;
      uint64_t v125 = swift_allocObject();
      *(void *)(v125 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v125 + 24) = v120;
      uint64_t v126 = swift_allocObject();
      *(unsigned char *)(v126 + 16) = 0;
      uint64_t v127 = swift_allocObject();
      *(unsigned char *)(v127 + 16) = 8;
      uint64_t v122 = swift_allocObject();
      *(void *)(v122 + 16) = partial apply for implicit closure #9 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v122 + 24) = v121;
      uint64_t v128 = swift_allocObject();
      *(void *)(v128 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v128 + 24) = v122;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      _allocateUninitializedArray<A>(_:)();
      uint64_t v129 = v4;
      swift_retain();
      *uint64_t v129 = closure #1 in OSLogArguments.append(_:)partial apply;
      v129[1] = v123;
      swift_retain();
      v129[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v129[3] = v124;
      swift_retain();
      v129[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v129[5] = v125;
      swift_retain();
      v129[6] = closure #1 in OSLogArguments.append(_:)partial apply;
      v129[7] = v126;
      swift_retain();
      v129[8] = closure #1 in OSLogArguments.append(_:)partial apply;
      v129[9] = v127;
      swift_retain();
      v129[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v129[11] = v128;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(oslog, v131))
      {
        buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v104 = createStorage<A>(capacity:type:)(0);
        uint64_t v105 = createStorage<A>(capacity:type:)(0);
        *(void *)(v138 + 1824) = buf;
        *(void *)(v138 + 1832) = v104;
        *(void *)(v138 + 1840) = v105;
        serialize(_:at:)(0, (unsigned char **)(v138 + 1824));
        serialize(_:at:)(2, (unsigned char **)(v138 + 1824));
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1304) = v123;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1304) = v124;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        *(void *)(v138 + 1304) = v125;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1304) = v126;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1304) = v127;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        *(void *)(v138 + 1296) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        *(void *)(v138 + 1304) = v128;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1296), v138 + 1824, v138 + 1832, v138 + 1840);
        _os_log_impl((void *)&_mh_execute_header, oslog, v131, "Filtered dataframe shape=%ld,%ld", buf, size);
        destroyStorage<A>(_:count:)(v104);
        destroyStorage<A>(_:count:)(v105);
        UnsafeMutablePointer.deallocate()();
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v100 = *(void *)(v138 + 1912);
      uint64_t v101 = *(void *)(v138 + 1872);
      uint32_t v99 = *(void *)(v138 + 1880);

      uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
      v102(v100, v101);
      while (*(void *)(v138 + 1480) < v107)
      {
        uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v96 = *(void *)(v138 + 2064);
        uint64_t v97 = *(void *)(v138 + 1976);
        kMediaML_rssi.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v98(v96, v97);
        if (!*(void *)(v138 + 552)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        os_log_type_t v95 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v93 = *(void *)(v138 + 2056);
        uint64_t v94 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 528, v138 + 496);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_throughputTrue.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v95(v93, v94);
        if (!*(void *)(v138 + 616)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v90 = *(void *)(v138 + 2048);
        uint64_t v91 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 592, v138 + 560);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_noise.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v92(v90, v91);
        if (!*(void *)(v138 + 680)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v87 = *(void *)(v138 + 2040);
        uint64_t v88 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 656, v138 + 624);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_txRate.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v89(v87, v88);
        if (!*(void *)(v138 + 744)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v86 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v84 = *(void *)(v138 + 2032);
        uint64_t v85 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 720, v138 + 688);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_rxRate.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v86(v84, v85);
        if (!*(void *)(v138 + 808)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v83 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v81 = *(void *)(v138 + 2024);
        uint32_t v82 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 784, v138 + 752);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_dayOfWeek.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v83(v81, v82);
        if (!*(void *)(v138 + 872)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v80 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v78 = *(void *)(v138 + 2016);
        uint64_t v79 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 848, v138 + 816);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_hourOfDay.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v80(v78, v79);
        if (!*(void *)(v138 + 936)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v75 = *(void *)(v138 + 2008);
        unint64_t v76 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 912, v138 + 880);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_ssid.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v77(v75, v76);
        if (!*(void *)(v138 + 1000)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        double v72 = *(void *)(v138 + 2000);
        uint64_t v73 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 976, v138 + 944);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_appName.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v74(v72, v73);
        if (!*(void *)(v138 + 1064)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v138 + 2264);
        uint64_t v69 = *(void *)(v138 + 1992);
        double v70 = *(void *)(v138 + 1976);
        outlined init with take of Any(v138 + 1040, v138 + 1008);
        swift_dynamicCast();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        kMediaML_sessionID.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        DataFrame.subscript.getter();
        AnyColumn.subscript.getter();
        v71(v69, v70);
        if (!*(void *)(v138 + 1128)) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        outlined init with take of Any(v138 + 1104, v138 + 1072);
        swift_dynamicCast();
        specialized Array.append(_:)();
        uint64_t v5 = (uint64_t (*)())swift_bridgeObjectRelease();
        uint64_t v7 = *(void *)(v138 + 1480);
        uint64_t v68 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_62;
        }
        *(void *)(v138 + 1480) = v68;
      }
      uint64_t v9 = *(void *)(v138 + 1904);
      uint64_t v51 = *(void *)(v138 + 1872);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v52 = preprocessData(rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)();
      *(void *)(v138 + 2320) = v52;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v138 + 1504) = v52;
      uint64_t v10 = MediaMLPlugin.logger.unsafeMutableAddressor();
      v110(v9, v10, v51);
      outlined init with copy of Any?(v138 + 48, v138 + 208);
      uint64_t v55 = swift_allocObject();
      outlined init with take of Any?((_OWORD *)(v138 + 208), (_OWORD *)(v55 + 16));
      swift_bridgeObjectRetain();
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = v52;
      swift_retain();
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = partial apply for implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v57 + 24) = v53;
      swift_release();
      log = Logger.logObject.getter();
      uint64_t v67 = static os_log_type_t.debug.getter();
      *(void *)(v138 + 1512) = 22;
      UnsignedInteger<>.init<A>(_:)();
      uint64_t v54 = *(_DWORD *)(v138 + 2424);
      uint64_t v59 = swift_allocObject();
      *(unsigned char *)(v59 + 16) = 32;
      uint64_t v60 = swift_allocObject();
      *(unsigned char *)(v60 + 16) = 8;
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = partial apply for implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
      *(void *)(v56 + 24) = v55;
      uint64_t v61 = swift_allocObject();
      *(void *)(v61 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
      *(void *)(v61 + 24) = v56;
      uint64_t v62 = swift_allocObject();
      *(unsigned char *)(v62 + 16) = 32;
      uint64_t v63 = swift_allocObject();
      *(unsigned char *)(v63 + 16) = 8;
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
      *(void *)(v58 + 24) = v57;
      uint64_t v64 = swift_allocObject();
      *(void *)(v64 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
      *(void *)(v64 + 24) = v58;
      _allocateUninitializedArray<A>(_:)();
      uint64_t v65 = v11;
      swift_retain();
      *uint64_t v65 = closure #1 in OSLogArguments.append(_:)partial apply;
      v65[1] = v59;
      swift_retain();
      v65[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v65[3] = v60;
      swift_retain();
      v65[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      v65[5] = v61;
      swift_retain();
      v65[6] = closure #1 in OSLogArguments.append(_:)partial apply;
      v65[7] = v62;
      swift_retain();
      v65[8] = closure #1 in OSLogArguments.append(_:)partial apply;
      v65[9] = v63;
      swift_retain();
      v65[10] = closure #1 in OSLogArguments.append(_:)partial apply;
      v65[11] = v64;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(log, v67))
      {
        os_log_type_t v48 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint32_t v49 = createStorage<A>(capacity:type:)(0);
        uint64_t v50 = createStorage<A>(capacity:type:)(2);
        *(void *)(v138 + 1744) = v48;
        *(void *)(v138 + 1752) = v49;
        *(void *)(v138 + 1760) = v50;
        serialize(_:at:)(2, (unsigned char **)(v138 + 1744));
        serialize(_:at:)(2, (unsigned char **)(v138 + 1744));
        *(void *)(v138 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1240) = v59;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        *(void *)(v138 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1240) = v60;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        *(void *)(v138 + 1232) = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
        *(void *)(v138 + 1240) = v61;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        *(void *)(v138 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1240) = v62;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        *(void *)(v138 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1240) = v63;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        *(void *)(v138 + 1232) = closure #1 in OSLogArguments.append(_:)partial apply;
        *(void *)(v138 + 1240) = v64;
        closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v138 + 1232), v138 + 1744, v138 + 1752, v138 + 1760);
        _os_log_impl((void *)&_mh_execute_header, log, v67, "processedData for session=%s %s", v48, v54);
        destroyStorage<A>(_:count:)(v49);
        destroyStorage<A>(_:count:)(v50);
        UnsafeMutablePointer.deallocate()();
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v46 = *(void *)(v138 + 1904);
      uint32_t v47 = *(void *)(v138 + 1872);

      v102(v46, v47);
      *(void *)(v138 + 2328) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
      uint64_t v5 = (uint64_t (*)())Array.count.getter();
      *(void *)(v138 + 1520) = v5;
      if (__OFSUB__(v5, 1))
      {
        __break(1u);
LABEL_62:
        __break(1u);
        return _swift_task_switch(v5, v6);
      }
      *(void *)(v138 + 1536) = (char *)v5 - 1;
      *(void *)(v138 + 1544) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
      min<A>(_:_:)();
      uint64_t v45 = *(void *)(v138 + 1528);
      *(void *)(v138 + 1552) = v45;
      if (Array.count.getter() <= 0)
      {
        uint64_t v31 = 0;
        continue;
      }
      break;
    }
    if (v45 < 0) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    *(void *)(v138 + 1136) = specialized Collection<>.makeIterator()();
    *(void *)(v138 + 1144) = v13;
    *(void *)(v138 + 1152) = v14;
    *(unsigned char *)(v138 + 1160) = v15 & 1;
  }
  *(void *)(v138 + 1560) = v140;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v43 = *(void *)(v138 + 1576);
  *(void *)(v138 + 1584) = v43;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v44 = *(double *)(v138 + 1600);
  if (((*(void *)&v44 >> 52) & 0x7FFLL) == 0x7FF) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  if (v44 <= -9.22337204e18) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  if (v44 >= 9.22337204e18) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  *(void *)(v138 + 1608) = (uint64_t)v44;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v42 = *(double *)(v138 + 1624);
  if (((*(void *)&v42 >> 52) & 0x7FFLL) == 0x7FF || v42 <= -9.22337204e18 || v42 >= 9.22337204e18) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v41 = *(void *)(v138 + 2224);
  *(void *)(v138 + 1632) = (uint64_t)v42;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v39 = *(void *)(v138 + 1648);
  *(void *)(v138 + 1656) = v39;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v40 = *(void *)(v138 + 1672);
  *(void *)(v138 + 1680) = v40;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v38 = *(void *)(v138 + 1696);
  *(void *)(v138 + 1704) = v38;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v37 = *(void *)(v138 + 1720);
  *(void *)(v138 + 1728) = v37;
  Array.subscript.getter();
  Array.subscript.getter();
  swift_bridgeObjectRelease();
  swift_dynamicCast();
  uint64_t v35 = *(void *)(v138 + 1168);
  uint64_t v36 = *(void *)(v138 + 1176);
  *(void *)(v138 + 2344) = v36;
  *(void *)(v138 + 1184) = v35;
  *(void *)(v138 + 1192) = v36;
  uint64_t v33 = specialized Array.subscript.getter();
  Swift::String v34 = v17;
  *(void *)(v138 + 2352) = v17;
  *(void *)(v138 + 1200) = v33;
  *(void *)(v138 + 1208) = v17;
  uint64_t v141 = specialized Array.subscript.getter();
  Swift::String v32 = v18;
  *(void *)(v138 + 2360) = v18;
  *(void *)(v138 + 1216) = v141;
  *(void *)(v138 + 1224) = v18;
  *(Swift::String *)(v138 + 2368) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO processedwifi (session_id, app_name, ssid, hour, dow, rssi, noise, tx_rate, rx_rate, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0x97uLL, 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = (void *)swift_task_alloc();
  uint64_t v6 = v41;
  *(void *)(v138 + 2384) = v19;
  void v19[2] = v141;
  v19[3] = v32;
  v19[4] = v33;
  v19[5] = v34;
  v19[6] = v35;
  v19[7] = v36;
  v19[8] = v37;
  v19[9] = v38;
  v19[10] = (uint64_t)v44;
  v19[11] = (uint64_t)v42;
  v19[12] = v39;
  v19[13] = v40;
  v19[14] = v43;
  uint64_t v5 = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  return _swift_task_switch(v5, v6);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 1312) = *v1;
  *(void *)(v4 + 2408) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  }
  else
  {
    uint64_t v2 = MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *buf;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v50 = v0;
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2232);
  uint64_t v28 = *(void *)(v0 + 2152);
  uint64_t v25 = *(void *)(v0 + 2144);
  char v24 = *(void *)(v0 + 2128);
  uint64_t v29 = *(void *)(v0 + 2120);
  uint64_t v1 = *(void *)(v0 + 1896);
  char v22 = *(void *)(v0 + 1880);
  uint64_t v23 = *(void *)(v0 + 1872);
  *(void *)(v0 + 1312) = v0;
  uint64_t v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v1, v2, v23);
  v26(v28, v25, v29);
  char v27 = *(_DWORD *)(v24 + 80);
  Swift::String v32 = swift_allocObject();
  uint64_t v30 = *(void (**)(unint64_t, uint64_t, uint64_t))(v24 + 32);
  v30(v32 + ((v27 + 16) & ~(unint64_t)v27), v28, v29);
  v26(v28, v25, v29);
  Swift::String v34 = swift_allocObject();
  v30(v34 + ((v27 + 16) & ~(unint64_t)v27), v28, v29);
  uint64_t v43 = Logger.logObject.getter();
  uint64_t v44 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 1392) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2416);
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36 + 16) = 0;
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37 + 16) = 8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = partial apply for implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  *(void *)(v33 + 24) = v32;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v38 + 24) = v33;
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = 0;
  uint64_t v40 = swift_allocObject();
  *(unsigned char *)(v40 + 16) = 8;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = partial apply for implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:);
  *(void *)(v35 + 24) = v34;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v41 + 24) = v35;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v42 = v3;
  swift_retain();
  char *v42 = closure #1 in OSLogArguments.append(_:)partial apply;
  v42[1] = v36;
  swift_retain();
  v42[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v42[3] = v37;
  swift_retain();
  v42[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v42[5] = v38;
  swift_retain();
  v42[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v42[7] = v39;
  swift_retain();
  v42[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v42[9] = v40;
  swift_retain();
  v42[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v42[11] = v41;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v4 = v21[301];
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v19 = createStorage<A>(capacity:type:)(0);
    uint64_t v20 = createStorage<A>(capacity:type:)(0);
    uint64_t v45 = buf;
    uint64_t v46 = v19;
    uint32_t v47 = v20;
    serialize(_:at:)(0, &v45);
    serialize(_:at:)(2, &v45);
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v49 = v36;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    if (v4) {
      return result;
    }
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v49 = v37;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint32_t v49 = v38;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v49 = v39;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v49 = v40;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    os_log_type_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint32_t v49 = v41;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Returning a dataframe of size=%ld,%ld", buf, size);
    destroyStorage<A>(_:count:)(v19);
    destroyStorage<A>(_:count:)(v20);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v21[281];
  uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t))v21[279];
  uint64_t v15 = v21[268];
  uint64_t v11 = v21[265];
  uint64_t v16 = v21[264];
  uint64_t v14 = v21[260];
  uint64_t v17 = v21[237];
  uint64_t v8 = v21[234];
  uint64_t v9 = v21[231];
  uint64_t v13 = v21[261];
  uint64_t v7 = v21[235];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v17, v8);
  v10(v9, v15, v11);
  v12(v15, v11);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v14);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v21[164] + 8);
  return v6();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[288];
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v0[281];
  uint64_t v5 = v0[270];
  uint64_t v3 = v0[265];
  uint64_t v14 = v0[264];
  uint64_t v7 = v0[262];
  uint64_t v12 = v0[260];
  uint64_t v11 = v0[246];
  uint64_t v6 = v0[245];
  uint64_t v9 = v0[243];
  uint64_t v8 = v0[241];
  uint64_t v10 = v0[240];
  v0[164] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of [String]();
  outlined destroy of [String]();
  outlined destroy of [String]();
  outlined destroy of [Int]();
  outlined destroy of [Int]();
  outlined destroy of [Double]();
  outlined destroy of [Double]();
  outlined destroy of [Int]();
  outlined destroy of [Double]();
  outlined destroy of [Int]();
  v4(v5, v3);
  outlined destroy of Any?((uint64_t)(v0 + 18));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v6);
  v13(v7, v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  outlined destroy of Any?((uint64_t)(v0 + 6));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v11);
  v13(v14, v12);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[164] + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[264];
  uint64_t v2 = v0[261];
  uint64_t v3 = v0[260];
  v0[164] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[164] + 8);
  return v4();
}

void *closure #1 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t closure #3 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t implicit closure #8 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #9 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  return Optional.debugDescription.getter();
}

uint64_t implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t closure #4 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v27 = v15;
  swift_bridgeObjectRetain();
  *(void *)(v27 + 24) = &type metadata for String;
  *(void *)(v27 + 32) = &protocol witness table for String;
  *(void *)uint64_t v27 = a2;
  *(void *)(v27 + 8) = a3;
  swift_bridgeObjectRetain();
  *(void *)(v27 + 64) = &type metadata for String;
  *(void *)(v27 + 72) = &protocol witness table for String;
  *(void *)(v27 + 40) = a4;
  *(void *)(v27 + 48) = a5;
  swift_bridgeObjectRetain();
  *(void *)(v27 + 104) = &type metadata for String;
  *(void *)(v27 + 112) = &protocol witness table for String;
  *(void *)(v27 + 80) = a6;
  *(void *)(v27 + 88) = a7;
  *(void *)(v27 + 144) = &type metadata for Int;
  *(void *)(v27 + 152) = &protocol witness table for Int;
  *(void *)(v27 + 120) = a8;
  *(void *)(v27 + 184) = &type metadata for Int;
  *(void *)(v27 + 192) = &protocol witness table for Int;
  *(void *)(v27 + 160) = a12;
  *(void *)(v27 + 224) = &type metadata for Int;
  *(void *)(v27 + 232) = &protocol witness table for Int;
  *(void *)(v27 + 200) = a13;
  *(void *)(v27 + 264) = &type metadata for Int;
  *(void *)(v27 + 272) = &protocol witness table for Int;
  *(void *)(v27 + 240) = a14;
  *(void *)(v27 + 304) = &type metadata for Double;
  *(void *)(v27 + 312) = &protocol witness table for Double;
  *(double *)(v27 + 280) = a9;
  *(void *)(v27 + 344) = &type metadata for Double;
  *(void *)(v27 + 352) = &protocol witness table for Double;
  *(double *)(v27 + 320) = a10;
  *(void *)(v27 + 384) = &type metadata for Double;
  *(void *)(v27 + 392) = &protocol witness table for Double;
  *(double *)(v27 + 360) = a11;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v29) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t MediaMLPlugin.getProcessedWiFiDataFromDB()(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v2[3] = v1;
  return _swift_task_switch(MediaMLPlugin.getProcessedWiFiDataFromDB(), 0);
}

void MediaMLPlugin.getProcessedWiFiDataFromDB()()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getProcessedWiFiDataFromDB(), 0, v11, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 80) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WITH AppNameSSIDpairs as (SELECT app_name, ssid FROM processedwifi GROUP BY app_name, ssid HAVING COUNT(*)>20)\nSELECT session_id, p.app_name, p.ssid, hour, dow, rssi, noise, tx_rate, rx_rate, throughput_true\nFROM processedwifi p JOIN AppNameSSIDpairs a\nON p.app_name = a.app_name AND p.ssid = a.ssid", 0x12BuLL, 1);
    _swift_task_switch(MediaMLPlugin.getProcessedWiFiDataFromDB(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    char v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

uint64_t MediaMLPlugin.getProcessedWiFiDataFromDB()()
{
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  uint64_t v1 = v0[9];
  v0[2] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB());
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getProcessedWiFiDataFromDB();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getProcessedWiFiDataFromDB();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[13];
  v0[2] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[6] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getProcessedWiFiDataFromDB()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v99 = 0;
  uint64_t v111 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB();
  uint64_t v129 = 0;
  uint64_t v128 = 0;
  uint64_t v100 = &v127;
  uint64_t v127 = 0;
  uint64_t v101 = &v126;
  uint64_t v126 = 0;
  uint64_t v104 = &v125;
  uint64_t v125 = 0;
  uint64_t v102 = &v124;
  uint64_t v124 = 0;
  uint64_t v103 = &v123;
  uint64_t v123 = 0;
  uint64_t v105 = &v122;
  uint64_t v122 = 0;
  uint64_t v106 = &v121;
  uint64_t v121 = 0;
  uint64_t v107 = &v120;
  uint64_t v120 = 0;
  uint64_t v108 = &v119;
  uint64_t v119 = 0;
  uint64_t v109 = &v118;
  uint64_t v118 = 0;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v77 = *(void *)(v76 - 8);
  uint64_t v78 = v76 - 8;
  unint64_t v79 = (*(void *)(v77 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v76);
  uint64_t v80 = (char *)&v16 - v79;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v82 = *(void *)(v81 - 8);
  uint64_t v83 = v81 - 8;
  unint64_t v84 = (*(void *)(v82 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v81);
  uint64_t v85 = (char *)&v16 - v84;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v87 = *(void *)(v86 - 8);
  uint64_t v88 = v86 - 8;
  unint64_t v89 = (*(void *)(v87 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v99);
  uint64_t v90 = (char *)&v16 - v89;
  uint64_t v91 = type metadata accessor for DataFrame();
  uint64_t v92 = *(void *)(v91 - 8);
  uint64_t v93 = v91 - 8;
  unint64_t v94 = (*(void *)(v92 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v99);
  os_log_type_t v95 = (char *)&v16 - v94;
  uint64_t v129 = (char *)&v16 - v94;
  uint64_t v128 = a1;
  uint64_t v96 = &type metadata for String;
  uint64_t v127 = _allocateUninitializedArray<A>(_:)();
  uint64_t v126 = _allocateUninitializedArray<A>(_:)();
  uint64_t v125 = _allocateUninitializedArray<A>(_:)();
  uint64_t v97 = &type metadata for Int;
  uint64_t v124 = _allocateUninitializedArray<A>(_:)();
  uint64_t v123 = _allocateUninitializedArray<A>(_:)();
  uint64_t v122 = _allocateUninitializedArray<A>(_:)();
  uint64_t v121 = _allocateUninitializedArray<A>(_:)();
  uint64_t v98 = &type metadata for Double;
  uint64_t v120 = _allocateUninitializedArray<A>(_:)();
  uint64_t v119 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v110;
  uint64_t v118 = v3;
  v114[2] = v100;
  v114[3] = v101;
  v114[4] = v102;
  v114[5] = v103;
  v114[6] = v104;
  v114[7] = v105;
  v114[8] = v106;
  v114[9] = v107;
  v114[10] = v108;
  v114[11] = v109;
  (*(void (**)(uint64_t (*)(uint64_t), void *))(*(void *)a1 + 144))(v111, v114);
  uint64_t v112 = v4;
  uint64_t v113 = v4;
  if (v4)
  {
    uint64_t v16 = v113;
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    outlined destroy of [String]();
    uint64_t result = &v127;
  }
  else
  {
    DataFrame.init()();
    uint64_t v5 = kMediaML_sessionID.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v5->_countAndFlagsBits;
    object = v5->_object;
    swift_bridgeObjectRetain();
    uint64_t v74 = &v127;
    uint64_t v17 = v127;
    swift_bridgeObjectRetain();
    uint64_t v19 = &v117;
    uint64_t v117 = v17;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v28 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v29 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v31 = *(void (**)(char *, uint64_t))(v87 + 8);
    uint64_t v30 = v87 + 8;
    v31(v90, v86);
    uint64_t v6 = kMediaML_appName.unsafeMutableAddressor();
    uint64_t v21 = v6->_countAndFlagsBits;
    uint64_t v23 = v6->_object;
    swift_bridgeObjectRetain();
    uint64_t v73 = &v126;
    uint64_t v22 = v126;
    swift_bridgeObjectRetain();
    v116[2] = v22;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v31(v90, v86);
    uint64_t v7 = kMediaML_ssid.unsafeMutableAddressor();
    uint64_t v24 = v7->_countAndFlagsBits;
    uint64_t v26 = v7->_object;
    swift_bridgeObjectRetain();
    double v72 = &v125;
    uint64_t v25 = v125;
    swift_bridgeObjectRetain();
    v116[1] = v25;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v31(v90, v86);
    uint64_t v8 = kMediaML_hourOfDay.unsafeMutableAddressor();
    uint64_t v35 = v8->_countAndFlagsBits;
    uint64_t v33 = v8->_object;
    swift_bridgeObjectRetain();
    uint64_t v71 = &v124;
    uint64_t v32 = v124;
    swift_bridgeObjectRetain();
    Swift::String v34 = v116;
    v116[0] = v32;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    unint64_t v46 = lazy protocol witness table accessor for type [Int] and conformance [A]();
    uint32_t v47 = &type metadata for Int;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint32_t v49 = *(void (**)(char *, uint64_t))(v82 + 8);
    uint64_t v48 = v82 + 8;
    v49(v85, v81);
    uint64_t v9 = kMediaML_dayOfWeek.unsafeMutableAddressor();
    uint64_t v36 = v9->_countAndFlagsBits;
    uint64_t v38 = v9->_object;
    swift_bridgeObjectRetain();
    double v70 = &v123;
    uint64_t v37 = v123;
    swift_bridgeObjectRetain();
    v115[3] = v37;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v49(v85, v81);
    uint64_t v10 = kMediaML_rssi.unsafeMutableAddressor();
    uint64_t v39 = v10->_countAndFlagsBits;
    uint64_t v41 = v10->_object;
    swift_bridgeObjectRetain();
    uint64_t v69 = &v122;
    uint64_t v40 = v122;
    swift_bridgeObjectRetain();
    v115[2] = v40;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v49(v85, v81);
    uint64_t v11 = kMediaML_noise.unsafeMutableAddressor();
    uint64_t v42 = v11->_countAndFlagsBits;
    uint64_t v44 = v11->_object;
    swift_bridgeObjectRetain();
    uint64_t v68 = &v121;
    uint64_t v43 = v121;
    swift_bridgeObjectRetain();
    v115[1] = v43;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v49(v85, v81);
    uint64_t v12 = kMediaML_txRate.unsafeMutableAddressor();
    uint64_t v53 = v12->_countAndFlagsBits;
    uint64_t v51 = v12->_object;
    swift_bridgeObjectRetain();
    uint64_t v67 = &v120;
    uint64_t v50 = v120;
    swift_bridgeObjectRetain();
    uint64_t v52 = v115;
    v115[0] = v50;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    unint64_t v61 = lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v62 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v64 = *(void (**)(char *, uint64_t))(v77 + 8);
    uint64_t v63 = v77 + 8;
    v64(v80, v76);
    MediaMLPlugin::SQLError v13 = kMediaML_rxRate.unsafeMutableAddressor();
    uint64_t v54 = v13->_countAndFlagsBits;
    uint64_t v56 = v13->_object;
    swift_bridgeObjectRetain();
    uint64_t v66 = &v119;
    uint64_t v55 = v119;
    swift_bridgeObjectRetain();
    v114[13] = v55;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v80, v76);
    uint64_t v14 = kMediaML_throughputTrue.unsafeMutableAddressor();
    uint64_t v57 = v14->_countAndFlagsBits;
    uint64_t v59 = v14->_object;
    swift_bridgeObjectRetain();
    uint64_t v65 = &v118;
    uint64_t v58 = v118;
    swift_bridgeObjectRetain();
    v114[12] = v58;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v64(v80, v76);
    (*(void (**)(uint64_t, char *, uint64_t))(v92 + 32))(v75, v95, v91);
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    outlined destroy of [String]();
    uint64_t result = v74;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v23)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v22)
    {
      SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
      if (v21)
      {
        SQLiteDB.Row.get<A>(at:)(3, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(4, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(5, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(6, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
        SQLiteDB.Row.get<A>(at:)(7, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        SQLiteDB.Row.get<A>(at:)(8, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        SQLiteDB.Row.get<A>(at:)(9, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        swift_bridgeObjectRetain();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        specialized Array.append(_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid not of type String", 0x17uLL, 1);
        MediaMLPlugin::SQLError v26 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v6);
        Swift::Int32 code = v26.code;
        uint64_t countAndFlagsBits = v26.desc.value._countAndFlagsBits;
        object = v26.desc.value._object;
        lazy protocol witness table accessor for type SQLError and conformance SQLError();
        uint64_t v11 = swift_allocError();
        *(_DWORD *)uint64_t v7 = code;
        *(void *)(v7 + 8) = countAndFlagsBits;
        *(void *)(v7 + 16) = object;
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name not of type String", 0x1BuLL, 1);
      MediaMLPlugin::SQLError v25 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 v14 = v25.code;
      uint64_t v12 = v25.desc.value._countAndFlagsBits;
      MediaMLPlugin::SQLError v13 = v25.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v15 = swift_allocError();
      *(_DWORD *)uint64_t v5 = v14;
      *(void *)(v5 + 8) = v12;
      *(void *)(v5 + 16) = v13;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id not of type String", 0x1DuLL, 1);
    MediaMLPlugin::SQLError v24 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v18 = v24.code;
    uint64_t desc_8 = v24.desc.value._countAndFlagsBits;
    uint64_t v17 = v24.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v19 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v18;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v17;
    swift_willThrow();
    return v19;
  }
}

uint64_t MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  *(void *)(v1 + 720) = v0;
  *(void *)(v1 + 512) = v1;
  *(void *)(v1 + 520) = 0;
  *(void *)(v1 + 536) = 0;
  *(void *)(v1 + 544) = 0;
  *(void *)(v1 + 600) = 0;
  *(void *)(v1 + 608) = 0;
  *(void *)(v1 + 616) = 0;
  *(void *)(v1 + 632) = 0;
  *(void *)(v1 + 664) = 0;
  *(void *)(v1 + 400) = 0;
  *(void *)(v1 + 408) = 0;
  *(void *)(v1 + 416) = 0;
  *(unsigned char *)(v1 + 424) = 0;
  *(void *)(v1 + 672) = 0;
  *(void *)(v1 + 448) = 0;
  *(void *)(v1 + 456) = 0;
  *(void *)(v1 + 480) = 0;
  *(void *)(v1 + 488) = 0;
  *(void *)(v1 + 680) = 0;
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v1 + 728) = v2;
  *(void *)(v1 + 736) = *(void *)(v2 - 8);
  *(void *)(v1 + 744) = swift_task_alloc();
  *(void *)(v1 + 752) = swift_task_alloc();
  *(void *)(v1 + 760) = swift_task_alloc();
  uint64_t v3 = type metadata accessor for DataFrame.Slice();
  *(void *)(v1 + 768) = v3;
  *(void *)(v1 + 776) = *(void *)(v3 - 8);
  *(void *)(v1 + 784) = swift_task_alloc();
  *(void *)(v1 + 792) = swift_task_alloc();
  *(void *)(v1 + 800) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<AnyColumnSlice>);
  *(void *)(v1 + 808) = swift_task_alloc();
  *(void *)(v1 + 816) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for AnyColumn();
  *(void *)(v1 + 824) = v4;
  *(void *)(v1 + 832) = *(void *)(v4 - 8);
  *(void *)(v1 + 840) = swift_task_alloc();
  *(void *)(v1 + 848) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AnyColumnSlice();
  *(void *)(v1 + 856) = v5;
  *(void *)(v1 + 864) = *(void *)(v5 - 8);
  *(void *)(v1 + 872) = swift_task_alloc();
  *(void *)(v1 + 880) = swift_task_alloc();
  *(void *)(v1 + 888) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for DataFrame();
  *(void *)(v1 + 896) = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  *(void *)(v1 + 904) = v8;
  *(void *)(v1 + 912) = *(void *)(v8 + 64);
  *(void *)(v1 + 920) = swift_task_alloc();
  *(void *)(v1 + 928) = swift_task_alloc();
  *(void *)(v1 + 936) = swift_task_alloc();
  *(void *)(v1 + 944) = swift_task_alloc();
  *(void *)(v1 + 952) = swift_task_alloc();
  *(void *)(v1 + 520) = v0;
  return _swift_task_switch(MediaMLPlugin.saveWiFiDataStandardDeviation(), 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 512) = *v1;
  *(void *)(v4 + 976) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = MediaMLPlugin.saveWiFiDataStandardDeviation();
  }
  else
  {
    uint64_t v2 = MediaMLPlugin.saveWiFiDataStandardDeviation();
  }
  return _swift_task_switch(v2, 0);
}

{
  void *v0;
  Swift::Int DateIn;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint32_t v42;
  os_log_type_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t);
  int v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(unint64_t, uint64_t, uint64_t);
  uint32_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  NSObject *log;
  os_log_type_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint8_t *buf;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(uint64_t, uint64_t, uint64_t);
  int v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  NSObject *oslog;
  os_log_type_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, uint64_t, uint64_t);
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  Swift::String v147;
  Swift::Bool v148;
  void (*v149)(uint64_t);
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  Swift::String v153;
  Swift::Bool v154;
  Swift::Bool v155;
  uint64_t v156;
  Swift::String v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(uint64_t, uint64_t, uint64_t);
  Swift::Bool v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t (*v167)(uint64_t, uint64_t, uint64_t);
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;

  uint64_t v175 = v0;
  uint64_t v160 = v0[119];
  os_log_type_t v159 = v0[118];
  uint64_t v158 = v0[113];
  uint64_t v161 = v0[112];
  v0[64] = v0;
  DateIn = getDateInEpoch()();
  v0[123] = DateIn;
  v0[68] = DateIn;
  uint64_t v157 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v163 = DataFrame.containsColumn(_:)(v157);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v158 + 16);
  uint64_t v162 = v2;
  v0[124] = v2;
  v0[125] = (v158 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v2(v159, v160, v161);
  if (v163)
  {
    uint64_t v153 = *kMediaML_ssid.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    uint64_t v154 = DataFrame.containsColumn(_:)(v153);
    swift_bridgeObjectRelease();
    uint64_t v155 = v154;
  }
  else
  {
    uint64_t v155 = 0;
  }
  uint64_t v151 = *(void *)(v156 + 952);
  uint64_t v3 = *(void *)(v156 + 944);
  uint64_t v150 = *(void *)(v156 + 936);
  uint64_t v152 = *(void *)(v156 + 896);
  uint64_t v4 = *(void *)(v156 + 904) + 8;
  uint64_t v149 = *(void (**)(uint64_t))v4;
  *(void *)(v156 + 1008) = *(void *)v4;
  *(void *)(v156 + 1016) = v4 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v149(v3);
  v162(v150, v151, v152);
  if (v155)
  {
    uint64_t v147 = *kMediaML_throughputStdDev.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    uint64_t v148 = DataFrame.containsColumn(_:)(v147);
    swift_bridgeObjectRelease();
    ((void (*)(void, void))v149)(*(void *)(v156 + 936), *(void *)(v156 + 896));
    if (v148)
    {
      uint64_t v144 = *(void *)(v156 + 888);
      uint64_t v139 = *(void *)(v156 + 880);
      uint64_t v145 = *(void *)(v156 + 856);
      uint64_t v141 = *(void *)(v156 + 848);
      int v142 = *(void *)(v156 + 824);
      uint64_t v143 = *(void *)(v156 + 864);
      uint64_t v140 = *(void *)(v156 + 832);
      kMediaML_appName.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.distinct()();
      uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v140 + 8);
      *(void *)(v156 + 1024) = v5;
      *(void *)(v156 + 1032) = (v140 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v5(v141, v142);
      swift_bridgeObjectRelease();
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 16);
      *(void *)(v156 + 1040) = v6;
      *(void *)(v156 + 1048) = (v143 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v6(v139, v144, v145);
      *(void *)(v156 + 1056) = lazy protocol witness table accessor for type AnyColumnSlice and conformance AnyColumnSlice();
      Collection<>.makeIterator()();
      uint64_t v146 = *(void *)(v156 + 976);
LABEL_9:
      IndexingIterator.next()();
      if (*(void *)(v156 + 40) == 1)
      {
        uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 992);
        unint64_t v61 = *(void *)(v156 + 952);
        uint64_t v64 = *(void *)(v156 + 920);
        uint64_t v65 = *(void *)(v156 + 896);
        uint64_t v23 = *(void *)(v156 + 752);
        uint64_t v59 = *(void *)(v156 + 728);
        uint64_t v60 = *(void *)(v156 + 904);
        uint64_t v58 = *(void *)(v156 + 736);
        outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v156 + 816));
        MediaMLPlugin::SQLError v24 = MediaMLPlugin.logger.unsafeMutableAddressor();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v23, v24, v59);
        v62(v64, v61, v65);
        uint64_t v63 = *(_DWORD *)(v60 + 80);
        uint64_t v68 = swift_allocObject();
        uint64_t v66 = *(void (**)(unint64_t, uint64_t, uint64_t))(v60 + 32);
        v66(v68 + ((v63 + 16) & ~(unint64_t)v63), v64, v65);
        v62(v64, v61, v65);
        double v70 = swift_allocObject();
        v66(v70 + ((v63 + 16) & ~(unint64_t)v63), v64, v65);
        log = Logger.logObject.getter();
        uint64_t v80 = static os_log_type_t.debug.getter();
        *(void *)(v156 + 592) = 22;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint64_t v67 = *(_DWORD *)(v156 + 1136);
        double v72 = swift_allocObject();
        *(unsigned char *)(v72 + 16) = 0;
        uint64_t v73 = swift_allocObject();
        *(unsigned char *)(v73 + 16) = 8;
        uint64_t v69 = swift_allocObject();
        *(void *)(v69 + 16) = partial apply for implicit closure #5 in MediaMLPlugin.saveWiFiDataStandardDeviation();
        *(void *)(v69 + 24) = v68;
        uint64_t v74 = swift_allocObject();
        *(void *)(v74 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(void *)(v74 + 24) = v69;
        uint64_t v75 = swift_allocObject();
        *(unsigned char *)(v75 + 16) = 0;
        uint64_t v76 = swift_allocObject();
        *(unsigned char *)(v76 + 16) = 8;
        uint64_t v71 = swift_allocObject();
        *(void *)(v71 + 16) = partial apply for implicit closure #6 in MediaMLPlugin.saveWiFiDataStandardDeviation();
        *(void *)(v71 + 24) = v70;
        uint64_t v77 = swift_allocObject();
        *(void *)(v77 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(void *)(v77 + 24) = v71;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        _allocateUninitializedArray<A>(_:)();
        uint64_t v78 = v25;
        swift_retain();
        *uint64_t v78 = closure #1 in OSLogArguments.append(_:)partial apply;
        v78[1] = v72;
        swift_retain();
        v78[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v78[3] = v73;
        swift_retain();
        v78[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v78[5] = v74;
        swift_retain();
        v78[6] = closure #1 in OSLogArguments.append(_:)partial apply;
        v78[7] = v75;
        swift_retain();
        v78[8] = closure #1 in OSLogArguments.append(_:)partial apply;
        v78[9] = v76;
        swift_retain();
        v78[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v78[11] = v77;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(log, v80))
        {
          uint64_t v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v56 = createStorage<A>(capacity:type:)(0);
          uint64_t v57 = createStorage<A>(capacity:type:)(0);
          uint64_t v164 = v55;
          uint64_t v165 = v56;
          uint64_t v166 = v57;
          serialize(_:at:)(0, &v164);
          serialize(_:at:)(2, &v164);
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v168 = v72;
          uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          if (v146) {
            return result;
          }
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v168 = v73;
          closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
          uint64_t v168 = v74;
          closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v168 = v75;
          closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
          uint64_t v168 = v76;
          closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          uint64_t v167 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
          uint64_t v168 = v77;
          closure #1 in osLogInternal(_:log:type:)(&v167, (uint64_t)&v164, (uint64_t)&v165, (uint64_t)&v166);
          _os_log_impl((void *)&_mh_execute_header, log, v80, "Returning a dataframe of size=%ld,%ld", v55, v67);
          destroyStorage<A>(_:count:)(v56);
          destroyStorage<A>(_:count:)(v57);
          UnsafeMutablePointer.deallocate()();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
        uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v156 + 1008);
        uint64_t v52 = *(void *)(v156 + 952);
        uint64_t v50 = *(void *)(v156 + 896);
        uint64_t v53 = *(void *)(v156 + 888);
        uint32_t v49 = *(void *)(v156 + 856);
        uint64_t v54 = *(void *)(v156 + 752);
        uint32_t v47 = *(void *)(v156 + 728);
        uint64_t v48 = *(void *)(v156 + 864);
        unint64_t v46 = *(void *)(v156 + 736);

        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v54, v47);
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v53, v49);
        v51(v52, v50);
        swift_release();
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
        swift_task_dealloc();
        swift_task_dealloc();
        MediaMLPlugin::SQLError v26 = *(uint64_t (**)(void))(*(void *)(v156 + 512) + 8);
        return v26();
      }
      else
      {
        outlined init with take of Any?((_OWORD *)(v156 + 16), (_OWORD *)(v156 + 48));
        kMediaML_appName.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        outlined init with copy of Any?(v156 + 48, v156 + 80);
        *(void *)(swift_task_alloc() + 16) = v156 + 80;
        uint64_t result = DataFrame.filter<A>(on:_:_:)();
        if (!v146)
        {
          uint64_t v137 = *(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 1040);
          uint64_t v134 = *(void *)(v156 + 880);
          uint64_t v136 = *(void *)(v156 + 872);
          uint64_t v138 = *(void *)(v156 + 856);
          uint64_t v135 = *(void *)(v156 + 864);
          swift_task_dealloc();
          outlined destroy of Any?(v156 + 80);
          swift_bridgeObjectRelease();
          kMediaML_ssid.unsafeMutableAddressor();
          swift_bridgeObjectRetain();
          DataFrame.Slice.subscript.getter();
          AnyColumnSlice.distinct()();
          uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v135 + 8);
          *(void *)(v156 + 1064) = v8;
          *(void *)(v156 + 1072) = (v135 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          v8(v134, v138);
          swift_bridgeObjectRelease();
          v137(v134, v136, v138);
          Collection<>.makeIterator()();
          while (1)
          {
            IndexingIterator.next()();
            if (*(void *)(v156 + 136) == 1)
            {
              uint64_t v82 = *(void (**)(uint64_t, uint64_t))(v156 + 1064);
              uint64_t v83 = *(void *)(v156 + 872);
              uint64_t v81 = *(void *)(v156 + 856);
              uint64_t v85 = *(void *)(v156 + 792);
              uint64_t v86 = *(void *)(v156 + 768);
              unint64_t v84 = *(void *)(v156 + 776);
              outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v156 + 808));
              v82(v83, v81);
              (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v85, v86);
              outlined destroy of Any?(v156 + 48);
              uint64_t v146 = 0;
              goto LABEL_9;
            }
            outlined init with take of Any?((_OWORD *)(v156 + 112), (_OWORD *)(v156 + 144));
            kMediaML_ssid.unsafeMutableAddressor();
            swift_bridgeObjectRetain();
            outlined init with copy of Any?(v156 + 144, v156 + 176);
            *(void *)(swift_task_alloc() + 16) = v156 + 176;
            DataFrame.Slice.filter<A>(on:_:_:)();
            uint64_t v115 = *(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 992);
            uint64_t v114 = *(void *)(v156 + 928);
            uint64_t v117 = *(void *)(v156 + 920);
            uint64_t v118 = *(void *)(v156 + 896);
            uint64_t v109 = *(void *)(v156 + 760);
            uint64_t v112 = *(void *)(v156 + 728);
            uint64_t v113 = *(void *)(v156 + 904);
            uint64_t v111 = *(void *)(v156 + 736);
            swift_task_dealloc();
            outlined destroy of Any?(v156 + 176);
            swift_bridgeObjectRelease();
            DataFrame.init(_:)();
            uint64_t v110 = DataFrame.shape.getter();
            *(void *)(v156 + 600) = v110;
            *(void *)(v156 + 608) = _allocateUninitializedArray<A>(_:)();
            *(void *)(v156 + 616) = 0;
            uint64_t v9 = MediaMLPlugin.logger.unsafeMutableAddressor();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16))(v109, v9, v112);
            v115(v117, v114, v118);
            uint64_t v116 = *(_DWORD *)(v113 + 80);
            uint64_t v121 = swift_allocObject();
            uint64_t v119 = *(void (**)(unint64_t, uint64_t, uint64_t))(v113 + 32);
            v119(v121 + ((v116 + 16) & ~(unint64_t)v116), v117, v118);
            v115(v117, v114, v118);
            uint64_t v123 = swift_allocObject();
            v119(v123 + ((v116 + 16) & ~(unint64_t)v116), v117, v118);
            oslog = Logger.logObject.getter();
            uint64_t v133 = static os_log_type_t.debug.getter();
            *(void *)(v156 + 624) = 22;
            lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            uint32_t size = *(_DWORD *)(v156 + 1140);
            uint64_t v125 = swift_allocObject();
            *(unsigned char *)(v125 + 16) = 0;
            uint64_t v126 = swift_allocObject();
            *(unsigned char *)(v126 + 16) = 8;
            uint64_t v122 = swift_allocObject();
            *(void *)(v122 + 16) = partial apply for implicit closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation();
            *(void *)(v122 + 24) = v121;
            uint64_t v127 = swift_allocObject();
            *(void *)(v127 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
            *(void *)(v127 + 24) = v122;
            uint64_t v128 = swift_allocObject();
            *(unsigned char *)(v128 + 16) = 0;
            uint64_t v129 = swift_allocObject();
            *(unsigned char *)(v129 + 16) = 8;
            uint64_t v124 = swift_allocObject();
            *(void *)(v124 + 16) = partial apply for implicit closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation();
            *(void *)(v124 + 24) = v123;
            uint64_t v130 = swift_allocObject();
            *(void *)(v130 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
            *(void *)(v130 + 24) = v124;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            _allocateUninitializedArray<A>(_:)();
            uint64_t v131 = v10;
            swift_retain();
            *uint64_t v131 = closure #1 in OSLogArguments.append(_:)partial apply;
            v131[1] = v125;
            swift_retain();
            v131[2] = closure #1 in OSLogArguments.append(_:)partial apply;
            v131[3] = v126;
            swift_retain();
            v131[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v131[5] = v127;
            swift_retain();
            v131[6] = closure #1 in OSLogArguments.append(_:)partial apply;
            v131[7] = v128;
            swift_retain();
            v131[8] = closure #1 in OSLogArguments.append(_:)partial apply;
            v131[9] = v129;
            swift_retain();
            v131[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
            v131[11] = v130;
            _finalizeUninitializedArray<A>(_:)();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(oslog, v133))
            {
              buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              uint64_t v107 = createStorage<A>(capacity:type:)(0);
              uint64_t v108 = createStorage<A>(capacity:type:)(0);
              *(void *)(v156 + 696) = buf;
              *(void *)(v156 + 704) = v107;
              *(void *)(v156 + 712) = v108;
              serialize(_:at:)(0, (unsigned char **)(v156 + 696));
              serialize(_:at:)(2, (unsigned char **)(v156 + 696));
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
              *(void *)(v156 + 504) = v125;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
              *(void *)(v156 + 504) = v126;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
              *(void *)(v156 + 504) = v127;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
              *(void *)(v156 + 504) = v128;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
              *(void *)(v156 + 504) = v129;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              *(void *)(v156 + 496) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
              *(void *)(v156 + 504) = v130;
              closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 496), v156 + 696, v156 + 704, v156 + 712);
              _os_log_impl((void *)&_mh_execute_header, oslog, v133, "Filtered dataframe shape=%ld,%ld", buf, size);
              destroyStorage<A>(_:count:)(v107);
              destroyStorage<A>(_:count:)(v108);
              UnsafeMutablePointer.deallocate()();
            }
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v104 = *(void *)(v156 + 760);
            uint64_t v105 = *(void *)(v156 + 728);
            uint64_t v103 = *(void *)(v156 + 736);

            (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v105);
            while (*(void *)(v156 + 616) < v110)
            {
              uint64_t v102 = *(void (**)(uint64_t, uint64_t))(v156 + 1024);
              uint64_t v100 = *(void *)(v156 + 840);
              uint64_t v101 = *(void *)(v156 + 824);
              kMediaML_throughputStdDev.unsafeMutableAddressor();
              swift_bridgeObjectRetain();
              DataFrame.subscript.getter();
              AnyColumn.subscript.getter();
              v102(v100, v101);
              if (!*(void *)(v156 + 392)) {
                return _assertionFailure(_:_:file:line:flags:)();
              }
              outlined init with take of Any(v156 + 368, v156 + 336);
              swift_dynamicCast();
              uint64_t v174 = *(void *)(v156 + 688);
              specialized Array.append(_:)();
              uint64_t v11 = swift_bridgeObjectRelease();
              MediaMLPlugin::SQLError v13 = *(void *)(v156 + 616);
              uint64_t v99 = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_57;
              }
              *(void *)(v156 + 616) = v99;
            }
            swift_bridgeObjectRetain();
            uint64_t v98 = specialized Array.count.getter();
            *(void *)(v156 + 632) = v98;
            swift_bridgeObjectRelease();
            uint64_t v11 = v98;
            if (__OFSUB__(v98, 1))
            {
              __break(1u);
LABEL_57:
              __break(1u);
              return _swift_task_switch(v11, v12);
            }
            *(void *)(v156 + 648) = v98 - 1;
            *(void *)(v156 + 656) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
            min<A>(_:_:)();
            uint64_t v97 = *(void *)(v156 + 640);
            *(void *)(v156 + 664) = v97;
            if (v98 > 0)
            {
              if (v97 < 0) {
                return _assertionFailure(_:_:file:line:flags:)();
              }
              uint64_t v169 = 0;
              uint64_t v170 = v97;
              *(void *)(v156 + 400) = specialized Collection<>.makeIterator()();
              *(void *)(v156 + 408) = v16;
              *(void *)(v156 + 416) = v17;
              *(unsigned char *)(v156 + 424) = v18 & 1;
              *(void *)(v156 + 1080) = 0;
              uint64_t v19 = specialized IndexingIterator.next()();
              uint64_t v171 = v19;
              Swift::String v172 = v20 & 1;
              if ((v20 & 1) == 0) {
                break;
              }
            }
            uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v156 + 1008);
            unint64_t v89 = *(void *)(v156 + 928);
            uint64_t v87 = *(void *)(v156 + 896);
            outlined destroy of [Double]();
            v88(v89, v87);
            outlined destroy of Any?(v156 + 144);
          }
          *(void *)(v156 + 672) = v19;
          outlined init with copy of Any?(v156 + 48, v156 + 240);
          if (!*(void *)(v156 + 264)) {
            return _assertionFailure(_:_:file:line:flags:)();
          }
          outlined init with take of Any(v156 + 240, v156 + 208);
          swift_dynamicCast();
          os_log_type_t v95 = *(void *)(v156 + 432);
          uint64_t v96 = *(void *)(v156 + 440);
          *(void *)(v156 + 1088) = v96;
          *(void *)(v156 + 448) = v95;
          *(void *)(v156 + 456) = v96;
          outlined init with copy of Any?(v156 + 144, v156 + 304);
          if (!*(void *)(v156 + 328)) {
            return _assertionFailure(_:_:file:line:flags:)();
          }
          uint64_t v93 = *(void *)(v156 + 984);
          unint64_t v94 = *(void *)(v156 + 960);
          outlined init with take of Any(v156 + 304, v156 + 272);
          swift_dynamicCast();
          uint64_t v90 = *(void *)(v156 + 464);
          uint64_t v91 = *(void *)(v156 + 472);
          *(void *)(v156 + 1096) = v91;
          *(void *)(v156 + 480) = v90;
          *(void *)(v156 + 488) = v91;
          specialized Array.subscript.getter();
          Swift::Bool v173 = v21;
          uint64_t v92 = v21;
          *(void *)(v156 + 680) = v21;
          *(Swift::String *)(v156 + 1104) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO wifiStdDev (app_name, ssid, throughput_stddev, training_date) VALUES (?, ?, ?, ?)", 0x5DuLL, 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v22 = (void *)swift_task_alloc();
          uint64_t v12 = v94;
          *(void *)(v156 + 1120) = v22;
          v22[2] = v95;
          v22[3] = v96;
          v22[4] = v90;
          v22[5] = v91;
          v22[6] = v92;
          v22[7] = v93;
          uint64_t v11 = (uint64_t)MediaMLPlugin.saveWiFiDataStandardDeviation();
          return _swift_task_switch(v11, v12);
        }
      }
      return result;
    }
  }
  else
  {
    ((void (*)(void, void))v149)(*(void *)(v156 + 936), *(void *)(v156 + 896));
  }
  uint64_t v27 = *(void *)(v156 + 744);
  uint64_t v41 = *(void *)(v156 + 728);
  uint64_t v40 = *(void *)(v156 + 736);
  unint64_t v28 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v27, v28, v41);
  uint64_t v44 = Logger.logObject.getter();
  uint64_t v43 = static os_log_type_t.error.getter();
  *(void *)(v156 + 552) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v42 = *(_DWORD *)(v156 + 428);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v45 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v44, v43))
  {
    uint64_t v29 = *(void *)(v156 + 976);
    uint64_t v36 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v37 = createStorage<A>(capacity:type:)(0);
    uint64_t v38 = createStorage<A>(capacity:type:)(0);
    *(void *)(v156 + 560) = v36;
    *(void *)(v156 + 568) = v37;
    *(void *)(v156 + 576) = v38;
    serialize(_:at:)(0, (unsigned char **)(v156 + 560));
    serialize(_:at:)(0, (unsigned char **)(v156 + 560));
    *(void *)(v156 + 584) = v45;
    uint64_t v39 = (void *)swift_task_alloc();
    v39[2] = v156 + 560;
    v39[3] = v156 + 568;
    v39[4] = v156 + 576;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v29) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, v44, v43, "saveWiFiDataStandardDeviation: DataFrame stddevDF did not contain all required columns", v36, v42);
    destroyStorage<A>(_:count:)(v37);
    destroyStorage<A>(_:count:)(v38);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  Swift::String v34 = *(void *)(v156 + 952);
  uint64_t v35 = *(void *)(v156 + 896);
  uint64_t v32 = *(void *)(v156 + 744);
  uint64_t v33 = *(void *)(v156 + 728);
  uint64_t v31 = *(void *)(v156 + 736);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
  lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
  swift_allocError();
  swift_willThrow();
  ((void (*)(uint64_t, uint64_t))v149)(v34, v35);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void))(*(void *)(v156 + 512) + 8);
  return v30();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v1 = v0[139];
  uint64_t v2 = v0[138];
  uint64_t v3 = v0[135];
  v0[64] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation());
  v0[141] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.saveWiFiDataStandardDeviation();
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.saveWiFiDataStandardDeviation();
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t result;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  int v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(unint64_t, uint64_t, uint64_t);
  uint32_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *log;
  os_log_type_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t *buf;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t, uint64_t);
  int v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  NSObject *oslog;
  os_log_type_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t, uint64_t);
  uint64_t v113;
  uint64_t i;
  uint64_t v115;
  uint64_t v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;

  uint64_t v128 = v0;
  *(void *)(v0 + 512) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v116 = *(void *)(v0 + 1128);
LABEL_24:
  *(void *)(v115 + 1080) = v116;
  uint64_t v124 = specialized IndexingIterator.next()();
  uint64_t v125 = v13 & 1;
  if (v13)
  {
    uint64_t v64 = v116;
LABEL_33:
    uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v115 + 1008);
    uint64_t v63 = *(void *)(v115 + 928);
    unint64_t v61 = *(void *)(v115 + 896);
    outlined destroy of [Double]();
    v62(v63, v61);
    outlined destroy of Any?(v115 + 144);
    for (i = v64; ; i = 0)
    {
      IndexingIterator.next()();
      if (*(void *)(v115 + 136) != 1)
      {
        outlined init with take of Any?((_OWORD *)(v115 + 112), (_OWORD *)(v115 + 144));
        kMediaML_ssid.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        outlined init with copy of Any?(v115 + 144, v115 + 176);
        *(void *)(swift_task_alloc() + 16) = v115 + 176;
        uint64_t result = DataFrame.Slice.filter<A>(on:_:_:)();
        if (i) {
          return result;
        }
        uint64_t v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 992);
        unint64_t v89 = *(void *)(v115 + 928);
        uint64_t v92 = *(void *)(v115 + 920);
        uint64_t v93 = *(void *)(v115 + 896);
        unint64_t v84 = *(void *)(v115 + 760);
        uint64_t v87 = *(void *)(v115 + 728);
        uint64_t v88 = *(void *)(v115 + 904);
        uint64_t v86 = *(void *)(v115 + 736);
        swift_task_dealloc();
        outlined destroy of Any?(v115 + 176);
        swift_bridgeObjectRelease();
        DataFrame.init(_:)();
        uint64_t v85 = DataFrame.shape.getter();
        *(void *)(v115 + 600) = v85;
        *(void *)(v115 + 608) = _allocateUninitializedArray<A>(_:)();
        *(void *)(v115 + 616) = 0;
        uint64_t v3 = MediaMLPlugin.logger.unsafeMutableAddressor();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v84, v3, v87);
        v90(v92, v89, v93);
        uint64_t v91 = *(_DWORD *)(v88 + 80);
        uint64_t v96 = swift_allocObject();
        unint64_t v94 = *(void (**)(unint64_t, uint64_t, uint64_t))(v88 + 32);
        v94(v96 + ((v91 + 16) & ~(unint64_t)v91), v92, v93);
        v90(v92, v89, v93);
        uint64_t v98 = swift_allocObject();
        v94(v98 + ((v91 + 16) & ~(unint64_t)v91), v92, v93);
        oslog = Logger.logObject.getter();
        uint64_t v108 = static os_log_type_t.debug.getter();
        *(void *)(v115 + 624) = 22;
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t size = *(_DWORD *)(v115 + 1140);
        uint64_t v100 = swift_allocObject();
        *(unsigned char *)(v100 + 16) = 0;
        uint64_t v101 = swift_allocObject();
        *(unsigned char *)(v101 + 16) = 8;
        uint64_t v97 = swift_allocObject();
        *(void *)(v97 + 16) = partial apply for implicit closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation();
        *(void *)(v97 + 24) = v96;
        uint64_t v102 = swift_allocObject();
        *(void *)(v102 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(void *)(v102 + 24) = v97;
        uint64_t v103 = swift_allocObject();
        *(unsigned char *)(v103 + 16) = 0;
        uint64_t v104 = swift_allocObject();
        *(unsigned char *)(v104 + 16) = 8;
        uint64_t v99 = swift_allocObject();
        *(void *)(v99 + 16) = partial apply for implicit closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation();
        *(void *)(v99 + 24) = v98;
        uint64_t v105 = swift_allocObject();
        *(void *)(v105 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
        *(void *)(v105 + 24) = v99;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        _allocateUninitializedArray<A>(_:)();
        uint64_t v106 = v4;
        swift_retain();
        *uint64_t v106 = closure #1 in OSLogArguments.append(_:)partial apply;
        v106[1] = v100;
        swift_retain();
        void v106[2] = closure #1 in OSLogArguments.append(_:)partial apply;
        v106[3] = v101;
        swift_retain();
        v106[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v106[5] = v102;
        swift_retain();
        v106[6] = closure #1 in OSLogArguments.append(_:)partial apply;
        v106[7] = v103;
        swift_retain();
        v106[8] = closure #1 in OSLogArguments.append(_:)partial apply;
        v106[9] = v104;
        swift_retain();
        v106[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
        v106[11] = v105;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(oslog, v108))
        {
          buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v82 = createStorage<A>(capacity:type:)(0);
          uint64_t v83 = createStorage<A>(capacity:type:)(0);
          *(void *)(v115 + 696) = buf;
          *(void *)(v115 + 704) = v82;
          *(void *)(v115 + 712) = v83;
          serialize(_:at:)(0, (unsigned char **)(v115 + 696));
          serialize(_:at:)(2, (unsigned char **)(v115 + 696));
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
          *(void *)(v115 + 504) = v100;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
          *(void *)(v115 + 504) = v101;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
          *(void *)(v115 + 504) = v102;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
          *(void *)(v115 + 504) = v103;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append(_:)partial apply;
          *(void *)(v115 + 504) = v104;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          *(void *)(v115 + 496) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
          *(void *)(v115 + 504) = v105;
          closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 496), v115 + 696, v115 + 704, v115 + 712);
          _os_log_impl((void *)&_mh_execute_header, oslog, v108, "Filtered dataframe shape=%ld,%ld", buf, size);
          destroyStorage<A>(_:count:)(v82);
          destroyStorage<A>(_:count:)(v83);
          UnsafeMutablePointer.deallocate()();
        }
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        unint64_t v79 = *(void *)(v115 + 760);
        uint64_t v80 = *(void *)(v115 + 728);
        uint64_t v78 = *(void *)(v115 + 736);

        (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v79, v80);
        while (*(void *)(v115 + 616) < v85)
        {
          uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v115 + 1024);
          uint64_t v75 = *(void *)(v115 + 840);
          uint64_t v76 = *(void *)(v115 + 824);
          kMediaML_throughputStdDev.unsafeMutableAddressor();
          swift_bridgeObjectRetain();
          DataFrame.subscript.getter();
          AnyColumn.subscript.getter();
          v77(v75, v76);
          if (!*(void *)(v115 + 392)) {
            return _assertionFailure(_:_:file:line:flags:)();
          }
          outlined init with take of Any(v115 + 368, v115 + 336);
          swift_dynamicCast();
          uint64_t v127 = *(void *)(v115 + 688);
          specialized Array.append(_:)();
          uint64_t v5 = (uint64_t (*)())swift_bridgeObjectRelease();
          uint64_t v7 = *(void *)(v115 + 616);
          uint64_t v74 = v7 + 1;
          if (__OFADD__(v7, 1)) {
            goto LABEL_46;
          }
          *(void *)(v115 + 616) = v74;
        }
        swift_bridgeObjectRetain();
        uint64_t v73 = specialized Array.count.getter();
        *(void *)(v115 + 632) = v73;
        swift_bridgeObjectRelease();
        uint64_t v5 = (uint64_t (*)())v73;
        if (__OFSUB__(v73, 1))
        {
          __break(1u);
LABEL_46:
          __break(1u);
          return _swift_task_switch(v5, v6);
        }
        *(void *)(v115 + 648) = v73 - 1;
        *(void *)(v115 + 656) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
        min<A>(_:_:)();
        double v72 = *(void *)(v115 + 640);
        *(void *)(v115 + 664) = v72;
        if (v73 <= 0)
        {
          uint64_t v64 = 0;
          goto LABEL_33;
        }
        if (v72 < 0) {
          return _assertionFailure(_:_:file:line:flags:)();
        }
        uint64_t v122 = 0;
        uint64_t v123 = v72;
        *(void *)(v115 + 400) = specialized Collection<>.makeIterator()();
        *(void *)(v115 + 408) = v10;
        *(void *)(v115 + 416) = v11;
        *(unsigned char *)(v115 + 424) = v12 & 1;
        uint64_t v116 = 0;
        goto LABEL_24;
      }
      uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v115 + 1064);
      uint64_t v57 = *(void *)(v115 + 872);
      uint64_t v55 = *(void *)(v115 + 856);
      uint64_t v59 = *(void *)(v115 + 792);
      uint64_t v60 = *(void *)(v115 + 768);
      uint64_t v58 = *(void *)(v115 + 776);
      outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v115 + 808));
      v56(v57, v55);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v59, v60);
      outlined destroy of Any?(v115 + 48);
      IndexingIterator.next()();
      if (*(void *)(v115 + 40) == 1) {
        break;
      }
      outlined init with take of Any?((_OWORD *)(v115 + 16), (_OWORD *)(v115 + 48));
      kMediaML_appName.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      outlined init with copy of Any?(v115 + 48, v115 + 80);
      *(void *)(swift_task_alloc() + 16) = v115 + 80;
      uint64_t result = DataFrame.filter<A>(on:_:_:)();
      if (i) {
        return result;
      }
      uint64_t v112 = *(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 1040);
      uint64_t v109 = *(void *)(v115 + 880);
      uint64_t v111 = *(void *)(v115 + 872);
      uint64_t v113 = *(void *)(v115 + 856);
      uint64_t v110 = *(void *)(v115 + 864);
      swift_task_dealloc();
      outlined destroy of Any?(v115 + 80);
      swift_bridgeObjectRelease();
      kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.Slice.subscript.getter();
      AnyColumnSlice.distinct()();
      uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
      *(void *)(v115 + 1064) = v2;
      *(void *)(v115 + 1072) = (v110 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v2(v109, v113);
      swift_bridgeObjectRelease();
      v112(v109, v111, v113);
      Collection<>.makeIterator()();
    }
    uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 992);
    uint64_t v35 = *(void *)(v115 + 952);
    uint64_t v38 = *(void *)(v115 + 920);
    uint64_t v39 = *(void *)(v115 + 896);
    uint64_t v16 = *(void *)(v115 + 752);
    uint64_t v33 = *(void *)(v115 + 728);
    Swift::String v34 = *(void *)(v115 + 904);
    uint64_t v32 = *(void *)(v115 + 736);
    outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v115 + 816));
    uint64_t v17 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v16, v17, v33);
    v36(v38, v35, v39);
    uint64_t v37 = *(_DWORD *)(v34 + 80);
    uint64_t v42 = swift_allocObject();
    uint64_t v40 = *(void (**)(unint64_t, uint64_t, uint64_t))(v34 + 32);
    v40(v42 + ((v37 + 16) & ~(unint64_t)v37), v38, v39);
    v36(v38, v35, v39);
    uint64_t v44 = swift_allocObject();
    v40(v44 + ((v37 + 16) & ~(unint64_t)v37), v38, v39);
    log = Logger.logObject.getter();
    uint64_t v54 = static os_log_type_t.debug.getter();
    *(void *)(v115 + 592) = 22;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v41 = *(_DWORD *)(v115 + 1136);
    unint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 0;
    uint32_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 8;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = partial apply for implicit closure #5 in MediaMLPlugin.saveWiFiDataStandardDeviation();
    *(void *)(v43 + 24) = v42;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v48 + 24) = v43;
    uint32_t v49 = swift_allocObject();
    *(unsigned char *)(v49 + 16) = 0;
    uint64_t v50 = swift_allocObject();
    *(unsigned char *)(v50 + 16) = 8;
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = partial apply for implicit closure #6 in MediaMLPlugin.saveWiFiDataStandardDeviation();
    *(void *)(v45 + 24) = v44;
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v51 + 24) = v45;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v52 = v18;
    swift_retain();
    *uint64_t v52 = closure #1 in OSLogArguments.append(_:)partial apply;
    v52[1] = v46;
    swift_retain();
    v52[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v52[3] = v47;
    swift_retain();
    v52[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v52[5] = v48;
    swift_retain();
    v52[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v52[7] = v49;
    swift_retain();
    v52[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v52[9] = v50;
    swift_retain();
    v52[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v52[11] = v51;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v54))
    {
      uint64_t v29 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v30 = createStorage<A>(capacity:type:)(0);
      uint64_t v31 = createStorage<A>(capacity:type:)(0);
      uint64_t v117 = v29;
      uint64_t v118 = v30;
      uint64_t v119 = v31;
      serialize(_:at:)(0, &v117);
      serialize(_:at:)(2, &v117);
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v121 = v46;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      if (i) {
        return result;
      }
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v121 = v47;
      closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v121 = v48;
      closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v121 = v49;
      closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v121 = v50;
      closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v121 = v51;
      closure #1 in osLogInternal(_:log:type:)(&v120, (uint64_t)&v117, (uint64_t)&v118, (uint64_t)&v119);
      _os_log_impl((void *)&_mh_execute_header, log, v54, "Returning a dataframe of size=%ld,%ld", v29, v41);
      destroyStorage<A>(_:count:)(v30);
      destroyStorage<A>(_:count:)(v31);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    MediaMLPlugin::SQLError v25 = *(void (**)(uint64_t, uint64_t))(v115 + 1008);
    MediaMLPlugin::SQLError v26 = *(void *)(v115 + 952);
    MediaMLPlugin::SQLError v24 = *(void *)(v115 + 896);
    uint64_t v27 = *(void *)(v115 + 888);
    uint64_t v23 = *(void *)(v115 + 856);
    unint64_t v28 = *(void *)(v115 + 752);
    uint64_t v21 = *(void *)(v115 + 728);
    uint64_t v22 = *(void *)(v115 + 864);
    uint64_t v20 = *(void *)(v115 + 736);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v27, v23);
    v25(v26, v24);
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(*(void *)(v115 + 512) + 8);
    return v19();
  }
  else
  {
    *(void *)(v115 + 672) = v124;
    outlined init with copy of Any?(v115 + 48, v115 + 240);
    if (!*(void *)(v115 + 264)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    outlined init with take of Any(v115 + 240, v115 + 208);
    swift_dynamicCast();
    double v70 = *(void *)(v115 + 432);
    uint64_t v71 = *(void *)(v115 + 440);
    *(void *)(v115 + 1088) = v71;
    *(void *)(v115 + 448) = v70;
    *(void *)(v115 + 456) = v71;
    outlined init with copy of Any?(v115 + 144, v115 + 304);
    if (*(void *)(v115 + 328))
    {
      uint64_t v68 = *(void *)(v115 + 984);
      uint64_t v69 = *(void *)(v115 + 960);
      outlined init with take of Any(v115 + 304, v115 + 272);
      swift_dynamicCast();
      uint64_t v65 = *(void *)(v115 + 464);
      uint64_t v66 = *(void *)(v115 + 472);
      *(void *)(v115 + 1096) = v66;
      *(void *)(v115 + 480) = v65;
      *(void *)(v115 + 488) = v66;
      specialized Array.subscript.getter();
      uint64_t v126 = v14;
      uint64_t v67 = v14;
      *(void *)(v115 + 680) = v14;
      *(Swift::String *)(v115 + 1104) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO wifiStdDev (app_name, ssid, throughput_stddev, training_date) VALUES (?, ?, ?, ?)", 0x5DuLL, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v15 = (void *)swift_task_alloc();
      uint64_t v6 = v69;
      *(void *)(v115 + 1120) = v15;
      void v15[2] = v70;
      v15[3] = v71;
      v15[4] = v65;
      v15[5] = v66;
      v15[6] = v67;
      v15[7] = v68;
      uint64_t v5 = MediaMLPlugin.saveWiFiDataStandardDeviation();
      return _swift_task_switch(v5, v6);
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 512) = v0;
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 512) + 8);
  return v1();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;

  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[133];
  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[126];
  MediaMLPlugin::SQLError v13 = v0[119];
  uint64_t v3 = v0[116];
  Swift::Int32 v14 = v0[112];
  uint64_t v12 = v0[111];
  uint64_t v5 = v0[109];
  uint64_t v10 = v0[107];
  uint64_t v9 = v0[102];
  uint64_t v4 = v0[101];
  uint64_t v7 = v0[99];
  uint64_t v6 = v0[97];
  uint64_t v8 = v0[96];
  v0[64] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of [Double]();
  v15(v3, v14);
  outlined destroy of Any?((uint64_t)(v0 + 18));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v4);
  v11(v5, v10);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  outlined destroy of Any?((uint64_t)(v0 + 6));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v9);
  v11(v12, v10);
  v15(v13, v14);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[64] + 8);
  return v1();
}

void MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  uint64_t v1 = *(void **)(v0 + 720);
  *(void *)(v0 + 512) = v0;
  uint64_t v13 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.saveWiFiDataStandardDeviation(), 0, v13, v2, v2);
  swift_release();
  uint64_t v11 = v12[66];
  v12[120] = v11;
  if (v11)
  {
    v12[67] = v11;
    uint64_t v3 = (void *)swift_task_alloc();
    v12[121] = v3;
    *uint64_t v3 = v12[64];
    v3[1] = MediaMLPlugin.saveWiFiDataStandardDeviation();
    uint64_t v4 = v12[119];
    MediaMLPlugin.getWiFiDataStandardDeviation()(v4);
  }
  else
  {
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v15 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v5);
    Swift::Int32 code = v15.code;
    uint64_t desc_8 = v15.desc.value._countAndFlagsBits;
    object = v15.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v6 = code;
    *(void *)(v6 + 8) = desc_8;
    *(void *)(v6 + 16) = object;
    swift_willThrow();
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
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(void (**)(void))(v12[64] + 8);
    v7();
  }
}

void *closure #1 in MediaMLPlugin.saveWiFiDataStandardDeviation()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t implicit closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v16 = v8;
  swift_bridgeObjectRetain();
  *(void *)(v16 + 24) = &type metadata for String;
  *(void *)(v16 + 32) = &protocol witness table for String;
  *(void *)uint64_t v16 = a2;
  *(void *)(v16 + 8) = a3;
  swift_bridgeObjectRetain();
  *(void *)(v16 + 64) = &type metadata for String;
  *(void *)(v16 + 72) = &protocol witness table for String;
  *(void *)(v16 + 40) = a4;
  *(void *)(v16 + 48) = a5;
  *(void *)(v16 + 104) = &type metadata for Double;
  *(void *)(v16 + 112) = &protocol witness table for Double;
  *(double *)(v16 + 80) = a7;
  *(void *)(v16 + 144) = &type metadata for Int;
  *(void *)(v16 + 152) = &protocol witness table for Int;
  *(void *)(v16 + 120) = a6;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v18) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #5 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #6 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t MediaMLPlugin.getWiFiDataStandardDeviation()(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v2[3] = v1;
  return _swift_task_switch(MediaMLPlugin.getWiFiDataStandardDeviation(), 0);
}

void MediaMLPlugin.getWiFiDataStandardDeviation()()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getWiFiDataStandardDeviation(), 0, v11, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 80) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WITH CTE as (SELECT app_name, ssid, AVG(throughput_true) AS throughput_mean FROM processedwifi GROUP BY app_name, ssid, session_id)\nSELECT app_name, ssid, AVG(throughput_mean*throughput_mean)-(AVG(throughput_mean)*AVG(throughput_mean)) AS throughput_var\nFROM CTE\nGROUP BY app_name, ssid", 0x11EuLL, 1);
    _swift_task_switch(MediaMLPlugin.getWiFiDataStandardDeviation(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    char v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

uint64_t MediaMLPlugin.getWiFiDataStandardDeviation()()
{
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  uint64_t v1 = v0[9];
  v0[2] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation());
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getWiFiDataStandardDeviation();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getWiFiDataStandardDeviation();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[13];
  v0[2] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[6] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getWiFiDataStandardDeviation()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v48 = 0;
  uint64_t v53 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation();
  uint64_t v66 = 0;
  uint64_t v65 = 0;
  uint32_t v49 = &v64;
  uint64_t v64 = 0;
  uint64_t v50 = &v63;
  uint64_t v63 = 0;
  uint64_t v51 = &v62;
  uint64_t v62 = 0;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = v32 - 8;
  unint64_t v35 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v32);
  uint64_t v36 = (char *)v9 - v35;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = v37 - 8;
  unint64_t v40 = (*(void *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v48);
  uint64_t v41 = (char *)v9 - v40;
  uint64_t v42 = type metadata accessor for DataFrame();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  unint64_t v45 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v48);
  unint64_t v46 = (char *)v9 - v45;
  uint64_t v66 = (char *)v9 - v45;
  uint64_t v65 = a1;
  uint32_t v47 = &type metadata for String;
  uint64_t v64 = _allocateUninitializedArray<A>(_:)();
  uint64_t v63 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v52;
  uint64_t v62 = v3;
  uint64_t v57 = v49;
  uint64_t v58 = v50;
  uint64_t v59 = v51;
  (*(void (**)(uint64_t (*)(uint64_t), char *))(*(void *)a1 + 144))(v53, v56);
  uint64_t v54 = v4;
  uint64_t v55 = v4;
  if (v4)
  {
    v9[1] = v55;
    outlined destroy of [Double]();
    outlined destroy of [String]();
    uint64_t result = &v64;
  }
  else
  {
    DataFrame.init()();
    uint64_t v5 = kMediaML_appName.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v5->_countAndFlagsBits;
    object = v5->_object;
    swift_bridgeObjectRetain();
    uint64_t v30 = &v64;
    uint64_t v10 = v64;
    swift_bridgeObjectRetain();
    uint64_t v12 = &v61;
    uint64_t v61 = v10;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v18 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v19 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v38 + 8);
    uint64_t v20 = v38 + 8;
    v21(v41, v37);
    uint64_t v6 = kMediaML_ssid.unsafeMutableAddressor();
    uint64_t v14 = v6->_countAndFlagsBits;
    uint64_t v16 = v6->_object;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v63;
    uint64_t v15 = v63;
    swift_bridgeObjectRetain();
    v60[1] = v15;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v21(v41, v37);
    uint64_t v7 = kMediaML_throughputStdDev.unsafeMutableAddressor();
    uint64_t v26 = v7->_countAndFlagsBits;
    uint64_t v23 = v7->_object;
    swift_bridgeObjectRetain();
    unint64_t v28 = &v62;
    uint64_t v22 = v62;
    swift_bridgeObjectRetain();
    MediaMLPlugin::SQLError v24 = v60;
    v60[0] = v22;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v27 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v31, v46, v42);
    outlined destroy of [Double]();
    outlined destroy of [String]();
    uint64_t result = v30;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v16)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v15)
    {
      SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid not of type String", 0x17uLL, 1);
      MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 code = v18.code;
      uint64_t countAndFlagsBits = v18.desc.value._countAndFlagsBits;
      object = v18.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v9 = swift_allocError();
      *(_DWORD *)uint64_t v5 = code;
      *(void *)(v5 + 8) = countAndFlagsBits;
      *(void *)(v5 + 16) = object;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name not of type String", 0x1BuLL, 1);
    MediaMLPlugin::SQLError v17 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v12 = v17.code;
    uint64_t desc_8 = v17.desc.value._countAndFlagsBits;
    uint64_t v11 = v17.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v13 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v12;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v11;
    swift_willThrow();
    return v13;
  }
}

uint64_t MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t a1)
{
  *(void *)(v2 + 912) = v1;
  *(void *)(v2 + 904) = a1;
  *(void *)(v2 + 672) = v2;
  *(void *)(v2 + 680) = 0;
  *(void *)(v2 + 688) = 0;
  *(void *)(v2 + 704) = 0;
  *(void *)(v2 + 752) = 0;
  *(void *)(v2 + 768) = 0;
  *(void *)(v2 + 776) = 0;
  *(void *)(v2 + 784) = 0;
  *(void *)(v2 + 800) = 0;
  *(void *)(v2 + 832) = 0;
  *(void *)(v2 + 560) = 0;
  *(void *)(v2 + 568) = 0;
  *(void *)(v2 + 576) = 0;
  *(unsigned char *)(v2 + 584) = 0;
  *(void *)(v2 + 840) = 0;
  *(void *)(v2 + 608) = 0;
  *(void *)(v2 + 616) = 0;
  *(void *)(v2 + 640) = 0;
  *(void *)(v2 + 648) = 0;
  *(void *)(v2 + 856) = 0;
  *(void *)(v2 + 864) = 0;
  uint64_t v3 = type metadata accessor for Logger();
  *(void *)(v2 + 920) = v3;
  *(void *)(v2 + 928) = *(void *)(v3 - 8);
  *(void *)(v2 + 936) = swift_task_alloc();
  *(void *)(v2 + 944) = swift_task_alloc();
  *(void *)(v2 + 952) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for DataFrame.Slice();
  *(void *)(v2 + 960) = v4;
  *(void *)(v2 + 968) = *(void *)(v4 - 8);
  *(void *)(v2 + 976) = swift_task_alloc();
  *(void *)(v2 + 984) = swift_task_alloc();
  *(void *)(v2 + 992) = swift_task_alloc();
  *(void *)(v2 + 1000) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<AnyColumnSlice>);
  *(void *)(v2 + 1008) = swift_task_alloc();
  *(void *)(v2 + 1016) = swift_task_alloc();
  *(void *)(v2 + 1024) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AnyColumn();
  *(void *)(v2 + 1032) = v5;
  *(void *)(v2 + 1040) = *(void *)(v5 - 8);
  *(void *)(v2 + 1048) = swift_task_alloc();
  *(void *)(v2 + 1056) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AnyColumnSlice();
  *(void *)(v2 + 1064) = v6;
  *(void *)(v2 + 1072) = *(void *)(v6 - 8);
  *(void *)(v2 + 1080) = swift_task_alloc();
  *(void *)(v2 + 1088) = swift_task_alloc();
  *(void *)(v2 + 1096) = swift_task_alloc();
  *(void *)(v2 + 1104) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame();
  *(void *)(v2 + 1112) = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  *(void *)(v2 + 1120) = v9;
  *(void *)(v2 + 1128) = *(void *)(v9 + 64);
  *(void *)(v2 + 1136) = swift_task_alloc();
  *(void *)(v2 + 1144) = swift_task_alloc();
  *(void *)(v2 + 1152) = swift_task_alloc();
  *(void *)(v2 + 1160) = swift_task_alloc();
  *(void *)(v2 + 1168) = swift_task_alloc();
  *(void *)(v2 + 1176) = swift_task_alloc();
  *(void *)(v2 + 680) = a1;
  *(void *)(v2 + 688) = v1;
  return _swift_task_switch(MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:), 0);
}

void MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  uint64_t v195 = v0;
  uint64_t v1 = *(void **)(v0 + 912);
  *(void *)(v0 + 672) = v0;
  uint64_t v183 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:), 0, v183, v2, v2);
  swift_release();
  uint64_t v181 = *(void *)(v182 + 696);
  *(void *)(v182 + 1184) = v181;
  if (!v181)
  {
    Swift::String v29 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v197 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v29);
    Swift::Int32 code = v197.code;
    uint64_t desc_8 = v197.desc.value._countAndFlagsBits;
    object = v197.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v30 = code;
    *(void *)(v30 + 8) = desc_8;
    *(void *)(v30 + 16) = object;
    swift_willThrow();
LABEL_57:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = *(void (**)(void))(*(void *)(v182 + 672) + 8);
    v31();
    return;
  }
  uint64_t v176 = *(void *)(v182 + 1176);
  uint64_t v178 = *(void *)(v182 + 1112);
  uint64_t v177 = *(void *)(v182 + 904);
  uint64_t v175 = *(void *)(v182 + 1120);
  *(void *)(v182 + 704) = v181;
  Swift::String v174 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v180 = DataFrame.containsColumn(_:)(v174);
  swift_bridgeObjectRelease();
  Swift::Bool v179 = *(void (**)(uint64_t, uint64_t, uint64_t))(v175 + 16);
  *(void *)(v182 + 1192) = v179;
  *(void *)(v182 + 1200) = (v175 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v179(v176, v177, v178);
  if (v180)
  {
    Swift::String v171 = *kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v172 = DataFrame.containsColumn(_:)(v171);
    swift_bridgeObjectRelease();
    Swift::Bool v173 = v172;
  }
  else
  {
    Swift::Bool v173 = 0;
  }
  uint64_t v3 = *(void *)(v182 + 1176);
  uint64_t v168 = *(void *)(v182 + 1168);
  uint64_t v170 = *(void *)(v182 + 1112);
  uint64_t v169 = *(void *)(v182 + 904);
  uint64_t v4 = *(void *)(v182 + 1120) + 8;
  uint64_t v167 = *(void (**)(uint64_t))v4;
  *(void *)(v182 + 1208) = *(void *)v4;
  *(void *)(v182 + 1216) = v4 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v167(v3);
  v179(v168, v169, v170);
  if (v173)
  {
    Swift::String v164 = *kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::Bool v165 = DataFrame.containsColumn(_:)(v164);
    swift_bridgeObjectRelease();
    Swift::Bool v166 = v165;
  }
  else
  {
    Swift::Bool v166 = 0;
  }
  uint64_t v161 = *(void *)(v182 + 1160);
  uint64_t v163 = *(void *)(v182 + 1112);
  uint64_t v162 = *(void *)(v182 + 904);
  v167(*(void *)(v182 + 1168));
  v179(v161, v162, v163);
  if (!v166)
  {
    ((void (*)(void, void))v167)(*(void *)(v182 + 1160), *(void *)(v182 + 1112));
LABEL_53:
    uint64_t v27 = *(void *)(v182 + 936);
    uint64_t v43 = *(void *)(v182 + 920);
    uint64_t v42 = *(void *)(v182 + 928);
    uint64_t v28 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v27, v28, v43);
    unint64_t v46 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    *(void *)(v182 + 712) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v44 = *(_DWORD *)(v182 + 588);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v47 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v46, v45))
    {
      uint64_t v38 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v39 = createStorage<A>(capacity:type:)(0);
      uint64_t v40 = createStorage<A>(capacity:type:)(0);
      *(void *)(v182 + 720) = v38;
      *(void *)(v182 + 728) = v39;
      *(void *)(v182 + 736) = v40;
      serialize(_:at:)(0, (unsigned char **)(v182 + 720));
      serialize(_:at:)(0, (unsigned char **)(v182 + 720));
      *(void *)(v182 + 744) = v47;
      uint64_t v41 = (void *)swift_task_alloc();
      v41[2] = v182 + 720;
      v41[3] = v182 + 728;
      v41[4] = v182 + 736;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl((void *)&_mh_execute_header, v46, v45, "saveCellDataStandardDeviation: DataFrame did not contain all required columns", v38, v44);
      destroyStorage<A>(_:count:)(v39);
      destroyStorage<A>(_:count:)(v40);
      UnsafeMutablePointer.deallocate()();
    }
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void *)(v182 + 936);
    uint64_t v37 = *(void *)(v182 + 920);
    uint64_t v35 = *(void *)(v182 + 928);

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v37);
    lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
    swift_allocError();
    swift_willThrow();
    swift_release();
    goto LABEL_57;
  }
  Swift::String v159 = *kMediaML_throughputStdDev.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::Bool v160 = DataFrame.containsColumn(_:)(v159);
  swift_bridgeObjectRelease();
  ((void (*)(void, void))v167)(*(void *)(v182 + 1160), *(void *)(v182 + 1112));
  if (!v160) {
    goto LABEL_53;
  }
  uint64_t v157 = *(void *)(v182 + 1104);
  uint64_t v152 = *(void *)(v182 + 1096);
  uint64_t v158 = *(void *)(v182 + 1064);
  uint64_t v154 = *(void *)(v182 + 1056);
  uint64_t v155 = *(void *)(v182 + 1032);
  uint64_t v156 = *(void *)(v182 + 1072);
  uint64_t v153 = *(void *)(v182 + 1040);
  Swift::Int DateIn = getDateInEpoch()();
  *(void *)(v182 + 1224) = DateIn;
  *(void *)(v182 + 752) = DateIn;
  kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  DataFrame.subscript.getter();
  AnyColumn.distinct()();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
  *(void *)(v182 + 1232) = v6;
  *(void *)(v182 + 1240) = (v153 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v154, v155);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 16);
  *(void *)(v182 + 1248) = v7;
  *(void *)(v182 + 1256) = (v156 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v152, v157, v158);
  *(void *)(v182 + 1264) = lazy protocol witness table accessor for type AnyColumnSlice and conformance AnyColumnSlice();
  Collection<>.makeIterator()();
  while (1)
  {
    IndexingIterator.next()();
    if (*(void *)(v182 + 40) == 1)
    {
      uint64_t v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v182 + 1192);
      uint64_t v63 = *(void *)(v182 + 1136);
      uint64_t v64 = *(void *)(v182 + 1112);
      uint64_t v23 = *(void *)(v182 + 944);
      uint64_t v58 = *(void *)(v182 + 920);
      uint64_t v60 = *(void *)(v182 + 904);
      uint64_t v59 = *(void *)(v182 + 1120);
      uint64_t v57 = *(void *)(v182 + 928);
      outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v182 + 1024));
      uint64_t v24 = MediaMLPlugin.logger.unsafeMutableAddressor();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v23, v24, v58);
      v61(v63, v60, v64);
      int v62 = *(_DWORD *)(v59 + 80);
      uint64_t v67 = swift_allocObject();
      uint64_t v65 = *(void (**)(unint64_t, uint64_t, uint64_t))(v59 + 32);
      v65(v67 + ((v62 + 16) & ~(unint64_t)v62), v63, v64);
      v61(v63, v60, v64);
      uint64_t v69 = swift_allocObject();
      v65(v69 + ((v62 + 16) & ~(unint64_t)v62), v63, v64);
      log = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.debug.getter();
      *(void *)(v182 + 760) = 22;
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v66 = *(_DWORD *)(v182 + 1344);
      uint64_t v71 = swift_allocObject();
      *(unsigned char *)(v71 + 16) = 0;
      uint64_t v72 = swift_allocObject();
      *(unsigned char *)(v72 + 16) = 8;
      uint64_t v68 = swift_allocObject();
      *(void *)(v68 + 16) = partial apply for implicit closure #6 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
      *(void *)(v68 + 24) = v67;
      uint64_t v73 = swift_allocObject();
      *(void *)(v73 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v73 + 24) = v68;
      uint64_t v74 = swift_allocObject();
      *(unsigned char *)(v74 + 16) = 0;
      uint64_t v75 = swift_allocObject();
      *(unsigned char *)(v75 + 16) = 8;
      uint64_t v70 = swift_allocObject();
      *(void *)(v70 + 16) = partial apply for implicit closure #7 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
      *(void *)(v70 + 24) = v69;
      uint64_t v76 = swift_allocObject();
      *(void *)(v76 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
      *(void *)(v76 + 24) = v70;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      _allocateUninitializedArray<A>(_:)();
      uint64_t v77 = v25;
      swift_retain();
      *uint64_t v77 = closure #1 in OSLogArguments.append(_:)partial apply;
      v77[1] = v71;
      swift_retain();
      v77[2] = closure #1 in OSLogArguments.append(_:)partial apply;
      v77[3] = v72;
      swift_retain();
      v77[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v77[5] = v73;
      swift_retain();
      v77[6] = closure #1 in OSLogArguments.append(_:)partial apply;
      v77[7] = v74;
      swift_retain();
      v77[8] = closure #1 in OSLogArguments.append(_:)partial apply;
      v77[9] = v75;
      swift_retain();
      v77[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      v77[11] = v76;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(log, v79))
      {
        uint64_t v54 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v55 = createStorage<A>(capacity:type:)(0);
        uint64_t v56 = createStorage<A>(capacity:type:)(0);
        Swift::Bool v184 = v54;
        uint64_t v185 = v55;
        uint64_t v186 = v56;
        serialize(_:at:)(0, &v184);
        serialize(_:at:)(2, &v184);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v188 = v71;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v188 = v72;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
        uint64_t v188 = v73;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v188 = v74;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
        uint64_t v188 = v75;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        uint64_t v187 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
        uint64_t v188 = v76;
        closure #1 in osLogInternal(_:log:type:)(&v187, (uint64_t)&v184, (uint64_t)&v185, (uint64_t)&v186);
        _os_log_impl((void *)&_mh_execute_header, log, v79, "Returning a dataframe of size=%ld,%ld", v54, v66);
        destroyStorage<A>(_:count:)(v55);
        destroyStorage<A>(_:count:)(v56);
        UnsafeMutablePointer.deallocate()();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v52 = *(void *)(v182 + 1104);
      uint64_t v51 = *(void *)(v182 + 1064);
      uint64_t v53 = *(void *)(v182 + 944);
      uint64_t v49 = *(void *)(v182 + 920);
      uint64_t v50 = *(void *)(v182 + 1072);
      uint64_t v48 = *(void *)(v182 + 928);

      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v53, v49);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v52, v51);
      swift_release();
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
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v26 = *(void (**)(void))(*(void *)(v182 + 672) + 8);
      v26();
      return;
    }
    outlined init with take of Any?((_OWORD *)(v182 + 16), (_OWORD *)(v182 + 48));
    kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    outlined init with copy of Any?(v182 + 48, v182 + 80);
    *(void *)(swift_task_alloc() + 16) = v182 + 80;
    DataFrame.filter<A>(on:_:_:)();
    uint64_t v150 = *(void (**)(uint64_t, uint64_t, uint64_t))(v182 + 1248);
    uint64_t v147 = *(void *)(v182 + 1096);
    uint64_t v149 = *(void *)(v182 + 1088);
    uint64_t v151 = *(void *)(v182 + 1064);
    uint64_t v148 = *(void *)(v182 + 1072);
    swift_task_dealloc();
    outlined destroy of Any?(v182 + 80);
    swift_bridgeObjectRelease();
    kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.Slice.subscript.getter();
    AnyColumnSlice.distinct()();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v148 + 8);
    *(void *)(v182 + 1272) = v8;
    *(void *)(v182 + 1280) = (v148 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v8(v147, v151);
    swift_bridgeObjectRelease();
    v150(v147, v149, v151);
    Collection<>.makeIterator()();
LABEL_15:
    IndexingIterator.next()();
    if (*(void *)(v182 + 136) != 1) {
      break;
    }
    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v182 + 1272);
    uint64_t v82 = *(void *)(v182 + 1088);
    uint64_t v80 = *(void *)(v182 + 1064);
    uint64_t v84 = *(void *)(v182 + 992);
    uint64_t v85 = *(void *)(v182 + 960);
    uint64_t v83 = *(void *)(v182 + 968);
    outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v182 + 1016));
    v81(v82, v80);
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v84, v85);
    outlined destroy of Any?(v182 + 48);
  }
  outlined init with take of Any?((_OWORD *)(v182 + 112), (_OWORD *)(v182 + 144));
  kMediaML_carrier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  outlined init with copy of Any?(v182 + 144, v182 + 176);
  *(void *)(swift_task_alloc() + 16) = v182 + 176;
  DataFrame.Slice.filter<A>(on:_:_:)();
  uint64_t v145 = *(void (**)(uint64_t, uint64_t, uint64_t))(v182 + 1248);
  uint64_t v143 = *(void (**)(uint64_t, uint64_t))(v182 + 1232);
  uint64_t v140 = *(void *)(v182 + 1096);
  uint64_t v144 = *(void *)(v182 + 1080);
  uint64_t v146 = *(void *)(v182 + 1064);
  uint64_t v141 = *(void *)(v182 + 1056);
  uint64_t v142 = *(void *)(v182 + 1032);
  swift_task_dealloc();
  outlined destroy of Any?(v182 + 176);
  swift_bridgeObjectRelease();
  DataFrame.init(_:)();
  kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  DataFrame.subscript.getter();
  AnyColumn.distinct()();
  v143(v141, v142);
  swift_bridgeObjectRelease();
  v145(v140, v144, v146);
  Collection<>.makeIterator()();
  while (1)
  {
    IndexingIterator.next()();
    if (*(void *)(v182 + 232) == 1)
    {
      uint64_t v87 = *(void (**)(uint64_t, uint64_t))(v182 + 1272);
      uint64_t v91 = *(void (**)(uint64_t, uint64_t))(v182 + 1208);
      uint64_t v89 = *(void *)(v182 + 1152);
      uint64_t v90 = *(void *)(v182 + 1112);
      uint64_t v88 = *(void *)(v182 + 1080);
      uint64_t v86 = *(void *)(v182 + 1064);
      outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v182 + 1008));
      v87(v88, v86);
      v91(v89, v90);
      outlined destroy of Any?(v182 + 144);
      goto LABEL_15;
    }
    outlined init with take of Any?((_OWORD *)(v182 + 208), (_OWORD *)(v182 + 240));
    kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    outlined init with copy of Any?(v182 + 240, v182 + 272);
    *(void *)(swift_task_alloc() + 16) = v182 + 272;
    DataFrame.filter<A>(on:_:_:)();
    uint64_t v121 = *(void (**)(uint64_t, uint64_t, uint64_t))(v182 + 1192);
    uint64_t v120 = *(void *)(v182 + 1144);
    uint64_t v123 = *(void *)(v182 + 1136);
    uint64_t v124 = *(void *)(v182 + 1112);
    uint64_t v115 = *(void *)(v182 + 952);
    uint64_t v118 = *(void *)(v182 + 920);
    uint64_t v119 = *(void *)(v182 + 1120);
    uint64_t v117 = *(void *)(v182 + 928);
    swift_task_dealloc();
    outlined destroy of Any?(v182 + 272);
    swift_bridgeObjectRelease();
    DataFrame.init(_:)();
    uint64_t v116 = DataFrame.shape.getter();
    *(void *)(v182 + 768) = v116;
    *(void *)(v182 + 776) = _allocateUninitializedArray<A>(_:)();
    *(void *)(v182 + 784) = 0;
    uint64_t v9 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 16))(v115, v9, v118);
    v121(v123, v120, v124);
    int v122 = *(_DWORD *)(v119 + 80);
    uint64_t v127 = swift_allocObject();
    uint64_t v125 = *(void (**)(unint64_t, uint64_t, uint64_t))(v119 + 32);
    v125(v127 + ((v122 + 16) & ~(unint64_t)v122), v123, v124);
    v121(v123, v120, v124);
    uint64_t v129 = swift_allocObject();
    v125(v129 + ((v122 + 16) & ~(unint64_t)v122), v123, v124);
    oslog = Logger.logObject.getter();
    os_log_type_t v139 = static os_log_type_t.debug.getter();
    *(void *)(v182 + 792) = 22;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v182 + 1348);
    uint64_t v131 = swift_allocObject();
    *(unsigned char *)(v131 + 16) = 0;
    uint64_t v132 = swift_allocObject();
    *(unsigned char *)(v132 + 16) = 8;
    uint64_t v128 = swift_allocObject();
    *(void *)(v128 + 16) = partial apply for implicit closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
    *(void *)(v128 + 24) = v127;
    uint64_t v133 = swift_allocObject();
    *(void *)(v133 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v133 + 24) = v128;
    uint64_t v134 = swift_allocObject();
    *(unsigned char *)(v134 + 16) = 0;
    uint64_t v135 = swift_allocObject();
    *(unsigned char *)(v135 + 16) = 8;
    uint64_t v130 = swift_allocObject();
    *(void *)(v130 + 16) = partial apply for implicit closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
    *(void *)(v130 + 24) = v129;
    uint64_t v136 = swift_allocObject();
    *(void *)(v136 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v136 + 24) = v130;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v137 = v10;
    swift_retain();
    *uint64_t v137 = closure #1 in OSLogArguments.append(_:)partial apply;
    v137[1] = v131;
    swift_retain();
    v137[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    void v137[3] = v132;
    swift_retain();
    v137[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v137[5] = v133;
    swift_retain();
    v137[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v137[7] = v134;
    swift_retain();
    v137[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v137[9] = v135;
    swift_retain();
    v137[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v137[11] = v136;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v139))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v113 = createStorage<A>(capacity:type:)(0);
      uint64_t v114 = createStorage<A>(capacity:type:)(0);
      *(void *)(v182 + 880) = buf;
      *(void *)(v182 + 888) = v113;
      *(void *)(v182 + 896) = v114;
      serialize(_:at:)(0, (unsigned char **)(v182 + 880));
      serialize(_:at:)(2, (unsigned char **)(v182 + 880));
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v182 + 664) = v131;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v182 + 664) = v132;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      *(void *)(v182 + 664) = v133;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v182 + 664) = v134;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v182 + 664) = v135;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      *(void *)(v182 + 656) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      *(void *)(v182 + 664) = v136;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 656), v182 + 880, v182 + 888, v182 + 896);
      _os_log_impl((void *)&_mh_execute_header, oslog, v139, "Filtered dataframe shape=%ld,%ld", buf, size);
      destroyStorage<A>(_:count:)(v113);
      destroyStorage<A>(_:count:)(v114);
      UnsafeMutablePointer.deallocate()();
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v110 = *(void *)(v182 + 952);
    uint64_t v111 = *(void *)(v182 + 920);
    uint64_t v109 = *(void *)(v182 + 928);

    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v110, v111);
    while (*(void *)(v182 + 784) < v116)
    {
      uint64_t v108 = *(void (**)(uint64_t, uint64_t))(v182 + 1232);
      uint64_t v106 = *(void *)(v182 + 1048);
      uint64_t v107 = *(void *)(v182 + 1032);
      kMediaML_throughputStdDev.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v108(v106, v107);
      if (!*(void *)(v182 + 552)) {
        goto LABEL_40;
      }
      outlined init with take of Any(v182 + 528, v182 + 496);
      swift_dynamicCast();
      uint64_t v194 = *(void *)(v182 + 872);
      specialized Array.append(_:)();
      uint64_t v11 = swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(v182 + 784);
      uint64_t v105 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_61;
      }
      *(void *)(v182 + 784) = v105;
    }
    swift_bridgeObjectRetain();
    uint64_t v104 = specialized Array.count.getter();
    *(void *)(v182 + 800) = v104;
    swift_bridgeObjectRelease();
    uint64_t v11 = v104;
    if (__OFSUB__(v104, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
      goto _swift_task_switch;
    }
    *(void *)(v182 + 816) = v104 - 1;
    *(void *)(v182 + 824) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
    min<A>(_:_:)();
    uint64_t v103 = *(void *)(v182 + 808);
    *(void *)(v182 + 832) = v103;
    if (v104 > 0)
    {
      if (v103 < 0) {
        goto LABEL_40;
      }
      uint64_t v189 = 0;
      uint64_t v190 = v103;
      *(void *)(v182 + 560) = specialized Collection<>.makeIterator()();
      *(void *)(v182 + 568) = v16;
      *(void *)(v182 + 576) = v17;
      *(unsigned char *)(v182 + 584) = v18 & 1;
      *(void *)(v182 + 1288) = 0;
      uint64_t v19 = specialized IndexingIterator.next()();
      uint64_t v191 = v19;
      char v192 = v20 & 1;
      if ((v20 & 1) == 0) {
        break;
      }
    }
    uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v182 + 1208);
    uint64_t v94 = *(void *)(v182 + 1144);
    uint64_t v92 = *(void *)(v182 + 1112);
    outlined destroy of [Double]();
    v93(v94, v92);
    outlined destroy of Any?(v182 + 240);
  }
  *(void *)(v182 + 840) = v19;
  outlined init with copy of Any?(v182 + 48, v182 + 336);
  if (!*(void *)(v182 + 360)) {
    goto LABEL_40;
  }
  outlined init with take of Any(v182 + 336, v182 + 304);
  swift_dynamicCast();
  uint64_t v101 = *(void *)(v182 + 592);
  uint64_t v102 = *(void *)(v182 + 600);
  *(void *)(v182 + 1296) = v102;
  *(void *)(v182 + 608) = v101;
  *(void *)(v182 + 616) = v102;
  outlined init with copy of Any?(v182 + 144, v182 + 400);
  if (!*(void *)(v182 + 424)) {
    goto LABEL_40;
  }
  outlined init with take of Any(v182 + 400, v182 + 368);
  swift_dynamicCast();
  uint64_t v99 = *(void *)(v182 + 624);
  uint64_t v100 = *(void *)(v182 + 632);
  *(void *)(v182 + 1304) = v100;
  *(void *)(v182 + 640) = v99;
  *(void *)(v182 + 648) = v100;
  outlined init with copy of Any?(v182 + 240, v182 + 464);
  if (!*(void *)(v182 + 488))
  {
LABEL_40:
    _assertionFailure(_:_:file:line:flags:)();
    return;
  }
  uint64_t v97 = *(void *)(v182 + 1224);
  uint64_t v98 = *(void *)(v182 + 1184);
  outlined init with take of Any(v182 + 464, v182 + 432);
  swift_dynamicCast();
  uint64_t v95 = *(void *)(v182 + 848);
  *(void *)(v182 + 856) = v95;
  specialized Array.subscript.getter();
  uint64_t v193 = v21;
  uint64_t v96 = v21;
  *(void *)(v182 + 864) = v21;
  *(Swift::String *)(v182 + 1312) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO cellStdDev (app_name, carrier, bars, throughput_stddev, training_date) VALUES (?, ?, ?, ?, ?)", 0x69uLL, 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v22 = (void *)swift_task_alloc();
  uint64_t v12 = v98;
  *(void *)(v182 + 1328) = v22;
  v22[2] = v101;
  v22[3] = v102;
  v22[4] = v99;
  v22[5] = v100;
  v22[6] = v95;
  v22[7] = v96;
  v22[8] = v97;
  uint64_t v11 = (uint64_t)MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
_swift_task_switch:
  _swift_task_switch(v11, v12);
}

uint64_t MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  uint64_t v1 = v0[165];
  uint64_t v2 = v0[164];
  uint64_t v3 = v0[161];
  v0[84] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:));
  v0[167] = v3;
  if (v3)
  {
    uint64_t v4 = MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t result;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  int v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(unint64_t, uint64_t, uint64_t);
  uint32_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *log;
  os_log_type_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint8_t *buf;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t, uint64_t);
  int v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(unint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  NSObject *oslog;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t, uint64_t);
  uint64_t v125;
  uint64_t j;
  uint64_t v127;
  uint64_t i;
  uint8_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  uint64_t v140 = v0;
  *(void *)(v0 + 672) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  for (i = *(void *)(v0 + 1336); ; i = 0)
  {
    *(void *)(v127 + 1288) = i;
    uint64_t v136 = specialized IndexingIterator.next()();
    uint64_t v137 = v13 & 1;
    if ((v13 & 1) == 0)
    {
      *(void *)(v127 + 840) = v136;
      outlined init with copy of Any?(v127 + 48, v127 + 336);
      if (!*(void *)(v127 + 360)) {
        return _assertionFailure(_:_:file:line:flags:)();
      }
      outlined init with take of Any(v127 + 336, v127 + 304);
      swift_dynamicCast();
      uint64_t v74 = *(void *)(v127 + 592);
      uint64_t v75 = *(void *)(v127 + 600);
      *(void *)(v127 + 1296) = v75;
      *(void *)(v127 + 608) = v74;
      *(void *)(v127 + 616) = v75;
      outlined init with copy of Any?(v127 + 144, v127 + 400);
      if (!*(void *)(v127 + 424)) {
        return _assertionFailure(_:_:file:line:flags:)();
      }
      outlined init with take of Any(v127 + 400, v127 + 368);
      swift_dynamicCast();
      uint64_t v72 = *(void *)(v127 + 624);
      uint64_t v73 = *(void *)(v127 + 632);
      *(void *)(v127 + 1304) = v73;
      *(void *)(v127 + 640) = v72;
      *(void *)(v127 + 648) = v73;
      outlined init with copy of Any?(v127 + 240, v127 + 464);
      if (!*(void *)(v127 + 488)) {
        return _assertionFailure(_:_:file:line:flags:)();
      }
      uint64_t v70 = *(void *)(v127 + 1224);
      uint64_t v71 = *(void *)(v127 + 1184);
      outlined init with take of Any(v127 + 464, v127 + 432);
      swift_dynamicCast();
      uint64_t v68 = *(void *)(v127 + 848);
      *(void *)(v127 + 856) = v68;
      specialized Array.subscript.getter();
      uint64_t v138 = v14;
      uint64_t v69 = v14;
      *(void *)(v127 + 864) = v14;
      *(Swift::String *)(v127 + 1312) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO cellStdDev (app_name, carrier, bars, throughput_stddev, training_date) VALUES (?, ?, ?, ?, ?)", 0x69uLL, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v15 = (void *)swift_task_alloc();
      uint64_t v6 = v71;
      *(void *)(v127 + 1328) = v15;
      void v15[2] = v74;
      v15[3] = v75;
      v15[4] = v72;
      v15[5] = v73;
      v15[6] = v68;
      v15[7] = v69;
      v15[8] = v70;
      uint64_t v5 = MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
      return _swift_task_switch(v5, v6);
    }
    uint64_t v67 = i;
LABEL_38:
    uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v127 + 1208);
    uint32_t v66 = *(void *)(v127 + 1144);
    uint64_t v64 = *(void *)(v127 + 1112);
    outlined destroy of [Double]();
    v65(v66, v64);
    outlined destroy of Any?(v127 + 240);
    uint64_t v120 = v67;
LABEL_7:
    IndexingIterator.next()();
    if (*(void *)(v127 + 232) == 1) {
      break;
    }
    outlined init with take of Any?((_OWORD *)(v127 + 208), (_OWORD *)(v127 + 240));
    kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    outlined init with copy of Any?(v127 + 240, v127 + 272);
    *(void *)(swift_task_alloc() + 16) = v127 + 272;
    uint64_t result = DataFrame.filter<A>(on:_:_:)();
    if (v120) {
      return result;
    }
    uint64_t v94 = *(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 1192);
    uint64_t v93 = *(void *)(v127 + 1144);
    uint64_t v96 = *(void *)(v127 + 1136);
    uint64_t v97 = *(void *)(v127 + 1112);
    uint64_t v88 = *(void *)(v127 + 952);
    uint64_t v91 = *(void *)(v127 + 920);
    uint64_t v92 = *(void *)(v127 + 1120);
    uint64_t v90 = *(void *)(v127 + 928);
    swift_task_dealloc();
    outlined destroy of Any?(v127 + 272);
    swift_bridgeObjectRelease();
    DataFrame.init(_:)();
    uint64_t v89 = DataFrame.shape.getter();
    *(void *)(v127 + 768) = v89;
    *(void *)(v127 + 776) = _allocateUninitializedArray<A>(_:)();
    *(void *)(v127 + 784) = 0;
    uint64_t v3 = MediaMLPlugin.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v88, v3, v91);
    v94(v96, v93, v97);
    uint64_t v95 = *(_DWORD *)(v92 + 80);
    uint64_t v100 = swift_allocObject();
    uint64_t v98 = *(void (**)(unint64_t, uint64_t, uint64_t))(v92 + 32);
    v98(v100 + ((v95 + 16) & ~(unint64_t)v95), v96, v97);
    v94(v96, v93, v97);
    uint64_t v102 = swift_allocObject();
    v98(v102 + ((v95 + 16) & ~(unint64_t)v95), v96, v97);
    oslog = Logger.logObject.getter();
    uint64_t v112 = static os_log_type_t.debug.getter();
    *(void *)(v127 + 792) = 22;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v127 + 1348);
    uint64_t v104 = swift_allocObject();
    *(unsigned char *)(v104 + 16) = 0;
    uint64_t v105 = swift_allocObject();
    *(unsigned char *)(v105 + 16) = 8;
    uint64_t v101 = swift_allocObject();
    *(void *)(v101 + 16) = partial apply for implicit closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
    *(void *)(v101 + 24) = v100;
    uint64_t v106 = swift_allocObject();
    *(void *)(v106 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v106 + 24) = v101;
    uint64_t v107 = swift_allocObject();
    *(unsigned char *)(v107 + 16) = 0;
    uint64_t v108 = swift_allocObject();
    *(unsigned char *)(v108 + 16) = 8;
    uint64_t v103 = swift_allocObject();
    *(void *)(v103 + 16) = partial apply for implicit closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
    *(void *)(v103 + 24) = v102;
    uint64_t v109 = swift_allocObject();
    *(void *)(v109 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v109 + 24) = v103;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v110 = v4;
    swift_retain();
    *uint64_t v110 = closure #1 in OSLogArguments.append(_:)partial apply;
    v110[1] = v104;
    swift_retain();
    v110[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v110[3] = v105;
    swift_retain();
    v110[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v110[5] = v106;
    swift_retain();
    v110[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v110[7] = v107;
    swift_retain();
    v110[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v110[9] = v108;
    swift_retain();
    v110[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v110[11] = v109;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v112))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v86 = createStorage<A>(capacity:type:)(0);
      uint64_t v87 = createStorage<A>(capacity:type:)(0);
      *(void *)(v127 + 880) = buf;
      *(void *)(v127 + 888) = v86;
      *(void *)(v127 + 896) = v87;
      serialize(_:at:)(0, (unsigned char **)(v127 + 880));
      serialize(_:at:)(2, (unsigned char **)(v127 + 880));
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v127 + 664) = v104;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v127 + 664) = v105;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      *(void *)(v127 + 664) = v106;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v127 + 664) = v107;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append(_:)partial apply;
      *(void *)(v127 + 664) = v108;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      *(void *)(v127 + 656) = closure #1 in OSLogArguments.append<A>(_:)partial apply;
      *(void *)(v127 + 664) = v109;
      closure #1 in osLogInternal(_:log:type:)((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 656), v127 + 880, v127 + 888, v127 + 896);
      _os_log_impl((void *)&_mh_execute_header, oslog, v112, "Filtered dataframe shape=%ld,%ld", buf, size);
      destroyStorage<A>(_:count:)(v86);
      destroyStorage<A>(_:count:)(v87);
      UnsafeMutablePointer.deallocate()();
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v83 = *(void *)(v127 + 952);
    uint64_t v84 = *(void *)(v127 + 920);
    uint64_t v82 = *(void *)(v127 + 928);

    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v83, v84);
    while (*(void *)(v127 + 784) < v89)
    {
      uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v127 + 1232);
      os_log_type_t v79 = *(void *)(v127 + 1048);
      uint64_t v80 = *(void *)(v127 + 1032);
      kMediaML_throughputStdDev.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.subscript.getter();
      v81(v79, v80);
      if (!*(void *)(v127 + 552)) {
        return _assertionFailure(_:_:file:line:flags:)();
      }
      outlined init with take of Any(v127 + 528, v127 + 496);
      swift_dynamicCast();
      os_log_type_t v139 = *(void *)(v127 + 872);
      specialized Array.append(_:)();
      uint64_t v5 = (uint64_t (*)())swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(v127 + 784);
      uint64_t v78 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_53;
      }
      *(void *)(v127 + 784) = v78;
    }
    swift_bridgeObjectRetain();
    uint64_t v77 = specialized Array.count.getter();
    *(void *)(v127 + 800) = v77;
    swift_bridgeObjectRelease();
    uint64_t v5 = (uint64_t (*)())v77;
    if (__OFSUB__(v77, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      return _swift_task_switch(v5, v6);
    }
    *(void *)(v127 + 816) = v77 - 1;
    *(void *)(v127 + 824) = *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor();
    min<A>(_:_:)();
    uint64_t v76 = *(void *)(v127 + 808);
    *(void *)(v127 + 832) = v76;
    if (v77 <= 0)
    {
      uint64_t v67 = 0;
      goto LABEL_38;
    }
    if (v76 < 0) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    uint64_t v134 = 0;
    uint64_t v135 = v76;
    *(void *)(v127 + 560) = specialized Collection<>.makeIterator()();
    *(void *)(v127 + 568) = v10;
    *(void *)(v127 + 576) = v11;
    *(unsigned char *)(v127 + 584) = v12 & 1;
  }
  uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v127 + 1272);
  uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v127 + 1208);
  uint64_t v61 = *(void *)(v127 + 1152);
  int v62 = *(void *)(v127 + 1112);
  uint64_t v60 = *(void *)(v127 + 1080);
  uint64_t v58 = *(void *)(v127 + 1064);
  outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v127 + 1008));
  v59(v60, v58);
  v63(v61, v62);
  outlined destroy of Any?(v127 + 144);
  for (j = v120; ; j = 0)
  {
    IndexingIterator.next()();
    if (*(void *)(v127 + 136) != 1)
    {
      outlined init with take of Any?((_OWORD *)(v127 + 112), (_OWORD *)(v127 + 144));
      kMediaML_carrier.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      outlined init with copy of Any?(v127 + 144, v127 + 176);
      *(void *)(swift_task_alloc() + 16) = v127 + 176;
      uint64_t result = DataFrame.Slice.filter<A>(on:_:_:)();
      if (j) {
        return result;
      }
      uint64_t v118 = *(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 1248);
      uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v127 + 1232);
      uint64_t v113 = *(void *)(v127 + 1096);
      uint64_t v117 = *(void *)(v127 + 1080);
      uint64_t v119 = *(void *)(v127 + 1064);
      uint64_t v114 = *(void *)(v127 + 1056);
      uint64_t v115 = *(void *)(v127 + 1032);
      swift_task_dealloc();
      outlined destroy of Any?(v127 + 176);
      swift_bridgeObjectRelease();
      DataFrame.init(_:)();
      kMediaML_bars.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      DataFrame.subscript.getter();
      AnyColumn.distinct()();
      v116(v114, v115);
      swift_bridgeObjectRelease();
      v118(v113, v117, v119);
      Collection<>.makeIterator()();
      uint64_t v120 = 0;
      goto LABEL_7;
    }
    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v127 + 1272);
    uint64_t v54 = *(void *)(v127 + 1088);
    uint64_t v52 = *(void *)(v127 + 1064);
    uint64_t v56 = *(void *)(v127 + 992);
    uint64_t v57 = *(void *)(v127 + 960);
    uint64_t v55 = *(void *)(v127 + 968);
    outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v127 + 1016));
    v53(v54, v52);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v57);
    outlined destroy of Any?(v127 + 48);
    IndexingIterator.next()();
    if (*(void *)(v127 + 40) == 1) {
      break;
    }
    outlined init with take of Any?((_OWORD *)(v127 + 16), (_OWORD *)(v127 + 48));
    kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    outlined init with copy of Any?(v127 + 48, v127 + 80);
    *(void *)(swift_task_alloc() + 16) = v127 + 80;
    uint64_t result = DataFrame.filter<A>(on:_:_:)();
    if (j) {
      return result;
    }
    uint64_t v124 = *(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 1248);
    uint64_t v121 = *(void *)(v127 + 1096);
    uint64_t v123 = *(void *)(v127 + 1088);
    uint64_t v125 = *(void *)(v127 + 1064);
    int v122 = *(void *)(v127 + 1072);
    swift_task_dealloc();
    outlined destroy of Any?(v127 + 80);
    swift_bridgeObjectRelease();
    kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    DataFrame.Slice.subscript.getter();
    AnyColumnSlice.distinct()();
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v122 + 8);
    *(void *)(v127 + 1272) = v2;
    *(void *)(v127 + 1280) = (v122 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v2(v121, v125);
    swift_bridgeObjectRelease();
    v124(v121, v123, v125);
    Collection<>.makeIterator()();
  }
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 1192);
  uint64_t v35 = *(void *)(v127 + 1136);
  uint64_t v36 = *(void *)(v127 + 1112);
  uint64_t v16 = *(void *)(v127 + 944);
  uint64_t v30 = *(void *)(v127 + 920);
  uint64_t v32 = *(void *)(v127 + 904);
  uint64_t v31 = *(void *)(v127 + 1120);
  Swift::String v29 = *(void *)(v127 + 928);
  outlined destroy of IndexingIterator<AnyColumnSlice>(*(void *)(v127 + 1024));
  uint64_t v17 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v16, v17, v30);
  v33(v35, v32, v36);
  uint64_t v34 = *(_DWORD *)(v31 + 80);
  uint64_t v39 = swift_allocObject();
  uint64_t v37 = *(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 32);
  v37(v39 + ((v34 + 16) & ~(unint64_t)v34), v35, v36);
  v33(v35, v32, v36);
  uint64_t v41 = swift_allocObject();
  v37(v41 + ((v34 + 16) & ~(unint64_t)v34), v35, v36);
  log = Logger.logObject.getter();
  uint64_t v51 = static os_log_type_t.debug.getter();
  *(void *)(v127 + 760) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v38 = *(_DWORD *)(v127 + 1344);
  uint64_t v43 = swift_allocObject();
  *(unsigned char *)(v43 + 16) = 0;
  uint32_t v44 = swift_allocObject();
  *(unsigned char *)(v44 + 16) = 8;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = partial apply for implicit closure #6 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
  *(void *)(v40 + 24) = v39;
  os_log_type_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v45 + 24) = v40;
  unint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + 16) = 0;
  uint64_t v47 = swift_allocObject();
  *(unsigned char *)(v47 + 16) = 8;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = partial apply for implicit closure #7 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:);
  *(void *)(v42 + 24) = v41;
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v48 + 24) = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v49 = v18;
  swift_retain();
  *uint64_t v49 = closure #1 in OSLogArguments.append(_:)partial apply;
  v49[1] = v43;
  swift_retain();
  v49[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v49[3] = v44;
  swift_retain();
  v49[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v49[5] = v45;
  swift_retain();
  v49[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v49[7] = v46;
  swift_retain();
  v49[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v49[9] = v47;
  swift_retain();
  v49[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v49[11] = v48;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(log, v51))
  {
    uint64_t v26 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v27 = createStorage<A>(capacity:type:)(0);
    uint64_t v28 = createStorage<A>(capacity:type:)(0);
    uint64_t v129 = v26;
    uint64_t v130 = v27;
    uint64_t v131 = v28;
    serialize(_:at:)(0, &v129);
    serialize(_:at:)(2, &v129);
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v133 = v43;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    if (j) {
      return result;
    }
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v133 = v44;
    closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v133 = v45;
    closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v133 = v46;
    closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v133 = v47;
    closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    uint64_t v132 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v133 = v48;
    closure #1 in osLogInternal(_:log:type:)(&v132, (uint64_t)&v129, (uint64_t)&v130, (uint64_t)&v131);
    _os_log_impl((void *)&_mh_execute_header, log, v51, "Returning a dataframe of size=%ld,%ld", v26, v38);
    destroyStorage<A>(_:count:)(v27);
    destroyStorage<A>(_:count:)(v28);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v24 = *(void *)(v127 + 1104);
  uint64_t v23 = *(void *)(v127 + 1064);
  uint64_t v25 = *(void *)(v127 + 944);
  uint64_t v21 = *(void *)(v127 + 920);
  uint64_t v22 = *(void *)(v127 + 1072);
  char v20 = *(void *)(v127 + 928);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v25, v21);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(*(void *)(v127 + 672) + 8);
  return v19();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[159];
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[151];
  uint64_t v6 = v0[144];
  uint64_t v3 = v0[143];
  uint64_t v7 = v0[139];
  uint64_t v17 = v0[138];
  uint64_t v10 = v0[136];
  uint64_t v5 = v0[135];
  uint64_t v15 = v0[133];
  uint64_t v14 = v0[128];
  uint64_t v9 = v0[127];
  uint64_t v4 = v0[126];
  uint64_t v12 = v0[124];
  uint64_t v11 = v0[121];
  uint64_t v13 = v0[120];
  v0[84] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of [Double]();
  v8(v3, v7);
  outlined destroy of Any?((uint64_t)(v0 + 30));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v4);
  v16(v5, v15);
  v8(v6, v7);
  outlined destroy of Any?((uint64_t)(v0 + 18));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v9);
  v16(v10, v15);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  outlined destroy of Any?((uint64_t)(v0 + 6));
  outlined destroy of IndexingIterator<AnyColumnSlice>(v14);
  v16(v17, v15);
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[84] + 8);
  return v1();
}

void *closure #1 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  void v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t closure #3 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v2 = a1[1];
  uint64_t v18 = *a1;
  uint64_t v19 = v2;
  uint64_t v17 = a2;
  v16[0] = v18;
  v16[1] = v2;
  outlined init with copy of Any?(a2, (uint64_t)v13);
  if (!v14)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v13, (uint64_t)v15);
  swift_dynamicCast();
  uint64_t v6 = v11;
  uint64_t v7 = v12;
  swift_bridgeObjectRetain();
  outlined init with copy of String?(v16, v9);
  void v9[2] = v6;
  uint64_t v10 = v7;
  if (!v9[1])
  {
    if (!v10)
    {
      outlined destroy of String?();
      char v5 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  outlined init with copy of String?(v9, &v8);
  if (!v10)
  {
    outlined destroy of String();
LABEL_10:
    outlined destroy of (String?, String?)();
    char v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String?();
  char v5 = v4;
LABEL_9:
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v16 = 0;
  char v17 = 0;
  uint64_t v15 = 0;
  uint64_t v4 = *a1;
  char v5 = *((unsigned char *)a1 + 8);
  uint64_t v16 = *a1;
  char v17 = v5 & 1;
  uint64_t v15 = a2;
  outlined init with copy of Any?(a2, (uint64_t)v12);
  if (!v13)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v12, (uint64_t)v14);
  swift_dynamicCast();
  uint64_t v7 = v4;
  char v8 = v5 & 1;
  uint64_t v9 = v11;
  char v10 = 0;
  BOOL v3 = (v5 & 1) == 0 && (outlined init with copy of Int?((uint64_t)&v7, (uint64_t)&v6), (v10 & 1) == 0) && v6 == v9;
  return v3;
}

uint64_t implicit closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v18 = v9;
  swift_bridgeObjectRetain();
  *(void *)(v18 + 24) = &type metadata for String;
  *(void *)(v18 + 32) = &protocol witness table for String;
  *(void *)uint64_t v18 = a2;
  *(void *)(v18 + 8) = a3;
  swift_bridgeObjectRetain();
  *(void *)(v18 + 64) = &type metadata for String;
  *(void *)(v18 + 72) = &protocol witness table for String;
  *(void *)(v18 + 40) = a4;
  *(void *)(v18 + 48) = a5;
  *(void *)(v18 + 104) = &type metadata for Int;
  *(void *)(v18 + 112) = &protocol witness table for Int;
  *(void *)(v18 + 80) = a6;
  *(void *)(v18 + 144) = &type metadata for Double;
  *(void *)(v18 + 152) = &protocol witness table for Double;
  *(double *)(v18 + 120) = a8;
  *(void *)(v18 + 184) = &type metadata for Int;
  *(void *)(v18 + 192) = &protocol witness table for Int;
  *(void *)(v18 + 160) = a7;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v20) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #6 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  return DataFrame.shape.getter();
}

uint64_t implicit closure #7 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  DataFrame.shape.getter();
  return v0;
}

uint64_t MediaMLPlugin.getCellDataStandardDeviation()(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v2[3] = v1;
  return _swift_task_switch(MediaMLPlugin.getCellDataStandardDeviation(), 0);
}

void MediaMLPlugin.getCellDataStandardDeviation()()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v11 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.getCellDataStandardDeviation(), 0, v11, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v9 = *(void *)(v10 + 32);
  *(void *)(v10 + 80) = v9;
  if (v9)
  {
    *(void *)(v10 + 40) = v9;
    *(Swift::String *)(v10 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WITH CTE AS (SELECT app_name, carrier, bars, AVG(throughput_true) AS throughput_mean FROM cell GROUP BY app_name, carrier, bars, session_id)\nSELECT app_name, carrier, bars, AVG(throughput_mean*throughput_mean)-(AVG(throughput_mean)*AVG(throughput_mean)) AS throughput_var\nFROM CTE\nGROUP BY app_name, carrier, bars", 0x139uLL, 1);
    _swift_task_switch(MediaMLPlugin.getCellDataStandardDeviation(), v9);
  }
  else
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    char v5 = *(void (**)(void))(*(void *)(v10 + 16) + 8);
    v5();
  }
}

uint64_t MediaMLPlugin.getCellDataStandardDeviation()()
{
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  uint64_t v1 = v0[9];
  v0[2] = v0;
  type metadata accessor for DataFrame();
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #2 in MediaMLPlugin.getCellDataStandardDeviation());
  v0[13] = v1;
  if (v1)
  {
    uint64_t v2 = MediaMLPlugin.getCellDataStandardDeviation();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = MediaMLPlugin.getCellDataStandardDeviation();
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = v0[13];
  v0[2] = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  v0[6] = v1;
  swift_willThrow();
  swift_errorRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

void *closure #1 in MediaMLPlugin.getCellDataStandardDeviation()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t *closure #2 in MediaMLPlugin.getCellDataStandardDeviation()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v61 = 0;
  uint64_t v67 = partial apply for closure #1 in closure #2 in MediaMLPlugin.getCellDataStandardDeviation();
  uint64_t v83 = 0;
  uint64_t v82 = 0;
  int v62 = &v81;
  uint64_t v81 = 0;
  uint64_t v63 = &v80;
  uint64_t v80 = 0;
  uint64_t v64 = &v79;
  uint64_t v79 = 0;
  uint64_t v65 = &v78;
  uint64_t v78 = 0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v40 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v40);
  uint32_t v44 = (char *)&v10 - v43;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Int>);
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = v45 - 8;
  unint64_t v48 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v49 = (char *)&v10 - v48;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Column<String>);
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = v50 - 8;
  unint64_t v53 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v61);
  uint64_t v54 = (char *)&v10 - v53;
  uint64_t v55 = type metadata accessor for DataFrame();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = v55 - 8;
  unint64_t v58 = (*(void *)(v56 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v61);
  uint64_t v59 = (char *)&v10 - v58;
  uint64_t v83 = (char *)&v10 - v58;
  uint64_t v82 = a1;
  uint64_t v60 = &type metadata for String;
  uint64_t v81 = _allocateUninitializedArray<A>(_:)();
  uint64_t v80 = _allocateUninitializedArray<A>(_:)();
  uint64_t v79 = _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = _allocateUninitializedArray<A>(_:)();
  uint64_t v4 = v66;
  uint64_t v78 = v3;
  uint64_t v71 = v62;
  uint64_t v72 = v63;
  uint64_t v73 = v64;
  uint64_t v74 = v65;
  (*(void (**)(uint64_t (*)(uint64_t), char *))(*(void *)a1 + 144))(v67, v70);
  uint64_t v68 = v4;
  uint64_t v69 = v4;
  if (v4)
  {
    uint64_t v10 = v69;
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = &v81;
  }
  else
  {
    DataFrame.init()();
    uint64_t v5 = kMediaML_appName.unsafeMutableAddressor();
    uint64_t countAndFlagsBits = v5->_countAndFlagsBits;
    object = v5->_object;
    swift_bridgeObjectRetain();
    uint64_t v38 = &v81;
    uint64_t v11 = v81;
    swift_bridgeObjectRetain();
    MediaMLPlugin::SQLError v13 = &v77;
    uint64_t v77 = v11;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    unint64_t v19 = lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v20 = &type metadata for String;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v51 + 8);
    uint64_t v21 = v51 + 8;
    v22(v54, v50);
    uint64_t v6 = kMediaML_carrier.unsafeMutableAddressor();
    uint64_t v15 = v6->_countAndFlagsBits;
    char v17 = v6->_object;
    swift_bridgeObjectRetain();
    uint64_t v37 = &v80;
    uint64_t v16 = v80;
    swift_bridgeObjectRetain();
    v76[1] = v16;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    v22(v54, v50);
    uint64_t v7 = kMediaML_bars.unsafeMutableAddressor();
    uint64_t v27 = v7->_countAndFlagsBits;
    uint64_t v24 = v7->_object;
    swift_bridgeObjectRetain();
    uint64_t v36 = &v79;
    uint64_t v23 = v79;
    swift_bridgeObjectRetain();
    uint64_t v25 = v76;
    v76[0] = v23;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    lazy protocol witness table accessor for type [Int] and conformance [A]();
    uint64_t v28 = &type metadata for Int;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v45);
    char v8 = kMediaML_throughputStdDev.unsafeMutableAddressor();
    uint64_t v33 = v8->_countAndFlagsBits;
    uint64_t v30 = v8->_object;
    swift_bridgeObjectRetain();
    uint64_t v35 = &v78;
    uint64_t v29 = v78;
    swift_bridgeObjectRetain();
    uint64_t v31 = &v75;
    uint64_t v75 = v29;
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
    lazy protocol witness table accessor for type [Double] and conformance [A]();
    uint64_t v34 = &type metadata for Double;
    Column.init<A>(name:contents:)();
    DataFrame.append<A>(column:)();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v40);
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))(v39, v59, v55);
    outlined destroy of [Double]();
    outlined destroy of [Int]();
    outlined destroy of [String]();
    uint64_t result = v38;
  }
  outlined destroy of [String]();
  return result;
}

uint64_t closure #1 in closure #2 in MediaMLPlugin.getCellDataStandardDeviation()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  if (v16)
  {
    SQLiteDB.Row.get<A>(at:)(1, a1, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
    if (v15)
    {
      SQLiteDB.Row.get<A>(at:)(2, a1, (uint64_t)&type metadata for Int, (uint64_t)&protocol witness table for Int);
      SQLiteDB.Row.get<A>(at:)(3, a1, (uint64_t)&type metadata for Double, (uint64_t)&protocol witness table for Double);
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      swift_bridgeObjectRetain();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      specialized Array.append(_:)();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier not of type String", 0x1AuLL, 1);
      MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v4);
      Swift::Int32 code = v18.code;
      uint64_t countAndFlagsBits = v18.desc.value._countAndFlagsBits;
      object = v18.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v9 = swift_allocError();
      *(_DWORD *)uint64_t v5 = code;
      *(void *)(v5 + 8) = countAndFlagsBits;
      *(void *)(v5 + 16) = object;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name not of type String", 0x1BuLL, 1);
    MediaMLPlugin::SQLError v17 = SQLError.init(code:desc:)(-1, (Swift::String_optional)v1);
    Swift::Int32 v12 = v17.code;
    uint64_t desc_8 = v17.desc.value._countAndFlagsBits;
    uint64_t v11 = v17.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v13 = swift_allocError();
    *(_DWORD *)uint64_t v2 = v12;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = v11;
    swift_willThrow();
    return v13;
  }
}

uint64_t MediaMLPlugin.saveModelStatsToDB(modelStats:)(uint64_t a1)
{
  v2[8] = v1;
  v2[7] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[6] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return _swift_task_switch(MediaMLPlugin.saveModelStatsToDB(modelStats:), 0);
}

void MediaMLPlugin.saveModelStatsToDB(modelStats:)()
{
  uint64_t v1 = (void *)v0[8];
  v0[2] = v0;
  uint64_t v13 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.saveModelStatsToDB(modelStats:), 0, v13, v2, v2);
  v0[9] = 0;
  swift_release();
  uint64_t v11 = *(void *)(v12 + 40);
  *(void *)(v12 + 80) = v11;
  if (v11)
  {
    uint64_t v10 = *(void *)(v12 + 56);
    *(void *)(v12 + 48) = v11;
    *(Swift::String *)(v12 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO modelStats (interfaceType, trainingRowCount, validationRowCount, carrierCount, ssidCount, appNameCount, sessionIDCount, trainingMAPE, validationMAPE, trainingDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xD5uLL, 1);
    uint64_t v3 = swift_task_alloc();
    *(void *)(v12 + 104) = v3;
    *(void *)(v3 + 16) = v10;
    _swift_task_switch(MediaMLPlugin.saveModelStatsToDB(modelStats:), v11);
  }
  else
  {
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v15 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v4);
    Swift::Int32 code = v15.code;
    uint64_t desc_8 = v15.desc.value._countAndFlagsBits;
    object = v15.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v5 = code;
    *(void *)(v5 + 8) = desc_8;
    *(void *)(v5 + 16) = object;
    swift_willThrow();
    uint64_t v6 = *(void (**)(void))(*(void *)(v12 + 16) + 8);
    v6();
  }
}

uint64_t MediaMLPlugin.saveModelStatsToDB(modelStats:)()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[9];
  v0[2] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #2 in MediaMLPlugin.saveModelStatsToDB(modelStats:));
  v0[14] = v3;
  if (v3)
  {
    Swift::String v4 = MediaMLPlugin.saveModelStatsToDB(modelStats:);
  }
  else
  {
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    Swift::String v4 = MediaMLPlugin.saveModelStatsToDB(modelStats:);
  }
  return _swift_task_switch(v4, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

void *closure #1 in MediaMLPlugin.saveModelStatsToDB(modelStats:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t closure #2 in MediaMLPlugin.saveModelStatsToDB(modelStats:)(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v17 = *a2;
  v3[3] = &type metadata for Int;
  v3[4] = &protocol witness table for Int;
  *uint64_t v3 = v17;
  uint64_t v16 = a2[1];
  v3[8] = &type metadata for Int;
  v3[9] = &protocol witness table for Int;
  v3[5] = v16;
  uint64_t v15 = a2[2];
  v3[13] = &type metadata for Int;
  v3[14] = &protocol witness table for Int;
  v3[10] = v15;
  uint64_t v14 = a2[3];
  v3[18] = &type metadata for Int;
  v3[19] = &protocol witness table for Int;
  v3[15] = v14;
  uint64_t v13 = a2[4];
  v3[23] = &type metadata for Int;
  v3[24] = &protocol witness table for Int;
  v3[20] = v13;
  uint64_t v12 = a2[5];
  v3[28] = &type metadata for Int;
  v3[29] = &protocol witness table for Int;
  v3[25] = v12;
  uint64_t v11 = a2[6];
  v3[33] = &type metadata for Int;
  v3[34] = &protocol witness table for Int;
  v3[30] = v11;
  uint64_t v10 = a2[7];
  v3[38] = &type metadata for Double;
  v3[39] = &protocol witness table for Double;
  v3[35] = v10;
  uint64_t v9 = a2[8];
  v3[43] = &type metadata for Double;
  v3[44] = &protocol witness table for Double;
  v3[40] = v9;
  uint64_t v8 = a2[9];
  v3[48] = &type metadata for Int;
  v3[49] = &protocol witness table for Int;
  v3[45] = v8;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:)(uint64_t a1)
{
  v2[14] = v1;
  v2[13] = a1;
  v2[4] = v2;
  v2[7] = 0;
  v2[8] = 0;
  v2[10] = 0;
  v2[7] = a1;
  v2[8] = v1;
  return _swift_task_switch(MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:), 0);
}

void MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:)()
{
  uint64_t v1 = (void *)v0[14];
  v0[4] = v0;
  uint64_t v17 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:), 0, v17, v2, v2);
  v0[15] = 0;
  swift_release();
  uint64_t v15 = v16[9];
  v16[16] = v15;
  if (v15)
  {
    uint64_t v14 = (void *)v16[13];
    v16[10] = v15;
    void v16[2] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v16[3] = v3;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM modelStats WHERE interfaceType = ", 0x2DuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v16[5] = *v14;
    v16[11] = v16[5];
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" AND trainingDate < ", 0x14uLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    v16[6] = v14[9];
    v16[12] = v16[6];
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v16[17] = String.init(stringInterpolation:)();
    v16[18] = v7;
    _swift_task_switch(MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:), v15);
  }
  else
  {
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v19 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v8);
    Swift::Int32 code = v19.code;
    uint64_t desc_8 = v19.desc.value._countAndFlagsBits;
    object = v19.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v9 = code;
    *(void *)(v9 + 8) = desc_8;
    *(void *)(v9 + 16) = object;
    swift_willThrow();
    uint64_t v10 = *(void (**)(void))(v16[4] + 8);
    v10();
  }
}

uint64_t MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:)()
{
  Swift::String v1 = *(Swift::String *)(v0 + 136);
  *(void *)(v0 + 32) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 152) = v2;
  if (v2)
  {
    uint64_t v3 = MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:);
  }
  return _swift_task_switch(v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

void *closure #1 in MediaMLPlugin.deletePreviousModelStatsFromDB(modelStats:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:)(uint64_t a1)
{
  v2[12] = v1;
  v2[11] = a1;
  v2[4] = v2;
  v2[6] = 0;
  v2[7] = 0;
  v2[9] = 0;
  v2[6] = a1;
  v2[7] = v1;
  return _swift_task_switch(MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:), 0);
}

void MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:)()
{
  uint64_t v1 = (void *)v0[12];
  v0[4] = v0;
  uint64_t v16 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:), 0, v16, v2, v2);
  v0[13] = 0;
  swift_release();
  uint64_t v14 = v15[8];
  v15[14] = v14;
  if (v14)
  {
    uint64_t v13 = v15[11];
    v15[9] = v14;
    void v15[2] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v15[3] = v3;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM wifiStdDev WHERE training_date < ", 0x2DuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v15[5] = *(void *)(v13 + 72);
    v15[10] = v15[5];
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v15[15] = String.init(stringInterpolation:)();
    v15[16] = v6;
    _swift_task_switch(MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:), v14);
  }
  else
  {
    Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v7);
    Swift::Int32 code = v18.code;
    uint64_t desc_8 = v18.desc.value._countAndFlagsBits;
    object = v18.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v8 = code;
    *(void *)(v8 + 8) = desc_8;
    *(void *)(v8 + 16) = object;
    swift_willThrow();
    uint64_t v9 = *(void (**)(void))(v15[4] + 8);
    v9();
  }
}

uint64_t MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:)()
{
  Swift::String v1 = *(Swift::String *)(v0 + 120);
  *(void *)(v0 + 32) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 136) = v2;
  if (v2)
  {
    uint64_t v3 = MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:);
  }
  return _swift_task_switch(v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

void *closure #1 in MediaMLPlugin.deletePreviousWiFiStdDevDB(modelStats:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:)(uint64_t a1)
{
  v2[12] = v1;
  v2[11] = a1;
  v2[4] = v2;
  v2[6] = 0;
  v2[7] = 0;
  v2[9] = 0;
  v2[6] = a1;
  v2[7] = v1;
  return _swift_task_switch(MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:), 0);
}

void MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:)()
{
  uint64_t v1 = (void *)v0[12];
  v0[4] = v0;
  uint64_t v16 = (*(uint64_t (**)(void))((*v1 & swift_isaMask) + 0x58))();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:), 0, v16, v2, v2);
  v0[13] = 0;
  swift_release();
  uint64_t v14 = v15[8];
  v15[14] = v14;
  if (v14)
  {
    uint64_t v13 = v15[11];
    v15[9] = v14;
    void v15[2] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v15[3] = v3;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM cellStdDev WHERE training_date < ", 0x2DuLL, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v4);
    swift_bridgeObjectRelease();
    v15[5] = *(void *)(v13 + 72);
    v15[10] = v15[5];
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of DefaultStringInterpolation();
    v15[15] = String.init(stringInterpolation:)();
    v15[16] = v6;
    _swift_task_switch(MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:), v14);
  }
  else
  {
    Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("database not available", 0x16uLL, 1);
    MediaMLPlugin::SQLError v18 = SQLError.init(code:desc:)(-3, (Swift::String_optional)v7);
    Swift::Int32 code = v18.code;
    uint64_t desc_8 = v18.desc.value._countAndFlagsBits;
    object = v18.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v8 = code;
    *(void *)(v8 + 8) = desc_8;
    *(void *)(v8 + 16) = object;
    swift_willThrow();
    uint64_t v9 = *(void (**)(void))(v15[4] + 8);
    v9();
  }
}

uint64_t MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:)()
{
  Swift::String v1 = *(Swift::String *)(v0 + 120);
  *(void *)(v0 + 32) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 136) = v2;
  if (v2)
  {
    uint64_t v3 = MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:);
  }
  return _swift_task_switch(v3, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  Swift::String v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

void *closure #1 in MediaMLPlugin.deletePreviousCellStdDevDB(modelStats:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

uint64_t MediaMLPlugin.perform(_:)(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v20 = a1;
  MediaMLPlugin::SQLError v19 = v1;
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaMLPlugin.perform-task", 0x24uLL, 1);
  String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v8 = os_transaction_create();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v18[2] = v8;
  v18[0] = v8;
  id v2 = v1;
  id v3 = a1;
  uint64_t v15 = v1;
  uint64_t v16 = a1;
  uint64_t v17 = ObjectType;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_os_transaction?);
  unint64_t v4 = type metadata accessor for MLRTrialTaskResult();
  uint64_t result = _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v18, (uint64_t)partial apply for closure #1 in MediaMLPlugin.perform(_:), (uint64_t)v14, v11, (uint64_t)&type metadata for Never, v4, (uint64_t)&protocol witness table for Never, v13);
  if (v12)
  {
    __break(1u);
  }
  else
  {

    uint64_t v6 = v18[1];
    swift_unknownObjectRelease();
    return v6;
  }
  return result;
}

void closure #1 in MediaMLPlugin.perform(_:)(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v205 = a4;
  uint64_t v248 = a1;
  id v238 = a2;
  uint64_t v206 = a3;
  uint64_t v239 = 0;
  uint32_t v252 = (void (*)(uint64_t))closure #1 in closure #1 in MediaMLPlugin.perform(_:);
  uint64_t v207 = partial apply for implicit closure #1 in closure #1 in MediaMLPlugin.perform(_:);
  Swift::String v208 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  Swift::Bool v209 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  Swift::Bool v210 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  Swift::String v211 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v212 = partial apply for implicit closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  uint64_t v213 = partial apply for implicit closure #3 in closure #1 in MediaMLPlugin.perform(_:);
  uint64_t v214 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v215 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  MediaMLPlugin::SQLError v216 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  Swift::Bool v217 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v218 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v219 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v220 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v221 = &async function pointer to partial apply for closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  uint64_t v222 = partial apply for implicit closure #4 in closure #1 in MediaMLPlugin.perform(_:);
  MediaMLPlugin::SQLError v223 = _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0;
  uint32_t v224 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v225 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v226 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  uint64_t v285 = 0;
  uint64_t v284 = 0;
  uint64_t v283 = 0;
  id v282 = 0;
  uint64_t v280 = 0;
  dispatch_semaphore_t v277 = 0;
  id v276 = 0;
  uint64_t v274 = 0;
  uint64_t v275 = 0;
  id v273 = 0;
  double v270 = 0.0;
  unint64_t v227 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v228 = (char *)&v89 - v227;
  uint64_t v229 = type metadata accessor for Logger();
  uint64_t v230 = *(void **)(v229 - 8);
  uint64_t v231 = v229 - 8;
  unint64_t v232 = (v230[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v239);
  uint64_t v233 = (char *)&v89 - v232;
  unint64_t v234 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v235 = (char *)&v89 - v234;
  unint64_t v236 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  int v237 = (char *)&v89 - v236;
  uint64_t v240 = type metadata accessor for DispatchTime();
  uint64_t v241 = *(void *)(v240 - 8);
  uint64_t v242 = v240 - 8;
  uint64_t v244 = *(void *)(v241 + 64);
  unint64_t v243 = (v244 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v239);
  v245 = (char *)&v89 - v243;
  unint64_t v246 = (v244 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v247 = (char *)&v89 - v246;
  uint64_t v285 = (char *)&v89 - v246;
  uint64_t v284 = v9;
  uint64_t v283 = v10;
  type metadata accessor for MLRTrialTaskResult();
  id v249 = MLRTrialTaskResult.__allocating_init()();
  id v282 = v249;
  uint64_t v250 = (*(uint64_t (**)(void))((*v248 & swift_isaMask) + 0x58))();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLiteDB?);
  uint64_t v12 = v251;
  OSAllocatedUnfairLock.withLock<A>(_:)(v252, 0, v250, v11, v11);
  uint64_t v253 = v12;
  if (v12)
  {
    __break(1u);
LABEL_33:
    __break(1u);
    return;
  }
  swift_release();
  uint64_t v204 = v281;
  if (!v281)
  {
    id v13 = v249;
    id v14 = v249;
    *uint64_t v205 = v249;

    uint64_t v202 = v253;
    return;
  }
  uint64_t v203 = v204;
  uint64_t v15 = v237;
  uint64_t v181 = v204;
  uint64_t v280 = v204;
  static DispatchTime.now()();
  uint64_t v16 = MediaMLPlugin.logger.unsafeMutableAddressor();
  uint64_t v182 = (void (*)(char *, uint64_t, uint64_t))v230[2];
  uint64_t v183 = v230 + 2;
  v182(v15, v16, v229);
  id v17 = v238;
  uint64_t v191 = 7;
  uint64_t v192 = swift_allocObject();
  *(void *)(v192 + 16) = v238;
  uint64_t v200 = Logger.logObject.getter();
  int v201 = static os_log_type_t.info.getter();
  uint64_t v186 = &v278;
  uint64_t v278 = 12;
  unint64_t v184 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v185 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v187 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v188 = v279;
  uint64_t v189 = 17;
  uint64_t v194 = swift_allocObject();
  *(unsigned char *)(v194 + 16) = 64;
  uint64_t v195 = swift_allocObject();
  *(unsigned char *)(v195 + 16) = 8;
  uint64_t v190 = 32;
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v192;
  uint64_t v193 = v18;
  *(void *)(v18 + 16) = v207;
  *(void *)(v18 + 24) = v19;
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v193;
  uint64_t v197 = v20;
  *(void *)(v20 + 16) = v208;
  *(void *)(v20 + 24) = v21;
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v196 = _allocateUninitializedArray<A>(_:)();
  uint64_t v198 = v22;
  swift_retain();
  uint64_t v23 = v194;
  uint64_t v24 = v198;
  *uint64_t v198 = v209;
  v24[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v23;
  swift_retain();
  uint64_t v25 = v195;
  uint64_t v26 = v198;
  v198[2] = v210;
  v26[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v25;
  swift_retain();
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v197;
  uint64_t v28 = v198;
  v198[4] = v211;
  v28[5] = v27;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v200, (os_log_type_t)v201))
  {
    Swift::String v174 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v173 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v175 = createStorage<A>(capacity:type:)(1);
    uint64_t v176 = createStorage<A>(capacity:type:)(0);
    uint64_t v177 = &v258;
    uint64_t v258 = v174;
    uint64_t v178 = &v257;
    uint64_t v257 = v175;
    Swift::Bool v179 = &v256;
    uint64_t v256 = v176;
    serialize(_:at:)(2, &v258);
    serialize(_:at:)(1, v177);
    uint64_t v29 = v253;
    uint64_t v254 = v209;
    uint64_t v255 = v194;
    closure #1 in osLogInternal(_:log:type:)(&v254, (uint64_t)v177, (uint64_t)v178, (uint64_t)v179);
    uint64_t v180 = v29;
    if (v29)
    {
      __break(1u);
    }
    else
    {
      uint64_t v254 = v210;
      uint64_t v255 = v195;
      closure #1 in osLogInternal(_:log:type:)(&v254, (uint64_t)&v258, (uint64_t)&v257, (uint64_t)&v256);
      uint64_t v171 = 0;
      uint64_t v30 = v171;
      uint64_t v254 = v211;
      uint64_t v255 = v197;
      closure #1 in osLogInternal(_:log:type:)(&v254, (uint64_t)&v258, (uint64_t)&v257, (uint64_t)&v256);
      uint64_t v170 = v30;
      _os_log_impl((void *)&_mh_execute_header, v200, (os_log_type_t)v201, "Running MLRTrialTask with trialClient: %@", v174, v188);
      destroyStorage<A>(_:count:)(v175);
      destroyStorage<A>(_:count:)(v176);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v172 = v170;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v172 = v253;
  }
  uint64_t v31 = v235;
  uint64_t v142 = v172;

  uint64_t v143 = (void (*)(char *, uint64_t))v230[1];
  uint64_t v144 = v230 + 1;
  v143(v237, v229);
  dispatch_semaphore_t v145 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v277 = v145;
  id v147 = [v238 triClient];
  id v276 = v147;
  [v147 refresh];
  id v146 = [self namespaceNameFromId:314];
  uint64_t v150 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v151 = v32;
  uint64_t v274 = v150;
  uint64_t v275 = v32;

  swift_bridgeObjectRetain();
  id v148 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v149 = [v147 experimentIdentifiersWithNamespaceName:v148];

  id v273 = v149;
  uint64_t v33 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v182(v31, v33, v229);
  id v34 = v149;
  uint64_t v157 = 7;
  uint64_t v153 = swift_allocObject();
  *(void *)(v153 + 16) = v149;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v156 = 32;
  uint64_t v35 = swift_allocObject();
  uint64_t v36 = v151;
  uint64_t v158 = v35;
  *(void *)(v35 + 16) = v150;
  *(void *)(v35 + 24) = v36;
  uint64_t v168 = Logger.logObject.getter();
  int v169 = static os_log_type_t.debug.getter();
  v271[1] = 22;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v152 = v272;
  uint64_t v154 = 17;
  uint64_t v160 = swift_allocObject();
  *(unsigned char *)(v160 + 16) = 64;
  uint64_t v161 = swift_allocObject();
  int v155 = 8;
  *(unsigned char *)(v161 + 16) = 8;
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = v153;
  uint64_t v162 = v37;
  *(void *)(v37 + 16) = v212;
  *(void *)(v37 + 24) = v38;
  uint64_t v163 = swift_allocObject();
  *(unsigned char *)(v163 + 16) = 32;
  uint64_t v164 = swift_allocObject();
  *(unsigned char *)(v164 + 16) = v155;
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v158;
  uint64_t v159 = v39;
  *(void *)(v39 + 16) = v213;
  *(void *)(v39 + 24) = v40;
  uint64_t v41 = swift_allocObject();
  uint64_t v42 = v159;
  uint64_t v166 = v41;
  *(void *)(v41 + 16) = v214;
  *(void *)(v41 + 24) = v42;
  uint64_t v165 = _allocateUninitializedArray<A>(_:)();
  uint64_t v167 = v43;
  swift_retain();
  uint64_t v44 = v160;
  uint64_t v45 = v167;
  uint64_t *v167 = v215;
  v45[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v44;
  swift_retain();
  uint64_t v46 = v161;
  uint64_t v47 = v167;
  v167[2] = v216;
  v47[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v46;
  swift_retain();
  unint64_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v162;
  uint64_t v49 = v167;
  v167[4] = v217;
  v49[5] = v48;
  swift_retain();
  uint64_t v50 = v163;
  uint64_t v51 = v167;
  v167[6] = v218;
  v51[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v50;
  swift_retain();
  uint64_t v52 = v164;
  unint64_t v53 = v167;
  v167[8] = v219;
  v53[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v52;
  swift_retain();
  uint64_t v54 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v166;
  uint64_t v55 = v167;
  v167[10] = v220;
  v55[11] = v54;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v168, (os_log_type_t)v169))
  {
    uint64_t v134 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v133 = 1;
    uint64_t v135 = createStorage<A>(capacity:type:)(1);
    uint64_t v136 = createStorage<A>(capacity:type:)(v133);
    uint64_t v138 = &v263;
    uint64_t v263 = v134;
    os_log_type_t v139 = &v262;
    uint64_t v262 = v135;
    uint64_t v140 = &v261;
    uint64_t v261 = v136;
    unsigned int v137 = 2;
    serialize(_:at:)(2, &v263);
    serialize(_:at:)(v137, v138);
    uint64_t v56 = v142;
    uint64_t v259 = v215;
    uint64_t v260 = v160;
    closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)v138, (uint64_t)v139, (uint64_t)v140);
    uint64_t v141 = v56;
    if (v56)
    {
      __break(1u);
    }
    else
    {
      uint64_t v259 = v216;
      uint64_t v260 = v161;
      closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)&v263, (uint64_t)&v262, (uint64_t)&v261);
      uint64_t v130 = 0;
      uint64_t v57 = v130;
      uint64_t v259 = v217;
      uint64_t v260 = v162;
      closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)&v263, (uint64_t)&v262, (uint64_t)&v261);
      uint64_t v129 = v57;
      uint64_t v259 = v218;
      uint64_t v260 = v163;
      closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)&v263, (uint64_t)&v262, (uint64_t)&v261);
      uint64_t v128 = 0;
      uint64_t v259 = v219;
      uint64_t v260 = v164;
      closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)&v263, (uint64_t)&v262, (uint64_t)&v261);
      uint64_t v127 = 0;
      uint64_t v259 = v220;
      uint64_t v260 = v166;
      closure #1 in osLogInternal(_:log:type:)(&v259, (uint64_t)&v263, (uint64_t)&v262, (uint64_t)&v261);
      uint64_t v126 = 0;
      _os_log_impl((void *)&_mh_execute_header, v168, (os_log_type_t)v169, "Found all trialIDs = %@ namespace=%s", v134, v152);
      uint64_t v125 = 1;
      destroyStorage<A>(_:count:)(v135);
      destroyStorage<A>(_:count:)(v136);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v131 = v126;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v131 = v142;
  }
  dispatch_semaphore_t v58 = v145;
  uint64_t v120 = v131;

  v143(v235, v229);
  uint64_t v59 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t))(*(void *)(v59 - 8) + 56))(v228, 1);
  uint64_t v60 = v248;
  id v61 = v149;
  int v62 = v58;
  uint64_t v63 = swift_allocObject();
  uint64_t v64 = v248;
  id v65 = v149;
  uint64_t v66 = v206;
  uint64_t v67 = (uint64_t)v221;
  uint64_t v68 = (void *)v63;
  uint64_t v69 = (uint64_t)v228;
  v68[2] = 0;
  v68[3] = 0;
  v68[4] = v64;
  v68[5] = v65;
  v68[6] = v58;
  v68[7] = v66;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v69, v67, (uint64_t)v68, (uint64_t)&type metadata for () + 8);
  swift_release();
  OS_dispatch_semaphore.wait()();
  static DispatchTime.now()();
  unint64_t v123 = DispatchTime.uptimeNanoseconds.getter();
  uint64_t v121 = *(void (**)(char *, uint64_t))(v241 + 8);
  uint64_t v122 = v241 + 8;
  v121(v245, v240);
  unint64_t v70 = DispatchTime.uptimeNanoseconds.getter();
  unint64_t v124 = v123 - v70;
  if (v123 < v70) {
    goto LABEL_33;
  }
  uint64_t v71 = v233;
  uint64_t v104 = v271;
  v271[0] = v124;
  lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  Double.init<A>(_:)();
  double v105 = v72;
  double v106 = v72 / *kSecondsFromNanoseconds.unsafeMutableAddressor();
  double v270 = v106;
  uint64_t v73 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v182(v71, v73, v229);
  uint64_t v110 = 7;
  uint64_t v111 = swift_allocObject();
  *(double *)(v111 + 16) = v106;
  uint64_t v118 = Logger.logObject.getter();
  int v119 = static os_log_type_t.info.getter();
  v268[1] = (unsigned char *)12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v107 = v269;
  uint64_t v108 = 17;
  uint64_t v113 = swift_allocObject();
  *(unsigned char *)(v113 + 16) = 0;
  uint64_t v114 = swift_allocObject();
  *(unsigned char *)(v114 + 16) = 8;
  uint64_t v109 = 32;
  uint64_t v74 = swift_allocObject();
  uint64_t v75 = v111;
  uint64_t v112 = v74;
  *(void *)(v74 + 16) = v222;
  *(void *)(v74 + 24) = v75;
  uint64_t v76 = swift_allocObject();
  uint64_t v77 = v112;
  uint64_t v116 = v76;
  *(void *)(v76 + 16) = v223;
  *(void *)(v76 + 24) = v77;
  uint64_t v115 = _allocateUninitializedArray<A>(_:)();
  uint64_t v117 = v78;
  swift_retain();
  uint64_t v79 = v113;
  uint64_t v80 = v117;
  *uint64_t v117 = v224;
  v80[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v79;
  swift_retain();
  uint64_t v81 = v114;
  uint64_t v82 = v117;
  v117[2] = v225;
  v82[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
  swift_retain();
  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v116;
  uint64_t v84 = v117;
  v117[4] = v226;
  v84[5] = v83;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v118, (os_log_type_t)v119))
  {
    uint64_t v97 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v96 = 0;
    uint64_t v98 = createStorage<A>(capacity:type:)(0);
    uint64_t v99 = createStorage<A>(capacity:type:)(v96);
    uint64_t v100 = v268;
    v268[0] = v97;
    uint64_t v101 = &v267;
    uint64_t v267 = v98;
    uint64_t v102 = &v266;
    uint64_t v266 = v99;
    serialize(_:at:)(0, v268);
    serialize(_:at:)(1, v100);
    uint64_t v85 = v120;
    v264 = v224;
    uint64_t v265 = v113;
    closure #1 in osLogInternal(_:log:type:)(&v264, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102);
    uint64_t v103 = v85;
    if (v85)
    {
      __break(1u);
    }
    else
    {
      v264 = v225;
      uint64_t v265 = v114;
      closure #1 in osLogInternal(_:log:type:)(&v264, (uint64_t)v268, (uint64_t)&v267, (uint64_t)&v266);
      uint64_t v93 = 0;
      uint64_t v86 = v93;
      v264 = v226;
      uint64_t v265 = v116;
      closure #1 in osLogInternal(_:log:type:)(&v264, (uint64_t)v268, (uint64_t)&v267, (uint64_t)&v266);
      uint64_t v92 = v86;
      _os_log_impl((void *)&_mh_execute_header, v118, (os_log_type_t)v119, "Total Time taken to finish running plugin=%f[s]", v97, v107);
      uint64_t v91 = 0;
      destroyStorage<A>(_:count:)(v98);
      destroyStorage<A>(_:count:)(v99);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v94 = v92;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    uint64_t v94 = v120;
  }
  uint64_t v90 = v94;

  v143(v233, v229);
  id v87 = v249;
  id v88 = v149;
  *uint64_t v205 = v249;

  swift_bridgeObjectRelease();
  v121(v247, v240);
  swift_release();

  uint64_t v202 = v90;
}

id MLRTrialTaskResult.__allocating_init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc MLRTrialTaskResult.init()();
}

void *closure #1 in closure #1 in MediaMLPlugin.perform(_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of SQLiteDB?(a1, a2);
}

id implicit closure #1 in closure #1 in MediaMLPlugin.perform(_:)(void *a1)
{
  id v1 = [a1 triClient];

  return v1;
}

void *implicit closure #2 in closure #1 in MediaMLPlugin.perform(_:)(void *a1)
{
  id v1 = a1;
  if (a1) {
    return a1;
  }
  else {
    return 0;
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in closure #1 in MediaMLPlugin.perform(_:)()
{
}

uint64_t closure #2 in closure #1 in MediaMLPlugin.perform(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[176] = a6;
  v6[175] = a5;
  v6[174] = a4;
  v6[106] = v6;
  v6[107] = 0;
  v6[108] = 0;
  v6[109] = 0;
  v6[110] = 0;
  v6[111] = 0;
  v6[112] = 0;
  uint64_t v7 = type metadata accessor for Logger();
  v6[177] = v7;
  v6[178] = *(void *)(v7 - 8);
  v6[179] = swift_task_alloc();
  v6[180] = swift_task_alloc();
  v6[181] = swift_task_alloc();
  v6[182] = swift_task_alloc();
  v6[183] = swift_task_alloc();
  v6[184] = swift_task_alloc();
  v6[185] = swift_task_alloc();
  v6[186] = swift_task_alloc();
  v6[187] = swift_task_alloc();
  v6[188] = swift_task_alloc();
  v6[189] = swift_task_alloc();
  v6[190] = swift_task_alloc();
  v6[191] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DataFrame();
  v6[192] = v8;
  v6[193] = *(void *)(v8 - 8);
  v6[194] = swift_task_alloc();
  v6[195] = swift_task_alloc();
  v6[196] = swift_task_alloc();
  v6[197] = swift_task_alloc();
  v6[198] = swift_task_alloc();
  v6[107] = a4;
  v6[108] = a5;
  v6[109] = a6;
  type metadata accessor for WifiModel();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v14 + 1592) = v9;
  *uint64_t v9 = *(void *)(v14 + 848);
  v9[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return WifiModel.__allocating_init()();
}

uint64_t closure #2 in closure #1 in MediaMLPlugin.perform(_:)(uint64_t a1)
{
  uint64_t v5 = (void *)*v1;
  v5[106] = *v1;
  v5[200] = a1;
  swift_task_dealloc();
  v5[110] = a1;
  type metadata accessor for CellularModel();
  id v2 = (void *)swift_task_alloc();
  v5[201] = v2;
  *id v2 = v5[106];
  v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return CellularModel.__allocating_init()();
}

{
  void *v1;
  void *v2;
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[106] = *v1;
  v5[202] = a1;
  swift_task_dealloc();
  v5[111] = a1;
  id v2 = (void *)swift_task_alloc();
  v5[203] = v2;
  *id v2 = v5[106];
  v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return MediaMLPlugin.checkAndPruneProcessedCellDB()();
}

uint64_t closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
  uint64_t v7 = *v1;
  uint64_t v5 = *v1 + 16;
  uint64_t v6 = (void *)(*v1 + 848);
  *(void *)(v7 + 848) = *v1;
  *(void *)(v7 + 1632) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    id v2 = (void *)swift_task_alloc();
    *(void *)(v5 + 1624) = v2;
    *id v2 = *v6;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v5 + 1568);
    return MediaMLPlugin.getRawCellDataFromDB()(v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v1;
  uint64_t v5 = *v1 + 16;
  uint64_t v6 = (void *)(*v1 + 848);
  *(void *)(v7 + 848) = *v1;
  *(void *)(v7 + 1648) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    id v2 = (void *)swift_task_alloc();
    *(void *)(v5 + 1640) = v2;
    *id v2 = *v6;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v5 + 1560);
    return MediaMLPlugin.getCellDataStandardDeviation()(v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v9 = *v1;
  uint64_t v7 = *v1 + 16;
  uint64_t v8 = (void *)(*v1 + 848);
  *(void *)(v9 + 848) = *v1;
  *(void *)(v9 + 1664) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)((**(void **)(v7 + 1376) & swift_isaMask) + 0x98)
                                                  + **(int **)((**(void **)(v7 + 1376) & swift_isaMask) + 0x98));
    id v2 = (void *)swift_task_alloc();
    *(void *)(v7 + 1656) = v2;
    *id v2 = *v8;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v7 + 1568);
    uint64_t v4 = *(void *)(v7 + 1552);
    return v6(v4, v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v9 = *v1;
  uint64_t v6 = *v1 + 16;
  uint64_t v7 = (void *)(*v1 + 848);
  uint64_t v8 = *v1 + 104;
  *(void *)(v9 + 848) = *v1;
  *(void *)(v9 + 1680) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v6 + 1600) + 168)
                                                  + **(int **)(**(void **)(v6 + 1600) + 168));
    id v2 = (void *)swift_task_alloc();
    *(void *)(v6 + 1672) = v2;
    *id v2 = *v7;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v6 + 1552);
    return v5(v8, v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  const void *v6;
  void *__dst;
  uint64_t v8;
  uint64_t v9;

  uint64_t v8 = *v1;
  uint64_t v4 = *v1 + 16;
  uint64_t v5 = (void *)(*v1 + 848);
  uint64_t v6 = (const void *)(*v1 + 104);
  __dst = (void *)(*v1 + 280);
  *(void *)(v8 + 848) = *v1;
  *(void *)(v8 + 1696) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    outlined init with take of ModelStats?(v6, __dst);
    id v2 = (void *)swift_task_alloc();
    *(void *)(v4 + 1688) = v2;
    *id v2 = *v5;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    return MediaMLPlugin.cleanRawCellDataFromDB()();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1712) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t result;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t size;
  os_log_type_t v19;
  NSObject *oslog;
  uint64_t v21;
  uint64_t v22;

  id v1 = *(void *)(v0 + 1528);
  uint64_t v16 = *(void *)(v0 + 1424);
  id v17 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  *(void *)(v0 + 1720) = v3;
  *(void *)(v0 + 1728) = (v16 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v1, v2, v17);
  oslog = Logger.logObject.getter();
  uint64_t v19 = static os_log_type_t.info.getter();
  *(void *)(v0 + 912) = 2;
  *(void *)(v0 + 1736) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 1744) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 1752) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(unsigned int *)(v0 + 188);
  *(void *)(v0 + 1760) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v21 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v19))
  {
    uint64_t v4 = *(void *)(v15 + 1712);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    id v13 = createStorage<A>(capacity:type:)(0);
    *(void *)(v15 + 1360) = buf;
    *(void *)(v15 + 1368) = v12;
    *(void *)(v15 + 1376) = v13;
    serialize(_:at:)(0, (unsigned char **)(v15 + 1360));
    serialize(_:at:)(0, (unsigned char **)(v15 + 1360));
    *(void *)(v15 + 1384) = v21;
    uint64_t v14 = (void *)swift_task_alloc();
    v14[2] = v15 + 1360;
    v14[3] = v15 + 1368;
    v14[4] = v15 + 1376;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v4) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v19, "Finished cell model training and received modelStats", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)(v15 + 1528);
  uint64_t v10 = *(void *)(v15 + 1416);
  uint64_t v8 = *(void *)(v15 + 1424);

  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v15 + 1768) = v6;
  *(void *)(v15 + 1776) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v9, v10);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v15 + 1784) = v7;
  *uint64_t v7 = *(void *)(v15 + 848);
  v7[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return MediaMLPlugin.checkAndPruneProcessedWifiDB()();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v1;
  uint64_t v5 = *v1 + 16;
  uint64_t v6 = (void *)(*v1 + 848);
  *(void *)(v7 + 848) = *v1;
  *(void *)(v7 + 1792) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    id v2 = (void *)swift_task_alloc();
    *(void *)(v5 + 1784) = v2;
    *id v2 = *v6;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v5 + 1544);
    return MediaMLPlugin.getRawWiFiDataFromDB()(v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v9 = *v1;
  uint64_t v7 = *v1 + 16;
  uint64_t v8 = (void *)(*v1 + 848);
  *(void *)(v9 + 848) = *v1;
  *(void *)(v9 + 1808) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)((**(void **)(v7 + 1376) & swift_isaMask) + 0xA8)
                                                  + **(int **)((**(void **)(v7 + 1376) & swift_isaMask) + 0xA8));
    id v2 = (void *)swift_task_alloc();
    *(void *)(v7 + 1800) = v2;
    *id v2 = *v8;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v7 + 1544);
    uint64_t v4 = *(void *)(v7 + 1536);
    return v6(v4, v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v8 = *v1;
  uint64_t v6 = *v1 + 16;
  uint64_t v7 = (void *)(*v1 + 848);
  *(void *)(v8 + 848) = *v1;
  *(void *)(v8 + 1824) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v6 + 1584) + 160)
                                                  + **(int **)(**(void **)(v6 + 1584) + 160));
    id v2 = (void *)swift_task_alloc();
    *(void *)(v6 + 1816) = v2;
    *id v2 = *v7;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    uint64_t v3 = *(void *)(v6 + 1536);
    return v5(v6, v3);
  }
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  void *__dst;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v1;
  uint64_t v4 = (void *)(*v1 + 16);
  uint64_t v5 = (void *)(*v1 + 848);
  __dst = (void *)(*v1 + 192);
  *(void *)(v7 + 848) = *v1;
  *(void *)(v7 + 1840) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(closure #2 in closure #1 in MediaMLPlugin.perform(_:), 0);
  }
  else
  {
    outlined init with take of ModelStats?(v4, __dst);
    id v2 = (void *)swift_task_alloc();
    v4[229] = v2;
    *id v2 = *v5;
    v2[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
    return MediaMLPlugin.cleanRawWiFiDataFromDB()();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1856) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1872) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v28;
  NSObject *oslog;
  uint64_t v30;
  uint64_t v31;

  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1504);
  uint64_t v25 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v26(v1, v2, v25);
  oslog = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.info.getter();
  *(void *)(v0 + 1136) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2012);
  uint64_t v30 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v28))
  {
    uint64_t v3 = *(void *)(v24 + 1872);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v21 = createStorage<A>(capacity:type:)(0);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    *(void *)(v24 + 1264) = buf;
    *(void *)(v24 + 1272) = v21;
    *(void *)(v24 + 1280) = v22;
    serialize(_:at:)(0, (unsigned char **)(v24 + 1264));
    serialize(_:at:)(0, (unsigned char **)(v24 + 1264));
    *(void *)(v24 + 1288) = v30;
    uint64_t v23 = (void *)swift_task_alloc();
    v23[2] = v24 + 1264;
    v23[3] = v24 + 1272;
    v23[4] = v24 + 1280;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Saved wifiModelStats to modelStats table", buf, size);
    destroyStorage<A>(_:count:)(v21);
    destroyStorage<A>(_:count:)(v22);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v24 + 1768);
  uint64_t v8 = *(void *)(v24 + 1504);
  uint64_t v9 = *(void *)(v24 + 1416);

  v10(v8, v9);
  uint64_t v11 = *(void *)(v24 + 200);
  uint64_t v12 = *(void *)(v24 + 208);
  id v13 = *(void *)(v24 + 216);
  uint64_t v14 = *(void *)(v24 + 224);
  uint64_t v15 = *(void *)(v24 + 232);
  uint64_t v16 = *(void *)(v24 + 240);
  id v17 = *(void *)(v24 + 248);
  uint64_t v18 = *(void *)(v24 + 256);
  uint64_t v19 = *(void *)(v24 + 264);
  if (*(unsigned char *)(v24 + 272)) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v5 = *(void **)(v24 + 1392);
  *(void *)(v24 + 448) = *(void *)(v24 + 192);
  *(void *)(v24 + 456) = v11;
  *(void *)(v24 + 464) = v12;
  *(void *)(v24 + 472) = v13;
  *(void *)(v24 + 480) = v14;
  *(void *)(v24 + 488) = v15;
  *(void *)(v24 + 496) = v16;
  *(void *)(v24 + 504) = v17;
  *(void *)(v24 + 512) = v18;
  *(void *)(v24 + 520) = v19;
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)((*v5 & swift_isaMask) + 0xE0)
                                       + **(int **)((*v5 & swift_isaMask) + 0xE0));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v24 + 1880) = v6;
  *uint64_t v6 = *(void *)(v24 + 848);
  v6[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return v7(v24 + 448);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1888) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t (*v10)(void);
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v19;
  NSObject *oslog;
  uint64_t v21;
  uint64_t v22;

  id v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1496);
  uint64_t v16 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v17(v1, v2, v16);
  oslog = Logger.logObject.getter();
  uint64_t v19 = static os_log_type_t.info.getter();
  *(void *)(v0 + 1144) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2016);
  uint64_t v21 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v19))
  {
    uint64_t v3 = *(void *)(v15 + 1888);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    id v13 = createStorage<A>(capacity:type:)(0);
    *(void *)(v15 + 1232) = buf;
    *(void *)(v15 + 1240) = v12;
    *(void *)(v15 + 1248) = v13;
    serialize(_:at:)(0, (unsigned char **)(v15 + 1232));
    serialize(_:at:)(0, (unsigned char **)(v15 + 1232));
    *(void *)(v15 + 1256) = v21;
    uint64_t v14 = (void *)swift_task_alloc();
    v14[2] = v15 + 1232;
    v14[3] = v15 + 1240;
    v14[4] = v15 + 1248;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v19, "Deleted previous wifiModelStats from modelStats table", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v15 + 1768);
  uint64_t v6 = *(void *)(v15 + 1496);
  uint64_t v7 = *(void *)(v15 + 1416);
  uint64_t v9 = *(void **)(v15 + 1392);

  v8(v6, v7);
  uint64_t v10 = (uint64_t (*)(void))(*(void *)((*v9 & swift_isaMask) + 0xB8) + **(int **)((*v9 & swift_isaMask) + 0xB8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v15 + 1896) = v5;
  *uint64_t v5 = *(void *)(v15 + 848);
  v5[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return v10();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1904) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v28;
  NSObject *oslog;
  uint64_t v30;
  uint64_t v31;

  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1488);
  uint64_t v25 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v26(v1, v2, v25);
  oslog = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.info.getter();
  *(void *)(v0 + 1152) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2020);
  uint64_t v30 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v28))
  {
    uint64_t v3 = *(void *)(v24 + 1904);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v21 = createStorage<A>(capacity:type:)(0);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    *(void *)(v24 + 1200) = buf;
    *(void *)(v24 + 1208) = v21;
    *(void *)(v24 + 1216) = v22;
    serialize(_:at:)(0, (unsigned char **)(v24 + 1200));
    serialize(_:at:)(0, (unsigned char **)(v24 + 1200));
    *(void *)(v24 + 1224) = v30;
    uint64_t v23 = (void *)swift_task_alloc();
    v23[2] = v24 + 1200;
    v23[3] = v24 + 1208;
    v23[4] = v24 + 1216;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Saved wifiStandardDeviation to wifiStdDev table", buf, size);
    destroyStorage<A>(_:count:)(v21);
    destroyStorage<A>(_:count:)(v22);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v24 + 1768);
  uint64_t v8 = *(void *)(v24 + 1488);
  uint64_t v9 = *(void *)(v24 + 1416);

  v10(v8, v9);
  uint64_t v11 = *(void *)(v24 + 200);
  uint64_t v12 = *(void *)(v24 + 208);
  id v13 = *(void *)(v24 + 216);
  uint64_t v14 = *(void *)(v24 + 224);
  uint64_t v15 = *(void *)(v24 + 232);
  uint64_t v16 = *(void *)(v24 + 240);
  id v17 = *(void *)(v24 + 248);
  uint64_t v18 = *(void *)(v24 + 256);
  uint64_t v19 = *(void *)(v24 + 264);
  if (*(unsigned char *)(v24 + 272)) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v5 = *(void **)(v24 + 1392);
  *(void *)(v24 + 528) = *(void *)(v24 + 192);
  *(void *)(v24 + 536) = v11;
  *(void *)(v24 + 544) = v12;
  *(void *)(v24 + 552) = v13;
  *(void *)(v24 + 560) = v14;
  *(void *)(v24 + 568) = v15;
  *(void *)(v24 + 576) = v16;
  *(void *)(v24 + 584) = v17;
  *(void *)(v24 + 592) = v18;
  *(void *)(v24 + 600) = v19;
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)((*v5 & swift_isaMask) + 0xE8)
                                       + **(int **)((*v5 & swift_isaMask) + 0xE8));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v24 + 1912) = v6;
  *uint64_t v6 = *(void *)(v24 + 848);
  v6[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return v7(v24 + 528);
}

{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1920) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1936) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v28;
  NSObject *oslog;
  uint64_t v30;
  uint64_t v31;

  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1464);
  uint64_t v25 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v26(v1, v2, v25);
  oslog = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.info.getter();
  *(void *)(v0 + 936) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1992);
  uint64_t v30 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v28))
  {
    uint64_t v3 = *(void *)(v24 + 1936);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v21 = createStorage<A>(capacity:type:)(0);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    *(void *)(v24 + 1064) = buf;
    *(void *)(v24 + 1072) = v21;
    *(void *)(v24 + 1080) = v22;
    serialize(_:at:)(0, (unsigned char **)(v24 + 1064));
    serialize(_:at:)(0, (unsigned char **)(v24 + 1064));
    *(void *)(v24 + 1088) = v30;
    uint64_t v23 = (void *)swift_task_alloc();
    v23[2] = v24 + 1064;
    v23[3] = v24 + 1072;
    v23[4] = v24 + 1080;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Saved cellModelStats to modelStats table", buf, size);
    destroyStorage<A>(_:count:)(v21);
    destroyStorage<A>(_:count:)(v22);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v24 + 1768);
  uint64_t v8 = *(void *)(v24 + 1464);
  uint64_t v9 = *(void *)(v24 + 1416);

  v10(v8, v9);
  uint64_t v11 = *(void *)(v24 + 288);
  uint64_t v12 = *(void *)(v24 + 296);
  id v13 = *(void *)(v24 + 304);
  uint64_t v14 = *(void *)(v24 + 312);
  uint64_t v15 = *(void *)(v24 + 320);
  uint64_t v16 = *(void *)(v24 + 328);
  id v17 = *(void *)(v24 + 336);
  uint64_t v18 = *(void *)(v24 + 344);
  uint64_t v19 = *(void *)(v24 + 352);
  if (*(unsigned char *)(v24 + 360)) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v5 = *(void **)(v24 + 1392);
  *(void *)(v24 + 688) = *(void *)(v24 + 280);
  *(void *)(v24 + 696) = v11;
  *(void *)(v24 + 704) = v12;
  *(void *)(v24 + 712) = v13;
  *(void *)(v24 + 720) = v14;
  *(void *)(v24 + 728) = v15;
  *(void *)(v24 + 736) = v16;
  *(void *)(v24 + 744) = v17;
  *(void *)(v24 + 752) = v18;
  *(void *)(v24 + 760) = v19;
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)((*v5 & swift_isaMask) + 0xE0)
                                       + **(int **)((*v5 & swift_isaMask) + 0xE0));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v24 + 1944) = v6;
  *uint64_t v6 = *(void *)(v24 + 848);
  v6[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return v7(v24 + 688);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1952) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  uint64_t (*v11)(uint64_t);
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v20;
  NSObject *oslog;
  uint64_t v22;
  uint64_t v23;

  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1456);
  id v17 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v18(v1, v2, v17);
  oslog = Logger.logObject.getter();
  uint64_t v20 = static os_log_type_t.info.getter();
  *(void *)(v0 + 944) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1996);
  uint64_t v22 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v20))
  {
    uint64_t v3 = *(void *)(v16 + 1952);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    *(void *)(v16 + 1032) = buf;
    *(void *)(v16 + 1040) = v13;
    *(void *)(v16 + 1048) = v14;
    serialize(_:at:)(0, (unsigned char **)(v16 + 1032));
    serialize(_:at:)(0, (unsigned char **)(v16 + 1032));
    *(void *)(v16 + 1056) = v22;
    uint64_t v15 = (void *)swift_task_alloc();
    void v15[2] = v16 + 1032;
    v15[3] = v16 + 1040;
    v15[4] = v16 + 1048;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Deleted previous cellModelStats from modelStats table", buf, size);
    destroyStorage<A>(_:count:)(v13);
    destroyStorage<A>(_:count:)(v14);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v16 + 1768);
  uint64_t v7 = *(void *)(v16 + 1456);
  uint64_t v8 = *(void *)(v16 + 1416);
  uint64_t v10 = *(void **)(v16 + 1392);

  v9(v7, v8);
  uint64_t v11 = (uint64_t (*)(uint64_t))(*(void *)((*v10 & swift_isaMask) + 0xC8)
                                        + **(int **)((*v10 & swift_isaMask) + 0xC8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v16 + 1960) = v5;
  *uint64_t v5 = *(void *)(v16 + 848);
  v5[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  uint64_t v6 = *(void *)(v16 + 1576);
  return v11(v6);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1968) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *buf;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v28;
  NSObject *oslog;
  uint64_t v30;
  uint64_t v31;

  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1448);
  uint64_t v25 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v26(v1, v2, v25);
  oslog = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.info.getter();
  *(void *)(v0 + 952) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2000);
  uint64_t v30 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v28))
  {
    uint64_t v3 = *(void *)(v24 + 1968);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v21 = createStorage<A>(capacity:type:)(0);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    *(void *)(v24 + 1000) = buf;
    *(void *)(v24 + 1008) = v21;
    *(void *)(v24 + 1016) = v22;
    serialize(_:at:)(0, (unsigned char **)(v24 + 1000));
    serialize(_:at:)(0, (unsigned char **)(v24 + 1000));
    *(void *)(v24 + 1024) = v30;
    uint64_t v23 = (void *)swift_task_alloc();
    v23[2] = v24 + 1000;
    v23[3] = v24 + 1008;
    v23[4] = v24 + 1016;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Saved cellStandardDeviation to cellStdDev table", buf, size);
    destroyStorage<A>(_:count:)(v21);
    destroyStorage<A>(_:count:)(v22);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v24 + 1768);
  uint64_t v8 = *(void *)(v24 + 1448);
  uint64_t v9 = *(void *)(v24 + 1416);

  v10(v8, v9);
  uint64_t v11 = *(void *)(v24 + 288);
  uint64_t v12 = *(void *)(v24 + 296);
  id v13 = *(void *)(v24 + 304);
  uint64_t v14 = *(void *)(v24 + 312);
  uint64_t v15 = *(void *)(v24 + 320);
  uint64_t v16 = *(void *)(v24 + 328);
  id v17 = *(void *)(v24 + 336);
  uint64_t v18 = *(void *)(v24 + 344);
  uint64_t v19 = *(void *)(v24 + 352);
  if (*(unsigned char *)(v24 + 360)) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v5 = *(void **)(v24 + 1392);
  *(void *)(v24 + 768) = *(void *)(v24 + 280);
  *(void *)(v24 + 776) = v11;
  *(void *)(v24 + 784) = v12;
  *(void *)(v24 + 792) = v13;
  *(void *)(v24 + 800) = v14;
  *(void *)(v24 + 808) = v15;
  *(void *)(v24 + 816) = v16;
  *(void *)(v24 + 824) = v17;
  *(void *)(v24 + 832) = v18;
  *(void *)(v24 + 840) = v19;
  uint64_t v7 = (uint64_t (*)(uint64_t))(*(void *)((*v5 & swift_isaMask) + 0xF0)
                                       + **(int **)((*v5 & swift_isaMask) + 0xF0));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v24 + 1976) = v6;
  *uint64_t v6 = *(void *)(v24 + 848);
  v6[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return v7(v24 + 768);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = *v1;
  *(void *)(v4 + 848) = *v1;
  *(void *)(v4 + 1984) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  else
  {
    id v2 = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  }
  return _swift_task_switch(v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  void (**v5)(uint64_t, uint64_t);
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v24;
  NSObject *oslog;
  uint64_t v26;
  uint64_t v27;

  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  id v1 = *(void *)(v0 + 1440);
  uint64_t v21 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v22(v1, v2, v21);
  oslog = Logger.logObject.getter();
  uint64_t v24 = static os_log_type_t.info.getter();
  *(void *)(v0 + 960) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2004);
  uint64_t v26 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v24))
  {
    uint64_t v3 = *(void *)(v20 + 1984);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v17 = createStorage<A>(capacity:type:)(0);
    uint64_t v18 = createStorage<A>(capacity:type:)(0);
    *(void *)(v20 + 968) = buf;
    *(void *)(v20 + 976) = v17;
    *(void *)(v20 + 984) = v18;
    serialize(_:at:)(0, (unsigned char **)(v20 + 968));
    serialize(_:at:)(0, (unsigned char **)(v20 + 968));
    *(void *)(v20 + 992) = v26;
    uint64_t v19 = (void *)swift_task_alloc();
    void v19[2] = v20 + 968;
    v19[3] = v20 + 976;
    v19[4] = v20 + 984;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v24, "Deleted previous cellStandardDeviation from cellStdDev table", buf, size);
    destroyStorage<A>(_:count:)(v17);
    destroyStorage<A>(_:count:)(v18);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v20 + 1768);
  uint64_t v7 = *(void *)(v20 + 1440);
  uint64_t v8 = *(void *)(v20 + 1416);

  v9(v7, v8);
  id v13 = *(void *)(v20 + 1584);
  uint64_t v12 = *(void *)(v20 + 1576);
  uint64_t v11 = *(void *)(v20 + 1568);
  uint64_t v10 = *(void *)(v20 + 1560);
  uint64_t v14 = *(void *)(v20 + 1536);
  uint64_t v5 = (void (**)(uint64_t, uint64_t))(*(void *)(v20 + 1544) + 8);
  uint64_t v15 = *v5;
  ((void (*)(void))*v5)(*(void *)(v20 + 1552));
  v15(v10, v14);
  v15(v11, v14);
  v15(v12, v14);
  v15(v13, v14);
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(v20 + 848) + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *buf;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t size;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *oslog;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  uint64_t v31 = v0;
  *(void *)(v0 + 848) = v0;
  uint64_t v15 = *(void *)(v0 + 1632);
  id v1 = *(void *)(v0 + 1432);
  id v13 = *(void *)(v0 + 1424);
  uint64_t v14 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v15;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
  swift_errorRetain();
  id v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v25 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 64;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v19 + 24) = v18;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v23 = v3;
  swift_retain();
  *uint64_t v23 = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[1] = v20;
  swift_retain();
  v23[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[3] = v21;
  swift_retain();
  v23[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[5] = v22;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v25))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = createStorage<A>(capacity:type:)(1);
    uint64_t v11 = createStorage<A>(capacity:type:)(0);
    uint64_t v26 = buf;
    uint64_t v27 = v10;
    uint64_t v28 = v11;
    serialize(_:at:)(2, &v26);
    serialize(_:at:)(1, &v26);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v20;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    _os_log_impl((void *)&_mh_execute_header, oslog, v25, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v10);
    destroyStorage<A>(_:count:)(v11);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v7 = v12[179];
  uint64_t v8 = v12[177];
  uint64_t v6 = v12[178];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v12[106] + 8);
  return v4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *buf;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t size;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *oslog;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  uint64_t v31 = v0;
  *(void *)(v0 + 848) = v0;
  uint64_t v15 = *(void *)(v0 + 1648);
  id v1 = *(void *)(v0 + 1432);
  id v13 = *(void *)(v0 + 1424);
  uint64_t v14 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v15;
  id v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
  swift_errorRetain();
  id v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v25 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 64;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v19 + 24) = v18;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v23 = v3;
  swift_retain();
  *uint64_t v23 = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[1] = v20;
  swift_retain();
  v23[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[3] = v21;
  swift_retain();
  v23[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[5] = v22;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v25))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = createStorage<A>(capacity:type:)(1);
    uint64_t v11 = createStorage<A>(capacity:type:)(0);
    uint64_t v26 = buf;
    uint64_t v27 = v10;
    uint64_t v28 = v11;
    serialize(_:at:)(2, &v26);
    serialize(_:at:)(1, &v26);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v20;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    _os_log_impl((void *)&_mh_execute_header, oslog, v25, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v10);
    destroyStorage<A>(_:count:)(v11);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v7 = v12[179];
  uint64_t v8 = v12[177];
  uint64_t v6 = v12[178];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v12[106] + 8);
  return v4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t (*v7)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint32_t size;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *oslog;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  id v34 = v0;
  id v1 = *(void *)(v0 + 1584);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v3 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v18 = *(void *)(v0 + 1664);
  uint64_t v4 = *(void *)(v0 + 1432);
  uint64_t v16 = *(void *)(v0 + 1424);
  id v17 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v18;
  uint64_t v5 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v4, v5, v17);
  swift_errorRetain();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 64;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v6;
  swift_retain();
  void *v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v13 = createStorage<A>(capacity:type:)(1);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    uint64_t v29 = buf;
    uint64_t v30 = v13;
    uint64_t v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl((void *)&_mh_execute_header, oslog, v28, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v13);
    destroyStorage<A>(_:count:)(v14);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v10 = v15[179];
  uint64_t v11 = v15[177];
  uint64_t v9 = v15[178];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v15[106] + 8);
  return v7();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint32_t size;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *oslog;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  uint64_t v36 = v0;
  uint64_t v15 = *(void *)(v0 + 1584);
  id v1 = *(void *)(v0 + 1576);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v16 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  id v17 = *(void (**)(uint64_t))(v2 + 8);
  v17(v1);
  ((void (*)(uint64_t, uint64_t))v17)(v15, v16);
  uint64_t v20 = *(void *)(v0 + 1680);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v18 = *(void *)(v0 + 1424);
  uint64_t v19 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v20;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v3, v4, v19);
  swift_errorRetain();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v20;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v30 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = 64;
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v23 + 24) = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v24 + 24) = v23;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v28 = v5;
  swift_retain();
  *uint64_t v28 = closure #1 in OSLogArguments.append(_:)partial apply;
  v28[1] = v25;
  swift_retain();
  v28[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v28[3] = v26;
  swift_retain();
  v28[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v28[5] = v27;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v30))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v31 = buf;
    uint64_t v32 = v12;
    uint64_t v33 = v13;
    serialize(_:at:)(2, &v31);
    serialize(_:at:)(1, &v31);
    id v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v35 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    id v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v35 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    id v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v35 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v34, (uint64_t)&v31, (uint64_t)&v32, (uint64_t)&v33);
    _os_log_impl((void *)&_mh_execute_header, oslog, v30, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v16 = *(void *)(v0 + 1584);
  uint64_t v15 = *(void *)(v0 + 1576);
  id v1 = *(void *)(v0 + 1568);
  id v2 = *(void *)(v0 + 1544);
  id v17 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v18 = *(void (**)(uint64_t))(v2 + 8);
  v18(v1);
  ((void (*)(uint64_t, uint64_t))v18)(v15, v17);
  ((void (*)(uint64_t, uint64_t))v18)(v16, v17);
  uint64_t v21 = *(void *)(v0 + 1696);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v19 = *(void *)(v0 + 1424);
  uint64_t v20 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v21;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v3, v4, v20);
  swift_errorRetain();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 64;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v24 + 24) = v23;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v5;
  swift_retain();
  *uint64_t v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v32 = buf;
    uint64_t v33 = v12;
    id v34 = v13;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v16 = *(void *)(v0 + 1584);
  uint64_t v15 = *(void *)(v0 + 1576);
  id v1 = *(void *)(v0 + 1568);
  id v2 = *(void *)(v0 + 1544);
  id v17 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v18 = *(void (**)(uint64_t))(v2 + 8);
  v18(v1);
  ((void (*)(uint64_t, uint64_t))v18)(v15, v17);
  ((void (*)(uint64_t, uint64_t))v18)(v16, v17);
  uint64_t v21 = *(void *)(v0 + 1712);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v19 = *(void *)(v0 + 1424);
  uint64_t v20 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v21;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v3, v4, v20);
  swift_errorRetain();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 64;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v24 + 24) = v23;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v5;
  swift_retain();
  *uint64_t v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v32 = buf;
    uint64_t v33 = v12;
    id v34 = v13;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v16 = *(void *)(v0 + 1584);
  uint64_t v15 = *(void *)(v0 + 1576);
  id v1 = *(void *)(v0 + 1568);
  id v2 = *(void *)(v0 + 1544);
  id v17 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v18 = *(void (**)(uint64_t))(v2 + 8);
  v18(v1);
  ((void (*)(uint64_t, uint64_t))v18)(v15, v17);
  ((void (*)(uint64_t, uint64_t))v18)(v16, v17);
  uint64_t v21 = *(void *)(v0 + 1792);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v19 = *(void *)(v0 + 1424);
  uint64_t v20 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v21;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v3, v4, v20);
  swift_errorRetain();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 64;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v24 + 24) = v23;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v5;
  swift_retain();
  *uint64_t v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v32 = buf;
    uint64_t v33 = v12;
    id v34 = v13;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v16 = *(void *)(v0 + 1584);
  uint64_t v15 = *(void *)(v0 + 1576);
  id v1 = *(void *)(v0 + 1568);
  id v2 = *(void *)(v0 + 1544);
  id v17 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v18 = *(void (**)(uint64_t))(v2 + 8);
  v18(v1);
  ((void (*)(uint64_t, uint64_t))v18)(v15, v17);
  ((void (*)(uint64_t, uint64_t))v18)(v16, v17);
  uint64_t v21 = *(void *)(v0 + 1808);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v19 = *(void *)(v0 + 1424);
  uint64_t v20 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v21;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v3, v4, v20);
  swift_errorRetain();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 64;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v24 + 24) = v23;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v5;
  swift_retain();
  *uint64_t v29 = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[1] = v26;
  swift_retain();
  v29[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[3] = v27;
  swift_retain();
  v29[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v32 = buf;
    uint64_t v33 = v12;
    id v34 = v13;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl((void *)&_mh_execute_header, oslog, v31, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *oslog;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  uint64_t v38 = v0;
  id v17 = *(void *)(v0 + 1584);
  uint64_t v16 = *(void *)(v0 + 1576);
  uint64_t v15 = *(void *)(v0 + 1568);
  id v1 = *(void *)(v0 + 1560);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v18 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v19 = *(void (**)(uint64_t))(v2 + 8);
  v19(v1);
  ((void (*)(uint64_t, uint64_t))v19)(v15, v18);
  ((void (*)(uint64_t, uint64_t))v19)(v16, v18);
  ((void (*)(uint64_t, uint64_t))v19)(v17, v18);
  uint64_t v22 = *(void *)(v0 + 1824);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v20 = *(void *)(v0 + 1424);
  uint64_t v21 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v22;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v3, v4, v21);
  swift_errorRetain();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v32 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 64;
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 8;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v25 + 24) = v24;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v25;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v29 + 24) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v30 = v5;
  swift_retain();
  *uint64_t v30 = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[1] = v27;
  swift_retain();
  v30[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[3] = v28;
  swift_retain();
  v30[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[5] = v29;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v32))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v33 = buf;
    id v34 = v12;
    uint64_t v35 = v13;
    serialize(_:at:)(2, &v33);
    serialize(_:at:)(1, &v33);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    _os_log_impl((void *)&_mh_execute_header, oslog, v32, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1840);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1856);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1872);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1888);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1904);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1920);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1936);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1952);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1968);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  uint64_t v39 = v0;
  uint64_t v18 = *(void *)(v0 + 1584);
  id v17 = *(void *)(v0 + 1576);
  uint64_t v16 = *(void *)(v0 + 1568);
  uint64_t v15 = *(void *)(v0 + 1560);
  id v1 = *(void *)(v0 + 1552);
  id v2 = *(void *)(v0 + 1544);
  uint64_t v19 = *(void *)(v0 + 1536);
  *(void *)(v0 + 848) = v0;
  uint64_t v20 = *(void (**)(uint64_t))(v2 + 8);
  v20(v1);
  ((void (*)(uint64_t, uint64_t))v20)(v15, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v16, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v17, v19);
  ((void (*)(uint64_t, uint64_t))v20)(v18, v19);
  uint64_t v23 = *(void *)(v0 + 1984);
  uint64_t v3 = *(void *)(v0 + 1432);
  uint64_t v21 = *(void *)(v0 + 1424);
  uint64_t v22 = *(void *)(v0 + 1416);
  swift_errorRetain();
  *(void *)(v0 + 896) = v23;
  uint64_t v4 = MediaMLPlugin.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v3, v4, v22);
  swift_errorRetain();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v33 = static os_log_type_t.error.getter();
  *(void *)(v0 + 904) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 100);
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 64;
  uint64_t v29 = swift_allocObject();
  *(unsigned char *)(v29 + 16) = 8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v27 + 24) = v26;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v30 + 24) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v31 = v5;
  swift_retain();
  *uint64_t v31 = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[1] = v28;
  swift_retain();
  v31[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[3] = v29;
  swift_retain();
  v31[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v31[5] = v30;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v33))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(1);
    id v13 = createStorage<A>(capacity:type:)(0);
    id v34 = buf;
    uint64_t v35 = v12;
    uint64_t v36 = v13;
    serialize(_:at:)(2, &v34);
    serialize(_:at:)(1, &v34);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v38 = v30;
    closure #1 in osLogInternal(_:log:type:)(&v37, (uint64_t)&v34, (uint64_t)&v35, (uint64_t)&v36);
    _os_log_impl((void *)&_mh_execute_header, oslog, v33, "Failed to train model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v12);
    destroyStorage<A>(_:count:)(v13);
    UnsafeMutablePointer.deallocate()();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v14[179];
  uint64_t v10 = v14[177];
  uint64_t v8 = v14[178];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_errorRelease();
  swift_errorRelease();
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[106] + 8);
  return v6();
}

void closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
  uint64_t v132 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  uint64_t v1 = *(void *)(v0 + 1520);
  uint64_t v131 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  uint64_t v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v132(v1, v2, v131);
  oslog = Logger.logObject.getter();
  os_log_type_t v134 = static os_log_type_t.info.getter();
  *(void *)(v0 + 920) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 276);
  uint64_t v136 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v134))
  {
    uint64_t v3 = *(void *)(v130 + 1856);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v127 = createStorage<A>(capacity:type:)(0);
    uint64_t v128 = createStorage<A>(capacity:type:)(0);
    *(void *)(v130 + 1328) = buf;
    *(void *)(v130 + 1336) = v127;
    *(void *)(v130 + 1344) = v128;
    serialize(_:at:)(0, (unsigned char **)(v130 + 1328));
    serialize(_:at:)(0, (unsigned char **)(v130 + 1328));
    *(void *)(v130 + 1352) = v136;
    uint64_t v129 = (void *)swift_task_alloc();
    v129[2] = v130 + 1328;
    v129[3] = v130 + 1336;
    v129[4] = v130 + 1344;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3) {
      return;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v134, "Finished wifi model training and received modelStats", buf, size);
    destroyStorage<A>(_:count:)(v127);
    destroyStorage<A>(_:count:)(v128);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
    uint64_t v125 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v125 = *(void *)(v130 + 1856);
  }
  unint64_t v123 = *(void (**)(uint64_t, uint64_t))(v130 + 1768);
  uint64_t v121 = *(void *)(v130 + 1520);
  uint64_t v122 = *(void *)(v130 + 1416);
  uint64_t v124 = *(void *)(v130 + 1400);

  v123(v121, v122);
  if (v124 && (*(unsigned char *)(v130 + 272) & 1) == 0)
  {
    Swift::Int v120 = *(void *)(v130 + 192);
    double v119 = *(double *)(v130 + 256);
    uint64_t v118 = *(void **)(v130 + 1400);
    double v117 = *(double *)(v130 + 248);
    id v5 = v118;
    if (!v118) {
      goto LABEL_65;
    }
    id v114 = *(id *)(v130 + 1400);
    id v113 = [v114 experimentId];
    uint64_t v115 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v116 = v6;

    id v7 = v114;
    if (!v114) {
      goto LABEL_65;
    }
    id v111 = *(id *)(v130 + 1400);
    Swift::Int32 v112 = [v111 deploymentId];

    id v8 = v111;
    if (!v111) {
      goto LABEL_65;
    }
    id v108 = *(id *)(v130 + 1400);
    id v107 = [v108 treatmentId];
    uint64_t v109 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v110 = v9;

    if (*(unsigned char *)(v130 + 272)) {
      goto LABEL_65;
    }
    uint64_t v106 = *(void *)(v130 + 200);
    uint64_t v10 = *(void *)(v130 + 208);
    if (__OFADD__(v106, v10)) {
      goto LABEL_76;
    }
    uint64_t v101 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 1720);
    uint64_t v12 = *(void *)(v130 + 1512);
    uint64_t v100 = *(void *)(v130 + 1416);
    reportErrorMetrics(interfaceType:validationMeanAbsPercentError:trainingMeanAbsPercentError:rmseError:experimentID:deploymentID:treatmentID:carrierCount:appCount:sessionCount:ssidCount:trainingDataCount:)(v120, v115, v116, v112, v109, v110, *(void *)(v130 + 216), *(void *)(v130 + 232), v119, v117, 1.2, *(void *)(v130 + 240), *(void *)(v130 + 224), v106 + v10);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    uint64_t v13 = MediaMLPlugin.logger.unsafeMutableAddressor();
    v101(v12, v13, v100);
    log = Logger.logObject.getter();
    os_log_type_t v103 = static os_log_type_t.info.getter();
    *(void *)(v130 + 1128) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v102 = *(_DWORD *)(v130 + 2008);
    uint64_t v105 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v103))
    {
      uint64_t v96 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v97 = createStorage<A>(capacity:type:)(0);
      uint64_t v98 = createStorage<A>(capacity:type:)(0);
      *(void *)(v130 + 1296) = v96;
      *(void *)(v130 + 1304) = v97;
      *(void *)(v130 + 1312) = v98;
      serialize(_:at:)(0, (unsigned char **)(v130 + 1296));
      serialize(_:at:)(0, (unsigned char **)(v130 + 1296));
      *(void *)(v130 + 1320) = v105;
      uint64_t v99 = (void *)swift_task_alloc();
      v99[2] = v130 + 1296;
      v99[3] = v130 + 1304;
      v99[4] = v130 + 1312;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v125) {
        return;
      }
      swift_task_dealloc();
      _os_log_impl((void *)&_mh_execute_header, log, v103, "Reported wifiModelStats to Core Analytics", v96, v102);
      destroyStorage<A>(_:count:)(v97);
      destroyStorage<A>(_:count:)(v98);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
      uint64_t v95 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v95 = v125;
    }
    uint64_t v94 = *(void (**)(uint64_t, uint64_t))(v130 + 1768);
    uint64_t v92 = *(void *)(v130 + 1512);
    uint64_t v93 = *(void *)(v130 + 1416);

    v94(v92, v93);
    if (*(unsigned char *)(v130 + 272)) {
      goto LABEL_65;
    }
    double v91 = *(double *)(v130 + 256);
    uint64_t v14 = (double *)modelMAPEThreshold.unsafeMutableAddressor();
    v4.n128_f64[0] = v91;
    if (v91 < *v14)
    {
      uint64_t v82 = *(void *)(v130 + 200);
      uint64_t v83 = *(void *)(v130 + 208);
      uint64_t v84 = *(void *)(v130 + 216);
      uint64_t v85 = *(void *)(v130 + 224);
      uint64_t v86 = *(void *)(v130 + 232);
      uint64_t v87 = *(void *)(v130 + 240);
      uint64_t v88 = *(void *)(v130 + 248);
      uint64_t v89 = *(void *)(v130 + 256);
      uint64_t v90 = *(void *)(v130 + 264);
      if ((*(unsigned char *)(v130 + 272) & 1) == 0)
      {
        uint64_t v15 = *(void **)(v130 + 1392);
        *(void *)(v130 + 368) = *(void *)(v130 + 192);
        *(void *)(v130 + 376) = v82;
        *(void *)(v130 + 384) = v83;
        *(void *)(v130 + 392) = v84;
        *(void *)(v130 + 400) = v85;
        *(void *)(v130 + 408) = v86;
        *(void *)(v130 + 416) = v87;
        *(void *)(v130 + 424) = v88;
        *(void *)(v130 + 432) = v89;
        *(void *)(v130 + 440) = v90;
        uint64_t v81 = (void (*)(uint64_t))(*(void *)((*v15 & swift_isaMask) + 0xD8)
                                           + **(int **)((*v15 & swift_isaMask) + 0xD8));
        uint64_t v16 = swift_task_alloc();
        id v17 = v81;
        uint64_t v18 = (void *)v16;
        uint64_t v19 = v130 + 368;
        *(void *)(v130 + 1864) = v18;
        void *v18 = *(void *)(v130 + 848);
        v18[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
        goto LABEL_35;
      }
LABEL_65:
      _assertionFailure(_:_:file:line:flags:)();
      return;
    }
    uint64_t v80 = v95;
  }
  else
  {
    uint64_t v80 = v125;
  }
  if (*(void *)(v130 + 1400) && (*(unsigned char *)(v130 + 360) & 1) == 0)
  {
    Swift::Int v79 = *(void *)(v130 + 280);
    double v78 = *(double *)(v130 + 344);
    uint64_t v77 = *(void **)(v130 + 1400);
    double v76 = *(double *)(v130 + 336);
    id v20 = v77;
    if (!v77) {
      goto LABEL_65;
    }
    id v73 = *(id *)(v130 + 1400);
    id v72 = [v73 experimentId];
    uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v75 = v21;

    id v22 = v73;
    if (!v73) {
      goto LABEL_65;
    }
    id v70 = *(id *)(v130 + 1400);
    Swift::Int32 v71 = [v70 deploymentId];

    id v23 = v70;
    if (!v70) {
      goto LABEL_65;
    }
    id v67 = *(id *)(v130 + 1400);
    id v66 = [v67 treatmentId];
    uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v69 = v24;

    if (*(unsigned char *)(v130 + 360)) {
      goto LABEL_65;
    }
    uint64_t v65 = *(void *)(v130 + 288);
    uint64_t v25 = *(void *)(v130 + 296);
    if (!__OFADD__(v65, v25))
    {
      uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 1720);
      uint64_t v27 = *(void *)(v130 + 1472);
      uint64_t v59 = *(void *)(v130 + 1416);
      reportErrorMetrics(interfaceType:validationMeanAbsPercentError:trainingMeanAbsPercentError:rmseError:experimentID:deploymentID:treatmentID:carrierCount:appCount:sessionCount:ssidCount:trainingDataCount:)(v79, v74, v75, v71, v68, v69, *(void *)(v130 + 304), *(void *)(v130 + 320), v78, v76, 1.2, *(void *)(v130 + 328), *(void *)(v130 + 312), v65 + v25);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v28 = MediaMLPlugin.logger.unsafeMutableAddressor();
      v60(v27, v28, v59);
      uint64_t v63 = Logger.logObject.getter();
      os_log_type_t v62 = static os_log_type_t.info.getter();
      *(void *)(v130 + 928) = 2;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v61 = *(_DWORD *)(v130 + 364);
      uint64_t v64 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v63, v62))
      {
        uint64_t v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v56 = createStorage<A>(capacity:type:)(0);
        uint64_t v57 = createStorage<A>(capacity:type:)(0);
        *(void *)(v130 + 1096) = v55;
        *(void *)(v130 + 1104) = v56;
        *(void *)(v130 + 1112) = v57;
        serialize(_:at:)(0, (unsigned char **)(v130 + 1096));
        serialize(_:at:)(0, (unsigned char **)(v130 + 1096));
        *(void *)(v130 + 1120) = v64;
        dispatch_semaphore_t v58 = (void *)swift_task_alloc();
        v58[2] = v130 + 1096;
        v58[3] = v130 + 1104;
        v58[4] = v130 + 1112;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v80) {
          return;
        }
        swift_task_dealloc();
        _os_log_impl((void *)&_mh_execute_header, v63, v62, "Reported cellModelStats to Core Analytics", v55, v61);
        destroyStorage<A>(_:count:)(v56);
        destroyStorage<A>(_:count:)(v57);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v130 + 1768);
      uint64_t v52 = *(void *)(v130 + 1472);
      uint64_t v53 = *(void *)(v130 + 1416);

      v54(v52, v53);
      if ((*(unsigned char *)(v130 + 360) & 1) == 0)
      {
        double v51 = *(double *)(v130 + 344);
        uint64_t v29 = (double *)modelMAPEThreshold.unsafeMutableAddressor();
        v4.n128_f64[0] = v51;
        if (v51 >= *v29) {
          goto LABEL_72;
        }
        uint64_t v42 = *(void *)(v130 + 288);
        uint64_t v43 = *(void *)(v130 + 296);
        uint64_t v44 = *(void *)(v130 + 304);
        uint64_t v45 = *(void *)(v130 + 312);
        uint64_t v46 = *(void *)(v130 + 320);
        uint64_t v47 = *(void *)(v130 + 328);
        uint64_t v48 = *(void *)(v130 + 336);
        uint64_t v49 = *(void *)(v130 + 344);
        uint64_t v50 = *(void *)(v130 + 352);
        if ((*(unsigned char *)(v130 + 360) & 1) == 0)
        {
          uint64_t v30 = *(void **)(v130 + 1392);
          *(void *)(v130 + 608) = *(void *)(v130 + 280);
          *(void *)(v130 + 616) = v42;
          *(void *)(v130 + 624) = v43;
          *(void *)(v130 + 632) = v44;
          *(void *)(v130 + 640) = v45;
          *(void *)(v130 + 648) = v46;
          *(void *)(v130 + 656) = v47;
          *(void *)(v130 + 664) = v48;
          *(void *)(v130 + 672) = v49;
          *(void *)(v130 + 680) = v50;
          uint64_t v41 = (void (*)(uint64_t))(*(void *)((*v30 & swift_isaMask) + 0xD8)
                                             + **(int **)((*v30 & swift_isaMask) + 0xD8));
          uint64_t v31 = swift_task_alloc();
          id v17 = v41;
          uint64_t v32 = (void *)v31;
          uint64_t v19 = v130 + 608;
          *(void *)(v130 + 1928) = v32;
          *uint64_t v32 = *(void *)(v130 + 848);
          v32[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
LABEL_35:
          v17(v19);
          return;
        }
      }
      goto LABEL_65;
    }
    __break(1u);
LABEL_76:
    __break(1u);
    return;
  }
LABEL_72:
  uint64_t v38 = *(void *)(v130 + 1584);
  uint64_t v37 = *(void *)(v130 + 1576);
  uint64_t v36 = *(void *)(v130 + 1568);
  uint64_t v35 = *(void *)(v130 + 1560);
  uint64_t v39 = *(void *)(v130 + 1536);
  uint64_t v33 = (void (**)(uint64_t, uint64_t))(*(void *)(v130 + 1544) + 8);
  uint64_t v40 = *v33;
  ((void (*)(void, __n128))*v33)(*(void *)(v130 + 1552), v4);
  v40(v35, v39);
  v40(v36, v39);
  v40(v37, v39);
  v40(v38, v39);
  OS_dispatch_semaphore.signal()();
  swift_release();
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v34 = *(void (**)(void))(*(void *)(v130 + 848) + 8);
  v34();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  void *v15;
  void *v16;
  void (**v17)(uint64_t, uint64_t);
  void (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint32_t v45;
  os_log_type_t v46;
  NSObject *log;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  Swift::Int32 v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  Swift::Int v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint8_t *buf;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  os_log_type_t v76;
  NSObject *oslog;
  uint64_t v78;
  uint64_t v79;

  uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1720);
  uint64_t v1 = *(void *)(v0 + 1480);
  id v73 = *(void *)(v0 + 1416);
  *(void *)(v0 + 848) = v0;
  uint64_t v2 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v74(v1, v2, v73);
  oslog = Logger.logObject.getter();
  double v76 = static os_log_type_t.info.getter();
  *(void *)(v0 + 1160) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 2024);
  double v78 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v76))
  {
    uint64_t v3 = *(void *)(v72 + 1920);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v69 = createStorage<A>(capacity:type:)(0);
    id v70 = createStorage<A>(capacity:type:)(0);
    *(void *)(v72 + 1168) = buf;
    *(void *)(v72 + 1176) = v69;
    *(void *)(v72 + 1184) = v70;
    serialize(_:at:)(0, (unsigned char **)(v72 + 1168));
    serialize(_:at:)(0, (unsigned char **)(v72 + 1168));
    *(void *)(v72 + 1192) = v78;
    Swift::Int32 v71 = (void *)swift_task_alloc();
    v71[2] = v72 + 1168;
    v71[3] = v72 + 1176;
    v71[4] = v72 + 1184;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3) {
      return;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, oslog, v76, "Deleted previous wifiStandardDeviation from wifiStdDev table", buf, size);
    destroyStorage<A>(_:count:)(v69);
    destroyStorage<A>(_:count:)(v70);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
    id v67 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v67 = *(void *)(v72 + 1920);
  }
  id v66 = *(void (**)(uint64_t, uint64_t))(v72 + 1768);
  uint64_t v64 = *(void *)(v72 + 1480);
  uint64_t v65 = *(void *)(v72 + 1416);

  v66(v64, v65);
  if (!*(void *)(v72 + 1400) || (*(unsigned char *)(v72 + 360) & 1) != 0) {
    goto LABEL_38;
  }
  uint64_t v63 = *(void *)(v72 + 280);
  os_log_type_t v62 = *(double *)(v72 + 344);
  uint32_t v61 = *(void **)(v72 + 1400);
  uint64_t v60 = *(double *)(v72 + 336);
  id v5 = v61;
  if (!v61) {
    goto LABEL_31;
  }
  uint64_t v57 = *(id *)(v72 + 1400);
  uint64_t v56 = [v57 experimentId];
  dispatch_semaphore_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v59 = v6;

  id v7 = v57;
  if (!v57) {
    goto LABEL_31;
  }
  uint64_t v54 = *(id *)(v72 + 1400);
  uint64_t v55 = [v54 deploymentId];

  id v8 = v54;
  if (!v54) {
    goto LABEL_31;
  }
  double v51 = *(id *)(v72 + 1400);
  uint64_t v50 = [v51 treatmentId];
  uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v53 = v9;

  if (*(unsigned char *)(v72 + 360)) {
    goto LABEL_31;
  }
  uint64_t v49 = *(void *)(v72 + 288);
  uint64_t v10 = *(void *)(v72 + 296);
  if (__OFADD__(v49, v10))
  {
    __break(1u);
    return;
  }
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 1720);
  uint64_t v12 = *(void *)(v72 + 1472);
  uint64_t v43 = *(void *)(v72 + 1416);
  reportErrorMetrics(interfaceType:validationMeanAbsPercentError:trainingMeanAbsPercentError:rmseError:experimentID:deploymentID:treatmentID:carrierCount:appCount:sessionCount:ssidCount:trainingDataCount:)(v63, v58, v59, v55, v52, v53, *(void *)(v72 + 304), *(void *)(v72 + 320), v62, v60, 1.2, *(void *)(v72 + 328), *(void *)(v72 + 312), v49 + v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v13 = MediaMLPlugin.logger.unsafeMutableAddressor();
  v44(v12, v13, v43);
  log = Logger.logObject.getter();
  uint64_t v46 = static os_log_type_t.info.getter();
  *(void *)(v72 + 928) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v45 = *(_DWORD *)(v72 + 364);
  uint64_t v48 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(log, v46))
  {
    uint64_t v39 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v40 = createStorage<A>(capacity:type:)(0);
    uint64_t v41 = createStorage<A>(capacity:type:)(0);
    *(void *)(v72 + 1096) = v39;
    *(void *)(v72 + 1104) = v40;
    *(void *)(v72 + 1112) = v41;
    serialize(_:at:)(0, (unsigned char **)(v72 + 1096));
    serialize(_:at:)(0, (unsigned char **)(v72 + 1096));
    *(void *)(v72 + 1120) = v48;
    uint64_t v42 = (void *)swift_task_alloc();
    v42[2] = v72 + 1096;
    v42[3] = v72 + 1104;
    v42[4] = v72 + 1112;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v67) {
      return;
    }
    swift_task_dealloc();
    _os_log_impl((void *)&_mh_execute_header, log, v46, "Reported cellModelStats to Core Analytics", v39, v45);
    destroyStorage<A>(_:count:)(v40);
    destroyStorage<A>(_:count:)(v41);
    UnsafeMutablePointer.deallocate()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v72 + 1768);
  uint64_t v36 = *(void *)(v72 + 1472);
  uint64_t v37 = *(void *)(v72 + 1416);

  v38(v36, v37);
  if (*(unsigned char *)(v72 + 360)) {
    goto LABEL_31;
  }
  uint64_t v35 = *(double *)(v72 + 344);
  uint64_t v14 = (double *)modelMAPEThreshold.unsafeMutableAddressor();
  v4.n128_f64[0] = v35;
  if (v35 >= *v14)
  {
LABEL_38:
    id v22 = *(void *)(v72 + 1584);
    uint64_t v21 = *(void *)(v72 + 1576);
    id v20 = *(void *)(v72 + 1568);
    uint64_t v19 = *(void *)(v72 + 1560);
    id v23 = *(void *)(v72 + 1536);
    id v17 = (void (**)(uint64_t, uint64_t))(*(void *)(v72 + 1544) + 8);
    uint64_t v24 = *v17;
    ((void (*)(void, __n128))*v17)(*(void *)(v72 + 1552), v4);
    v24(v19, v23);
    v24(v20, v23);
    v24(v21, v23);
    v24(v22, v23);
    OS_dispatch_semaphore.signal()();
    swift_release();
    swift_release();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(void (**)(void))(*(void *)(v72 + 848) + 8);
    v18();
    return;
  }
  uint64_t v26 = *(void *)(v72 + 288);
  uint64_t v27 = *(void *)(v72 + 296);
  uint64_t v28 = *(void *)(v72 + 304);
  uint64_t v29 = *(void *)(v72 + 312);
  uint64_t v30 = *(void *)(v72 + 320);
  uint64_t v31 = *(void *)(v72 + 328);
  uint64_t v32 = *(void *)(v72 + 336);
  uint64_t v33 = *(void *)(v72 + 344);
  id v34 = *(void *)(v72 + 352);
  if (*(unsigned char *)(v72 + 360))
  {
LABEL_31:
    _assertionFailure(_:_:file:line:flags:)();
    return;
  }
  uint64_t v15 = *(void **)(v72 + 1392);
  *(void *)(v72 + 608) = *(void *)(v72 + 280);
  *(void *)(v72 + 616) = v26;
  *(void *)(v72 + 624) = v27;
  *(void *)(v72 + 632) = v28;
  *(void *)(v72 + 640) = v29;
  *(void *)(v72 + 648) = v30;
  *(void *)(v72 + 656) = v31;
  *(void *)(v72 + 664) = v32;
  *(void *)(v72 + 672) = v33;
  *(void *)(v72 + 680) = v34;
  uint64_t v25 = (void (*)(uint64_t))(*(void *)((*v15 & swift_isaMask) + 0xD8)
                                     + **(int **)((*v15 & swift_isaMask) + 0xD8));
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v72 + 1928) = v16;
  *uint64_t v16 = *(void *)(v72 + 848);
  v16[1] = closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  v25(v72 + 608);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = type metadata accessor for TaskPriority();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  uint64_t v6 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  id v5 = (void *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

uint64_t _ss20withExtendedLifetimeyq0_x_q0_yq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = a5;
  uint64_t v12 = a8;
  uint64_t v20 = a4;
  uint64_t v19 = a5;
  uint64_t v18 = a6;
  uint64_t v13 = *(void *)(a5 - 8);
  uint64_t v14 = a5 - 8;
  unint64_t v15 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v16 = (char *)&v11 - v15;
  uint64_t result = v9();
  uint64_t v17 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(v12, v16, v11);
  }
  return result;
}

id MediaMLPlugin.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id MediaMLPlugin.init()()
{
  id v16 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  v6[0] = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = (char *)v6 - v6[0];
  uint64_t v9 = (char *)v6 - v6[0];
  id v1 = (id)__chkstk_darwin(v11);
  id v16 = v11;
  v6[1] = OBJC_IVAR___MediaMLPlugin_dbPath;
  uint64_t v2 = mediaMLDataDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v0, v2, v10);
  v6[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rawdata.db", 0xAuLL, 1)._object;
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v10);

  uint64_t v13 = v16;
  uint64_t v3 = (objc_class *)type metadata accessor for MediaMLPlugin();
  v15.receiver = v13;
  v15.super_class = v3;
  id v14 = objc_msgSendSuper2(&v15, "init");
  id v4 = v14;
  id v16 = v14;

  return v14;
}

id MediaMLPlugin.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaMLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id @nonobjc NSNumber.init(value:)(uint64_t a1)
{
  return [v1 initWithInteger:a1];
}

{
  void *v1;

  return [v1 initWithInt:a1];
}

id @nonobjc NSNumber.init(value:)()
{
  return objc_msgSend(v0, "initWithDouble:");
}

id @nonobjc NSString.init(string:)()
{
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = objc_msgSend(v1, "initWithString:");

  swift_bridgeObjectRelease();
  return v3;
}

id @nonobjc MLRTrialTaskResult.init()()
{
  return [v0 init];
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v4 = (void (*)(void))__chkstk_darwin(a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t OSAllocatedUnfairLock.init(uncheckedState:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for os_unfair_lock_s();
  type metadata accessor for ManagedBuffer();
  uint64_t v5 = static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
  (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8))(a1);
  return v5;
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();
  id v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  id v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0xFFFFFFFFFFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + class metadata base offset for ManagedBuffer)
                                                        - 8)
                                            + 16))(a2);
}

void OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[1] = a5;
  closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(a3 + *(void *)(*(void *)a3 + class metadata base offset for ManagedBuffer + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0xFFFFFFFFFFFFFFFCLL)), a1, a2, a4, a5, v5);
}

void closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v10) {
    *a7 = v10;
  }
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_1000584B4()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_1000584E8()
{
  return swift_deallocObject();
}

uint64_t sub_10005851C()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_100058568()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v8 + 8;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *uint64_t v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {
  }
}

uint64_t sub_1000586F8()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t lazy protocol witness table accessor for type SQLError and conformance SQLError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type SQLError and conformance SQLError;
  if (!lazy protocol witness table cache variable for type SQLError and conformance SQLError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type SQLError and conformance SQLError);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1000587C0()
{
  return swift_deallocObject();
}

uint64_t sub_1000587EC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedWifiDB()()
{
  return implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(*(void *)(v0 + 16));
}

uint64_t sub_100058820()
{
  return swift_deallocObject();
}

uint64_t sub_100058854()
{
  return swift_deallocObject();
}

uint64_t sub_100058888()
{
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_0@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_1000588D4()
{
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v8, v9, (uint64_t)&type metadata for Int, v4);
}

uint64_t partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB()()
{
  return implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(v0);
}

uint64_t sub_100058990()
{
  return swift_deallocObject();
}

uint64_t sub_1000589C4()
{
  return swift_deallocObject();
}

uint64_t sub_1000589F8()
{
  return swift_deallocObject();
}

uint64_t sub_100058A44()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(uint64_t a1)
{
  return closure #3 in MediaMLPlugin.checkAndPruneProcessedWifiDB()(a1, *(void *)(v1 + 16));
}

uint64_t sub_100058B20()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedCellDB()()
{
  return implicit closure #1 in MediaMLPlugin.checkAndPruneProcessedCellDB()(*(void *)(v0 + 16));
}

uint64_t sub_100058B54()
{
  return swift_deallocObject();
}

uint64_t sub_100058B88()
{
  return swift_deallocObject();
}

uint64_t sub_100058BBC()
{
  return swift_deallocObject();
}

uint64_t sub_100058C08()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB()()
{
  return implicit closure #2 in MediaMLPlugin.checkAndPruneProcessedCellDB()(v0);
}

uint64_t sub_100058CC4()
{
  return swift_deallocObject();
}

uint64_t sub_100058CF8()
{
  return swift_deallocObject();
}

uint64_t sub_100058D2C()
{
  return swift_deallocObject();
}

uint64_t sub_100058D78()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #3 in MediaMLPlugin.checkAndPruneProcessedCellDB()(uint64_t a1)
{
  return closure #3 in MediaMLPlugin.checkAndPruneProcessedCellDB()(a1, *(void *)(v1 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation()
{
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void *outlined init with copy of String(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of Order?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Order();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_100059120()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)();
}

uint64_t sub_100059254()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #14 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #14 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)();
}

uint64_t sub_100059388()
{
  return swift_deallocObject();
}

uint64_t sub_1000593BC()
{
  return swift_deallocObject();
}

uint64_t sub_1000593F0()
{
  return swift_deallocObject();
}

uint64_t sub_10005943C()
{
  return swift_deallocObject();
}

uint64_t sub_1000594F0()
{
  return swift_deallocObject();
}

uint64_t sub_100059524()
{
  return swift_deallocObject();
}

uint64_t sub_100059558()
{
  return swift_deallocObject();
}

uint64_t sub_1000595A4()
{
  return swift_deallocObject();
}

uint64_t sub_100059658()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)();
}

uint64_t sub_10005978C()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)();
}

uint64_t sub_1000598C0()
{
  return swift_deallocObject();
}

uint64_t sub_1000598F4()
{
  return swift_deallocObject();
}

uint64_t sub_100059928()
{
  return swift_deallocObject();
}

uint64_t sub_100059974()
{
  return swift_deallocObject();
}

uint64_t sub_100059A28()
{
  return swift_deallocObject();
}

uint64_t sub_100059A5C()
{
  return swift_deallocObject();
}

uint64_t sub_100059A90()
{
  return swift_deallocObject();
}

uint64_t sub_100059ADC()
{
  return swift_deallocObject();
}

uint64_t sub_100059B90()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)()
{
  return implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)(*(void *)(v0 + 16));
}

uint64_t sub_100059BC4()
{
  return swift_deallocObject();
}

uint64_t sub_100059BF8()
{
  return swift_deallocObject();
}

uint64_t sub_100059C2C()
{
  return swift_deallocObject();
}

uint64_t sub_100059C78()
{
  return swift_deallocObject();
}

__n128 outlined init with take of Any(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t partial apply for closure #2 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)(uint64_t a1)
{
  return closure #2 in MediaMLPlugin.getAndSavePreProcessedCellData(dataFrame:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(double *)(v1 + 104), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96));
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type AnyColumnSlice and conformance AnyColumnSlice()
{
  uint64_t v2 = lazy protocol witness table cache variable for type AnyColumnSlice and conformance AnyColumnSlice;
  if (!lazy protocol witness table cache variable for type AnyColumnSlice and conformance AnyColumnSlice)
  {
    type metadata accessor for AnyColumnSlice();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AnyColumnSlice and conformance AnyColumnSlice);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of IndexingIterator<AnyColumnSlice>(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for AnyColumnSlice();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_100059EC8()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #12 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)();
}

uint64_t sub_100059FFC()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #13 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)();
}

uint64_t sub_10005A130()
{
  return swift_deallocObject();
}

uint64_t sub_10005A164()
{
  return swift_deallocObject();
}

uint64_t sub_10005A198()
{
  return swift_deallocObject();
}

uint64_t sub_10005A1E4()
{
  return swift_deallocObject();
}

uint64_t sub_10005A298()
{
  return swift_deallocObject();
}

uint64_t sub_10005A2CC()
{
  return swift_deallocObject();
}

uint64_t sub_10005A300()
{
  return swift_deallocObject();
}

uint64_t sub_10005A34C()
{
  return swift_deallocObject();
}

_OWORD *outlined init with take of Any?(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

uint64_t partial apply for closure #2 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t *a1)
{
  return closure #2 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t partial apply for closure #3 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t *a1)
{
  return closure #3 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_10005A554()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #8 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #8 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)();
}

uint64_t sub_10005A688()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #9 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #9 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)();
}

uint64_t sub_10005A7BC()
{
  return swift_deallocObject();
}

uint64_t sub_10005A7F0()
{
  return swift_deallocObject();
}

uint64_t sub_10005A824()
{
  return swift_deallocObject();
}

uint64_t sub_10005A870()
{
  return swift_deallocObject();
}

uint64_t sub_10005A924()
{
  return swift_deallocObject();
}

uint64_t sub_10005A958()
{
  return swift_deallocObject();
}

uint64_t sub_10005A98C()
{
  return swift_deallocObject();
}

uint64_t sub_10005A9D8()
{
  return swift_deallocObject();
}

uint64_t sub_10005AA8C()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_0(v2 + 16);
  }
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)()
{
  return implicit closure #10 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)();
}

uint64_t sub_10005AAF0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)@<X0>(void *a1@<X8>)
{
  return implicit closure #11 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_10005AB38()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [[Any]]);
  unint64_t v1 = lazy protocol witness table accessor for type [[Any]] and conformance [A]();

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

unint64_t lazy protocol witness table accessor for type [[Any]] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [[Any]] and conformance [A];
  if (!lazy protocol witness table cache variable for type [[Any]] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [[Any]]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [[Any]] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10005AC5C()
{
  return swift_deallocObject();
}

uint64_t sub_10005AC90()
{
  return swift_deallocObject();
}

uint64_t sub_10005ACC4()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10005AD10()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10005AD5C()
{
  return swift_deallocObject();
}

uint64_t sub_10005AD90()
{
  return swift_deallocObject();
}

uint64_t sub_10005ADC4()
{
  return swift_deallocObject();
}

uint64_t sub_10005AE10()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #4 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(uint64_t a1)
{
  return closure #4 in MediaMLPlugin.getAndSavePreProcessedWifiData(dataFrame:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(double *)(v1 + 96), *(double *)(v1 + 104), *(double *)(v1 + 112), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88));
}

uint64_t sub_10005AEFC()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #5 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  type metadata accessor for DataFrame();

  return implicit closure #5 in MediaMLPlugin.saveWiFiDataStandardDeviation()();
}

uint64_t sub_10005B030()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  type metadata accessor for DataFrame();

  return implicit closure #6 in MediaMLPlugin.saveWiFiDataStandardDeviation()();
}

uint64_t sub_10005B164()
{
  return swift_deallocObject();
}

uint64_t sub_10005B198()
{
  return swift_deallocObject();
}

uint64_t sub_10005B1CC()
{
  return swift_deallocObject();
}

uint64_t sub_10005B218()
{
  return swift_deallocObject();
}

uint64_t sub_10005B2CC()
{
  return swift_deallocObject();
}

uint64_t sub_10005B300()
{
  return swift_deallocObject();
}

uint64_t sub_10005B334()
{
  return swift_deallocObject();
}

uint64_t sub_10005B380()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t *a1)
{
  return closure #2 in MediaMLPlugin.saveWiFiDataStandardDeviation()(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t partial apply for closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t *a1)
{
  return closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_10005B48C()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  type metadata accessor for DataFrame();

  return implicit closure #3 in MediaMLPlugin.saveWiFiDataStandardDeviation()();
}

uint64_t sub_10005B5C0()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()()
{
  type metadata accessor for DataFrame();

  return implicit closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()();
}

uint64_t sub_10005B6F4()
{
  return swift_deallocObject();
}

uint64_t sub_10005B728()
{
  return swift_deallocObject();
}

uint64_t sub_10005B75C()
{
  return swift_deallocObject();
}

uint64_t sub_10005B7A8()
{
  return swift_deallocObject();
}

uint64_t sub_10005B85C()
{
  return swift_deallocObject();
}

uint64_t sub_10005B890()
{
  return swift_deallocObject();
}

uint64_t sub_10005B8C4()
{
  return swift_deallocObject();
}

uint64_t sub_10005B910()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()(uint64_t a1)
{
  return closure #4 in MediaMLPlugin.saveWiFiDataStandardDeviation()(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 56), *(double *)(v1 + 48));
}

uint64_t sub_10005BA30()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #6 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)();
}

uint64_t sub_10005BB64()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #7 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)();
}

uint64_t sub_10005BC98()
{
  return swift_deallocObject();
}

uint64_t sub_10005BCCC()
{
  return swift_deallocObject();
}

uint64_t sub_10005BD00()
{
  return swift_deallocObject();
}

uint64_t sub_10005BD4C()
{
  return swift_deallocObject();
}

uint64_t sub_10005BE00()
{
  return swift_deallocObject();
}

uint64_t sub_10005BE34()
{
  return swift_deallocObject();
}

uint64_t sub_10005BE68()
{
  return swift_deallocObject();
}

uint64_t sub_10005BEB4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1)
{
  return closure #2 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t partial apply for closure #3 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1)
{
  return closure #3 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(a1, *(void *)(v1 + 16)) & 1;
}

BOOL partial apply for closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t *a1)
{
  return closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(a1, *(void *)(v1 + 16));
}

uint64_t sub_10005BFEC()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #4 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)();
}

uint64_t sub_10005C120()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)()
{
  type metadata accessor for DataFrame();

  return implicit closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)();
}

uint64_t sub_10005C254()
{
  return swift_deallocObject();
}

uint64_t sub_10005C288()
{
  return swift_deallocObject();
}

uint64_t sub_10005C2BC()
{
  return swift_deallocObject();
}

uint64_t sub_10005C308()
{
  return swift_deallocObject();
}

uint64_t sub_10005C3BC()
{
  return swift_deallocObject();
}

uint64_t sub_10005C3F0()
{
  return swift_deallocObject();
}

uint64_t sub_10005C424()
{
  return swift_deallocObject();
}

uint64_t sub_10005C470()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(uint64_t a1)
{
  return closure #5 in MediaMLPlugin.saveCellDataStandardDeviation(dataFrame:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 64), *(double *)(v1 + 56));
}

uint64_t partial apply for closure #2 in MediaMLPlugin.saveModelStatsToDB(modelStats:)(uint64_t a1)
{
  return closure #2 in MediaMLPlugin.saveModelStatsToDB(modelStats:)(a1, *(uint64_t **)(v1 + 16));
}

void partial apply for closure #1 in MediaMLPlugin.perform(_:)(void *a1@<X8>)
{
  closure #1 in MediaMLPlugin.perform(_:)(*(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t type metadata accessor for MLRTrialTaskResult()
{
  uint64_t v2 = lazy cache variable for type metadata for MLRTrialTaskResult;
  if (!lazy cache variable for type metadata for MLRTrialTaskResult)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for MLRTrialTaskResult);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for MediaMLPlugin()
{
  uint64_t v1 = type metadata singleton initialization cache for MediaMLPlugin;
  if (!type metadata singleton initialization cache for MediaMLPlugin) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t base witness table accessor for Equatable in PluginErrors()
{
  return lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
}

unint64_t base witness table accessor for Error in PluginErrors()
{
  return lazy protocol witness table accessor for type PluginErrors and conformance PluginErrors();
}

uint64_t getEnumTagSinglePayload for PluginErrors(unsigned __int8 *a1, int a2)
{
  if (a2)
  {
    int v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v6 = v2;
    }
    if (v6 == 1)
    {
      int v5 = *a1;
    }
    else if (v6 == 2)
    {
      int v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      int v5 = *(_DWORD *)a1;
    }
    if (v5) {
      int v4 = v5 - 1;
    }
    else {
      int v4 = -1;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

unsigned char *storeEnumTagSinglePayload for PluginErrors(unsigned char *result, int a2, int a3)
{
  int v5 = 0;
  if (a3)
  {
    int v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v4 = v3;
    }
    int v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        *__n128 result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)__n128 result = a2;
      }
      else
      {
        *(_DWORD *)__n128 result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      *__n128 result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)__n128 result = 0;
    }
    else
    {
      *(_DWORD *)__n128 result = 0;
    }
  }
  return result;
}

uint64_t getEnumTag for PluginErrors()
{
  return 0;
}

ValueMetadata *type metadata accessor for PluginErrors()
{
  return &type metadata for PluginErrors;
}

uint64_t ObjC metadata update function for MediaMLPlugin()
{
  return type metadata accessor for MediaMLPlugin();
}

uint64_t type metadata completion function for MediaMLPlugin()
{
  uint64_t updated = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_10005CC1C()
{
  return swift_deallocObject();
}

id partial apply for implicit closure #1 in closure #1 in MediaMLPlugin.perform(_:)()
{
  return implicit closure #1 in closure #1 in MediaMLPlugin.perform(_:)(*(void **)(v0 + 16));
}

uint64_t sub_10005CC64()
{
  return swift_deallocObject();
}

uint64_t sub_10005CC98()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10005CCF4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10005CD40()
{
  return swift_deallocObject();
}

void closure #1 in OSLogArguments.append(_:)partial apply(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10005CD8C()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
  return implicit closure #2 in closure #1 in MediaMLPlugin.perform(_:)(*(void **)(v0 + 16));
}

uint64_t sub_10005CDD4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in closure #1 in MediaMLPlugin.perform(_:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in closure #1 in MediaMLPlugin.perform(_:)();
  return result;
}

uint64_t sub_10005CE20()
{
  return swift_deallocObject();
}

uint64_t sub_10005CE54()
{
  return swift_deallocObject();
}

uint64_t sub_10005CE88()
{
  return swift_deallocObject();
}

uint64_t sub_10005CED4()
{
  return swift_deallocObject();
}

uint64_t sub_10005CF08()
{
  return swift_deallocObject();
}

uint64_t sub_10005CF3C()
{
  return swift_deallocObject();
}

uint64_t sub_10005CF88()
{
  return swift_deallocObject();
}

uint64_t sub_10005CFD4()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in closure #1 in MediaMLPlugin.perform(_:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #2 in closure #1 in MediaMLPlugin.perform(_:);
  return closure #2 in closure #1 in MediaMLPlugin.perform(_:)(a1, v6, v7, v8, v9, v10);
}

uint64_t partial apply for closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_10005D2D0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in closure #1 in MediaMLPlugin.perform(_:)()
{
  return implicit closure #4 in closure #1 in MediaMLPlugin.perform(_:)(*(double *)(v0 + 16));
}

uint64_t sub_10005D304()
{
  return swift_deallocObject();
}

uint64_t sub_10005D338()
{
  return swift_deallocObject();
}

uint64_t sub_10005D36C()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10005D3B8()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskPriority();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_10005D4B4()
{
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v7 = *(int **)(v1 + 24);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v3;
  *uint64_t v3 = *(void *)(v6 + 16);
  v3[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_;
  uint64_t v4 = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + v4))(a1, v7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTATQ0_()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_10005D71C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in closure #2 in closure #1 in MediaMLPlugin.perform(_:)();
  return result;
}

uint64_t sub_10005D764()
{
  return swift_deallocObject();
}

uint64_t sub_10005D798()
{
  return swift_deallocObject();
}

uint64_t sub_10005D7CC()
{
  return swift_deallocObject();
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_10005D818()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10005D864()
{
  return swift_deallocObject();
}

void *outlined init with take of ModelStats?(const void *a1, void *__dst)
{
  return __dst;
}

void *outlined init with copy of SQLiteDB?(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  uint64_t result = a2;
  *a2 = v4;
  return result;
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getCellDataStandardDeviation()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getCellDataStandardDeviation()(a1);
}

void *outlined init with copy of String?(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of (String?, String?)()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getWiFiDataStandardDeviation()(a1);
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getProcessedWiFiDataFromDB()(a1);
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getProcessedCellDataFromDB()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getProcessedCellDataFromDB()(a1);
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getRawWiFiDataFromDB()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getRawWiFiDataFromDB()(a1);
}

uint64_t partial apply for closure #1 in closure #2 in MediaMLPlugin.getRawCellDataFromDB()(uint64_t a1)
{
  return closure #1 in closure #2 in MediaMLPlugin.getRawCellDataFromDB()(a1);
}

uint64_t type metadata accessor for os_unfair_lock_s()
{
  uint64_t v4 = lazy cache variable for type metadata for os_unfair_lock_s;
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
      return v1;
    }
  }
  return v4;
}

uint64_t partial apply for closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)(a1, a2);
}

uint64_t SQLError.description.getter(int a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  if (!a3)
  {
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SQL Error", 9uLL, 1);
    outlined destroy of String?();
  }
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(": ", 2uLL, 1);
  static String.+ infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!sqlite3_errstr(a1))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  String.init(cString:)();
  uint64_t v4 = static String.+ infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t SQLError.errorDescription.getter(int a1, uint64_t a2, uint64_t a3)
{
  return SQLError.description.getter(a1, a2, a3);
}

uint64_t SQLError.code.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*SQLError.code.modify())()
{
  return SQLError.code.modify;
}

uint64_t variable initialization expression of SQLError.desc()
{
  return 0;
}

uint64_t SQLError.desc.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t SQLError.desc.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SQLError.desc.modify())()
{
  return SQLError.desc.modify;
}

uint64_t default argument 1 of SQLError.init(code:desc:)()
{
  return 0;
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance SQLError()
{
  return SQLError.errorDescription.getter(*(_DWORD *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance SQLError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance SQLError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance SQLError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SQLError()
{
  return SQLError.description.getter(*(_DWORD *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t protocol witness for Error._domain.getter in conformance SQLError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance SQLError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SQLError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SQLError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t DBError.description.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned too many rows", 0x20uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned wrong columns count", 0x26uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("closed", 6uLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned no rows", 0x1AuLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t DBError.errorDescription.getter(char a1)
{
  return DBError.description.getter(a1);
}

BOOL static DBError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t DBError.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t DBError.hashValue.getter()
{
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type DBError and conformance DBError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DBError(char *a1, char *a2)
{
  return static DBError.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance DBError()
{
  return DBError.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance DBError()
{
  return DBError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DBError(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance DBError()
{
  return DBError.errorDescription.getter(*v0);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance DBError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance DBError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance DBError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DBError()
{
  return DBError.description.getter(*v0);
}

uint64_t protocol witness for Error._domain.getter in conformance DBError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance DBError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance DBError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance DBError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t SQLiteDB.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static SQLiteDB.logger);
}

uint64_t SQLiteDB.Location.path.getter()
{
  id v16 = 0;
  uint64_t v17 = 0;
  uint64_t v7 = 0;
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v8 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v9 = (char *)&v4 - v8;
  uint64_t v17 = (char *)&v4 - v8;
  unint64_t v11 = (*(void *)(*(void *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = (const void *)__chkstk_darwin(v10);
  objc_super v15 = (char *)&v4 - v11;
  id v16 = v0;
  outlined init with copy of SQLiteDB.Location(v0, (char *)&v4 - v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v15, 1, v14) == 1)
  {
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(":memory:", 8uLL, 1);
  }
  else
  {
    unint64_t v1 = v9;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v15, v14);
    uint64_t v17 = v1;
    v5._uint64_t countAndFlagsBits = URL.path.getter();
    v5._object = v2;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v14);
    Swift::String v6 = v5;
  }
  return v6._countAndFlagsBits;
}

uint64_t type metadata accessor for SQLiteDB.Location()
{
  uint64_t v1 = type metadata singleton initialization cache for SQLiteDB.Location;
  if (!type metadata singleton initialization cache for SQLiteDB.Location) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *outlined init with copy of SQLiteDB.Location(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = type metadata accessor for SQLiteDB.Location();
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t SQLiteDB.DBHandle.__allocating_init(location:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v5 = SQLiteDB.DBHandle.init(location:)(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t SQLiteDB.DBHandle.init(location:)(uint64_t a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  uint64_t v12 = 0;
  SQLiteDB.Location.path.getter();
  uint64_t v10 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  Swift::Int32 v11 = sqlite3_open_v2((const char *)(v10 + 32), &v12, 32774, 0);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (!v12 || v11)
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to open database", 0x17uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(v11, (Swift::String_optional)v3);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    swift_willThrow();
    swift_deallocPartialClassInstance();
    outlined destroy of SQLiteDB.Location(a1);
    return v5;
  }
  else
  {
    *(void *)(v1 + 16) = v12;
    outlined destroy of SQLiteDB.Location(a1);
    return v1;
  }
}

uint64_t outlined destroy of SQLiteDB.Location(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t SQLiteDB.DBHandle.close()()
{
  swift_beginAccess();
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_endAccess();
  if ((v3 & 1) == 0)
  {
    swift_beginAccess();
    *(unsigned char *)(v2 + 24) = 1;
    swift_endAccess();
    return sqlite3_close_v2(*(sqlite3 **)(v2 + 16));
  }
  return result;
}

uint64_t SQLiteDB.DBHandle.deinit()
{
  SQLiteDB.DBHandle.close()();
  return v1;
}

uint64_t SQLiteDB.DBHandle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.Statement.handle.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SQLiteDB.Statement.sqlString.getter()
{
  uint64_t v4 = sqlite3_expanded_sql(*(sqlite3_stmt **)(v0 + 16));
  if (!v4) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
  uint64_t v2 = String.init(cString:)();
  $defer #1 () in SQLiteDB.Statement.sqlString.getter(v4);
  return v2;
}

void $defer #1 () in SQLiteDB.Statement.sqlString.getter(void *a1)
{
}

uint64_t variable initialization expression of SQLiteDB.Statement.finished()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Statement.finished : SQLiteDB.Statement@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 104))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Statement.finished : SQLiteDB.Statement(char *a1)
{
  char v2 = *a1;
  swift_retain();
  SQLiteDB.Statement.finished.setter(v2 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Statement.finished.getter()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Statement.finished.setter(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Statement.finished.modify())()
{
  return SQLiteDB.Statement.finished.modify;
}

uint64_t SQLiteDB.Statement.finished.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Statement.__allocating_init(handle:)(uint64_t a1)
{
  return SQLiteDB.Statement.init(handle:)(a1);
}

uint64_t SQLiteDB.Statement.init(handle:)(uint64_t a1)
{
  uint64_t result = v1;
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t SQLiteDB.Statement.step()()
{
  Swift::Int32 v15 = sqlite3_step(*(sqlite3_stmt **)(v0 + 16));
  if (v15 == 100)
  {
    swift_retain();
    return ((uint64_t (*)())SQLiteDB.Row.init(statement:))();
  }
  else
  {
    if (v15 != 101)
    {
      DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Statement ((", 0xCuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v1);
      uint64_t v2 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))(*(void *)v14 + 96))(v2);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      outlined destroy of String();
      Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(")) could not be executed", 0x18uLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      uint64_t desc = String.init(stringInterpolation:)();
      v5.value._object = v4;
      v5.value._uint64_t countAndFlagsBits = desc;
      MediaMLPlugin::SQLError v16 = SQLError.init(code:desc:)(v15, v5);
      Swift::Int32 code = v16.code;
      uint64_t desc_8 = v16.desc.value._countAndFlagsBits;
      object = v16.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)uint64_t v6 = code;
      *(void *)(v6 + 8) = desc_8;
      *(void *)(v6 + 16) = object;
      swift_willThrow();
      return v12;
    }
    swift_beginAccess();
    v14[24] = 1;
    swift_endAccess();
    return 0;
  }
}

uint64_t SQLiteDB.Statement.forEach(handler:)(void (*a1)(void))
{
  while (1)
  {
    uint64_t result = SQLiteDB.Statement.step()();
    if (v3 || !result) {
      break;
    }
    a1();
    swift_release();
    uint64_t v3 = 0;
  }
  return result;
}

uint64_t SQLiteDB.Statement.queryOneRow<A>(handler:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a4;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v45 = 0;
  uint64_t v50 = a3;
  uint64_t v36 = *(void *)(a3 - 8);
  uint64_t v37 = a3 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v39 = (char *)v14 - v38;
  uint64_t v49 = (char *)v14 - v38;
  uint64_t v47 = __chkstk_darwin(a1);
  uint64_t v48 = v6;
  uint64_t v46 = v4;
  uint64_t result = SQLiteDB.Statement.step()();
  uint64_t v40 = v5;
  uint64_t v41 = result;
  uint64_t v42 = v5;
  if (v5)
  {
    uint64_t v17 = v42;
  }
  else
  {
    uint64_t v31 = v41;
    if (v41)
    {
      uint64_t v30 = v31;
      uint64_t v8 = v40;
      uint64_t v27 = v31;
      uint64_t v45 = v31;
      v33();
      uint64_t v28 = v8;
      uint64_t v29 = v8;
      uint64_t v9 = SQLiteDB.Statement.step()();
      *(_DWORD *)&v24[8] = 0;
      uint64_t v25 = v9;
      uint64_t v26 = 0;
      uint64_t v44 = v9;
      *(void *)uint64_t v24 = v9 != 0;
      BOOL v23 = v9 != 0;
      outlined destroy of SQLiteDB.Row?();
      if (v23)
      {
        for (uint64_t i = *(void *)&v24[4]; ; uint64_t i = *(void *)&v19[4])
        {
          uint64_t v10 = i;
          uint64_t v11 = SQLiteDB.Statement.step()();
          *(void *)&v19[4] = v10;
          uint64_t v20 = v11;
          uint64_t v21 = v10;
          if (v10) {
            break;
          }
          uint64_t v43 = v20;
          *(void *)uint64_t v19 = v20 != 0;
          BOOL v18 = v20 != 0;
          outlined destroy of SQLiteDB.Row?();
          if (!v18)
          {
            lazy protocol witness table accessor for type DBError and conformance DBError();
            uint64_t v16 = swift_allocError();
            unsigned char *v12 = 1;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
            swift_release();
            uint64_t result = v16;
            uint64_t v17 = v16;
            return result;
          }
        }
        v14[1] = v21;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
        return swift_release();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v32, v39, v35);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
        return swift_release();
      }
    }
    else
    {
      lazy protocol witness table accessor for type DBError and conformance DBError();
      uint64_t v15 = swift_allocError();
      *MediaMLPlugin::SQLError v13 = 0;
      swift_willThrow();
      uint64_t result = v15;
      uint64_t v17 = v15;
    }
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of SQLiteDB.Row?()
{
}

uint64_t SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = v2;
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), unsigned char *))(*(void *)v2 + 152))(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v4);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t (*)(uint64_t), unsigned char *, uint64_t);
  unsigned char v6[16];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v10 = a1;
  uint64_t v9 = v2;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v5 = *(uint64_t (**)(uint64_t (*)(uint64_t), unsigned char *, uint64_t))(*(void *)v2 + 152);
  uint64_t v3 = type metadata accessor for Optional();
  return v5(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v6, v3);
}

uint64_t closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *uint64_t v4 = 2;
    return swift_willThrow();
  }
}

{
  unsigned char *v4;

  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *uint64_t v4 = 2;
    return swift_willThrow();
  }
}

uint64_t partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1)
{
  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

{
  uint64_t v1;

  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t SQLiteDB.Row.count.getter(uint64_t a1)
{
  swift_retain();
  pStmt = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  return sqlite3_column_count(pStmt);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Statement.execute()()
{
  while (1)
  {
    *(_DWORD *)&v0[8] = HIDWORD(v2);
    uint64_t v1 = SQLiteDB.Statement.step()();
    if (v2) {
      break;
    }
    outlined destroy of SQLiteDB.Row?();
    if (!v1) {
      break;
    }
    *(void *)uint64_t v0 = 1;
    uint64_t v2 = *(void *)&v0[4];
  }
}

uint64_t SQLiteDB.Statement.bind(at:to:)(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(v6, a1, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

void *SQLiteDB.Statement.bind(values:)(uint64_t a1)
{
  memset(v11, 0, 32);
  v11[4] = a1;
  v10[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SQLBindable]);
  lazy protocol witness table accessor for type [SQLBindable] and conformance [A]();
  Sequence.enumerated()();
  v10[5] = v10[7];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>);
  EnumeratedSequence.makeIterator()();
  for (uint64_t i = v5; ; uint64_t i = 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>.Iterator);
    EnumeratedSequence.Iterator.next()();
    outlined init with take of (offset: Int, element: SQLBindable)?(v8, &v9);
    if (!v10[3])
    {
      uint64_t result = v11;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    uint64_t v3 = v9;
    uint64_t result = outlined init with take of SQLBindable(v10, __dst);
    if (__OFADD__(v3, 1)) {
      break;
    }
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v4 + 184))(v3 + 1, __dst);
    if (i)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
      uint64_t result = v11;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [SQLBindable] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [SQLBindable] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SQLBindable] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SQLBindable]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [SQLBindable] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void *outlined init with take of (offset: Int, element: SQLBindable)?(const void *a1, void *a2)
{
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator()
{
}

void *outlined init with take of SQLBindable(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t SQLiteDB.Statement.deinit()
{
  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  return v2;
}

uint64_t SQLiteDB.Statement.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Row.statement.getter()
{
}

uint64_t SQLiteDB.Row.get<A>(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

{
  swift_retain();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

uint64_t variable initialization expression of SQLiteDB.Transaction.finalized()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 96))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction(char *a1, uint64_t *a2)
{
  char v4 = *a1;
  uint64_t v3 = *a2;
  swift_retain();
  (*(void (**)(void))(*(void *)v3 + 104))(v4 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Transaction.finalized.getter()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Transaction.finalized.setter(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Transaction.finalized.modify())()
{
  return SQLiteDB.Transaction.finalized.modify;
}

uint64_t SQLiteDB.Transaction.finalized.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Transaction.__allocating_init(_:)(uint64_t a1)
{
  return SQLiteDB.Transaction.init(_:)(a1);
}

uint64_t SQLiteDB.Transaction.init(_:)(uint64_t a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  swift_retain();
  *(void *)(v1 + 16) = a1;
  swift_release();
  return v4;
}

uint64_t SQLiteDB.Transaction.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  if ((*(uint64_t (**)(void))(*(void *)v3 + 96))())
  {
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    MediaMLPlugin::SQLError v16 = SQLError.init(code:desc:)(1, (Swift::String_optional)v5);
    Swift::Int32 code = v16.code;
    uint64_t desc_8 = v16.desc.value._countAndFlagsBits;
    object = v16.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v10 = swift_allocError();
    *(_DWORD *)uint64_t v6 = code;
    *(void *)(v6 + 8) = desc_8;
    *(void *)(v6 + 16) = object;
    swift_willThrow();
    return v10;
  }
  else
  {
    swift_retain();
    uint64_t v11 = SQLiteDB.makeStatement(with:)(a1, a2);
    if (!v15)
    {
      swift_release();
      swift_retain();
      a3(v11);
      swift_release();
    }
    return swift_release();
  }
}

uint64_t SQLiteDB.makeStatement(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v32 = partial apply for closure #1 in SQLiteDB.makeStatement(with:);
  uint64_t v39 = 0;
  Swift::Int32 v37 = 0;
  uint64_t v36 = 0;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  uint64_t v42 = v2;
  uint64_t v34 = *(void *)(v2 + 112);
  swift_retain();
  uint64_t v33 = &v41;
  swift_beginAccess();
  int v35 = *(unsigned __int8 *)(v34 + 24);
  swift_endAccess();
  swift_release();
  if (v35)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    uint64_t v12 = swift_allocError();
    *uint64_t v10 = 3;
    swift_willThrow();
    uint64_t v18 = v12;
  }
  else
  {
    uint64_t v25 = &v40;
    uint64_t v40 = 0;
    uint64_t v3 = v31;
    uint64_t v26 = String.utf8CString.getter();
    uint64_t v39 = v26;
    swift_retain();
    swift_retain();
    uint64_t v27 = &v11;
    __chkstk_darwin(v32);
    ContiguousArray.withUnsafeBufferPointer<A>(_:)();
    uint64_t v28 = v3;
    if (v3)
    {
      __break(1u);
    }
    else
    {
      swift_release();
      swift_release();
      Swift::Int32 v22 = v38;
      Swift::Int32 v37 = v38;
      uint64_t v23 = v40;
      if (v40)
      {
        uint64_t v21 = v23;
        uint64_t v20 = v23;
        uint64_t v36 = v23;
        if (!v22)
        {
          type metadata accessor for SQLiteDB.Statement();
          uint64_t v19 = SQLiteDB.Statement.__allocating_init(handle:)(v20);
          swift_release();
          return v19;
        }
      }
      Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to prepare statement", 0x1BuLL, 1);
      uint64_t countAndFlagsBits = v5._countAndFlagsBits;
      MediaMLPlugin::SQLError v45 = SQLError.init(code:desc:)(v22, (Swift::String_optional)v5);
      Swift::Int32 code = v45.code;
      uint64_t v14 = v45.desc.value._countAndFlagsBits;
      object = v45.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v6 = swift_allocError();
      uint64_t v7 = v14;
      uint64_t v8 = object;
      uint64_t v17 = v6;
      *(_DWORD *)uint64_t v9 = code;
      *(void *)(v9 + 8) = v7;
      *(void *)(v9 + 16) = v8;
      swift_willThrow();
      swift_release();
      uint64_t v18 = v17;
    }
  }
  return v24;
}

Swift::Int64 __swiftcall SQLiteDB.Transaction.changes()()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_retain();
  uint64_t v3 = *(void *)(v2 + 112);
  swift_retain();
  swift_release();
  uint64_t v4 = *(sqlite3 **)(v3 + 16);
  swift_release();
  return sqlite3_changes64(v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.commit()()
{
  if ((*(uint64_t (**)(void))(*(void *)v0 + 96))())
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    MediaMLPlugin::SQLError v8 = SQLError.init(code:desc:)(1, (Swift::String_optional)v1);
    Swift::Int32 code = v8.code;
    uint64_t desc_8 = v8.desc.value._countAndFlagsBits;
    object = v8.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = code;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = object;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v7) {
      (*(void (**)(uint64_t))(*(void *)v6 + 104))(1);
    }
  }
}

uint64_t SQLiteDB.executeRaw(_:)()
{
  uint64_t v17 = *(void *)(v0 + 112);
  swift_retain();
  swift_beginAccess();
  char v18 = *(unsigned char *)(v17 + 24);
  swift_endAccess();
  swift_release();
  if (v18)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    uint64_t v6 = swift_allocError();
    *Swift::String v5 = 3;
    swift_willThrow();
    return v6;
  }
  else
  {
    uint64_t v12 = *(void *)(v16 + 112);
    swift_retain();
    MediaMLPlugin::SQLError v13 = *(sqlite3 **)(v12 + 16);
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v14 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    swift_bridgeObjectRelease();
    unsigned int code = sqlite3_exec(v13, (const char *)(v14 + 32), 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = code;
    if (code)
    {
      uint64_t desc = default argument 1 of SQLError.init(code:desc:)();
      v3.value._object = v2;
      v3.value._uint64_t countAndFlagsBits = desc;
      MediaMLPlugin::SQLError v19 = SQLError.init(code:desc:)(code, v3);
      Swift::Int32 v10 = v19.code;
      uint64_t desc_8 = v19.desc.value._countAndFlagsBits;
      object = v19.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v11 = swift_allocError();
      *(_DWORD *)uint64_t v4 = v10;
      *(void *)(v4 + 8) = desc_8;
      *(void *)(v4 + 16) = object;
      swift_willThrow();
      return v11;
    }
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.rollback()()
{
  if ((*(uint64_t (**)(void))(*(void *)v0 + 96))())
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    MediaMLPlugin::SQLError v8 = SQLError.init(code:desc:)(1, (Swift::String_optional)v1);
    Swift::Int32 code = v8.code;
    uint64_t desc_8 = v8.desc.value._countAndFlagsBits;
    object = v8.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = code;
    *(void *)(v2 + 8) = desc_8;
    *(void *)(v2 + 16) = object;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ROLLBACK", 8uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v7) {
      (*(void (**)(uint64_t))(*(void *)v6 + 104))(1);
    }
  }
}

uint64_t SQLiteDB.Transaction.deinit()
{
  swift_release();
  return v1;
}

uint64_t SQLiteDB.Transaction.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.__allocating_init(_:)(const void *a1)
{
  swift_allocObject();
  uint64_t v5 = SQLiteDB.init(_:)(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t SQLiteDB.init(_:)(const void *a1)
{
  MediaMLPlugin::SQLError v45 = a1;
  uint64_t v41 = *v1;
  uint64_t v55 = 0;
  uint64_t v54 = 0;
  uint64_t v53 = 0;
  Swift::Int32 v52 = 0;
  Swift::Int32 v51 = 0;
  uint64_t v44 = 0;
  unint64_t v43 = (*(void *)(*(void *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v42);
  uint64_t v47 = (char *)v17 - v43;
  uint64_t v55 = v3;
  uint64_t v54 = v2;
  swift_defaultActor_initialize();
  type metadata accessor for SQLiteDB.DBHandle();
  outlined init with copy of SQLiteDB.Location(v45, v47);
  uint64_t v4 = v46;
  uint64_t v5 = SQLiteDB.DBHandle.__allocating_init(location:)((uint64_t)v47);
  uint64_t v48 = v4;
  uint64_t v49 = v5;
  uint64_t v50 = v4;
  if (v4)
  {
    uint64_t v28 = v50;
    uint64_t v29 = v42;
  }
  else
  {
    uint64_t v35 = v49;
    uint64_t v53 = v49;
    Swift::Int32 v37 = *(sqlite3 **)(v49 + 16);
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA journal_mode=WAL;", 0x18uLL, 1)._object;
    uint64_t v38 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    uint64_t v36 = (const char *)(v38 + 32);
    swift_bridgeObjectRelease();
    Swift::Int32 v40 = sqlite3_exec(v37, v36, 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    Swift::Int32 v52 = v40;
    if (v40)
    {
      Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable WAL", 0x14uLL, 1);
      v17[3] = v12._countAndFlagsBits;
      MediaMLPlugin::SQLError v57 = SQLError.init(code:desc:)(v40, (Swift::String_optional)v12);
      Swift::Int32 code = v57.code;
      uint64_t countAndFlagsBits = v57.desc.value._countAndFlagsBits;
      MediaMLPlugin::SQLError v19 = v57.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v13 = swift_allocError();
      uint64_t v14 = countAndFlagsBits;
      uint64_t v15 = v19;
      uint64_t v21 = v13;
      *(_DWORD *)uint64_t v16 = code;
      *(void *)(v16 + 8) = v14;
      *(void *)(v16 + 16) = v15;
      swift_willThrow();
      swift_release();
      uint64_t v28 = v21;
      uint64_t v29 = v42;
    }
    else
    {
      uint64_t v31 = *(sqlite3 **)(v35 + 16);
      uint64_t v33 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA foreign_keys=ON;", 0x17uLL, 1)._object;
      uint64_t v32 = String.utf8CString.getter();
      swift_retain();
      swift_release();
      swift_retain();
      uint64_t v30 = (const char *)(v32 + 32);
      swift_bridgeObjectRelease();
      Swift::Int32 v34 = sqlite3_exec(v31, v30, 0, 0, 0);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      Swift::Int32 v51 = v34;
      if (!v34)
      {
        swift_retain();
        *(void *)(v42 + 112) = v35;
        swift_release();
        outlined destroy of SQLiteDB.Location((uint64_t)v45);
        return v42;
      }
      Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable FK", 0x13uLL, 1);
      uint64_t v23 = v7._countAndFlagsBits;
      MediaMLPlugin::SQLError v56 = SQLError.init(code:desc:)(v34, (Swift::String_optional)v7);
      Swift::Int32 v26 = v56.code;
      uint64_t v24 = v56.desc.value._countAndFlagsBits;
      uint64_t v25 = v56.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v8 = swift_allocError();
      uint64_t v9 = v24;
      Swift::Int32 v10 = v25;
      uint64_t v27 = v8;
      *(_DWORD *)uint64_t v11 = v26;
      *(void *)(v11 + 8) = v9;
      *(void *)(v11 + 16) = v10;
      swift_willThrow();
      swift_release();
      uint64_t v28 = v27;
      uint64_t v29 = v42;
    }
  }
  v17[1] = v29;
  v17[2] = v28;
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  outlined destroy of SQLiteDB.Location((uint64_t)v45);
  return v22;
}

uint64_t closure #1 in SQLiteDB.makeStatement(with:)@<X0>(uint64_t a1@<X2>, sqlite3_stmt **a2@<X4>, _DWORD *a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 112);
  swift_retain();
  Swift::String v7 = *(sqlite3 **)(v6 + 16);
  swift_release();
  uint64_t v8 = (const char *)UnsafeBufferPointer.baseAddress.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  ContiguousArray.count.getter();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_prepare_v2(v7, v8, v9, a2, 0);
  *a3 = result;
  return result;
}

uint64_t partial apply for closure #1 in SQLiteDB.makeStatement(with:)@<X0>(_DWORD *a1@<X8>)
{
  return closure #1 in SQLiteDB.makeStatement(with:)(*(void *)(v1 + 16), *(sqlite3_stmt ***)(v1 + 32), a1);
}

uint64_t type metadata accessor for SQLiteDB.Statement()
{
  return self;
}

uint64_t type metadata accessor for SQLiteDB.DBHandle()
{
  return self;
}

uint64_t SQLiteDB.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result = SQLiteDB.makeStatement(with:)(a1, a2);
  if (!v3)
  {
    a3();
    return swift_release();
  }
  return result;
}

uint64_t SQLiteDB.withTransaction<A>(handler:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v43 = a3;
  uint64_t v28 = *(void *)(a3 - 8);
  uint64_t v29 = a3 - 8;
  unint64_t v30 = (*(void *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = (char *)v13 - v30;
  uint64_t v42 = (char *)v13 - v30;
  uint64_t v40 = __chkstk_darwin(a1);
  uint64_t v41 = v5;
  uint64_t v39 = v4;
  type metadata accessor for SQLiteDB.Transaction();
  swift_retain();
  uint64_t v33 = SQLiteDB.Transaction.__allocating_init(_:)(v32);
  uint64_t v38 = v33;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BEGIN TRANSACTION", 0x11uLL, 1);
  uint64_t v7 = v34;
  object = v6._object;
  SQLiteDB.executeRaw(_:)();
  uint64_t v36 = v7;
  uint64_t v37 = v7;
  if (v7)
  {
    uint64_t v15 = v37;
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    uint64_t v16 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = v36;
    uint64_t v9 = v25(v33);
    uint64_t v22 = v8;
    uint64_t v23 = v8;
    if (v8)
    {
      uint64_t v14 = v23;
      uint64_t result = swift_release();
      uint64_t v16 = v14;
    }
    else
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)v33 + 96))(v9))
      {
        uint64_t v18 = v22;
        goto LABEL_7;
      }
      Swift::String v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
      uint64_t v11 = v22;
      MediaMLPlugin::SQLError v19 = v10._object;
      SQLiteDB.executeRaw(_:)();
      uint64_t v20 = v11;
      uint64_t v21 = v11;
      if (!v11)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = v20;
LABEL_7:
        uint64_t v17 = v18;
        (*(void (**)(uint64_t, char *, uint64_t))(v28 + 16))(v24, v31, v27);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
        return swift_release();
      }
      v13[1] = v21;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
      return swift_release();
    }
  }
  return result;
}

uint64_t type metadata accessor for SQLiteDB.Transaction()
{
  return self;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.execute(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall SQLiteDB.close()()
{
}

uint64_t SQLiteDB.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t SQLiteDB.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t SQLiteDB.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance SQLiteDB()
{
  return SQLiteDB.unownedExecutor.getter();
}

uint64_t SQLNullableType<>.init(with:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v11 = a5;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  unint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = a3 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v17 = (char *)&v10 - v16;
  unint64_t v18 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v5);
  MediaMLPlugin::SQLError v19 = (char *)&v10 - v18;
  unint64_t v30 = (char *)&v10 - v18;
  uint64_t v29 = v7;
  uint64_t v28 = v8;
  swift_retain();
  uint64_t v25 = *(sqlite3_stmt **)(v20 + 16);
  swift_release();
  uint64_t v24 = &v26;
  uint64_t v26 = v21;
  unint64_t v22 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  unint64_t v23 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_type(v25, v27) == 5)
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1, 1, v12);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v20, v21);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v12);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v11, v19, v12);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v12);
  }
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

uint64_t Int.init(with:column:)(uint64_t a1)
{
  swift_retain();
  uint64_t v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int(v2, v4);
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

uint64_t Int.bind(to:at:)(uint64_t a1)
{
  uint64_t v7 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_int(v7, v10, v9);
  Swift::Int32 v8 = result;
  if (result)
  {
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int", 0x12uLL, 1);
    MediaMLPlugin::SQLError v11 = SQLError.init(code:desc:)(v8, (Swift::String_optional)v2);
    Swift::Int32 code = v11.code;
    uint64_t desc_8 = v11.desc.value._countAndFlagsBits;
    object = v11.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v3 = code;
    *(void *)(v3 + 8) = desc_8;
    *(void *)(v3 + 16) = object;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Int.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int(uint64_t a1)
{
  return Int.bind(to:at:)(a1);
}

uint64_t Int64.init(with:column:)(uint64_t a1)
{
  swift_retain();
  Swift::String v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int64(v2, v4);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

uint64_t Int64.bind(to:at:)(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  int v9 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_int64(v9, v12, a3);
  Swift::Int32 v11 = result;
  if (result)
  {
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int64", 0x14uLL, 1);
    MediaMLPlugin::SQLError v13 = SQLError.init(code:desc:)(v11, (Swift::String_optional)v4);
    Swift::Int32 code = v13.code;
    uint64_t desc_8 = v13.desc.value._countAndFlagsBits;
    object = v13.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v5 = code;
    *(void *)(v5 + 8) = desc_8;
    *(void *)(v5 + 16) = object;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Int64.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int64(uint64_t a1, uint64_t a2)
{
  return Int64.bind(to:at:)(a1, a2, *v2);
}

double Double.init(with:column:)(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  double v1 = sqlite3_column_double(v3, v5);
  double v6 = Double.init(_:)(v1);
  swift_release();
  return v6;
}

uint64_t Double.bind(to:at:)(uint64_t a1, double a2)
{
  Swift::Int32 v8 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_double(v8, v11, a2);
  Swift::Int32 v10 = result;
  if (result)
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Double", 0x15uLL, 1);
    MediaMLPlugin::SQLError v12 = SQLError.init(code:desc:)(v10, (Swift::String_optional)v3);
    Swift::Int32 code = v12.code;
    uint64_t desc_8 = v12.desc.value._countAndFlagsBits;
    object = v12.desc.value._object;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = code;
    *(void *)(v4 + 8) = desc_8;
    *(void *)(v4 + 16) = object;
    return swift_willThrow();
  }
  return result;
}

void protocol witness for SQLType.init(with:column:) in conformance Double(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = Double.init(with:column:)(a1);
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Double(uint64_t a1)
{
  return Double.bind(to:at:)(a1, *v1);
}

uint64_t String.init(with:column:)(uint64_t a1)
{
  swift_retain();
  int v5 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_text(v5, v6))
  {
    uint64_t v2 = String.init(cString:)();
    swift_bridgeObjectRetain();
    swift_release();
    outlined destroy of String();
    return v2;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t String.bind(to:at:)()
{
  String.utf8CString.getter();
  swift_retain();
  swift_retain();
  uint64_t result = ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  if (v6)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    if (v7)
    {
      Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind String", 0x15uLL, 1);
      MediaMLPlugin::SQLError v8 = SQLError.init(code:desc:)(v7, (Swift::String_optional)v1);
      Swift::Int32 code = v8.code;
      uint64_t desc_8 = v8.desc.value._countAndFlagsBits;
      object = v8.desc.value._object;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)uint64_t v2 = code;
      *(void *)(v2 + 8) = desc_8;
      *(void *)(v2 + 16) = object;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in String.bind(to:at:)@<X0>(uint64_t a1@<X2>, _DWORD *a2@<X8>)
{
  int v5 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t v4 = (char *)UnsafeBufferPointer.baseAddress.getter();
  ContiguousArray.count.getter();
  SignedInteger<>.init<A>(_:)();
  uint64_t v2 = SQLITE_TRANSIENT.unsafeMutableAddressor();
  uint64_t result = sqlite3_bind_text(v5, v8, v4, v7, (void (__cdecl *)(void *))*v2);
  *a2 = result;
  return result;
}

uint64_t partial apply for closure #1 in String.bind(to:at:)@<X0>(_DWORD *a1@<X8>)
{
  return closure #1 in String.bind(to:at:)(*(void *)(v1 + 16), a1);
}

uint64_t *SQLITE_TRANSIENT.unsafeMutableAddressor()
{
  if (one-time initialization token for SQLITE_TRANSIENT != -1) {
    swift_once();
  }
  return &SQLITE_TRANSIENT;
}

uint64_t protocol witness for SQLNullableType.init(with:column:) in conformance String@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = String.init(with:column:)(a1);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance String()
{
  return String.bind(to:at:)();
}

void one-time initialization function for SQLITE_TRANSIENT()
{
  SQLITE_TRANSIENT = -1;
}

unint64_t base witness table accessor for Error in SQLError()
{
  return lazy protocol witness table accessor for type SQLError and conformance SQLError();
}

unint64_t base witness table accessor for Equatable in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

unint64_t base witness table accessor for Error in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

uint64_t initializeBufferWithCopyOfBuffer for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t destroy for SQLError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v4 = *(void *)(a1 + 16);
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLError()
{
  return &type metadata for SQLError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DBError(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DBError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *__n128 result = a2 + 3;
    }
  }
  return result;
}

uint64_t getEnumTag for DBError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for DBError(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLiteDB()
{
  return self;
}

unint64_t initializeBufferWithCopyOfBuffer for SQLiteDB.Location(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v10 = *(void *)(a3 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  if ((v11 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    swift_retain();
    *a1 = v6;
    return *a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    uint64_t v4 = type metadata accessor for URL();
    uint64_t v5 = *(void *)(v4 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 48))(a2, 1))
    {
      memcpy(a1, a2, *(void *)(v10 + 64));
    }
    else
    {
      (*(void (**)(void *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    return (unint64_t)a1;
  }
}

uint64_t destroy for SQLiteDB.Location(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1);
  if (!result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v7);
  }
  return a1;
}

void *initializeWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v7);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_100064EC4(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for URL();
  unsigned int v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
  if (v3 > 1) {
    return v3 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_100064F68(uint64_t a1, int a2, unsigned int a3)
{
  if (a2) {
    unsigned int v3 = a2 + 1;
  }
  else {
    unsigned int v3 = 0;
  }
  unsigned int v7 = v3;
  uint64_t v4 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, void, void))(*(void *)(v4 - 8) + 56))(a1, v7, a3);
}

uint64_t getEnumTag for SQLiteDB.Location(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for SQLiteDB.Location(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56))(a1, a2, 1);
}

uint64_t type metadata completion function for SQLiteDB.Location()
{
  uint64_t v2 = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for SQLiteDB.Row()
{
  return &type metadata for SQLiteDB.Row;
}

Swift::Double *kSecondsFromNanoseconds.unsafeMutableAddressor()
{
  return &kSecondsFromNanoseconds;
}

uint64_t one-time initialization function for kMediaML_rssi()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rssuint64_t i = v1;
  return result;
}

Swift::String *kMediaML_rssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rssi != -1) {
    swift_once();
  }
  return &kMediaML_rssi;
}

uint64_t one-time initialization function for kMediaML_cca()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cca", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_cca = v1;
  return result;
}

Swift::String *kMediaML_cca.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_cca != -1) {
    swift_once();
  }
  return &kMediaML_cca;
}

uint64_t one-time initialization function for kMediaML_snr()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("snr", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_snr = v1;
  return result;
}

Swift::String *kMediaML_snr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_snr != -1) {
    swift_once();
  }
  return &kMediaML_snr;
}

uint64_t one-time initialization function for kMediaML_noise()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("noise", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_noise = v1;
  return result;
}

Swift::String *kMediaML_noise.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_noise != -1) {
    swift_once();
  }
  return &kMediaML_noise;
}

uint64_t one-time initialization function for kMediaML_throughputTrue()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("throughput_true", 0xFuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputTrue = v1;
  return result;
}

Swift::String *kMediaML_throughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputTrue != -1) {
    swift_once();
  }
  return &kMediaML_throughputTrue;
}

uint64_t one-time initialization function for kMediaML_txRate()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tx_rate", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_txRate = v1;
  return result;
}

Swift::String *kMediaML_txRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_txRate != -1) {
    swift_once();
  }
  return &kMediaML_txRate;
}

uint64_t one-time initialization function for kMediaML_rxRate()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rx_rate", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rxRate = v1;
  return result;
}

Swift::String *kMediaML_rxRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rxRate != -1) {
    swift_once();
  }
  return &kMediaML_rxRate;
}

uint64_t one-time initialization function for kMediaML_dayOfWeek()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dow", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_dayOfWeek = v1;
  return result;
}

Swift::String *kMediaML_dayOfWeek.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_dayOfWeek != -1) {
    swift_once();
  }
  return &kMediaML_dayOfWeek;
}

uint64_t one-time initialization function for kMediaML_hourOfDay()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_hourOfDay = v1;
  return result;
}

Swift::String *kMediaML_hourOfDay.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_hourOfDay != -1) {
    swift_once();
  }
  return &kMediaML_hourOfDay;
}

uint64_t one-time initialization function for kMediaML_ssid()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_ssid = v1;
  return result;
}

Swift::String *kMediaML_ssid.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssid != -1) {
    swift_once();
  }
  return &kMediaML_ssid;
}

uint64_t one-time initialization function for kMediaML_interfaceType()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ifty", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_interfaceType = v1;
  return result;
}

Swift::String *kMediaML_interfaceType.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_interfaceType != -1) {
    swift_once();
  }
  return &kMediaML_interfaceType;
}

uint64_t one-time initialization function for kMediaML_nData()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ndata", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_nData = v1;
  return result;
}

Swift::String *kMediaML_nData.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_nData != -1) {
    swift_once();
  }
  return &kMediaML_nData;
}

uint64_t one-time initialization function for kMediaML_appName()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name", 8uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_appName = v1;
  return result;
}

Swift::String *kMediaML_appName.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appName != -1) {
    swift_once();
  }
  return &kMediaML_appName;
}

uint64_t one-time initialization function for kMediaML_sessionID()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_sessionID = v1;
  return result;
}

Swift::String *kMediaML_sessionID.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionID != -1) {
    swift_once();
  }
  return &kMediaML_sessionID;
}

uint64_t one-time initialization function for kMediaML_carrier()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_carrier = v1;
  return result;
}

Swift::String *kMediaML_carrier.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_carrier != -1) {
    swift_once();
  }
  return &kMediaML_carrier;
}

uint64_t one-time initialization function for kMediaML_rsrp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrp", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rsrp = v1;
  return result;
}

Swift::String *kMediaML_rsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrp != -1) {
    swift_once();
  }
  return &kMediaML_rsrp;
}

uint64_t one-time initialization function for kMediaML_rscp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rscp", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rscp = v1;
  return result;
}

Swift::String *kMediaML_rscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rscp != -1) {
    swift_once();
  }
  return &kMediaML_rscp;
}

uint64_t one-time initialization function for kMediaML_rsrq()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrq", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rsrq = v1;
  return result;
}

Swift::String *kMediaML_rsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrq != -1) {
    swift_once();
  }
  return &kMediaML_rsrq;
}

uint64_t one-time initialization function for kMediaML_bars()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_bars = v1;
  return result;
}

Swift::String *kMediaML_bars.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_bars != -1) {
    swift_once();
  }
  return &kMediaML_bars;
}

uint64_t one-time initialization function for kMediaML_count()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("count", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_count = v1;
  return result;
}

Swift::String *kMediaML_count.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_count != -1) {
    swift_once();
  }
  return &kMediaML_count;
}

uint64_t one-time initialization function for kMediaML_medianThroughputTrue()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("quantile(throughput_true)", 0x19uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_medianThroughputTrue = v1;
  return result;
}

Swift::String *kMediaML_medianThroughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_medianThroughputTrue != -1) {
    swift_once();
  }
  return &kMediaML_medianThroughputTrue;
}

uint64_t one-time initialization function for kMediaML_binnedRssi()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rssi", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRssuint64_t i = v1;
  return result;
}

Swift::String *kMediaML_binnedRssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRssi != -1) {
    swift_once();
  }
  return &kMediaML_binnedRssi;
}

uint64_t one-time initialization function for kMediaML_binnedRsrp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrp", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRsrp = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrp != -1) {
    swift_once();
  }
  return &kMediaML_binnedRsrp;
}

uint64_t one-time initialization function for kMediaML_binnedRsrq()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrq", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRsrq = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrq != -1) {
    swift_once();
  }
  return &kMediaML_binnedRsrq;
}

uint64_t one-time initialization function for kMediaML_binnedRscp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rscp", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRscp = v1;
  return result;
}

Swift::String *kMediaML_binnedRscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRscp != -1) {
    swift_once();
  }
  return &kMediaML_binnedRscp;
}

uint64_t one-time initialization function for kMediaML_binnedSnr()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_snr", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedSnr = v1;
  return result;
}

Swift::String *kMediaML_binnedSnr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedSnr != -1) {
    swift_once();
  }
  return &kMediaML_binnedSnr;
}

uint64_t one-time initialization function for kMediaML_throughputStdDev()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predStdDev", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputStdDev = v1;
  return result;
}

Swift::String *kMediaML_throughputStdDev.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputStdDev != -1) {
    swift_once();
  }
  return &kMediaML_throughputStdDev;
}

uint64_t one-time initialization function for kMediaML_throughputPrediction()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predVal", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputPrediction = v1;
  return result;
}

Swift::String *kMediaML_throughputPrediction.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputPrediction != -1) {
    swift_once();
  }
  return &kMediaML_throughputPrediction;
}

Swift::Int *cell_signal_binsize.unsafeMutableAddressor()
{
  return &cell_signal_binsize;
}

Swift::Int *cell_snr_binsize.unsafeMutableAddressor()
{
  return &cell_snr_binsize;
}

Swift::Int *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_low_medium_boundary;
}

Swift::Int *rssiBucket_medium_high_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_medium_high_boundary;
}

uint64_t one-time initialization function for rssiBucket_low()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("low", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_low = v1;
  return result;
}

Swift::String *rssiBucket_low.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_low != -1) {
    swift_once();
  }
  return &rssiBucket_low;
}

uint64_t one-time initialization function for rssiBucket_medium()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_medium = v1;
  return result;
}

Swift::String *rssiBucket_medium.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_medium != -1) {
    swift_once();
  }
  return &rssiBucket_medium;
}

uint64_t one-time initialization function for rssiBucket_high()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("high", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_high = v1;
  return result;
}

Swift::String *rssiBucket_high.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_high != -1) {
    swift_once();
  }
  return &rssiBucket_high;
}

uint64_t one-time initialization function for kMediaML_trainingRowCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingRowCount", 0x10uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_trainingRowCount = v1;
  return result;
}

Swift::String *kMediaML_trainingRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingRowCount != -1) {
    swift_once();
  }
  return &kMediaML_trainingRowCount;
}

uint64_t one-time initialization function for kMediaML_validationRowCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationRowCount", 0x12uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_validationRowCount = v1;
  return result;
}

Swift::String *kMediaML_validationRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationRowCount != -1) {
    swift_once();
  }
  return &kMediaML_validationRowCount;
}

uint64_t one-time initialization function for kMediaML_ssidCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssidCount", 9uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_ssidCount = v1;
  return result;
}

Swift::String *kMediaML_ssidCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssidCount != -1) {
    swift_once();
  }
  return &kMediaML_ssidCount;
}

uint64_t one-time initialization function for kMediaML_appNameCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appNameCount", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_appNameCount = v1;
  return result;
}

Swift::String *kMediaML_appNameCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appNameCount != -1) {
    swift_once();
  }
  return &kMediaML_appNameCount;
}

uint64_t one-time initialization function for kMediaML_sessionIDCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sessionIDCount", 0xEuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_sessionIDCount = v1;
  return result;
}

Swift::String *kMediaML_sessionIDCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionIDCount != -1) {
    swift_once();
  }
  return &kMediaML_sessionIDCount;
}

uint64_t one-time initialization function for kMediaML_trainingMAPE()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingMAPE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_trainingMAPE = v1;
  return result;
}

Swift::String *kMediaML_trainingMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingMAPE != -1) {
    swift_once();
  }
  return &kMediaML_trainingMAPE;
}

uint64_t one-time initialization function for kMediaML_validationMAPE()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationMAPE", 0xEuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_validationMAPE = v1;
  return result;
}

Swift::String *kMediaML_validationMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationMAPE != -1) {
    swift_once();
  }
  return &kMediaML_validationMAPE;
}

uint64_t one-time initialization function for mediaMLBaseDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLBaseDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLBaseDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/", 0x24uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLBaseDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLBaseDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLBaseDirectory);
}

uint64_t one-time initialization function for mediaMLModelDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLModelDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLModelDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/model/", 0x2AuLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLModelDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLModelDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLModelDirectory);
}

uint64_t one-time initialization function for mediaMLDataDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLDataDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLDataDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/data/", 0x29uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLDataDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLDataDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLDataDirectory);
}

Swift::Int *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_RAW_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_WRITE;
}

Swift::Int *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor()
{
  return &DB_DELETION_BUCKET_SIZE;
}

Swift::Int *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_WiFi;
}

Swift::Int *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_Cellular;
}

Swift::Int *maxThroughput.unsafeMutableAddressor()
{
  return &maxThroughput;
}

Swift::Int *minSignalStrength.unsafeMutableAddressor()
{
  return &minSignalStrength;
}

Swift::Int *minNoise.unsafeMutableAddressor()
{
  return &minNoise;
}

Swift::Double *maxTxRate.unsafeMutableAddressor()
{
  return &maxTxRate;
}

Swift::Double *maxRxRate.unsafeMutableAddressor()
{
  return &maxRxRate;
}

Swift::Int *minSSIDLength.unsafeMutableAddressor()
{
  return &minSSIDLength;
}

Swift::Int *maxSSIDLength.unsafeMutableAddressor()
{
  return &maxSSIDLength;
}

Swift::Int *maxBars.unsafeMutableAddressor()
{
  return &maxBars;
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t DataFrameProtocol.grouped(by:)()
{
  return DataFrameProtocol.grouped(by:)();
}

Swift::Bool __swiftcall DataFrame.containsColumn(_:)(Swift::String a1)
{
  return DataFrame.containsColumn(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t DataFrame.Slice.filter<A>(on:_:_:)()
{
  return DataFrame.Slice.filter<A>(on:_:_:)();
}

uint64_t type metadata accessor for DataFrame.Slice()
{
  return type metadata accessor for DataFrame.Slice();
}

uint64_t DataFrame.Slice.subscript.getter()
{
  return DataFrame.Slice.subscript.getter();
}

uint64_t DataFrame.shape.getter()
{
  return DataFrame.shape.getter();
}

uint64_t DataFrame.append<A>(column:)()
{
  return DataFrame.append<A>(column:)();
}

uint64_t DataFrame.filter<A>(on:_:_:)()
{
  return DataFrame.filter<A>(on:_:_:)();
}

uint64_t DataFrame.init()()
{
  return DataFrame.init()();
}

uint64_t type metadata accessor for DataFrame()
{
  return type metadata accessor for DataFrame();
}

uint64_t DataFrame.init(_:)()
{
  return DataFrame.init(_:)();
}

uint64_t DataFrame.subscript.getter()
{
  return DataFrame.subscript.getter();
}

uint64_t AnyColumnSlice.distinct()()
{
  return AnyColumnSlice.distinct()();
}

uint64_t type metadata accessor for AnyColumnSlice()
{
  return type metadata accessor for AnyColumnSlice();
}

uint64_t RowGroupingProtocol.quantiles<A>(_:_:quantile:order:)()
{
  return RowGroupingProtocol.quantiles<A>(_:_:quantile:order:)();
}

uint64_t type metadata accessor for Order()
{
  return type metadata accessor for Order();
}

uint64_t Column.init<A>(name:contents:)()
{
  return Column.init<A>(name:contents:)();
}

uint64_t AnyColumn.distinct()()
{
  return AnyColumn.distinct()();
}

uint64_t type metadata accessor for AnyColumn()
{
  return type metadata accessor for AnyColumn();
}

uint64_t AnyColumn.subscript.getter()
{
  return AnyColumn.subscript.getter();
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

uint64_t type metadata accessor for CellularModel()
{
  return type metadata accessor for CellularModel();
}

Swift::Int __swiftcall getDateInEpoch()()
{
  return getDateInEpoch()();
}

uint64_t modelMAPEThreshold.unsafeMutableAddressor()
{
  return modelMAPEThreshold.unsafeMutableAddressor();
}

uint64_t type metadata accessor for WifiModel()
{
  return type metadata accessor for WifiModel();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return DispatchTime.uptimeNanoseconds.getter();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t AutoreleasingUnsafeMutablePointer.pointee.setter()
{
  return AutoreleasingUnsafeMutablePointer.pointee.setter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t MutableCollection.subscript.getter()
{
  return MutableCollection.subscript.getter();
}

uint64_t UnsafeBufferPointer.baseAddress.getter()
{
  return UnsafeBufferPointer.baseAddress.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.init(stringInterpolation:)()
{
  return String.init(stringInterpolation:)();
}

uint64_t static String.+ infix(_:_:)()
{
  return static String.+ infix(_:_:)();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return static String.== infix(_:_:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.enumerated()()
{
  return Sequence.enumerated()();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return Sequence.reduce<A>(_:_:)();
}

uint64_t Sequence.forEach(_:)()
{
  return Sequence.forEach(_:)();
}

uint64_t Sequence.contains(where:)()
{
  return Sequence.contains(where:)();
}

uint64_t Sequence<>.max()()
{
  return Sequence<>.max()();
}

uint64_t Sequence<>.min()()
{
  return Sequence<>.min()();
}

uint64_t Sequence<>.sorted()()
{
  return Sequence<>.sorted()();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return UnsignedInteger<>.init<A>(_:)();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return SignedInteger<>.init<A>(_:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.count.getter()
{
  return Array.count.getter();
}

uint64_t specialized Array.count.getter()
{
  return specialized Array.count.getter();
}

{
  return specialized Array.count.getter();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t specialized Array.append(_:)()
{
  return specialized Array.append(_:)();
}

{
  return specialized Array.append(_:)();
}

{
  return specialized Array.append(_:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t Array.init<A>(_:)()
{
  return Array.init<A>(_:)();
}

uint64_t Array.subscript.getter()
{
  return Array.subscript.getter();
}

uint64_t specialized Array.subscript.getter()
{
  return specialized Array.subscript.getter();
}

{
  return specialized Array.subscript.getter();
}

{
  return specialized Array.subscript.getter();
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

uint64_t UnownedSerialExecutor.init(_:)()
{
  return UnownedSerialExecutor.init(_:)();
}

Swift::Double __swiftcall Double.init(_:)(Swift::Double a1)
{
  Double.init(_:)(a1);
  return result;
}

uint64_t Double.init<A>(_:)()
{
  return Double.init<A>(_:)();
}

uint64_t Collection.first.getter()
{
  return Collection.first.getter();
}

uint64_t Collection<>.makeIterator()()
{
  return Collection<>.makeIterator()();
}

uint64_t specialized Collection<>.makeIterator()()
{
  return specialized Collection<>.makeIterator()();
}

{
  return specialized Collection<>.makeIterator()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return UnsafeMutablePointer.deinitialize(count:)();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return static UnsafeMutablePointer.allocate(capacity:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return SetAlgebra.isDisjoint(with:)();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return SetAlgebra.isSuperset(of:)();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return SetAlgebra.isEmpty.getter();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return SetAlgebra.isSubset(of:)();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t _hashValue<A>(for:)()
{
  return _hashValue<A>(for:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t ContiguousArray.withUnsafeBufferPointer<A>(_:)()
{
  return ContiguousArray.withUnsafeBufferPointer<A>(_:)();
}

uint64_t ContiguousArray.count.getter()
{
  return ContiguousArray.count.getter();
}

uint64_t IndexingIterator.next()()
{
  return IndexingIterator.next()();
}

uint64_t specialized IndexingIterator.next()()
{
  return specialized IndexingIterator.next()();
}

{
  return specialized IndexingIterator.next()();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return dispatch thunk of static FixedWidthInteger.bitWidth.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return EnumeratedSequence.makeIterator()();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return EnumeratedSequence.Iterator.next()();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t specialized _allocateUninitializedArray<A>(_:)()
{
  return specialized _allocateUninitializedArray<A>(_:)();
}

uint64_t == infix<A>(_:_:)()
{
  return == infix<A>(_:_:)();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return _convertInOutToPointerArgument<A>(_:)();
}

uint64_t abs<A>(_:)()
{
  return abs<A>(_:)();
}

uint64_t max<A>(_:_:)()
{
  return max<A>(_:_:)();
}

uint64_t min<A>(_:_:)()
{
  return min<A>(_:_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.combine<A>(_:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t OptionSet<>.insert(_:)()
{
  return OptionSet<>.insert(_:)();
}

uint64_t OptionSet<>.remove(_:)()
{
  return OptionSet<>.remove(_:)();
}

uint64_t OptionSet<>.update(with:)()
{
  return OptionSet<>.update(with:)();
}

uint64_t OptionSet<>.contains(_:)()
{
  return OptionSet<>.contains(_:)();
}

uint64_t OptionSet.intersection(_:)()
{
  return OptionSet.intersection(_:)();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t OptionSet.union(_:)()
{
  return OptionSet.union(_:)();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t OptionSet<>.init()()
{
  return OptionSet<>.init()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

sqlite3_int64 sqlite3_changes64(sqlite3 *a1)
{
  return _sqlite3_changes64(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_expanded_sql(pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_deallocate()
{
  return _swift_defaultActor_deallocate();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return _swift_getEnumTagSinglePayloadGeneric();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return _swift_storeEnumTagSinglePayloadGeneric();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}