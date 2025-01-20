uint64_t thunk for @escaping @callee_guaranteed (@unowned Bool) -> ()(uint64_t a1)
{
  char v1;
  void (*v3)(void);

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v1 = _convertObjCBoolToBool(_:)();
  v3(v1 & 1);
  return swift_release();
}

uint64_t partial apply for closure #2 in _MLServiceS.init(nameOfModel:)(char a1)
{
  return closure #2 in _MLServiceS.init(nameOfModel:)(a1 & 1);
}

uint64_t closure #2 in _MLServiceS.init(nameOfModel:)(unsigned int a1)
{
  unsigned int v23 = a1;
  uint64_t v33 = 0;
  v21 = closure #1 in osLogInternal(_:log:type:)partial apply;
  char v43 = 0;
  uint64_t v22 = 0;
  uint64_t v28 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v28 - 8);
  uint64_t v27 = v28 - 8;
  unint64_t v24 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = (char *)&v8 - v24;
  v25 = (char *)&v8 - v24;
  char v43 = MEMORY[0x270FA5388](v23) & 1;
  uint64_t v2 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v1, v2, v28);
  v35 = Logger.logObject.getter();
  int v34 = static os_log_type_t.debug.getter();
  v31 = &v41;
  uint64_t v41 = 2;
  unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v30 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v32 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v36 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v35, (os_log_type_t)v34))
  {
    uint64_t v3 = v22;
    v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = 0;
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(v10);
    v17 = &v40;
    v40 = v11;
    v18 = &v39;
    uint64_t v39 = v12;
    v15 = &v38;
    uint64_t v38 = v13;
    unsigned int v14 = 0;
    serialize(_:at:)(0, &v40);
    serialize(_:at:)(v14, v17);
    uint64_t v37 = v36;
    v16 = &v8;
    MEMORY[0x270FA5388](&v8);
    v4 = v18;
    v5 = &v8 - 6;
    v19 = &v8 - 6;
    v5[2] = (uint64_t)v17;
    v5[3] = (uint64_t)v4;
    v5[4] = v6;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_255D5C000, v35, (os_log_type_t)v34, "Server started", v11, v32);
      uint64_t v8 = 0;
      destroyStorage<A>(_:count:)(v12, 0, v9);
      destroyStorage<A>(_:count:)(v13, v8, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v11, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v25, v28);
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

uint64_t _MLServiceS.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static _MLServiceS.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

id _MLServiceS.init(nameOfModel:)(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v50 = a1;
  uint64_t v51 = a2;
  id v3 = v2;
  id v4 = v2;
  id v5 = v2;
  id v6 = v2;
  id v7 = v2;
  id v8 = v2;
  id v9 = v2;
  id v52 = v2;
  swift_bridgeObjectRetain();
  uint64_t v10 = &v33[OBJC_IVAR____MLServiceS_modelName];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;

  type metadata accessor for NSXPCConnection();
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.mediamlxpc", 0x14uLL, 1);
  *(NSXPCConnection *)&v33[OBJC_IVAR____MLServiceS_connection] = NSXPCConnection.__allocating_init(serviceName:)(v11);

  id v28 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  id v12 = v28;
  type metadata accessor for NSXPCInterface();
  id v13 = &unk_2704A1968;
  id v27 = @nonobjc NSXPCInterface.__allocating_init(with:)(&unk_2704A1968);
  objc_msgSend(v28, sel_setRemoteObjectInterface_);

  id v29 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  id v14 = v29;
  objc_msgSend(v29, sel_resume);

  id v32 = *(id *)&v33[OBJC_IVAR____MLServiceS_connection];
  id v15 = v32;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = ObjectType;
  v48 = partial apply for closure #1 in _MLServiceS.init(nameOfModel:);
  uint64_t v49 = v16;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v44 = 1107296256;
  int v45 = 0;
  v46 = thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ();
  v47 = &block_descriptor;
  v31 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v32, sel_synchronousRemoteObjectProxyWithErrorHandler_, v31);
  _Block_release(v31);

  _bridgeAnyObjectToAny(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLServerProtocol);
  if (swift_dynamicCast()) {
    uint64_t v24 = v42;
  }
  else {
    uint64_t v24 = 0;
  }
  *(void *)&v33[OBJC_IVAR____MLServiceS_service] = v24;
  swift_unknownObjectRelease();

  unsigned int v23 = *(void **)&v33[OBJC_IVAR____MLServiceS_service];
  swift_unknownObjectRetain();
  if (v23)
  {
    uint64_t v22 = v23;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  swift_getObjectType();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = ObjectType;
  v40 = partial apply for closure #2 in _MLServiceS.init(nameOfModel:);
  uint64_t v41 = v17;
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = 1107296256;
  int v37 = 0;
  uint64_t v38 = thunk for @escaping @callee_guaranteed (@unowned Bool) -> ();
  uint64_t v39 = &block_descriptor_6;
  uint64_t v20 = _Block_copy(&v35);
  swift_release();
  objc_msgSend(v22, sel_wakeRemoteServiceWith_, v20);
  _Block_release(v20);
  swift_unknownObjectRelease();

  v34.receiver = v52;
  v34.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v34, sel_init);
  id v18 = v21;
  id v52 = v21;
  swift_bridgeObjectRelease();

  return v21;
}

unint64_t type metadata accessor for NSXPCConnection()
{
  uint64_t v2 = lazy cache variable for type metadata for NSXPCConnection;
  if (!lazy cache variable for type metadata for NSXPCConnection)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSXPCConnection);
    return ObjCClassMetadata;
  }
  return v2;
}

NSXPCConnection __swiftcall NSXPCConnection.__allocating_init(serviceName:)(Swift::String serviceName)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (NSXPCConnection)@nonobjc NSXPCConnection.init(serviceName:)();
}

id @nonobjc NSXPCConnection.init(serviceName:)()
{
  id v2 = (id)MEMORY[0x25A299120]();
  id v3 = objc_msgSend(v1, sel_initWithServiceName_);

  swift_bridgeObjectRelease();
  return v3;
}

unint64_t type metadata accessor for NSXPCInterface()
{
  uint64_t v2 = lazy cache variable for type metadata for NSXPCInterface;
  if (!lazy cache variable for type metadata for NSXPCInterface)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSXPCInterface);
    return ObjCClassMetadata;
  }
  return v2;
}

id @nonobjc NSXPCInterface.__allocating_init(with:)(void *a1)
{
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_interfaceWithProtocol_, a1);

  return v3;
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataValidation", 0xEuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static _MLServiceS.logger);
  __swift_project_value_buffer(v1, (uint64_t)static _MLServiceS.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaMLServices", 0x19uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLService", 9uLL, 1);
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

Swift::Bool __swiftcall checkValidInterfaceType(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  char v10 = 0;
  kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A299110](v9);
  outlined destroy of String();
  if (v9[3])
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
  char v10 = 1;
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
  char v9 = 0;
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A299110](v8);
  outlined destroy of String();
  if (v8[3])
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
  char v9 = 1;
  return 1;
}

Swift::Bool __swiftcall validateAppName(text:)(Swift::String text)
{
  v19 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v13 = 0;
  Swift::String v21 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Za-z0-9./]{1,155}$", 0x16uLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  char v10 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    uint64_t v17 = 0;
    uint64_t v18 = String.count.getter();
    swift_bridgeObjectRetain();
    id v6 = (id)MEMORY[0x25A299120](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v14 = 0;
    uint64_t v15 = v18;
    id v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    id v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    BOOL v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
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
  v19 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v13 = 0;
  Swift::String v21 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}$", 0x3EuLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  char v10 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v19 = v2;
    uint64_t v17 = 0;
    uint64_t v18 = String.count.getter();
    swift_bridgeObjectRetain();
    id v6 = (id)MEMORY[0x25A299120](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v14 = 0;
    uint64_t v15 = v18;
    id v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    id v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    BOOL v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

Swift::Bool __swiftcall validateSSID(text:)(Swift::String text)
{
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  object = text._object;
  id v27 = partial apply for closure #1 in validateSSID(text:);
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
    uint64_t v15 = MEMORY[0x263F8D310];
    uint64_t v14 = _allocateUninitializedArray<A>(_:)();
    id v13 = v1;
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
    MEMORY[0x270FA5388](&v9);
    id v6 = (char *)&v9 - v18;
    v19 = v6;
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
  char v1 = Sequence<>.starts<A>(with:)();
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
  uint64_t v260 = 0;
  char v259 = 0;
  uint64_t v255 = 0;
  v256 = 0;
  uint64_t v201 = 0;
  uint64_t v244 = 0;
  v245 = 0;
  uint64_t v227 = 0;
  v228 = 0;
  uint64_t v202 = type metadata accessor for Logger();
  uint64_t v203 = *(void *)(v202 - 8);
  uint64_t v204 = v202 - 8;
  unint64_t v205 = (*(void *)(v203 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](rawValue);
  v206 = (char *)&v59 - v205;
  unint64_t v207 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v208 = (char *)&v59 - v207;
  unint64_t v209 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v210 = (char *)&v59 - v209;
  uint64_t v260 = v5;
  char v259 = 0;
  Swift::String v211 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v213 = &v257;
  Swift::String v257 = v211;
  MEMORY[0x25A299110](v258);
  outlined destroy of String();
  if (v258[3])
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
    outlined destroy of Any?((uint64_t)v258);
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
  uint64_t v255 = v181;
  v256 = v180;
  if (validateAppName(text:)(v6))
  {
    Swift::String v174 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    v175 = &v246;
    Swift::String v246 = v174;
    MEMORY[0x25A299110](v247);
    outlined destroy of String();
    if (v247[3])
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
      MEMORY[0x25A299110](v236);
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
      MEMORY[0x25A299110](v230);
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
          char v259 = 1;
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
        id v13 = v143;
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
            _os_log_impl(&dword_255D5C000, v141, (os_log_type_t)v142, "ssid in data directory failed validation: %s", v119, v129);
            destroyStorage<A>(_:count:)(v120, 0, v118);
            destroyStorage<A>(_:count:)(v121, 1, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x25A299260](v119, MEMORY[0x263F8E778]);
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
      uint64_t v26 = v208;
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
      int v36 = v110;
      *v110 = v193;
      v36[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
      swift_retain();
      uint64_t v37 = v107;
      uint64_t v38 = v110;
      v110[2] = v194;
      v38[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
      swift_retain();
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
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
          _os_log_impl(&dword_255D5C000, v112, (os_log_type_t)v113, "sessionID in data directory failed validation: %s", v90, v100);
          destroyStorage<A>(_:count:)(v91, 0, v89);
          destroyStorage<A>(_:count:)(v92, 1, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A299260](v90, MEMORY[0x263F8E778]);
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
    uint64_t v42 = v206;
    uint64_t v43 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v42, v43, v202);
    swift_bridgeObjectRetain();
    uint64_t v75 = 32;
    uint64_t v76 = 7;
    uint64_t v44 = swift_allocObject();
    int v45 = v176;
    uint64_t v77 = v44;
    *(void *)(v44 + 16) = v177;
    *(void *)(v44 + 24) = v45;
    v85 = Logger.logObject.getter();
    int v86 = static os_log_type_t.error.getter();
    v72 = &v253;
    uint64_t v253 = 12;
    unint64_t v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v73 = v254;
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
    id v52 = v83;
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
      v66 = &v252;
      v252 = v63;
      v67 = &v251;
      uint64_t v251 = v64;
      v68 = &v250;
      uint64_t v250 = v65;
      serialize(_:at:)(2, &v252);
      serialize(_:at:)(1, v66);
      v248 = v188;
      uint64_t v249 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
      uint64_t v69 = v57;
      if (v57)
      {
        __break(1u);
      }
      else
      {
        v248 = v189;
        uint64_t v249 = v80;
        closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)&v252, (uint64_t)&v251, (uint64_t)&v250);
        uint64_t v61 = 0;
        v248 = v190;
        uint64_t v249 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)&v252, (uint64_t)&v251, (uint64_t)&v250);
        _os_log_impl(&dword_255D5C000, v85, (os_log_type_t)v86, "AppName in data directory failed validation: %s", v63, v73);
        destroyStorage<A>(_:count:)(v64, 0, v62);
        destroyStorage<A>(_:count:)(v65, 1, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A299260](v63, MEMORY[0x263F8E778]);
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

uint64_t sub_255D61830()
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
  uint64_t v546 = MEMORY[0x270FA5388](data._rawValue);
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
  uint64_t v675 = 0;
  char v674 = 0;
  Swift::Int v668 = 0;
  Swift::Int v662 = 0;
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
  uint64_t v1 = MEMORY[0x270FA5388](v546);
  v528 = (char *)&v145 - v527;
  unint64_t v529 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v530 = (char *)&v145 - v529;
  unint64_t v531 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v532 = (char *)&v145 - v531;
  unint64_t v533 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v534 = (char *)&v145 - v533;
  unint64_t v535 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v536 = (char *)&v145 - v535;
  unint64_t v537 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v538 = (char *)&v145 - v537;
  unint64_t v539 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v540 = (char *)&v145 - v539;
  unint64_t v541 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v542 = (char *)&v145 - v541;
  unint64_t v543 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v544 = (char *)&v145 - v543;
  uint64_t v675 = v17;
  char v674 = 0;
  Swift::String v545 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v547 = &v671;
  Swift::String v671 = v545;
  MEMORY[0x25A299110](v672);
  outlined destroy of String();
  if (v672[3])
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
    outlined destroy of Any?((uint64_t)v672);
    Swift::Int v473 = v145;
    int v474 = 1;
  }
  Swift::Int v669 = v473;
  char v670 = v474 & 1;
  if (v474) {
    Swift::Int v673 = 0;
  }
  else {
    Swift::Int v673 = v669;
  }
  Swift::Int v470 = v673;
  Swift::Int v668 = v673;
  Swift::String v471 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v472 = &v665;
  Swift::String v665 = v471;
  MEMORY[0x25A299110](v666);
  outlined destroy of String();
  if (v666[3])
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
    outlined destroy of Any?((uint64_t)v666);
    Swift::Int v466 = v146;
    int v467 = 1;
  }
  Swift::Int v663 = v466;
  char v664 = v467 & 1;
  if (v467) {
    Swift::Int v667 = 0;
  }
  else {
    Swift::Int v667 = v663;
  }
  Swift::Int v463 = v667;
  Swift::Int v662 = v667;
  Swift::String v464 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v465 = &v659;
  Swift::String v659 = v464;
  MEMORY[0x25A299110](v660);
  outlined destroy of String();
  if (v660[3])
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
    Swift::Int v661 = 0;
  }
  else {
    Swift::Int v661 = v657;
  }
  Swift::Int v456 = v661;
  Swift::Int v656 = v661;
  Swift::String v457 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v458 = &v653;
  Swift::String v653 = v457;
  MEMORY[0x25A299110](v654);
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
  MEMORY[0x25A299110](v648);
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
  MEMORY[0x25A299110](v642);
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
  MEMORY[0x25A299110](v636);
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
  MEMORY[0x25A299110](v630);
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
  MEMORY[0x25A299110](v624);
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
                    char v674 = 1;
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
                    uint64_t v26 = v402;
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
                        _os_log_impl(&dword_255D5C000, v404, (os_log_type_t)v405, "throughput_true in data directory failed validation: %ld", v382, v392);
                        uint64_t v378 = 0;
                        destroyStorage<A>(_:count:)(v383, 0, v380);
                        destroyStorage<A>(_:count:)(v384, v378, MEMORY[0x263F8EE58] + 8);
                        MEMORY[0x25A299260](v382, MEMORY[0x263F8E778]);
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
                  uint64_t v42 = v374;
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
                      _os_log_impl(&dword_255D5C000, v376, (os_log_type_t)v377, "txRate in data directory failed validation: %f", v354, v364);
                      uint64_t v350 = 0;
                      destroyStorage<A>(_:count:)(v355, 0, v352);
                      destroyStorage<A>(_:count:)(v356, v350, MEMORY[0x263F8EE58] + 8);
                      MEMORY[0x25A299260](v354, MEMORY[0x263F8E778]);
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
                    _os_log_impl(&dword_255D5C000, v348, (os_log_type_t)v349, "rxRate in data directory failed validation: %f", v326, v336);
                    uint64_t v322 = 0;
                    destroyStorage<A>(_:count:)(v327, 0, v324);
                    destroyStorage<A>(_:count:)(v328, v322, MEMORY[0x263F8EE58] + 8);
                    MEMORY[0x25A299260](v326, MEMORY[0x263F8E778]);
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
                  _os_log_impl(&dword_255D5C000, v320, (os_log_type_t)v321, "bars in data directory failed validation: %ld", v298, v308);
                  uint64_t v294 = 0;
                  destroyStorage<A>(_:count:)(v299, 0, v296);
                  destroyStorage<A>(_:count:)(v300, v294, MEMORY[0x263F8EE58] + 8);
                  MEMORY[0x25A299260](v298, MEMORY[0x263F8E778]);
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
                _os_log_impl(&dword_255D5C000, v292, (os_log_type_t)v293, "noise in data directory failed validation: %ld", v270, v280);
                uint64_t v266 = 0;
                destroyStorage<A>(_:count:)(v271, 0, v268);
                destroyStorage<A>(_:count:)(v272, v266, MEMORY[0x263F8EE58] + 8);
                MEMORY[0x25A299260](v270, MEMORY[0x263F8E778]);
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
          v262 = v94;
          swift_retain();
          uint64_t v95 = v258;
          uint64_t v96 = v262;
          *v262 = v494;
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
              _os_log_impl(&dword_255D5C000, v264, (os_log_type_t)v265, "rscp in data directory failed validation: %ld", v242, v252);
              uint64_t v238 = 0;
              destroyStorage<A>(_:count:)(v243, 0, v240);
              destroyStorage<A>(_:count:)(v244, v238, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x25A299260](v242, MEMORY[0x263F8E778]);
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
            _os_log_impl(&dword_255D5C000, v236, (os_log_type_t)v237, "rsrq in data directory failed validation: %ld", v214, v224);
            uint64_t v210 = 0;
            destroyStorage<A>(_:count:)(v215, 0, v212);
            destroyStorage<A>(_:count:)(v216, v210, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x25A299260](v214, MEMORY[0x263F8E778]);
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
          _os_log_impl(&dword_255D5C000, v208, (os_log_type_t)v209, "rsrp in data directory failed validation: %ld", v186, v196);
          uint64_t v182 = 0;
          destroyStorage<A>(_:count:)(v187, 0, v184);
          destroyStorage<A>(_:count:)(v188, v182, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A299260](v186, MEMORY[0x263F8E778]);
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
        _os_log_impl(&dword_255D5C000, v180, (os_log_type_t)v181, "rssi in data directory failed validation: %ld", v158, v168);
        uint64_t v154 = 0;
        destroyStorage<A>(_:count:)(v159, 0, v156);
        destroyStorage<A>(_:count:)(v160, v154, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A299260](v158, MEMORY[0x263F8E778]);
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
  id v7 = (id)MEMORY[0x25A299120]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  id v9 = objc_msgSend(v6, sel_initWithPattern_options_error_, v7, a3, v10);
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

uint64_t destroyStorage<A>(_:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    return MEMORY[0x25A299260](v3, a3);
  }
  return result;
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
    v13[3] = MEMORY[0x263F8DBE0];
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
    return (void *)specialized ContiguousArray.init()();
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
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t specialized ContiguousArray.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
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
  size_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_255D671F8()
{
  return swift_deallocObject();
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255D6722C()
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

uint64_t sub_255D67260()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D672AC()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D672F8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_255D67344()
{
  return swift_deallocObject();
}

uint64_t sub_255D67378()
{
  return swift_deallocObject();
}

uint64_t sub_255D673AC()
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

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D673F8()
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

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D67444()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_255D67490()
{
  return swift_deallocObject();
}

uint64_t sub_255D674C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D674F8()
{
  return swift_deallocObject();
}

uint64_t sub_255D67544()
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

uint64_t sub_255D675AC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in checkValidNumericInputRange(data:)()
{
  return implicit closure #11 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D675E0()
{
  return swift_deallocObject();
}

uint64_t sub_255D67614()
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
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v20, v14, (uint64_t)v22, v21, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v15);
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
  uint64_t v9 = MEMORY[0x270FA5388]();
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

uint64_t sub_255D67944()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255D67990()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255D67AC0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in checkValidNumericInputRange(data:)()
{
  return implicit closure #13 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D67AF4()
{
  return swift_deallocObject();
}

uint64_t sub_255D67B28()
{
  return swift_deallocObject();
}

uint64_t sub_255D67B5C()
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

uint64_t sub_255D67BA8()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255D67C5C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #15 in checkValidNumericInputRange(data:)()
{
  return implicit closure #15 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D67C90()
{
  return swift_deallocObject();
}

uint64_t sub_255D67CC4()
{
  return swift_deallocObject();
}

uint64_t sub_255D67CF8()
{
  return swift_deallocObject();
}

uint64_t sub_255D67D44()
{
  return swift_deallocObject();
}

uint64_t sub_255D67DF8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in checkValidNumericInputRange(data:)()
{
  return implicit closure #17 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D67E2C()
{
  return swift_deallocObject();
}

uint64_t sub_255D67E60()
{
  return swift_deallocObject();
}

uint64_t sub_255D67E94()
{
  return swift_deallocObject();
}

uint64_t sub_255D67EE0()
{
  return swift_deallocObject();
}

uint64_t sub_255D67F94()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #19 in checkValidNumericInputRange(data:)()
{
  return implicit closure #19 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D67FC8()
{
  return swift_deallocObject();
}

uint64_t sub_255D67FFC()
{
  return swift_deallocObject();
}

uint64_t sub_255D68030()
{
  return swift_deallocObject();
}

uint64_t sub_255D6807C()
{
  return swift_deallocObject();
}

uint64_t sub_255D68130()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #21 in checkValidNumericInputRange(data:)()
{
  return implicit closure #21 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D68164()
{
  return swift_deallocObject();
}

uint64_t sub_255D68198()
{
  return swift_deallocObject();
}

uint64_t sub_255D681CC()
{
  return swift_deallocObject();
}

uint64_t sub_255D68218()
{
  return swift_deallocObject();
}

uint64_t sub_255D682CC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #23 in checkValidNumericInputRange(data:)()
{
  return implicit closure #23 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_255D68300()
{
  return swift_deallocObject();
}

uint64_t sub_255D68334()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_255D68390()
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

uint64_t sub_255D68448()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D68494()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #25 in checkValidNumericInputRange(data:)()
{
  return implicit closure #25 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_255D684C8()
{
  return swift_deallocObject();
}

uint64_t sub_255D684FC()
{
  return swift_deallocObject();
}

uint64_t sub_255D68530()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D6857C()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D685C8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #27 in checkValidNumericInputRange(data:)()
{
  return implicit closure #27 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D685FC()
{
  return swift_deallocObject();
}

uint64_t sub_255D68630()
{
  return swift_deallocObject();
}

uint64_t sub_255D68664()
{
  return swift_deallocObject();
}

uint64_t sub_255D686B0()
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

uint64_t _MLServiceS.modelName.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____MLServiceS_modelName);
  swift_bridgeObjectRetain();
  return v2;
}

void *_MLServiceS.connection.getter()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____MLServiceS_connection);
  id v1 = v3;
  return v3;
}

uint64_t _MLServiceS.service.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____MLServiceS_service);
  swift_unknownObjectRetain();
  return v2;
}

uint64_t static _MLServiceS.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = _MLServiceS.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

id _MLServiceS.__allocating_init(nameOfModel:)(uint64_t a1, uint64_t a2)
{
  id v3 = objc_allocWithZone(v2);
  return _MLServiceS.init(nameOfModel:)(a1, a2);
}

uint64_t closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  id v34 = a1;
  v40 = partial apply for implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:);
  uint64_t v42 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  uint64_t v46 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  uint64_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v66 = 0;
  uint64_t v28 = 0;
  uint64_t v33 = type metadata accessor for Logger();
  uint64_t v31 = *(void *)(v33 - 8);
  uint64_t v32 = v33 - 8;
  unint64_t v29 = (*(void *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (char *)v19 - v29;
  uint64_t v30 = (char *)v19 - v29;
  uint64_t v66 = MEMORY[0x270FA5388](v34);
  uint64_t v2 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v1, v2, v33);
  id v3 = v34;
  uint64_t v44 = 7;
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v34;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v57 = Logger.logObject.getter();
  int v58 = static os_log_type_t.error.getter();
  uint64_t v37 = &v64;
  uint64_t v64 = 12;
  unint64_t v35 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v36 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v38 = v65;
  uint64_t v39 = 17;
  uint64_t v49 = swift_allocObject();
  *(unsigned char *)(v49 + 16) = 64;
  uint64_t v51 = swift_allocObject();
  *(unsigned char *)(v51 + 16) = 8;
  uint64_t v43 = 32;
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v41;
  uint64_t v45 = v4;
  *(void *)(v4 + 16) = v40;
  *(void *)(v4 + 24) = v5;
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v45;
  uint64_t v47 = v6;
  *(void *)(v6 + 16) = v42;
  *(void *)(v6 + 24) = v7;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v47;
  uint64_t v54 = v8;
  *(void *)(v8 + 16) = v46;
  *(void *)(v8 + 24) = v9;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v52 = _allocateUninitializedArray<A>(_:)();
  uint64_t v55 = v10;
  swift_retain();
  uint64_t v11 = v49;
  uint64_t v12 = v55;
  *uint64_t v55 = v48;
  v12[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
  swift_retain();
  uint64_t v13 = v51;
  uint64_t v14 = v55;
  v55[2] = v50;
  v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
  swift_retain();
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v54;
  unint64_t v16 = v55;
  v55[4] = v53;
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v57, (os_log_type_t)v58))
  {
    uint64_t v17 = v28;
    uint64_t v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v22 = createStorage<A>(capacity:type:)(1);
    uint64_t v23 = createStorage<A>(capacity:type:)(0);
    uint64_t v24 = &v63;
    uint64_t v63 = v21;
    uint64_t v25 = &v62;
    uint64_t v62 = v22;
    uint64_t v26 = &v61;
    uint64_t v61 = v23;
    serialize(_:at:)(2, &v63);
    serialize(_:at:)(1, v24);
    uint64_t v59 = v48;
    uint64_t v60 = v49;
    closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
    uint64_t v27 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      uint64_t v59 = v50;
      uint64_t v60 = v51;
      closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
      v19[1] = 0;
      uint64_t v59 = v53;
      uint64_t v60 = v54;
      closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
      _os_log_impl(&dword_255D5C000, v57, (os_log_type_t)v58, "Received error: %@", v21, v38);
      destroyStorage<A>(_:count:)(v22, 1, v20);
      destroyStorage<A>(_:count:)(v23, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v21, MEMORY[0x263F8E778]);
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

  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v33);
}

uint64_t sub_255D697A4()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  return closure #1 in _MLServiceS.init(nameOfModel:)(a1);
}

void *implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ()(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v2 = a2;
  v4(a2);

  return swift_release();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_255D698B0()
{
  return swift_deallocObject();
}

uint64_t _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v15 = 0;
  uint64_t v20 = &async function pointer to partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v21 = (char *)&v15 - v16;
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  uint64_t v22 = v2;
  uint64_t v5 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 56))(v21, 1);
  id v6 = v2;
  outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?(v17);
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v17;
  uint64_t v9 = v18;
  uint64_t v10 = ObjectType;
  uint64_t v11 = (uint64_t)v20;
  uint64_t v12 = (void *)v7;
  uint64_t v13 = (uint64_t)v21;
  v12[2] = 0;
  v12[3] = 0;
  void v12[4] = v2;
  v12[5] = v8;
  v12[6] = v9;
  v12[7] = v10;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v13, v11, (uint64_t)v12, MEMORY[0x263F8EE60] + 8);
  return swift_release();
}

uint64_t closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[15] = a7;
  v7[14] = a6;
  v7[13] = a5;
  v7[12] = a4;
  v7[10] = v7;
  v7[11] = 0;
  v7[8] = 0;
  v7[9] = 0;
  v7[11] = a4;
  v7[8] = a5;
  v7[9] = a6;
  return MEMORY[0x270FA2498](closure #1 in _MLServiceS.getModelStats(completionHandler:), 0);
}

uint64_t closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  uint64_t v1 = *(void *)(v0 + 96);
  *(void *)(v0 + 80) = v0;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____MLServiceS_service);
  swift_unknownObjectRetain();
  if (!v10) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v7 = *(void *)(v9 + 120);
  uint64_t v6 = *(void *)(v9 + 112);
  uint64_t v5 = *(void *)(v9 + 104);
  swift_getObjectType();
  outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?(v5);
  id v2 = (void *)swift_allocObject();
  v2[2] = v5;
  v2[3] = v6;
  v2[4] = v7;
  *(void *)(v9 + 48) = partial apply for closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:);
  *(void *)(v9 + 56) = v2;
  *(void *)(v9 + 16) = MEMORY[0x263EF8330];
  *(_DWORD *)(v9 + 24) = 1107296256;
  *(_DWORD *)(v9 + 28) = 0;
  *(void *)(v9 + 32) = thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]?) -> ();
  *(void *)(v9 + 40) = &block_descriptor_147;
  uint64_t aBlock = _Block_copy((const void *)(v9 + 16));
  swift_release();
  objc_msgSend(v10, sel_getModelStatsWith_, aBlock);
  _Block_release(aBlock);
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v9 + 80) + 8);
  return v3();
}

uint64_t sub_255D69D5C()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v11 = v1[7];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:);
  return closure #1 in _MLServiceS.getModelStats(completionHandler:)(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t partial apply for closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = a1;
  uint64_t v41 = (void (*)(uint64_t))a2;
  uint64_t v40 = a3;
  uint64_t v53 = partial apply for implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:);
  uint64_t v57 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v59 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v61 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v64 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v84 = 0;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v39 = 0;
  uint64_t v46 = type metadata accessor for Logger();
  uint64_t v44 = *(void *)(v46 - 8);
  uint64_t v45 = v46 - 8;
  unint64_t v42 = (*(void *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = (char *)&v20 - v42;
  uint64_t v43 = (char *)&v20 - v42;
  uint64_t v84 = MEMORY[0x270FA5388](v47);
  uint64_t v82 = v4;
  uint64_t v83 = v5;
  uint64_t v6 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v3, v6, v46);
  swift_bridgeObjectRetain();
  uint64_t v55 = 7;
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v47;
  v68 = Logger.logObject.getter();
  int v69 = static os_log_type_t.debug.getter();
  uint64_t v50 = &v80;
  uint64_t v80 = 12;
  unint64_t v48 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v49 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v51 = v81;
  uint64_t v52 = 17;
  uint64_t v60 = swift_allocObject();
  *(unsigned char *)(v60 + 16) = 32;
  uint64_t v62 = swift_allocObject();
  *(unsigned char *)(v62 + 16) = 8;
  uint64_t v54 = 32;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v56;
  uint64_t v58 = v7;
  *(void *)(v7 + 16) = v53;
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v58;
  uint64_t v65 = v9;
  *(void *)(v9 + 16) = v57;
  *(void *)(v9 + 24) = v10;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v63 = _allocateUninitializedArray<A>(_:)();
  uint64_t v66 = v11;
  swift_retain();
  uint64_t v12 = v60;
  uint64_t v13 = v66;
  *uint64_t v66 = v59;
  v13[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  swift_retain();
  uint64_t v14 = v62;
  uint64_t v15 = v66;
  v66[2] = v61;
  v15[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v65;
  uint64_t v17 = v66;
  v66[4] = v64;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v68, (os_log_type_t)v69))
  {
    uint64_t v18 = v39;
    uint64_t v32 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v33 = createStorage<A>(capacity:type:)(0);
    uint64_t v34 = createStorage<A>(capacity:type:)(1);
    unint64_t v35 = &v74;
    uint64_t v74 = v32;
    unint64_t v36 = &v73;
    uint64_t v73 = v33;
    uint64_t v37 = &v72;
    uint64_t v72 = v34;
    serialize(_:at:)(2, &v74);
    serialize(_:at:)(1, v35);
    unint64_t v70 = v59;
    uint64_t v71 = v60;
    closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)v35, (uint64_t)v36, (uint64_t)v37);
    uint64_t v38 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      unint64_t v70 = v61;
      uint64_t v71 = v62;
      closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      uint64_t v30 = 0;
      unint64_t v70 = v64;
      uint64_t v71 = v65;
      closure #1 in osLogInternal(_:log:type:)(&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      _os_log_impl(&dword_255D5C000, v68, (os_log_type_t)v69, "Response from XPC service: %s", v32, v51);
      destroyStorage<A>(_:count:)(v33, 0, v31);
      destroyStorage<A>(_:count:)(v34, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v32, MEMORY[0x263F8E778]);
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

  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v46);
  uint64_t v79 = v47;
  BOOL v29 = v47 != 0;
  if (v47)
  {
    uint64_t result = outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v41);
    if (v41)
    {
      uint64_t v27 = (uint64_t)v41;
      uint64_t v28 = v40;
      uint64_t v26 = v40;
      uint64_t v25 = v41;
      uint64_t v75 = (uint64_t)v41;
      uint64_t v76 = v40;
      swift_retain();
      v25(v47);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    uint64_t result = outlined copy of (@escaping @callee_guaranteed @Sendable (@guaranteed [String : Any]?) -> ())?((uint64_t)v41);
    if (v41)
    {
      uint64_t v23 = (uint64_t)v41;
      uint64_t v24 = v40;
      uint64_t v22 = v40;
      uint64_t v21 = v41;
      uint64_t v77 = (uint64_t)v41;
      uint64_t v78 = v40;
      swift_retain();
      v21(0);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  if (a1)
  {
    uint64_t v3 = Dictionary.description.getter();
    uint64_t v4 = v1;
    swift_bridgeObjectRelease();
    uint64_t v5 = v3;
    uint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  if (v6) {
    return v5;
  }
  uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("No model stats provided", 0x17uLL, 1)._countAndFlagsBits;
  outlined destroy of String?();
  return countAndFlagsBits;
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
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

void thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v3 = isa;
  }
  else
  {
    Class v3 = 0;
  }
  (*(void (**)(void))(a2 + 16))();
}

uint64_t sub_255D6AED4()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSDictionary?) -> ()(a1, *(void *)(v1 + 16));
}

Swift::Double __swiftcall _MLServiceS.getPrediction(inputFeatures:)(Swift::OpaquePointer inputFeatures)
{
  uint64_t ObjectType = swift_getObjectType();
  rawValue = inputFeatures._rawValue;
  uint64_t v24 = v1;
  uint64_t v15 = swift_allocObject();
  uint64_t v23 = v15 + 16;
  *(void *)(v15 + 16) = 0;
  if (checkValidInterfaceType(data:)(inputFeatures))
  {
    uint64_t v11 = *(void **)(v12 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v11)
    {
      uint64_t v10 = v11;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_getObjectType();
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_retain();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v15;
    *(void *)(v2 + 24) = ObjectType;
    uint64_t v21 = partial apply for closure #1 in _MLServiceS.getPrediction(inputFeatures:);
    uint64_t v22 = v2;
    uint64_t aBlock = MEMORY[0x263EF8330];
    int v17 = 1107296256;
    int v18 = 0;
    uint64_t v19 = thunk for @escaping @callee_guaranteed (@unowned Double) -> ();
    uint64_t v20 = &block_descriptor_22;
    uint64_t v7 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v10, sel_getPredictionWithInputFeatures_with_, isa, v7);
    _Block_release(v7);

    swift_unknownObjectRelease();
    swift_beginAccess();
    double v9 = *(double *)(v15 + 16);
    swift_endAccess();
    if (v9 < 0.0)
    {
      swift_beginAccess();
      *(void *)(v15 + 16) = 0;
      swift_endAccess();
    }
    swift_beginAccess();
    double v5 = *(double *)(v15 + 16);
    swift_endAccess();
    swift_release();
    return v5;
  }
  else
  {
    double v4 = *(double *)(v15 + 16);
    swift_release();
    return v4;
  }
}

uint64_t sub_255D6B27C()
{
  return swift_deallocObject();
}

uint64_t closure #1 in _MLServiceS.getPrediction(inputFeatures:)(uint64_t a1, double a2)
{
  double v38 = a2;
  uint64_t v32 = a1;
  uint64_t v44 = partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:);
  unint64_t v48 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v70 = 0;
  uint64_t v69 = 0;
  uint64_t v31 = 0;
  uint64_t v37 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v37 - 8);
  uint64_t v36 = v37 - 8;
  unint64_t v33 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v32);
  Class v3 = (char *)v19 - v33;
  uint64_t v34 = (char *)v19 - v33;
  uint64_t v70 = v4;
  uint64_t v69 = v2 + 16;
  uint64_t v5 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v3, v5, v37);
  uint64_t v46 = 7;
  uint64_t v47 = swift_allocObject();
  *(double *)(v47 + 16) = v38;
  uint64_t v59 = Logger.logObject.getter();
  int v60 = static os_log_type_t.debug.getter();
  uint64_t v41 = &v67;
  uint64_t v67 = 12;
  unint64_t v39 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v40 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v42 = v68;
  uint64_t v43 = 17;
  uint64_t v51 = swift_allocObject();
  *(unsigned char *)(v51 + 16) = 0;
  uint64_t v53 = swift_allocObject();
  *(unsigned char *)(v53 + 16) = 8;
  uint64_t v45 = 32;
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v47;
  uint64_t v49 = v6;
  *(void *)(v6 + 16) = v44;
  *(void *)(v6 + 24) = v7;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v49;
  uint64_t v56 = v8;
  *(void *)(v8 + 16) = v48;
  *(void *)(v8 + 24) = v9;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v54 = _allocateUninitializedArray<A>(_:)();
  uint64_t v57 = v10;
  swift_retain();
  uint64_t v11 = v51;
  uint64_t v12 = v57;
  *uint64_t v57 = v50;
  v12[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
  swift_retain();
  uint64_t v13 = v53;
  uint64_t v14 = v57;
  v57[2] = v52;
  v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
  swift_retain();
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v56;
  unint64_t v16 = v57;
  v57[4] = v55;
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v59, (os_log_type_t)v60))
  {
    uint64_t v17 = v31;
    uint64_t v24 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v23 = 0;
    uint64_t v25 = createStorage<A>(capacity:type:)(0);
    uint64_t v26 = createStorage<A>(capacity:type:)(v23);
    uint64_t v27 = &v65;
    uint64_t v65 = v24;
    uint64_t v28 = &v64;
    uint64_t v64 = v25;
    BOOL v29 = &v63;
    uint64_t v63 = v26;
    serialize(_:at:)(0, &v65);
    serialize(_:at:)(1, v27);
    uint64_t v61 = v50;
    uint64_t v62 = v51;
    closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29);
    uint64_t v30 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      uint64_t v61 = v52;
      uint64_t v62 = v53;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
      uint64_t v21 = 0;
      uint64_t v61 = v55;
      uint64_t v62 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
      _os_log_impl(&dword_255D5C000, v59, (os_log_type_t)v60, "Response from XPC service: %f", v24, v42);
      uint64_t v20 = 0;
      destroyStorage<A>(_:count:)(v25, 0, v22);
      destroyStorage<A>(_:count:)(v26, v20, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v24, MEMORY[0x263F8E778]);
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

  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v37);
  v19[1] = &v66;
  swift_beginAccess();
  *(double *)(v32 + 16) = v38;
  return swift_endAccess();
}

uint64_t sub_255D6B970()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getPrediction(inputFeatures:)(double a1)
{
  return closure #1 in _MLServiceS.getPrediction(inputFeatures:)(*(void *)(v1 + 16), a1);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Double) -> ()(uint64_t a1, double a2)
{
  uint64_t v5 = *(void (**)(uint64_t, double))(a1 + 32);
  uint64_t v2 = swift_retain();
  v5(v2, a2);
  return swift_release();
}

uint64_t block_copy_helper_20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_21()
{
  return swift_release();
}

Swift::OpaquePointer_optional __swiftcall _MLServiceS.getPredictionDictionary(withInputFeatures:)(Swift::OpaquePointer withInputFeatures)
{
  uint64_t ObjectType = swift_getObjectType();
  rawValue = withInputFeatures._rawValue;
  uint64_t v24 = v1;
  uint64_t v15 = swift_allocObject();
  uint64_t v23 = v15 + 16;
  *(void *)(v15 + 16) = 0;
  if (checkValidInterfaceType(data:)(withInputFeatures))
  {
    uint64_t v11 = *(void **)(v12 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v11)
    {
      uint64_t v10 = v11;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_getObjectType();
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    swift_retain();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v15;
    *(void *)(v2 + 24) = ObjectType;
    uint64_t v21 = partial apply for closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:);
    uint64_t v22 = v2;
    uint64_t aBlock = MEMORY[0x263EF8330];
    int v17 = 1107296256;
    int v18 = 0;
    uint64_t v19 = thunk for @escaping @callee_guaranteed (@guaranteed [String : Any]) -> ();
    uint64_t v20 = &block_descriptor_31;
    uint64_t v6 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v10, sel_getPredictionDictionaryWithInputFeatures_with_, isa, v6);
    _Block_release(v6);

    swift_unknownObjectRelease();
    swift_beginAccess();
    uint64_t v8 = *(void **)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_endAccess();
    swift_release();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v5 = *(void **)(v15 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v9 = v5;
  }
  uint64_t v4 = v9;
  result.value._rawValue = v4;
  result.is_nil = v3;
  return result;
}

uint64_t sub_255D6BDEC()
{
  return swift_deallocObject();
}

uint64_t closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a1;
  uint64_t v30 = a2;
  uint64_t v37 = partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:);
  uint64_t v44 = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  unint64_t v48 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v52 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v70 = 0;
  uint64_t v69 = 0;
  uint64_t v29 = 0;
  uint64_t v35 = type metadata accessor for Logger();
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v34 = v35 - 8;
  unint64_t v31 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (char *)v20 - v31;
  uint64_t v32 = (char *)v20 - v31;
  uint64_t v70 = MEMORY[0x270FA5388](v36);
  uint64_t v69 = v3 + 16;
  uint64_t v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v2, v4, v35);
  swift_bridgeObjectRetain();
  uint64_t v46 = 7;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v36;
  swift_retain();
  uint64_t v45 = 32;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v38;
  uint64_t v47 = v5;
  *(void *)(v5 + 16) = v37;
  *(void *)(v5 + 24) = v6;
  swift_release();
  uint64_t v59 = Logger.logObject.getter();
  int v60 = static os_log_type_t.debug.getter();
  uint64_t v41 = &v67;
  uint64_t v67 = 12;
  unint64_t v39 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v40 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v42 = v68;
  uint64_t v43 = 17;
  uint64_t v51 = swift_allocObject();
  *(unsigned char *)(v51 + 16) = 32;
  uint64_t v53 = swift_allocObject();
  *(unsigned char *)(v53 + 16) = 8;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v47;
  uint64_t v49 = v7;
  *(void *)(v7 + 16) = v44;
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v49;
  uint64_t v56 = v9;
  *(void *)(v9 + 16) = v48;
  *(void *)(v9 + 24) = v10;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v54 = _allocateUninitializedArray<A>(_:)();
  uint64_t v57 = v11;
  swift_retain();
  uint64_t v12 = v51;
  uint64_t v13 = v57;
  *uint64_t v57 = v50;
  v13[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  swift_retain();
  uint64_t v14 = v53;
  uint64_t v15 = v57;
  v57[2] = v52;
  v15[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v56;
  int v17 = v57;
  v57[4] = v55;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v59, (os_log_type_t)v60))
  {
    uint64_t v18 = v29;
    uint64_t v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v23 = createStorage<A>(capacity:type:)(0);
    uint64_t v24 = createStorage<A>(capacity:type:)(1);
    uint64_t v25 = &v65;
    uint64_t v65 = v22;
    uint64_t v26 = &v64;
    uint64_t v64 = v23;
    uint64_t v27 = &v63;
    uint64_t v63 = v24;
    serialize(_:at:)(2, &v65);
    serialize(_:at:)(1, v25);
    uint64_t v61 = v50;
    uint64_t v62 = v51;
    closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27);
    uint64_t v28 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      uint64_t v61 = v52;
      uint64_t v62 = v53;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
      v20[2] = 0;
      uint64_t v61 = v55;
      uint64_t v62 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v61, (uint64_t)&v65, (uint64_t)&v64, (uint64_t)&v63);
      _os_log_impl(&dword_255D5C000, v59, (os_log_type_t)v60, "Response from XPC service: %s", v22, v42);
      destroyStorage<A>(_:count:)(v23, 0, v21);
      destroyStorage<A>(_:count:)(v24, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v22, MEMORY[0x263F8E778]);
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

  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
  swift_bridgeObjectRetain();
  v20[1] = &v66;
  swift_beginAccess();
  *(void *)(v30 + 16) = v36;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_255D6C564()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(uint64_t a1)
{
  return closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(a1, *(void *)(v1 + 16));
}

uint64_t implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t block_copy_helper_29(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_30()
{
  return swift_release();
}

Swift::Void __swiftcall _MLServiceS.write(data:)(Swift::OpaquePointer data)
{
  v138._rawValue = data._rawValue;
  uint64_t v127 = v1;
  uint64_t v113 = 0;
  uint64_t v139 = partial apply for implicit closure #1 in _MLServiceS.write(data:);
  Swift::Int v147 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
  double v151 = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
  Swift::Int v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  uint64_t v155 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v158 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  uint64_t v102 = partial apply for implicit closure #3 in _MLServiceS.write(data:);
  uint64_t v103 = _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0;
  uint64_t v104 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v105 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  uint64_t v107 = partial apply for closure #1 in _MLServiceS.write(data:);
  uint64_t v108 = "Fatal error";
  uint64_t v109 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v110 = "MediaMLServices/MLService.swift";
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v188 = 0;
  uint64_t v187 = 0;
  uint64_t v186 = 0;
  uint64_t v185 = 0;
  uint64_t v112 = 0;
  uint64_t v114 = type metadata accessor for DispatchTime();
  int v116 = *(void **)(v114 - 8);
  uint64_t v115 = v114 - 8;
  uint64_t v117 = v116;
  uint64_t v118 = v116[8];
  unint64_t v119 = (v118 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  uint64_t v120 = (char *)&v46 - v119;
  unint64_t v121 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v122 = (char *)&v46 - v121;
  unint64_t v123 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v124 = (char *)&v46 - v123;
  uint64_t v188 = (char *)&v46 - v123;
  unint64_t v125 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  unint64_t v126 = (char *)&v46 - v125;
  uint64_t v187 = (char *)&v46 - v125;
  uint64_t v135 = type metadata accessor for Logger();
  uint64_t v133 = *(void **)(v135 - 8);
  uint64_t v134 = v135 - 8;
  uint64_t v129 = v133[8];
  unint64_t v128 = (v129 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v138._rawValue);
  uint64_t v130 = (char *)&v46 - v128;
  unint64_t v131 = (v129 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v46 - v131;
  uint64_t v132 = (char *)&v46 - v131;
  uint64_t v186 = v9;
  uint64_t v185 = v11;
  uint64_t v12 = _MLServiceS.logger.unsafeMutableAddressor();
  uint64_t v136 = (void (*)(char *, uint64_t, uint64_t))v133[2];
  uint64_t v137 = v133 + 2;
  v136(v10, v12, v135);
  swift_bridgeObjectRetain();
  uint64_t v149 = 7;
  uint64_t v140 = (Swift::OpaquePointer *)swift_allocObject();
  v140[2]._rawValue = v138._rawValue;
  swift_retain();
  uint64_t v148 = 32;
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v140;
  uint64_t v150 = v13;
  *(void *)(v13 + 16) = v139;
  *(void *)(v13 + 24) = v14;
  swift_release();
  Swift::String v162 = Logger.logObject.getter();
  int v163 = static os_log_type_t.debug.getter();
  uint64_t v143 = &v183;
  uint64_t v183 = 12;
  unint64_t v141 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v142 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v144 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v145 = v184;
  uint64_t v146 = 17;
  uint64_t v154 = swift_allocObject();
  *(unsigned char *)(v154 + 16) = 32;
  uint64_t v156 = swift_allocObject();
  *(unsigned char *)(v156 + 16) = 8;
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v150;
  uint64_t v152 = v15;
  *(void *)(v15 + 16) = v147;
  *(void *)(v15 + 24) = v16;
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v152;
  uint64_t v159 = v17;
  *(void *)(v17 + 16) = v151;
  *(void *)(v17 + 24) = v18;
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v157 = _allocateUninitializedArray<A>(_:)();
  uint64_t v160 = v19;
  swift_retain();
  uint64_t v20 = v154;
  uint64_t v21 = v160;
  *uint64_t v160 = v153;
  v21[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
  swift_retain();
  uint64_t v22 = v156;
  uint64_t v23 = v160;
  v160[2] = v155;
  v23[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22;
  swift_retain();
  uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v159;
  uint64_t v25 = v160;
  v160[4] = v158;
  v25[5] = v24;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v162, (os_log_type_t)v163))
  {
    uint64_t v26 = v112;
    uint64_t v95 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v96 = createStorage<A>(capacity:type:)(0);
    uint64_t v97 = createStorage<A>(capacity:type:)(1);
    unint64_t v98 = &v168;
    uint32_t v168 = v95;
    v99 = &v167;
    uint64_t v167 = v96;
    uint32_t v100 = &v166;
    uint64_t v166 = v97;
    serialize(_:at:)(2, &v168);
    serialize(_:at:)(1, v98);
    uint64_t v164 = v153;
    uint64_t v165 = v154;
    closure #1 in osLogInternal(_:log:type:)(&v164, (uint64_t)v98, (uint64_t)v99, (uint64_t)v100);
    uint64_t v101 = v26;
    if (v26)
    {
      __break(1u);
    }
    else
    {
      uint64_t v164 = v155;
      uint64_t v165 = v156;
      closure #1 in osLogInternal(_:log:type:)(&v164, (uint64_t)&v168, (uint64_t)&v167, (uint64_t)&v166);
      uint64_t v92 = 0;
      uint64_t v28 = v92;
      uint64_t v164 = v158;
      uint64_t v165 = v159;
      closure #1 in osLogInternal(_:log:type:)(&v164, (uint64_t)&v168, (uint64_t)&v167, (uint64_t)&v166);
      uint64_t v91 = v28;
      _os_log_impl(&dword_255D5C000, v162, (os_log_type_t)v163, "Calling write function with data dictionary: %s", v95, v145);
      destroyStorage<A>(_:count:)(v96, 0, v94);
      destroyStorage<A>(_:count:)(v97, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v95, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      uint64_t v93 = v91;
    }
  }
  else
  {
    uint64_t v27 = v112;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v93 = v27;
  }
  uint64_t v87 = v93;

  uint64_t v88 = (void (*)(char *, uint64_t))v133[1];
  uint64_t v89 = v133 + 1;
  v88(v132, v135);
  static DispatchTime.now()();
  BOOL v90 = checkValidThroughputTrue(data:)(v138);
  swift_bridgeObjectRetain();
  BOOL v86 = v90 && checkValidInterfaceType(data:)(v138);
  BOOL v85 = v86;
  swift_bridgeObjectRelease();
  if (v85)
  {
    uint64_t v29 = v130;
    static DispatchTime.now()();
    uint64_t v30 = _MLServiceS.logger.unsafeMutableAddressor();
    v136(v29, v30, v135);
    uint64_t v67 = v117;
    char v66 = (void (*)(char *, char *, uint64_t))v116[2];
    uint64_t v65 = v116 + 2;
    v66(v122, v124, v114);
    v66(v120, v126, v114);
    uint64_t v31 = *((_DWORD *)v67 + 20);
    uint64_t v68 = (v31 + 16) & ~v31;
    uint64_t v75 = 7;
    uint64_t v69 = (v68 + v118 + v31) & ~v31;
    uint64_t v76 = swift_allocObject();
    uint64_t v71 = (void (*)(uint64_t, char *, uint64_t))v116[4];
    uint64_t v70 = v116 + 4;
    v71(v76 + v68, v122, v114);
    v71(v76 + v69, v120, v114);
    uint64_t v83 = Logger.logObject.getter();
    int v84 = static os_log_type_t.info.getter();
    uint64_t v181 = 12;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v72 = v182;
    uint64_t v73 = 17;
    uint64_t v78 = swift_allocObject();
    *(unsigned char *)(v78 + 16) = 0;
    uint64_t v79 = swift_allocObject();
    *(unsigned char *)(v79 + 16) = 8;
    uint64_t v74 = 32;
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v76;
    uint64_t v77 = v32;
    *(void *)(v32 + 16) = v102;
    *(void *)(v32 + 24) = v33;
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = v77;
    uint64_t v81 = v34;
    *(void *)(v34 + 16) = v103;
    *(void *)(v34 + 24) = v35;
    uint64_t v80 = _allocateUninitializedArray<A>(_:)();
    uint64_t v82 = v36;
    swift_retain();
    uint64_t v37 = v78;
    uint64_t v38 = v82;
    *uint64_t v82 = v104;
    v38[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
    swift_retain();
    uint64_t v39 = v79;
    unint64_t v40 = v82;
    v82[2] = v105;
    v40[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39;
    swift_retain();
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
    uint32_t v42 = v82;
    v82[4] = v106;
    v42[5] = v41;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v83, (os_log_type_t)v84))
    {
      uint64_t v43 = v87;
      uint64_t v58 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v57 = 0;
      uint64_t v59 = createStorage<A>(capacity:type:)(0);
      uint64_t v60 = createStorage<A>(capacity:type:)(v57);
      uint64_t v61 = &v173;
      uint64_t v173 = v58;
      uint64_t v62 = &v172;
      uint64_t v172 = v59;
      uint64_t v63 = &v171;
      uint64_t v171 = v60;
      serialize(_:at:)(0, &v173);
      serialize(_:at:)(1, v61);
      uint64_t v169 = v104;
      uint64_t v170 = v78;
      closure #1 in osLogInternal(_:log:type:)(&v169, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63);
      uint64_t v64 = v43;
      if (v43)
      {
        __break(1u);
      }
      else
      {
        uint64_t v169 = v105;
        uint64_t v170 = v79;
        closure #1 in osLogInternal(_:log:type:)(&v169, (uint64_t)&v173, (uint64_t)&v172, (uint64_t)&v171);
        uint64_t v55 = 0;
        uint64_t v169 = v106;
        uint64_t v170 = v81;
        closure #1 in osLogInternal(_:log:type:)(&v169, (uint64_t)&v173, (uint64_t)&v172, (uint64_t)&v171);
        _os_log_impl(&dword_255D5C000, v83, (os_log_type_t)v84, "Validity check in MLService Time taken = %f [ns]", v58, v72);
        uint64_t v54 = 0;
        destroyStorage<A>(_:count:)(v59, 0, v56);
        destroyStorage<A>(_:count:)(v60, v54, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A299260](v58, MEMORY[0x263F8E778]);
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

    v88(v130, v135);
    uint64_t v53 = *(void **)(v127 + OBJC_IVAR____MLServiceS_service);
    swift_unknownObjectRetain();
    if (v53)
    {
      uint64_t v52 = v53;
    }
    else
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    id v49 = v52;
    swift_getObjectType();
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v44 = swift_allocObject();
    uint64_t v45 = v107;
    *(void *)(v44 + 16) = ObjectType;
    uint64_t v179 = v45;
    uint64_t v180 = v44;
    uint64_t aBlock = MEMORY[0x263EF8330];
    int v175 = 1107296256;
    int v176 = 0;
    uint64_t v177 = thunk for @escaping @callee_guaranteed (@guaranteed String) -> ();
    uint64_t v178 = &block_descriptor_73;
    uint64_t v47 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v49, sel_writeWithData_with_, isa, v47);
    _Block_release(v47);

    swift_unknownObjectRelease();
    uint64_t v51 = (void (*)(char *, uint64_t))v116[1];
    uint64_t v50 = v116 + 1;
    v51(v124, v114);
    v51(v126, v114);
  }
  else
  {
    ((void (*)(char *, uint64_t))v116[1])(v126, v114);
  }
}

uint64_t implicit closure #1 in _MLServiceS.write(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_255D6DD2C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in _MLServiceS.write(data:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in _MLServiceS.write(data:)(*(void *)(v1 + 16), a1);
}

uint64_t implicit closure #3 in _MLServiceS.write(data:)()
{
  unint64_t v2 = DispatchTime.uptimeNanoseconds.getter();
  unint64_t v0 = DispatchTime.uptimeNanoseconds.getter();
  uint64_t result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t closure #1 in _MLServiceS.write(data:)(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint32_t v42 = partial apply for implicit closure #1 in closure #1 in _MLServiceS.write(data:);
  uint64_t v46 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  unint64_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v29 = 0;
  uint64_t v34 = type metadata accessor for Logger();
  uint64_t v32 = *(void *)(v34 - 8);
  uint64_t v33 = v34 - 8;
  unint64_t v30 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v2 = (char *)v20 - v30;
  uint64_t v31 = (char *)v20 - v30;
  uint64_t v66 = MEMORY[0x270FA5388](v35);
  uint64_t v67 = v3;
  uint64_t v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v2, v4, v34);
  swift_bridgeObjectRetain();
  uint64_t v43 = 32;
  uint64_t v44 = 7;
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v36;
  uint64_t v45 = v5;
  *(void *)(v5 + 16) = v35;
  *(void *)(v5 + 24) = v6;
  uint64_t v57 = Logger.logObject.getter();
  int v58 = static os_log_type_t.debug.getter();
  uint64_t v39 = &v64;
  uint64_t v64 = 12;
  unint64_t v37 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v38 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v40 = v65;
  uint64_t v41 = 17;
  uint64_t v49 = swift_allocObject();
  *(unsigned char *)(v49 + 16) = 32;
  uint64_t v51 = swift_allocObject();
  *(unsigned char *)(v51 + 16) = 8;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v45;
  uint64_t v47 = v7;
  *(void *)(v7 + 16) = v42;
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v47;
  uint64_t v54 = v9;
  *(void *)(v9 + 16) = v46;
  *(void *)(v9 + 24) = v10;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v52 = _allocateUninitializedArray<A>(_:)();
  uint64_t v55 = v11;
  swift_retain();
  uint64_t v12 = v49;
  uint64_t v13 = v55;
  *uint64_t v55 = v48;
  v13[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  swift_retain();
  uint64_t v14 = v51;
  uint64_t v15 = v55;
  v55[2] = v50;
  v15[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v54;
  uint64_t v17 = v55;
  v55[4] = v53;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v57, (os_log_type_t)v58))
  {
    uint64_t v18 = v29;
    uint64_t v22 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v23 = createStorage<A>(capacity:type:)(0);
    uint64_t v24 = createStorage<A>(capacity:type:)(1);
    uint64_t v25 = &v63;
    uint64_t v63 = v22;
    uint64_t v26 = &v62;
    uint64_t v62 = v23;
    uint64_t v27 = &v61;
    uint64_t v61 = v24;
    serialize(_:at:)(2, &v63);
    serialize(_:at:)(1, v25);
    uint64_t v59 = v48;
    uint64_t v60 = v49;
    closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27);
    uint64_t v28 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      uint64_t v59 = v50;
      uint64_t v60 = v51;
      closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
      v20[1] = 0;
      uint64_t v59 = v53;
      uint64_t v60 = v54;
      closure #1 in osLogInternal(_:log:type:)(&v59, (uint64_t)&v63, (uint64_t)&v62, (uint64_t)&v61);
      _os_log_impl(&dword_255D5C000, v57, (os_log_type_t)v58, "Response from XPC service: %s", v22, v40);
      destroyStorage<A>(_:count:)(v23, 0, v21);
      destroyStorage<A>(_:count:)(v24, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v22, MEMORY[0x263F8E778]);
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

  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v31, v34);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in closure #1 in _MLServiceS.write(data:)()
{
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String) -> ()(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  id v2 = a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5(v3);
  swift_bridgeObjectRelease();

  return swift_release();
}

id _MLServiceS.__deallocating_deinit()
{
  uint64_t v26 = v0;
  uint64_t v37 = 0;
  uint64_t v23 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v48 = 0;
  uint64_t v25 = 0;
  uint64_t v32 = type metadata accessor for Logger();
  uint64_t v30 = *(void *)(v32 - 8);
  uint64_t v31 = v32 - 8;
  unint64_t v27 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32);
  uint64_t v1 = (char *)&v10 - v27;
  uint64_t v28 = (char *)&v10 - v27;
  uint64_t v48 = v2;
  id v29 = *(id *)(v2 + OBJC_IVAR____MLServiceS_connection);
  id v3 = v29;
  objc_msgSend(v29, sel_invalidate);

  uint64_t v4 = _MLServiceS.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v1, v4, v32);
  uint64_t v39 = Logger.logObject.getter();
  int v38 = static os_log_type_t.info.getter();
  uint64_t v35 = &v46;
  uint64_t v46 = 2;
  unint64_t v33 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v34 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v36 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v40 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v39, (os_log_type_t)v38))
  {
    uint64_t v5 = v25;
    uint64_t v13 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = 0;
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    uint64_t v15 = createStorage<A>(capacity:type:)(v12);
    uint64_t v19 = &v44;
    uint64_t v44 = v13;
    uint64_t v20 = &v43;
    uint64_t v43 = v14;
    uint64_t v17 = &v42;
    uint64_t v42 = v15;
    unsigned int v16 = 0;
    serialize(_:at:)(0, &v44);
    serialize(_:at:)(v16, v19);
    uint64_t v41 = v40;
    uint64_t v18 = &v10;
    MEMORY[0x270FA5388](&v10);
    uint64_t v6 = v20;
    uint64_t v7 = &v10 - 6;
    uint64_t v21 = &v10 - 6;
    v7[2] = (uint64_t)v19;
    v7[3] = (uint64_t)v6;
    v7[4] = v8;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v5)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_255D5C000, v39, (os_log_type_t)v38, "Called into deinit", v13, v36);
      uint64_t v10 = 0;
      destroyStorage<A>(_:count:)(v14, 0, v11);
      destroyStorage<A>(_:count:)(v15, v10, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A299260](v13, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v32);
  v45.receiver = v26;
  v45.super_class = ObjectType;
  return objc_msgSendSuper2(&v45, sel_dealloc);
}

id _MLServiceS.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t _MLServiceS.init()()
{
  if (!"MediaMLServices._MLServiceS")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"MediaMLServices._MLServiceS", 27, (unint64_t)"init()", 6, 2, (unint64_t)"MediaMLServices/MLService.swift", 31, 2, v1, 0xBuLL, 0x27uLL);
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t sub_255D6ECBC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_12:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  uint64_t v31 = partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
  uint64_t v32 = partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:);
  unint64_t v33 = "Fatal error";
  unint64_t v34 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v35 = "Swift/StaticString.swift";
  uint32_t v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  int v38 = "UnsafeBufferPointer with negative count";
  uint64_t v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v18;
        uint64_t v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v32);
        unsigned int v16 = v31;
        uint64_t v17 = &v41;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  uint64_t v18 = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v25 >= 0) {
    return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(v18, v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
  uint64_t v31 = closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply;
  uint64_t v32 = "Fatal error";
  unint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  unint64_t v34 = "Swift/StaticString.swift";
  uint64_t v35 = "Not enough bits to represent the passed value";
  uint32_t v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  int v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v17;
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v31);
        uint64_t v15 = v30;
        unsigned int v16 = &v40;
        specialized Unicode.Scalar.withUTF8CodeUnits<A>(_:)(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v25 >= 0) {
    return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                _assertionFailure(_:_:file:line:flags:)();
                __break(1u);
              }
              _assertionFailure(_:_:file:line:flags:)();
              __break(1u);
            }
            _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
          }
          _assertionFailure(_:_:file:line:flags:)();
          __break(1u);
        }
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();
  uint64_t v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  id v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
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

uint64_t sub_255D70128()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255D7015C()
{
  return swift_deallocObject();
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
    void *v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {
  }
}

uint64_t sub_255D702D4()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D70320()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D7036C()
{
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v1 = *(_DWORD *)(v4 + 80);
  uint64_t v2 = (v1 + 16) & ~v1;
  uint64_t v5 = (v2 + *(void *)(v4 + 64) + v1) & ~v1;
  id v7 = *(void (**)(uint64_t))(v4 + 8);
  v7(v0 + v2);
  ((void (*)(uint64_t, uint64_t))v7)(v0 + v5, v6);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in _MLServiceS.write(data:)()
{
  type metadata accessor for DispatchTime();
  return implicit closure #3 in _MLServiceS.write(data:)();
}

uint64_t sub_255D70524()
{
  return swift_deallocObject();
}

uint64_t sub_255D70558()
{
  return swift_deallocObject();
}

uint64_t sub_255D7058C()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D705D8()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D70624()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in _MLServiceS.write(data:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in _MLServiceS.write(data:)(a1, a2);
}

uint64_t block_copy_helper_71(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_72()
{
  return swift_release();
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

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of MLServerProtocol?()
{
}

uint64_t type metadata accessor for _MLServiceS()
{
  return self;
}

uint64_t partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(uint64_t a1, uint64_t a2)
{
  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:)(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply(uint64_t a1, uint64_t a2)
{
  return specialized closure #1 in StaticString.withUTF8Buffer<A>(_:)(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_255D7087C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.write(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in closure #1 in _MLServiceS.write(data:)();
  return result;
}

uint64_t sub_255D708C8()
{
  return swift_deallocObject();
}

uint64_t sub_255D708FC()
{
  return swift_deallocObject();
}

uint64_t sub_255D70930()
{
  return swift_deallocObject();
}

uint64_t sub_255D7097C()
{
  return swift_deallocObject();
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

uint64_t sub_255D70A44()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in closure #1 in _MLServiceS.getPredictionDictionary(withInputFeatures:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_255D70A8C()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_255D70B2C()
{
  return swift_deallocObject();
}

uint64_t sub_255D70B60()
{
  return swift_deallocObject();
}

uint64_t sub_255D70B94()
{
  return swift_deallocObject();
}

uint64_t sub_255D70BE0()
{
  return swift_deallocObject();
}

uint64_t sub_255D70C2C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:)()
{
  return implicit closure #1 in closure #1 in _MLServiceS.getPrediction(inputFeatures:)(*(double *)(v0 + 16));
}

uint64_t sub_255D70C60()
{
  return swift_deallocObject();
}

uint64_t sub_255D70C94()
{
  return swift_deallocObject();
}

uint64_t sub_255D70CC8()
{
  return swift_deallocObject();
}

uint64_t sub_255D70D14()
{
  return swift_deallocObject();
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

uint64_t sub_255D70E10()
{
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v6 = v2;
  *(void *)(v2 + 16) = v2;
  id v7 = *(int **)(v1 + 24);
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

uint64_t sub_255D71078()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(uint64_t a1)
{
  return closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t block_copy_helper_145(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_146()
{
  return swift_release();
}

uint64_t sub_255D71148()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)()
{
  return implicit closure #1 in closure #1 in closure #1 in _MLServiceS.getModelStats(completionHandler:)(*(void *)(v0 + 16));
}

uint64_t sub_255D71190()
{
  return swift_deallocObject();
}

uint64_t sub_255D711C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D711F8()
{
  return swift_deallocObject();
}

uint64_t sub_255D71244()
{
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_255D712EC()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)()
{
  return implicit closure #1 in closure #1 in _MLServiceS.init(nameOfModel:)(*(void **)(v0 + 16));
}

uint64_t sub_255D71334()
{
  return swift_deallocObject();
}

uint64_t sub_255D71368()
{
  return swift_deallocObject();
}

uint64_t sub_255D7139C()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_255D713E8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D71434()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

Swift::Double *kSecondsFromNanoseconds.unsafeMutableAddressor()
{
  return &kSecondsFromNanoseconds;
}

uint64_t one-time initialization function for kMediaML_rssi()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rssi = v1;
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
  kMediaML_binnedRssi = v1;
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

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t _convertObjCBoolToBool(_:)()
{
  return MEMORY[0x270FA1138]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D6D8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t Sequence<>.starts<A>(with:)()
{
  return MEMORY[0x270F9DA10]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t Double.init<A>(_:)()
{
  return MEMORY[0x270F9DDE8]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
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

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x270F9E398]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x270F9F940]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x270FA0100]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x270FA0108]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x270FA0110]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x270FA0118]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}