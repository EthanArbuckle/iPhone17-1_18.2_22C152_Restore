uint64_t variable initialization expression of MLServerDelegate.mediaML()
{
  uint64_t v0;
  uint64_t v2;

  v2 = 0;
  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  return OSAllocatedUnfairLock<A>.init(initialState:)((uint64_t)&v2, v0);
}

uint64_t OSAllocatedUnfairLock<A>.init(initialState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v10 = a2;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = a2 - 8;
  unint64_t v3 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v4 = (uint64_t)&v3 - v3;
  (*(void (**)(void))(v5 + 16))();
  uint64_t v9 = OSAllocatedUnfairLock.init(uncheckedState:)(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v7);
  return v9;
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

void key path getter for MLServerDelegate.mediaML : MLServerDelegate(id *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & swift_isaMask) + 0x58))(v2);
}

void key path setter for MLServerDelegate.mediaML : MLServerDelegate(uint64_t *a1, id *a2)
{
  outlined init with copy of OSAllocatedUnfairLock<MediaML?>(a1, &v6);
  uint64_t v5 = v6;
  uint64_t v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t))((*v4 & swift_isaMask) + 0x60))(v5);
}

uint64_t MLServerDelegate.mediaML.getter()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t MLServerDelegate.mediaML.setter(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*MLServerDelegate.mediaML.modify())()
{
  return MLServerDelegate.mediaML.modify;
}

uint64_t MLServerDelegate.mediaML.modify()
{
  return swift_endAccess();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static MLServerDelegate.logger);
  __swift_project_value_buffer(v1, (uint64_t)static MLServerDelegate.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLServerDelegate", 0x10uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static MLServer.logger);
  __swift_project_value_buffer(v1, (uint64_t)static MLServer.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.mediamlxpc", 0x14uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MLServer", 8uLL, 1);
  return Logger.init(subsystem:category:)();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t MLServerDelegate.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MLServerDelegate.logger);
}

uint64_t static MLServerDelegate.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MLServerDelegate.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

Swift::Void __swiftcall MLServerDelegate.ensureMediaML()()
{
  uint64_t v8 = 0;
  v11 = &async function pointer to partial apply for closure #1 in MLServerDelegate.ensureMediaML();
  uint64_t ObjectType = swift_getObjectType();
  v13 = 0;
  unint64_t v9 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v12 = (char *)&v8 - v9;
  v13 = v0;
  uint64_t v1 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t))(*(void *)(v1 - 8) + 56))(v12, 1);
  id v2 = v0;
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = ObjectType;
  uint64_t v5 = (uint64_t)v11;
  uint64_t v6 = (void *)v3;
  uint64_t v7 = (uint64_t)v12;
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  v6[5] = v4;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v7, v5, (uint64_t)v6, (uint64_t)&type metadata for () + 8);
  swift_release();
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[6] = 0;
  uint64_t v5 = type metadata accessor for Logger();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[3] = a4;
  type metadata accessor for MediaML();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v9 + 88) = v6;
  *uint64_t v6 = *(void *)(v9 + 16);
  v6[1] = closure #1 in MLServerDelegate.ensureMediaML();
  return MediaML.__allocating_init()();
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[2] = *v2;
  v5[12] = a1;
  v5[13] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = closure #1 in MLServerDelegate.ensureMediaML();
  }
  else
  {
    uint64_t v3 = closure #1 in MLServerDelegate.ensureMediaML();
  }
  return _swift_task_switch(v3, 0);
}

void closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v1 = v0[13];
  uint64_t v6 = v0[12];
  id v2 = (void *)v0[7];
  v0[2] = v0;
  v0[6] = v6;
  uint64_t v7 = (*(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x58))();
  swift_retain();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))partial apply for closure #1 in closure #1 in MLServerDelegate.ensureMediaML(), v6, v7, v3, (uint64_t)&type metadata for () + 8);
  if (!v1)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t v4 = *(void (**)(void))(*(void *)(v5 + 16) + 8);
    v4();
  }
}

uint64_t closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v31 = v0;
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 64);
  *(void *)(v0 + 16) = v0;
  swift_errorRetain();
  *(void *)(v0 + 32) = v15;
  uint64_t v2 = MLServerDelegate.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v1, v2, v14);
  swift_errorRetain();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  *(void *)(v0 + 40) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 112);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 64;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = partial apply for implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML();
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(void *)(v19 + 24) = v18;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(void *)(v22 + 24) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v23 = v3;
  swift_retain();
  void *v23 = partial apply for closure #1 in OSLogArguments.append(_:);
  v23[1] = v20;
  swift_retain();
  v23[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[3] = v21;
  swift_retain();
  v23[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v23[5] = v22;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v24, v25))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = createStorage<A>(capacity:type:)(1);
    uint64_t v11 = createStorage<A>(capacity:type:)(0);
    v26 = buf;
    uint64_t v27 = v10;
    uint64_t v28 = v11;
    serialize(_:at:)(2, &v26);
    serialize(_:at:)(1, &v26);
    v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v30 = v20;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v30 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v30 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v29, (uint64_t)&v26, (uint64_t)&v27, (uint64_t)&v28);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to init MediaML due to error=%@", buf, size);
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
  uint64_t v7 = v12[10];
  uint64_t v8 = v12[8];
  uint64_t v6 = v12[9];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v12[2] + 8);
  return v4();
}

uint64_t sub_100004F94()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MLServerDelegate.ensureMediaML()(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in MLServerDelegate.ensureMediaML();
  return closure #1 in MLServerDelegate.ensureMediaML()(a1, v6, v7, v8);
}

uint64_t partial apply for closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(void *a1, uint64_t a2)
{
  *a1 = a2;
  return swift_release();
}

void OSAllocatedUnfairLock.withLock<A>(_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()()
{
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
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

id MLServerDelegate.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

void *MLServerDelegate.init()()
{
  id v1 = v0;
  id v11 = v0;
  uint64_t v6 = OBJC_IVAR____TtC10mediamlxpc16MLServerDelegate_mediaML;
  uint64_t v10 = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  *(void *)&v7[v6] = OSAllocatedUnfairLock<A>.init(initialState:)((uint64_t)&v10, v2);

  v9.receiver = v11;
  v9.super_class = (Class)type metadata accessor for MLServerDelegate();
  uint64_t v8 = objc_msgSendSuper2(&v9, "init");
  uint64_t v3 = v8;
  uint64_t v4 = v8;
  id v11 = v8;
  (*(void (**)(void))((*v8 & swift_isaMask) + 0x70))();

  return v8;
}

uint64_t type metadata accessor for MLServerDelegate()
{
  return self;
}

Swift::Bool __swiftcall MLServerDelegate.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  uint64_t v12 = (*(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x58))();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MediaML?);
  OSAllocatedUnfairLock.withLock<A>(_:)((void (*)(uint64_t))closure #1 in MLServerDelegate.listener(_:shouldAcceptNewConnection:), 0, v12, v3, v3);
  uint64_t v4 = swift_release();
  if (v14)
  {
    type metadata accessor for MLServer();
    swift_retain();
    id v13 = MLServer.__allocating_init(mediaML:)(v14);
    type metadata accessor for NSXPCInterface();
    uint64_t v5 = &OBJC_PROTOCOL____TtP10mediamlxpc16MLServerProtocol_;
    id v8 = @nonobjc NSXPCInterface.__allocating_init(with:)(&OBJC_PROTOCOL____TtP10mediamlxpc16MLServerProtocol_);
    -[objc_class setExportedInterface:](shouldAcceptNewConnection.super.isa, "setExportedInterface:");

    id v6 = v13;
    [(objc_class *)shouldAcceptNewConnection.super.isa setExportedObject:v13];
    swift_unknownObjectRelease();
    [(objc_class *)shouldAcceptNewConnection.super.isa activate];

    swift_release();
    return 1;
  }
  else
  {
    (*(void (**)(uint64_t))((*v11 & swift_isaMask) + 0x70))(v4);
    return 0;
  }
}

void *closure #1 in MLServerDelegate.listener(_:shouldAcceptNewConnection:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return outlined init with copy of MediaML?(a1, a2);
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
  id v3 = [(id)swift_getObjCClassFromMetadata() interfaceWithProtocol:a1];

  return v3;
}

id MLServerDelegate.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MLServerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of OSAllocatedUnfairLock<MediaML?>()
{
}

void *outlined init with copy of OSAllocatedUnfairLock<MediaML?>(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  result = a2;
  *a2 = v4;
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
  objc_super v2 = *a2;
  *objc_super v2 = result;
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

uint64_t OSAllocatedUnfairLock.init(uncheckedState:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for os_unfair_lock_s();
  type metadata accessor for ManagedBuffer();
  uint64_t v5 = static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
  (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8))(a1);
  return v5;
}

uint64_t closure #1 in OSAllocatedUnfairLock.init(uncheckedState:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0xFFFFFFFFFFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v3 + class metadata base offset for ManagedBuffer)
                                                        - 8)
                                            + 16))(a2);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
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

void OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[1] = a5;
  closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(a3 + *(void *)(*(void *)a3 + class metadata base offset for ManagedBuffer + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0xFFFFFFFFFFFFFFFCLL)), a1, a2, a4, a5, v5);
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

void closure #1 in OSAllocatedUnfairLock.withLockUncheckedInternal<A>(body:)(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v10) {
    *a7 = v10;
  }
}

void *outlined init with copy of MediaML?(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  result = a2;
  *a2 = v4;
  return result;
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

uint64_t sub_1000063D8()
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

uint64_t sub_100006640()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in closure #1 in MLServerDelegate.ensureMediaML()();
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

Swift::Void __swiftcall Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

uint64_t sub_10000681C()
{
  return swift_deallocObject();
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_100006850()
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

uint64_t sub_100006884()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_1000068D0()
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

uint64_t sub_100006A60()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t partial apply for closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(void *a1)
{
  return closure #1 in closure #1 in MLServerDelegate.ensureMediaML()(a1, v1);
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

uint64_t one-time initialization function for semaphoreTimeoutValue()
{
  uint64_t v1 = type metadata accessor for DispatchTimeInterval();
  __swift_allocate_value_buffer(v1, semaphoreTimeoutValue);
  *(void *)__swift_project_value_buffer(v1, (uint64_t)semaphoreTimeoutValue) = 1;
  return (*(uint64_t (**)(void))(*(void *)(v1 - 8) + 104))();
}

uint64_t semaphoreTimeoutValue.unsafeMutableAddressor()
{
  if (one-time initialization token for semaphoreTimeoutValue != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for DispatchTimeInterval();
  return __swift_project_value_buffer(v0, (uint64_t)semaphoreTimeoutValue);
}

uint64_t one-time initialization function for priority()
{
  uint64_t v1 = type metadata accessor for TaskPriority();
  __swift_allocate_value_buffer(v1, priority);
  __swift_project_value_buffer(v1, (uint64_t)priority);
  return static TaskPriority.high.getter();
}

uint64_t priority.unsafeMutableAddressor()
{
  if (one-time initialization token for priority != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for TaskPriority();
  return __swift_project_value_buffer(v0, (uint64_t)priority);
}

uint64_t MLServer.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MLServer.logger);
}

uint64_t static MLServer.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t MLServer.mediaML.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  return v2;
}

id MLServer.__allocating_init(mediaML:)(uint64_t a1)
{
  id v2 = objc_allocWithZone(v1);
  return MLServer.init(mediaML:)(a1);
}

id MLServer.init(mediaML:)(uint64_t a1)
{
  uint64_t v9 = a1;
  id v2 = v1;
  id v10 = v1;
  swift_retain();
  *(void *)&v5[OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML] = a1;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for MLServer();
  id v7 = objc_msgSendSuper2(&v8, "init");
  id v3 = v7;
  id v10 = v7;
  swift_release();

  return v7;
}

uint64_t type metadata accessor for MLServer()
{
  return self;
}

void MLServer.getPrediction(inputFeatures:with:)(uint64_t a1, void (*a2)(void, double), uint64_t a3)
{
  uint64_t v122 = a1;
  v111 = a2;
  uint64_t v109 = a3;
  id v110 = v3;
  uint64_t v106 = 0;
  v123 = partial apply for implicit closure #1 in MLServer.getPrediction(inputFeatures:with:);
  v131 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
  v135 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v137 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v139 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v142 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v90 = &async function pointer to partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:);
  v91 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v164 = 0;
  uint64_t v162 = 0;
  uint64_t v163 = 0;
  uint64_t v161 = 0;
  dispatch_semaphore_t v158 = 0;
  char v157 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = type metadata accessor for DispatchTimeInterval();
  uint64_t v95 = *(void *)(v94 - 8);
  uint64_t v96 = v94 - 8;
  unint64_t v97 = (*(void *)(v95 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v98 = (char *)v49 - v97;
  uint64_t v99 = type metadata accessor for DispatchTime();
  uint64_t v100 = *(void *)(v99 - 8);
  uint64_t v101 = v99 - 8;
  unint64_t v102 = (*(void *)(v100 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v99);
  v103 = (char *)v49 - v102;
  unint64_t v104 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v49 - v102);
  v105 = (char *)v49 - v104;
  unint64_t v107 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v106);
  v108 = (char *)v49 - v107;
  uint64_t v119 = type metadata accessor for Logger();
  v117 = *(void **)(v119 - 8);
  uint64_t v118 = v119 - 8;
  uint64_t v113 = v117[8];
  unint64_t v112 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v122);
  v114 = (char *)v49 - v112;
  unint64_t v115 = (v113 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v5);
  id v7 = (char *)v49 - v115;
  v116 = (char *)v49 - v115;
  uint64_t v164 = v6;
  uint64_t v162 = v8;
  uint64_t v163 = v9;
  uint64_t v161 = v10;
  uint64_t v11 = MLServer.logger.unsafeMutableAddressor();
  v120 = (void (*)(char *, uint64_t, uint64_t))v117[2];
  v121 = v117 + 2;
  v120(v7, v11, v119);
  swift_bridgeObjectRetain();
  uint64_t v133 = 7;
  uint64_t v124 = swift_allocObject();
  *(void *)(v124 + 16) = v122;
  swift_retain();
  uint64_t v132 = 32;
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v124;
  uint64_t v134 = v12;
  *(void *)(v12 + 16) = v123;
  *(void *)(v12 + 24) = v13;
  swift_release();
  v146 = Logger.logObject.getter();
  int v147 = static os_log_type_t.debug.getter();
  v127 = &v159;
  uint64_t v159 = 12;
  unint64_t v125 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v128 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v129 = v160;
  uint64_t v130 = 17;
  uint64_t v138 = swift_allocObject();
  *(unsigned char *)(v138 + 16) = 32;
  uint64_t v140 = swift_allocObject();
  *(unsigned char *)(v140 + 16) = 8;
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v134;
  uint64_t v136 = v14;
  *(void *)(v14 + 16) = v131;
  *(void *)(v14 + 24) = v15;
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v136;
  uint64_t v143 = v16;
  *(void *)(v16 + 16) = v135;
  *(void *)(v16 + 24) = v17;
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v141 = _allocateUninitializedArray<A>(_:)();
  v144 = v18;
  swift_retain();
  uint64_t v19 = v138;
  uint64_t v20 = v144;
  *v144 = v137;
  v20[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
  swift_retain();
  uint64_t v21 = v140;
  uint64_t v22 = v144;
  v144[2] = v139;
  v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
  swift_retain();
  v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v143;
  v24 = v144;
  v144[4] = v142;
  v24[5] = v23;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v146, (os_log_type_t)v147))
  {
    uint64_t v25 = v93;
    v83 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v84 = createStorage<A>(capacity:type:)(0);
    uint64_t v85 = createStorage<A>(capacity:type:)(1);
    v86 = v152;
    v152[0] = v83;
    v87 = &v151;
    uint64_t v151 = v84;
    v88 = &v150;
    uint64_t v150 = v85;
    serialize(_:at:)(2, v152);
    serialize(_:at:)(1, v86);
    v148 = v137;
    uint64_t v149 = v138;
    closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)v86, (uint64_t)v87, (uint64_t)v88);
    uint64_t v89 = v25;
    if (v25)
    {
      __break(1u);
    }
    else
    {
      v148 = v139;
      uint64_t v149 = v140;
      closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)v152, (uint64_t)&v151, (uint64_t)&v150);
      uint64_t v80 = 0;
      uint64_t v27 = v80;
      v148 = v142;
      uint64_t v149 = v143;
      closure #1 in osLogInternal(_:log:type:)(&v148, (uint64_t)v152, (uint64_t)&v151, (uint64_t)&v150);
      uint64_t v79 = v27;
      _os_log_impl((void *)&_mh_execute_header, v146, (os_log_type_t)v147, "Called into getPrediction with inputFeatures: %s", v83, v129);
      destroyStorage<A>(_:count:)(v84);
      destroyStorage<A>(_:count:)(v85);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v81 = v79;
    }
  }
  else
  {
    uint64_t v26 = v93;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v81 = v26;
  }
  uint64_t v65 = v81;

  v66 = (void (*)(char *, uint64_t))v117[1];
  v67 = v117 + 1;
  v66(v116, v119);
  uint64_t v69 = 0;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v68 = v28;
  dispatch_semaphore_t v158 = v28;
  uint64_t v70 = priority.unsafeMutableAddressor();
  uint64_t v73 = type metadata accessor for TaskPriority();
  uint64_t v71 = *(void *)(v73 - 8);
  uint64_t v72 = v73 - 8;
  (*(void (**)(char *, uint64_t))(v71 + 16))(v108, v70);
  v29 = *(void (**)(char *, void))(v71 + 56);
  int v78 = 1;
  v29(v108, 0);
  id v30 = v110;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v31 = v28;
  uint64_t v32 = swift_allocObject();
  id v33 = v110;
  uint64_t v34 = v122;
  v35 = v111;
  uint64_t v36 = v109;
  uint64_t v37 = ObjectType;
  uint64_t v38 = (uint64_t)v90;
  v39 = (void *)v32;
  uint64_t v40 = (uint64_t)v108;
  v74 = v39;
  v39[2] = 0;
  v39[3] = 0;
  v39[4] = v33;
  v39[5] = v34;
  v39[6] = v35;
  v39[7] = v36;
  v39[8] = v28;
  v39[9] = 0;
  v39[10] = v37;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v40, v38, (uint64_t)v39, (uint64_t)&type metadata for () + 8);
  swift_release();
  static DispatchTime.now()();
  uint64_t v41 = semaphoreTimeoutValue.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v98, v41, v94);
  + infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v98, v94);
  v76 = *(void (**)(char *, uint64_t))(v100 + 8);
  uint64_t v75 = v100 + 8;
  v76(v103, v99);
  int v77 = OS_dispatch_semaphore.wait(timeout:)();
  v76(v105, v99);
  char v157 = v77 & 1 & v78;
  if (static DispatchTimeoutResult.== infix(_:_:)())
  {
    v42 = v114;
    uint64_t v43 = MLServer.logger.unsafeMutableAddressor();
    v120(v42, v43, v119);
    v63 = Logger.logObject.getter();
    int v62 = static os_log_type_t.error.getter();
    v155[1] = (unsigned char *)2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v61 = v156;
    v64 = (unsigned char *)_allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v63, (os_log_type_t)v62))
    {
      uint64_t v44 = v65;
      v51 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v49[1] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v50 = 0;
      uint64_t v52 = createStorage<A>(capacity:type:)(0);
      uint64_t v53 = createStorage<A>(capacity:type:)(v50);
      v57 = v155;
      v155[0] = v51;
      v58 = &v154;
      uint64_t v154 = v52;
      v55 = &v153;
      uint64_t v153 = v53;
      unsigned int v54 = 0;
      serialize(_:at:)(0, v155);
      serialize(_:at:)(v54, v57);
      v152[1] = v64;
      v56 = v49;
      __chkstk_darwin(v49);
      v45 = v58;
      v46 = &v49[-6];
      v59 = &v49[-6];
      v46[2] = v57;
      v46[3] = v45;
      v46[4] = v47;
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v44)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl((void *)&_mh_execute_header, v63, (os_log_type_t)v62, "getPrediction timed-out", v51, v61);
        v49[0] = 0;
        destroyStorage<A>(_:count:)(v52);
        destroyStorage<A>(_:count:)(v53);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v66(v114, v119);
    uint64_t v48 = swift_retain();
    v111(v48, 0.0);
    swift_release();
  }
}

uint64_t implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_100008174()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in MLServer.getPrediction(inputFeatures:with:)(*(void *)(v1 + 16), a1);
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(double *)(v9 + 144) = a1;
  *(void *)(v9 + 136) = a9;
  *(void *)(v9 + 128) = a8;
  *(void *)(v9 + 120) = a7;
  *(void *)(v9 + 112) = a6;
  *(void *)(v9 + 104) = a5;
  *(void *)(v9 + 32) = v9;
  *(void *)(v9 + 40) = 0;
  *(void *)(v9 + 48) = 0;
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  *(void *)(v9 + 56) = 0;
  *(void *)(v9 + 64) = 0;
  *(void *)(v9 + 80) = 0;
  *(void *)(v9 + 96) = 0;
  uint64_t v10 = type metadata accessor for Logger();
  *(void *)(v9 + 152) = v10;
  *(void *)(v9 + 160) = *(void *)(v10 - 8);
  *(void *)(v9 + 168) = swift_task_alloc();
  *(void *)(v9 + 40) = a5;
  *(void *)(v9 + 48) = a6;
  *(void *)(v9 + 16) = a7;
  *(void *)(v9 + 24) = a8;
  *(void *)(v9 + 56) = a9;
  *(double *)(v9 + 64) = a1;
  return _swift_task_switch(closure #1 in MLServer.getPrediction(inputFeatures:with:), 0);
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t v1 = v0[13];
  v0[4] = v0;
  v0[22] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  id v2 = (void *)swift_task_alloc();
  v5[23] = v2;
  *id v2 = v5[4];
  v2[1] = closure #1 in MLServer.getPrediction(inputFeatures:with:);
  uint64_t v3 = v5[14];
  return MediaML.getPrediction(data:)(v3);
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  double v6;
  void (*v7)(uint64_t, double);
  double *v8;
  uint64_t v9;

  uint64_t v1 = *(unsigned char *)(v0 + 212);
  id v2 = *(void *)(v0 + 200);
  *(void *)(v0 + 32) = v0;
  if (v1) {
    v8[9] = 0.0;
  }
  else {
    *((void *)v8 + 9) = v2;
  }
  id v7 = (void (*)(uint64_t, double))*((void *)v8 + 15);
  uint64_t v6 = v8[9];
  v8[12] = v6;
  uint64_t v3 = swift_retain();
  v7(v3, v6);
  swift_release();
  OS_dispatch_semaphore.signal()();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(*((void *)v8 + 4) + 8);
  return v4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void (*v11)(uint64_t, double);
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  double *v15;
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
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  uint64_t v34 = v0;
  uint64_t v18 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 160);
  uint64_t v17 = *(void *)(v0 + 152);
  *(void *)(v0 + 32) = v0;
  swift_release();
  swift_errorRetain();
  *(void *)(v0 + 80) = v18;
  id v2 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v1, v2, v17);
  swift_errorRetain();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v27 = Logger.logObject.getter();
  dispatch_semaphore_t v28 = static os_log_type_t.error.getter();
  *(void *)(v0 + 88) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 208);
  v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 64;
  v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = partial apply for implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:);
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v3;
  swift_retain();
  uint8_t *v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v13 = createStorage<A>(capacity:type:)(1);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    v29 = buf;
    id v30 = v13;
    uint64_t v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    id v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    id v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    id v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to get prediction with error=%@", buf, size);
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
  uint64_t v8 = *((void *)v15 + 21);
  uint64_t v9 = *((void *)v15 + 19);
  uint64_t v10 = v15[18];
  uint64_t v11 = (void (*)(uint64_t, double))*((void *)v15 + 15);
  id v7 = *((void *)v15 + 20);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  uint64_t v4 = swift_retain();
  v11(v4, v10);
  swift_release();
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*((void *)v15 + 4) + 8);
  return v5();
}

uint64_t closure #1 in MLServer.getPrediction(inputFeatures:with:)(uint64_t a1, char a2)
{
  uint64_t v6 = *v3;
  *(void *)(v6 + 32) = *v3;
  *(void *)(v6 + 192) = v2;
  *(void *)(v6 + 200) = a1;
  *(unsigned char *)(v6 + 212) = a2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v4 = closure #1 in MLServer.getPrediction(inputFeatures:with:);
  }
  else
  {
    swift_release();
    uint64_t v4 = closure #1 in MLServer.getPrediction(inputFeatures:with:);
  }
  return _swift_task_switch(v4, 0);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
}

uint64_t thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v132 = a1;
  v121 = a2;
  uint64_t v119 = a3;
  id v120 = v3;
  uint64_t v116 = 0;
  uint64_t v133 = partial apply for implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  uint64_t v141 = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  uint64_t v145 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  int v147 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v149 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v152 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v100 = &async function pointer to partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  uint64_t v101 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v175 = 0;
  uint64_t v173 = 0;
  uint64_t v174 = 0;
  uint64_t v172 = 0;
  dispatch_semaphore_t v169 = 0;
  uint64_t v168 = 0;
  char v167 = 0;
  uint64_t v103 = 0;
  uint64_t v104 = type metadata accessor for DispatchTimeInterval();
  uint64_t v105 = *(void *)(v104 - 8);
  uint64_t v106 = v104 - 8;
  unint64_t v107 = (*(void *)(v105 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v108 = (char *)v53 - v107;
  uint64_t v109 = type metadata accessor for DispatchTime();
  uint64_t v110 = *(void *)(v109 - 8);
  uint64_t v111 = v109 - 8;
  unint64_t v112 = (*(void *)(v110 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v109);
  uint64_t v113 = (char *)v53 - v112;
  unint64_t v114 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v53 - v112);
  unint64_t v115 = (char *)v53 - v114;
  unint64_t v117 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v116);
  uint64_t v118 = (char *)v53 - v117;
  uint64_t v129 = type metadata accessor for Logger();
  v127 = *(void **)(v129 - 8);
  uint64_t v128 = v129 - 8;
  uint64_t v123 = v127[8];
  unint64_t v122 = (v123 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v132);
  uint64_t v124 = (char *)v53 - v122;
  unint64_t v125 = (v123 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v7 = (char *)v53 - v125;
  unint64_t v126 = (char *)v53 - v125;
  uint64_t v175 = v6;
  uint64_t v173 = v8;
  uint64_t v174 = v9;
  uint64_t v172 = v10;
  uint64_t v11 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v130 = (void (*)(char *, uint64_t, uint64_t))v127[2];
  v131 = v127 + 2;
  v130(v7, v11, v129);
  swift_bridgeObjectRetain();
  uint64_t v143 = 7;
  uint64_t v134 = swift_allocObject();
  *(void *)(v134 + 16) = v132;
  swift_retain();
  uint64_t v142 = 32;
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v134;
  uint64_t v144 = v12;
  *(void *)(v12 + 16) = v133;
  *(void *)(v12 + 24) = v13;
  swift_release();
  uint32_t v156 = Logger.logObject.getter();
  int v157 = static os_log_type_t.debug.getter();
  v137 = &v170;
  uint64_t v170 = 12;
  unint64_t v135 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v136 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v138 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v139 = v171;
  uint64_t v140 = 17;
  uint64_t v148 = swift_allocObject();
  *(unsigned char *)(v148 + 16) = 32;
  uint64_t v150 = swift_allocObject();
  *(unsigned char *)(v150 + 16) = 8;
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v144;
  uint64_t v146 = v14;
  *(void *)(v14 + 16) = v141;
  *(void *)(v14 + 24) = v15;
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v146;
  uint64_t v153 = v16;
  *(void *)(v16 + 16) = v145;
  *(void *)(v16 + 24) = v17;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v151 = _allocateUninitializedArray<A>(_:)();
  uint64_t v154 = v18;
  swift_retain();
  uint64_t v19 = v148;
  uint64_t v20 = v154;
  *uint64_t v154 = v147;
  v20[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
  swift_retain();
  uint64_t v21 = v150;
  uint64_t v22 = v154;
  v154[2] = v149;
  v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
  swift_retain();
  v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v153;
  v24 = v154;
  v154[4] = v152;
  v24[5] = v23;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v156, (os_log_type_t)v157))
  {
    uint64_t v25 = v103;
    uint64_t v93 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v94 = createStorage<A>(capacity:type:)(0);
    uint64_t v95 = createStorage<A>(capacity:type:)(1);
    uint64_t v96 = v162;
    v162[0] = v93;
    unint64_t v97 = &v161;
    uint64_t v161 = v94;
    v98 = &v160;
    uint64_t v160 = v95;
    serialize(_:at:)(2, v162);
    serialize(_:at:)(1, v96);
    dispatch_semaphore_t v158 = v147;
    uint64_t v159 = v148;
    closure #1 in osLogInternal(_:log:type:)(&v158, (uint64_t)v96, (uint64_t)v97, (uint64_t)v98);
    uint64_t v99 = v25;
    if (v25)
    {
      __break(1u);
    }
    else
    {
      dispatch_semaphore_t v158 = v149;
      uint64_t v159 = v150;
      closure #1 in osLogInternal(_:log:type:)(&v158, (uint64_t)v162, (uint64_t)&v161, (uint64_t)&v160);
      uint64_t v90 = 0;
      uint64_t v27 = v90;
      dispatch_semaphore_t v158 = v152;
      uint64_t v159 = v153;
      closure #1 in osLogInternal(_:log:type:)(&v158, (uint64_t)v162, (uint64_t)&v161, (uint64_t)&v160);
      uint64_t v89 = v27;
      _os_log_impl((void *)&_mh_execute_header, v156, (os_log_type_t)v157, "Called into getPredictionDictionary with inputFeatures: %s", v93, v139);
      destroyStorage<A>(_:count:)(v94);
      destroyStorage<A>(_:count:)(v95);
      UnsafeMutablePointer.deallocate()();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v91 = v89;
    }
  }
  else
  {
    uint64_t v26 = v103;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v91 = v26;
  }
  uint64_t v69 = v91;

  uint64_t v70 = (void (*)(char *, uint64_t))v127[1];
  uint64_t v71 = v127 + 1;
  v70(v126, v129);
  uint64_t v78 = 0;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v72 = v28;
  dispatch_semaphore_t v169 = v28;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
  uint64_t v77 = _allocateUninitializedArray<A>(_:)();
  v74 = v29;
  id v30 = (void *)kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v30, v74);
  uint64_t v31 = v74;
  uint64_t v75 = 0;
  v74[2] = 0;
  uint64_t v73 = v31 + 3;
  uint64_t v32 = (void *)kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v32, v73);
  v74[5] = v75;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v83 = Dictionary.init(dictionaryLiteral:)();
  uint64_t v168 = v83;
  uint64_t v79 = priority.unsafeMutableAddressor();
  uint64_t v82 = type metadata accessor for TaskPriority();
  uint64_t v80 = *(void *)(v82 - 8);
  uint64_t v81 = v82 - 8;
  (*(void (**)(char *, uint64_t))(v80 + 16))(v118, v79);
  id v33 = *(void (**)(char *, void))(v80 + 56);
  int v88 = 1;
  v33(v118, 0);
  id v34 = v120;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v35 = v28;
  uint64_t v36 = swift_allocObject();
  id v37 = v120;
  uint64_t v38 = v132;
  uint64_t v39 = v83;
  uint64_t v40 = v121;
  uint64_t v41 = v119;
  uint64_t v42 = ObjectType;
  uint64_t v43 = (uint64_t)v100;
  uint64_t v44 = (void *)v36;
  uint64_t v45 = (uint64_t)v118;
  uint64_t v84 = v44;
  v44[2] = 0;
  v44[3] = 0;
  v44[4] = v37;
  v44[5] = v38;
  v44[6] = v39;
  v44[7] = v40;
  v44[8] = v41;
  v44[9] = v28;
  v44[10] = v42;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v45, v43, (uint64_t)v44, (uint64_t)&type metadata for () + 8);
  swift_release();
  static DispatchTime.now()();
  uint64_t v46 = semaphoreTimeoutValue.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v105 + 16))(v108, v46, v104);
  + infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v108, v104);
  v86 = *(void (**)(char *, uint64_t))(v110 + 8);
  uint64_t v85 = v110 + 8;
  v86(v113, v109);
  int v87 = OS_dispatch_semaphore.wait(timeout:)();
  v86(v115, v109);
  char v167 = v87 & 1 & v88;
  if (static DispatchTimeoutResult.== infix(_:_:)())
  {
    uint64_t v47 = v124;
    uint64_t v48 = MLServer.logger.unsafeMutableAddressor();
    v130(v47, v48, v129);
    v67 = Logger.logObject.getter();
    int v66 = static os_log_type_t.error.getter();
    v165[1] = (unsigned char *)2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v65 = v166;
    dispatch_semaphore_t v68 = (unsigned char *)_allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v67, (os_log_type_t)v66))
    {
      uint64_t v49 = v69;
      v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      v53[2] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v54 = 0;
      uint64_t v56 = createStorage<A>(capacity:type:)(0);
      uint64_t v57 = createStorage<A>(capacity:type:)(v54);
      uint32_t v61 = v165;
      v165[0] = v55;
      int v62 = &v164;
      uint64_t v164 = v56;
      v59 = &v163;
      uint64_t v163 = v57;
      unsigned int v58 = 0;
      serialize(_:at:)(0, v165);
      serialize(_:at:)(v58, v61);
      v162[1] = v68;
      uint64_t v60 = v53;
      __chkstk_darwin(v53);
      uint64_t v50 = v62;
      v51 = &v53[-6];
      v63 = &v53[-6];
      v51[2] = v61;
      v51[3] = v50;
      v51[4] = v52;
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v49)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl((void *)&_mh_execute_header, v67, (os_log_type_t)v66, "getPredictionDictionary timed-out", v55, v65);
        v53[1] = 0;
        destroyStorage<A>(_:count:)(v56);
        destroyStorage<A>(_:count:)(v57);
        UnsafeMutablePointer.deallocate()();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v70(v124, v129);
    swift_retain();
    swift_bridgeObjectRetain();
    v53[0] = _dictionaryUpCast<A, B, C, D>(_:)();
    v121(v53[0]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_bridgeObjectRelease();
}

uint64_t implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = v17;
  v8[18] = a8;
  v8[17] = a7;
  v8[16] = a6;
  v8[15] = a5;
  v8[14] = a4;
  v8[4] = v8;
  v8[5] = 0;
  v8[6] = 0;
  v8[7] = 0;
  v8[2] = 0;
  v8[3] = 0;
  v8[8] = 0;
  v8[10] = 0;
  v8[13] = 0;
  uint64_t v9 = type metadata accessor for Logger();
  v8[20] = v9;
  v8[21] = *(void *)(v9 - 8);
  v8[22] = swift_task_alloc();
  v8[5] = a4;
  v8[6] = a5;
  v8[7] = a6;
  v8[2] = a7;
  v8[3] = a8;
  v8[8] = v17;
  return _swift_task_switch(closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:), 0);
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t v1 = v0[14];
  v0[4] = v0;
  v0[23] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v5[24] = v2;
  *uint64_t v2 = v5[4];
  v2[1] = closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  uint64_t v3 = v5[15];
  return MediaML.getPredictionDictionary(data:)(v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void (*v4)(uint64_t);
  uint64_t v5;
  void *v6;
  uint64_t v7;

  uint64_t v1 = v0[25];
  v0[4] = v0;
  v0[12] = v1;
  swift_bridgeObjectRetain();
  if (v0[12])
  {
    v6[9] = v6[12];
  }
  else
  {
    swift_bridgeObjectRetain();
    v6[9] = _dictionaryUpCast<A, B, C, D>(_:)();
    swift_bridgeObjectRelease();
    outlined destroy of [String : Any]?();
  }
  uint64_t v4 = (void (*)(uint64_t))v6[17];
  swift_bridgeObjectRelease();
  uint64_t v5 = v6[9];
  v6[13] = v5;
  swift_retain();
  v4(v5);
  swift_release();
  OS_dispatch_semaphore.signal()();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v6[4] + 8);
  return v2();
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
  void (*v9)(void);
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  uint64_t v32 = v0;
  uint64_t v16 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v14 = *(void *)(v0 + 168);
  uint64_t v15 = *(void *)(v0 + 160);
  *(void *)(v0 + 32) = v0;
  swift_release();
  swift_errorRetain();
  *(void *)(v0 + 80) = v16;
  uint64_t v2 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v1, v2, v15);
  swift_errorRetain();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v25 = Logger.logObject.getter();
  uint64_t v26 = static os_log_type_t.error.getter();
  *(void *)(v0 + 88) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v17 = *(_DWORD *)(v0 + 216);
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 64;
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 16) = 8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = partial apply for implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  *(void *)(v19 + 24) = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0;
  *(void *)(v20 + 24) = v19;
  v23 = swift_allocObject();
  *(void *)(v23 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0;
  *(void *)(v23 + 24) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v24 = v3;
  swift_retain();
  NSObject *v24 = closure #1 in OSLogArguments.append(_:)partial apply;
  v24[1] = v21;
  swift_retain();
  v24[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v24[3] = v22;
  swift_retain();
  v24[4] = _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
  v24[5] = v23;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v25, v26))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v11 = createStorage<A>(capacity:type:)(1);
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v27 = buf;
    dispatch_semaphore_t v28 = v11;
    v29 = v12;
    serialize(_:at:)(2, &v27);
    serialize(_:at:)(1, &v27);
    id v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v31 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v30, (uint64_t)&v27, (uint64_t)&v28, (uint64_t)&v29);
    id v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v31 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v30, (uint64_t)&v27, (uint64_t)&v28, (uint64_t)&v29);
    id v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
    uint64_t v31 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v30, (uint64_t)&v27, (uint64_t)&v28, (uint64_t)&v29);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to get prediction with error=%@", buf, v17);
    destroyStorage<A>(_:count:)(v11);
    destroyStorage<A>(_:count:)(v12);
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
  uint64_t v7 = v13[22];
  uint64_t v8 = v13[20];
  uint64_t v9 = (void (*)(void))v13[17];
  uint64_t v6 = v13[21];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  swift_retain();
  swift_bridgeObjectRetain();
  _dictionaryUpCast<A, B, C, D>(_:)();
  v9();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_errorRelease();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v13[4] + 8);
  return v4();
}

uint64_t closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[4] = *v2;
  v5[25] = a1;
  v5[26] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  }
  else
  {
    swift_release();
    uint64_t v3 = closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  }
  return _swift_task_switch(v3, 0);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> ()(uint64_t a1, uint64_t a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(void))(a2 + 16))();
}

uint64_t MLServer.write(data:with:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v50 = a1;
  uint64_t v49 = a2;
  uint64_t v47 = a3;
  id v48 = v3;
  uint64_t v60 = 0;
  uint64_t v41 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v42 = &async function pointer to partial apply for closure #1 in MLServer.write(data:with:);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v73 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v70 = 0;
  uint64_t v44 = 0;
  unint64_t v45 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v46 = &v25[-v45];
  uint64_t v55 = type metadata accessor for Logger();
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v54 = v55 - 8;
  unint64_t v51 = (*(void *)(v53 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v50);
  uint64_t v5 = &v25[-v51];
  uint64_t v52 = &v25[-v51];
  uint64_t v73 = v4;
  uint64_t v71 = v6;
  uint64_t v72 = v7;
  uint64_t v70 = v8;
  uint64_t v9 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v53 + 16))(v5, v9, v55);
  int v62 = Logger.logObject.getter();
  int v61 = static os_log_type_t.debug.getter();
  unsigned int v58 = &v68;
  uint64_t v68 = 2;
  unint64_t v56 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v57 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v59 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v63 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v62, (os_log_type_t)v61))
  {
    uint64_t v10 = v44;
    uint64_t v31 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v30 = 0;
    uint64_t v32 = createStorage<A>(capacity:type:)(0);
    uint64_t v33 = createStorage<A>(capacity:type:)(v30);
    id v37 = &v67;
    v67 = v31;
    uint64_t v38 = &v66;
    uint64_t v66 = v32;
    v35 = &v65;
    uint64_t v65 = v33;
    unsigned int v34 = 0;
    serialize(_:at:)(0, &v67);
    serialize(_:at:)(v34, v37);
    uint64_t v64 = v63;
    uint64_t v36 = v25;
    __chkstk_darwin(v25);
    uint64_t v11 = v38;
    uint64_t v12 = &v25[-48];
    uint64_t v39 = &v25[-48];
    v12[2] = v37;
    v12[3] = v11;
    v12[4] = v13;
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v10)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v61, "Called into writeData", v31, v59);
      uint64_t v28 = 0;
      destroyStorage<A>(_:count:)(v32);
      destroyStorage<A>(_:count:)(v33);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v52, v55);
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(*(void *)(type metadata accessor for TaskPriority() - 8) + 56);
  int v26 = 1;
  v14(v46, 1);
  swift_bridgeObjectRetain();
  id v15 = v48;
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = v50;
  id v18 = v48;
  uint64_t v19 = ObjectType;
  uint64_t v20 = (uint64_t)v42;
  uint64_t v21 = (void *)v16;
  uint64_t v22 = (uint64_t)v46;
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v17;
  v21[5] = v18;
  v21[6] = v19;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v22, v20, (uint64_t)v21, (uint64_t)&type metadata for () + 8);
  swift_release();
  swift_retain();
  Swift::String v23 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Dispatched write data task", 0x1AuLL, v26 & 1);
  object = v23._object;
  v49(v23._countAndFlagsBits);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t closure #1 in MLServer.write(data:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a5;
  v5[7] = a4;
  v5[2] = v5;
  void v5[3] = 0;
  v5[4] = 0;
  uint64_t v6 = type metadata accessor for DispatchTime();
  v5[9] = v6;
  uint64_t v9 = *(void *)(v6 - 8);
  v5[10] = v9;
  v5[11] = *(void *)(v9 + 64);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v5[16] = v7;
  v5[17] = *(void *)(v7 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  void v5[3] = a4;
  v5[4] = a5;
  return _swift_task_switch(closure #1 in MLServer.write(data:with:), 0);
}

uint64_t closure #1 in MLServer.write(data:with:)()
{
  uint64_t v74 = v0;
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v50 = *(void *)(v0 + 136);
  uint64_t v51 = *(void *)(v0 + 128);
  uint64_t v53 = *(void *)(v0 + 56);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = MLServer.logger.unsafeMutableAddressor();
  uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  v52(v1, v2, v51);
  swift_bridgeObjectRetain();
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v53;
  swift_retain();
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = partial apply for implicit closure #1 in closure #1 in MLServer.write(data:with:);
  *(void *)(v56 + 24) = v54;
  swift_release();
  int v62 = Logger.logObject.getter();
  os_log_type_t v63 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 40) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v55 = *(_DWORD *)(v0 + 176);
  uint64_t v58 = swift_allocObject();
  *(unsigned char *)(v58 + 16) = 32;
  uint64_t v59 = swift_allocObject();
  *(unsigned char *)(v59 + 16) = 8;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(void *)(v57 + 24) = v56;
  uint64_t v60 = swift_allocObject();
  *(void *)(v60 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v60 + 24) = v57;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  int v61 = v3;
  swift_retain();
  *int v61 = closure #1 in OSLogArguments.append(_:)partial apply;
  v61[1] = v58;
  swift_retain();
  v61[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v61[3] = v59;
  swift_retain();
  v61[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v61[5] = v60;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v62, v63))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v47 = createStorage<A>(capacity:type:)(0);
    uint64_t v48 = createStorage<A>(capacity:type:)(1);
    uint32_t v69 = buf;
    uint64_t v70 = v47;
    uint64_t v71 = v48;
    serialize(_:at:)(2, &v69);
    serialize(_:at:)(1, &v69);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v73 = v58;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v73 = v59;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v73 = v60;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Checking text and numerical input validity for data dictionary: %s", buf, v55);
    destroyStorage<A>(_:count:)(v47);
    destroyStorage<A>(_:count:)(v48);
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
  uint64_t v41 = *(void *)(v49 + 152);
  uint64_t v42 = *(void *)(v49 + 128);
  data._rawValue = *(void **)(v49 + 56);
  uint64_t v40 = *(void *)(v49 + 136);

  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v43(v41, v42);
  static DispatchTime.now()();
  Swift::Bool v45 = checkValidTextInputs(data:)(data);
  swift_bridgeObjectRetain();
  if (!v45)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    (*(void (**)(void, void))(*(void *)(v49 + 80) + 8))(*(void *)(v49 + 120), *(void *)(v49 + 72));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(*(void *)(v49 + 16) + 8);
    return v10();
  }
  Swift::Bool v39 = checkValidTextInputs(data:)(*(Swift::OpaquePointer *)(v49 + 56));
  swift_bridgeObjectRelease();
  if (!v39) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)(v49 + 144);
  uint64_t v18 = *(void *)(v49 + 128);
  uint64_t v21 = *(void *)(v49 + 120);
  uint64_t v20 = *(void *)(v49 + 112);
  uint64_t v25 = *(void *)(v49 + 104);
  uint64_t v27 = *(void *)(v49 + 96);
  uint64_t v23 = *(void *)(v49 + 88);
  uint64_t v28 = *(void *)(v49 + 72);
  uint64_t v19 = *(void *)(v49 + 80);
  static DispatchTime.now()();
  uint64_t v5 = MLServer.logger.unsafeMutableAddressor();
  v52(v4, v5, v18);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v22(v25, v20, v28);
  v22(v27, v21, v28);
  uint64_t v6 = *(_DWORD *)(v19 + 80);
  uint64_t v24 = (v6 + 16) & ~v6;
  uint64_t v26 = (v24 + v23 + v6) & ~v6;
  uint64_t v31 = swift_allocObject();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
  v29(v31 + v24, v25, v28);
  v29(v31 + v26, v27, v28);
  oslog = Logger.logObject.getter();
  os_log_type_t v38 = static os_log_type_t.info.getter();
  *(void *)(v49 + 48) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v49 + 180);
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = swift_allocObject();
  *(unsigned char *)(v34 + 16) = 8;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = partial apply for implicit closure #3 in closure #1 in MLServer.write(data:with:);
  *(void *)(v32 + 24) = v31;
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
  *(void *)(v35 + 24) = v32;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v36 = v7;
  swift_retain();
  *uint64_t v36 = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[1] = v33;
  swift_retain();
  v36[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v36[3] = v34;
  swift_retain();
  v36[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v36[5] = v35;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v38))
  {
    id v15 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v16 = createStorage<A>(capacity:type:)(0);
    uint64_t v17 = createStorage<A>(capacity:type:)(0);
    uint64_t v64 = v15;
    uint64_t v65 = v16;
    uint64_t v66 = v17;
    serialize(_:at:)(0, &v64);
    serialize(_:at:)(1, &v64);
    v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v68 = v33;
    closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)&v64, (uint64_t)&v65, (uint64_t)&v66);
    v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v68 = v34;
    closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)&v64, (uint64_t)&v65, (uint64_t)&v66);
    v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v68 = v35;
    closure #1 in osLogInternal(_:log:type:)(&v67, (uint64_t)&v64, (uint64_t)&v65, (uint64_t)&v66);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "Validity check in MLServer Time taken = %f [ns]", v15, size);
    destroyStorage<A>(_:count:)(v16);
    destroyStorage<A>(_:count:)(v17);
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
  uint64_t v12 = *(void *)(v49 + 144);
  uint64_t v13 = *(void *)(v49 + 128);
  uint64_t v14 = *(void *)(v49 + 64);

  v43(v12, v13);
  *(void *)(v49 + 160) = *(void *)(v14 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v49 + 168) = v8;
  *uint64_t v8 = *(void *)(v49 + 16);
  v8[1] = closure #1 in MLServer.write(data:with:);
  uint64_t v9 = *(void *)(v49 + 56);
  return MediaML.writeData(data:)(v9);
}

{
  uint64_t v0;
  uint64_t v2;

  *(void *)(*(void *)v0 + 16) = *(void *)v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(closure #1 in MLServer.write(data:with:), 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;

  uint64_t v5 = v0[15];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[10];
  uint64_t v6 = v0[9];
  v0[2] = v0;
  uint64_t v7 = *(void (**)(uint64_t))(v2 + 8);
  v7(v1);
  ((void (*)(uint64_t, uint64_t))v7)(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0[2] + 8);
  return v3();
}

uint64_t implicit closure #1 in closure #1 in MLServer.write(data:with:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t implicit closure #3 in closure #1 in MLServer.write(data:with:)()
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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  (*(void (**)(void))(a3 + 16))();
}

uint64_t MLServer.wakeRemoteService(with:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v25 = a2;
  uint64_t v36 = 0;
  uint64_t v23 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v24 = 0;
  uint64_t v31 = type metadata accessor for Logger();
  uint64_t v29 = *(void *)(v31 - 8);
  uint64_t v30 = v31 - 8;
  unint64_t v27 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v2 = (char *)v11 - v27;
  uint64_t v28 = (char *)v11 - v27;
  uint64_t v47 = __chkstk_darwin(v26);
  uint64_t v48 = v3;
  uint64_t v46 = v4;
  uint64_t v5 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v2, v5, v31);
  os_log_type_t v38 = Logger.logObject.getter();
  int v37 = static os_log_type_t.default.getter();
  uint64_t v34 = &v44;
  uint64_t v44 = 2;
  unint64_t v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v33 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v35 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v39 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v38, (os_log_type_t)v37))
  {
    uint64_t v6 = v24;
    uint64_t v13 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    v11[1] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = 0;
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    uint64_t v15 = createStorage<A>(capacity:type:)(v12);
    uint64_t v19 = &v43;
    uint64_t v43 = v13;
    uint64_t v20 = &v42;
    uint64_t v42 = v14;
    uint64_t v17 = &v41;
    uint64_t v41 = v15;
    unsigned int v16 = 0;
    serialize(_:at:)(0, &v43);
    serialize(_:at:)(v16, v19);
    uint64_t v40 = v39;
    uint64_t v18 = v11;
    __chkstk_darwin(v11);
    uint64_t v7 = v20;
    uint64_t v8 = &v11[-6];
    uint64_t v21 = &v11[-6];
    v8[2] = v19;
    v8[3] = v7;
    v8[4] = v9;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v6)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v37, "Starting mediamlxpc service", v13, v35);
      v11[0] = 0;
      destroyStorage<A>(_:count:)(v14);
      destroyStorage<A>(_:count:)(v15);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v31);
  swift_retain();
  v26(1);
  return swift_release();
}

uint64_t thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()(uint64_t a1, uint64_t a2)
{
  char v2 = _convertBoolToObjCBool(_:)();
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v2 & 1);
}

uint64_t MLServer.getModelStats(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a1;
  uint64_t v44 = a2;
  uint64_t v55 = 0;
  os_log_type_t v38 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v39 = &async function pointer to partial apply for closure #1 in MLServer.getModelStats(with:);
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v65 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v42 = (char *)&v20 - v41;
  uint64_t v50 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v50 - 8);
  uint64_t v49 = v50 - 8;
  unint64_t v46 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v45);
  uint64_t v3 = (char *)&v20 - v46;
  uint64_t v47 = (char *)&v20 - v46;
  uint64_t v66 = v2;
  uint64_t v67 = v4;
  uint64_t v65 = v5;
  uint64_t v6 = MLServer.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v3, v6, v50);
  uint64_t v57 = Logger.logObject.getter();
  int v56 = static os_log_type_t.info.getter();
  uint64_t v53 = &v63;
  uint64_t v63 = 2;
  unint64_t v51 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v54 = v64;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v58 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v57, (os_log_type_t)v56))
  {
    uint64_t v7 = v40;
    uint64_t v28 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v27 = 0;
    uint64_t v29 = createStorage<A>(capacity:type:)(0);
    uint64_t v30 = createStorage<A>(capacity:type:)(v27);
    uint64_t v34 = &v62;
    int v62 = v28;
    uint32_t v35 = &v61;
    uint64_t v61 = v29;
    unint64_t v32 = &v60;
    uint64_t v60 = v30;
    unsigned int v31 = 0;
    serialize(_:at:)(0, &v62);
    serialize(_:at:)(v31, v34);
    uint64_t v59 = v58;
    unint64_t v33 = &v20;
    __chkstk_darwin(&v20);
    uint64_t v8 = v35;
    uint64_t v9 = &v20 - 6;
    uint64_t v36 = &v20 - 6;
    v9[2] = (uint64_t)v34;
    v9[3] = (uint64_t)v8;
    v9[4] = v10;
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v7)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v56, "Getting model stats", v28, v54);
      uint64_t v25 = 0;
      destroyStorage<A>(_:count:)(v29);
      destroyStorage<A>(_:count:)(v30);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v50);
  uint64_t v21 = priority.unsafeMutableAddressor();
  uint64_t v24 = type metadata accessor for TaskPriority();
  uint64_t v22 = *(void *)(v24 - 8);
  uint64_t v23 = v24 - 8;
  (*(void (**)(char *, uint64_t))(v22 + 16))(v42, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v42, 0, 1, v24);
  id v11 = v43;
  swift_retain();
  uint64_t v12 = swift_allocObject();
  id v13 = v43;
  uint64_t v14 = v45;
  uint64_t v15 = v44;
  uint64_t v16 = (uint64_t)v39;
  uint64_t v17 = (void *)v12;
  uint64_t v18 = (uint64_t)v42;
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v13;
  v17[5] = v14;
  v17[6] = v15;
  _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC(v18, v16, (uint64_t)v17);
  return swift_release();
}

uint64_t closure #1 in MLServer.getModelStats(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a6;
  v6[8] = a5;
  v6[7] = a4;
  v6[4] = v6;
  v6[5] = 0;
  v6[2] = 0;
  v6[3] = 0;
  v6[6] = 0;
  v6[5] = a4;
  v6[2] = a5;
  v6[3] = a6;
  return _swift_task_switch(closure #1 in MLServer.getModelStats(with:), 0);
}

uint64_t closure #1 in MLServer.getModelStats(with:)()
{
  uint64_t v1 = v0[7];
  v0[4] = v0;
  v0[10] = *(void *)(v1 + OBJC_IVAR____TtC10mediamlxpc8MLServer_mediaML);
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 88) = v2;
  *uint64_t v2 = *(void *)(v4 + 32);
  v2[1] = closure #1 in MLServer.getModelStats(with:);
  return MediaML.getModelStats()();
}

{
  void *v0;
  uint64_t (*v1)(void);
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = v0[12];
  uint64_t v3 = (void (*)(uint64_t))v0[8];
  v0[4] = v0;
  v0[6] = v4;
  swift_retain();
  v3(v4);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0[4] + 8);
  return v1();
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

uint64_t closure #1 in MLServer.getModelStats(with:)(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  v5[4] = *v2;
  v5[12] = a1;
  v5[13] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = closure #1 in MLServer.getModelStats(with:);
  }
  else
  {
    swift_release();
    uint64_t v3 = closure #1 in MLServer.getModelStats(with:);
  }
  return _swift_task_switch(v3, 0);
}

uint64_t _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for TaskPriority();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(a1, 1) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  }
  uint64_t v4 = *(void *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v4)
  {
    swift_getObjectType();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> ()(uint64_t a1, uint64_t a2)
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

id MLServer.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

uint64_t MLServer.init()()
{
  if (!"mediamlxpc.MLServer")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"mediamlxpc.MLServer", 19, (unint64_t)"init()", 6, 2, (unint64_t)"mediamlxpc/MLServer.swift", 25, 2, v1, 0xFuLL, 7uLL);
  __break(1u);
  return result;
}

id MLServer.__deallocating_deinit()
{
  Class v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MLServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))__chkstk_darwin(a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t sub_10000E274()
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
  unsigned int v31 = partial apply for closure #1 in closure #1 in _unimplementedInitializer(className:initName:file:line:column:);
  unint64_t v32 = partial apply for specialized closure #1 in StaticString.withUTF8Buffer<A>(_:);
  unint64_t v33 = "Fatal error";
  uint64_t v34 = "Unexpectedly found nil while unwrapping an Optional value";
  uint32_t v35 = "Swift/StaticString.swift";
  uint64_t v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  os_log_type_t v38 = "UnsafeBufferPointer with negative count";
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
        uint64_t v11 = (uint64_t (*)(uint64_t *, uint64_t))__chkstk_darwin(v32);
        uint64_t v16 = v31;
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
  unsigned int v31 = closure #1 in StaticString.withUTF8Buffer<A>(_:)specialized partial apply;
  unint64_t v32 = "Fatal error";
  unint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v34 = "Swift/StaticString.swift";
  uint32_t v35 = "Not enough bits to represent the passed value";
  uint64_t v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  os_log_type_t v38 = "Swift/UnsafeBufferPointer.swift";
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
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))__chkstk_darwin(v31);
        uint64_t v15 = v30;
        uint64_t v16 = &v40;
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
      void v5[3] = 2 * (v3 - (void)(v5 + 4));
    }
    else
    {
      swift_retain();
      v5[2] = a1;
      void v5[3] = 2 * v6;
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
      void v7[2] = v9;
      v7[3] = 2 * (v5 - (void)(v7 + 4));
    }
    else
    {
      swift_retain();
      void v7[2] = v9;
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

uint64_t sub_1000103E0()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_100010414()
{
  return swift_deallocObject();
}

uint64_t sub_100010448()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100010494()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1000104E0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *((void *)v1 + 2);
  uint64_t v7 = *((void *)v1 + 3);
  uint64_t v8 = *((void *)v1 + 4);
  uint64_t v9 = *((void *)v1 + 5);
  uint64_t v10 = *((void *)v1 + 6);
  uint64_t v11 = *((void *)v1 + 7);
  uint64_t v12 = *((void *)v1 + 8);
  double v13 = v1[9];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:);
  return closure #1 in MLServer.getPrediction(inputFeatures:with:)(v13, a1, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t partial apply for closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
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

uint64_t sub_100010848()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()()
{
  return thunk for @escaping @callee_unowned @convention(block) (@unowned Double) -> ()(*(void *)(v0 + 16));
}

uint64_t sub_100010890()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000108D8()
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

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars8;

  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_100010978()
{
  return swift_deallocObject();
}

uint64_t sub_1000109AC()
{
  return swift_deallocObject();
}

uint64_t sub_1000109E0()
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

uint64_t sub_100010A2C()
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

void *outlined init with copy of String(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

uint64_t sub_100010AB8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v11 = v1[7];
  uint64_t v12 = v1[8];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:);
  return closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)(a1, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t partial apply for closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
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

uint64_t sub_100010DA8()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> ()(a1, *(void *)(v1 + 16));
}

uint64_t sub_100010DF0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MLServer.write(data:with:)(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in MLServer.write(data:with:);
  return closure #1 in MLServer.write(data:with:)(a1, v6, v7, v8, v9);
}

uint64_t partial apply for closure #1 in MLServer.write(data:with:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_10001108C()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(uint64_t a1, uint64_t a2)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> ()(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100011104()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()(char a1)
{
  return thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ()(a1 & 1, *(void *)(v1 + 16));
}

uint64_t sub_100011150()
{
  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in MLServer.getModelStats(with:)(uint64_t a1)
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
  v3[1] = partial apply for closure #1 in MLServer.getModelStats(with:);
  return closure #1 in MLServer.getModelStats(with:)(a1, v6, v7, v8, v9, v10);
}

uint64_t partial apply for closure #1 in MLServer.getModelStats(with:)()
{
  uint64_t v3 = *v0;
  *(void *)(v3 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 16) + 8);
  return v1();
}

uint64_t sub_1000113EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> ()(uint64_t a1)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary?) -> ()(a1, *(void *)(v1 + 16));
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

uint64_t sub_1000114EC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in MLServer.write(data:with:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in closure #1 in MLServer.write(data:with:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_100011534()
{
  return swift_deallocObject();
}

uint64_t sub_1000115D4()
{
  return swift_deallocObject();
}

uint64_t sub_100011608()
{
  return swift_deallocObject();
}

uint64_t sub_10001163C()
{
  return swift_deallocObject();
}

uint64_t sub_100011688()
{
  return swift_deallocObject();
}

uint64_t sub_1000116D4()
{
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v1 = *(_DWORD *)(v4 + 80);
  uint64_t v2 = (v1 + 16) & ~v1;
  uint64_t v5 = (v2 + *(void *)(v4 + 64) + v1) & ~v1;
  uint64_t v7 = *(void (**)(uint64_t))(v4 + 8);
  v7(v0 + v2);
  ((void (*)(uint64_t, uint64_t))v7)(v0 + v5, v6);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in closure #1 in MLServer.write(data:with:)()
{
  type metadata accessor for DispatchTime();
  return implicit closure #3 in closure #1 in MLServer.write(data:with:)();
}

uint64_t sub_10001188C()
{
  return swift_deallocObject();
}

uint64_t sub_1000118C0()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001191C()
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

uint64_t sub_1000119D4()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
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

uint64_t sub_100011A9C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in closure #1 in MLServer.getPredictionDictionary(inputFeatures:with:)();
  return result;
}

uint64_t sub_100011AE4()
{
  return swift_deallocObject();
}

uint64_t sub_100011B18()
{
  return swift_deallocObject();
}

uint64_t sub_100011B4C()
{
  return swift_deallocObject();
}

void *_s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_100011B98()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100011BE4()
{
  return swift_deallocObject();
}

void _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100011C5C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in closure #1 in MLServer.getPrediction(inputFeatures:with:)();
  return result;
}

uint64_t sub_100011CA4()
{
  return swift_deallocObject();
}

uint64_t sub_100011CD8()
{
  return swift_deallocObject();
}

uint64_t sub_100011D0C()
{
  return swift_deallocObject();
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_100011D58()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100011DA4()
{
  return swift_deallocObject();
}

void closure #1 in OSLogArguments.append(_:)partial apply(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
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

void static Main.main()()
{
  type metadata accessor for MLServerDelegate();
  id v2 = MLServerDelegate.__allocating_init()();
  id v1 = [self serviceListener];
  id v0 = v2;
  [v1 setDelegate:v2];
  swift_unknownObjectRelease();
  [v1 activate];
}

void static Main.$main()()
{
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

uint64_t _convertBoolToObjCBool(_:)()
{
  return _convertBoolToObjCBool(_:)();
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

uint64_t kMediaML_throughputStdDev.unsafeMutableAddressor()
{
  return kMediaML_throughputStdDev.unsafeMutableAddressor();
}

uint64_t kMediaML_throughputPrediction.unsafeMutableAddressor()
{
  return kMediaML_throughputPrediction.unsafeMutableAddressor();
}

Swift::Bool __swiftcall checkValidTextInputs(data:)(Swift::OpaquePointer data)
{
  return checkValidTextInputs(data:)(data._rawValue);
}

uint64_t type metadata accessor for MediaML()
{
  return type metadata accessor for MediaML();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
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

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.forEach(_:)()
{
  return Sequence.forEach(_:)();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return UnsignedInteger<>.init<A>(_:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static TaskPriority.high.getter()
{
  return static TaskPriority.high.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t Double.init<A>(_:)()
{
  return Double.init<A>(_:)();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _dictionaryUpCast<A, B, C, D>(_:)()
{
  return _dictionaryUpCast<A, B, C, D>(_:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return _allocateUninitializedArray<A>(_:)();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return __swift_stdlib_reportUnimplementedInitializerInFile();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}