uint64_t static PlatformInfo.isInternalBuild.getter()
{
  uint64_t has_internal_content;

  String.utf8CString.getter();
  has_internal_content = os_variant_has_internal_content();
  swift_release();
  return has_internal_content;
}

ValueMetadata *type metadata accessor for PlatformInfo()
{
  return &type metadata for PlatformInfo;
}

uint64_t DarwinNotificationHelper.__deallocating_deinit()
{
  v1 = &v0[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations];
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v3 + 8 * v9);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(v2 + 56) + 40 * v11 + 16));
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_23:
    swift_release();
    v15.receiver = v0;
    v15.super_class = (Class)type metadata accessor for DarwinNotificationHelper();
    return (uint64_t)objc_msgSendSuper2(&v15, sel_dealloc);
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DarwinNotificationHelper()
{
  return self;
}

uint64_t DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for DispatchPredicate();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  int64_t v12 = (void *)((char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v13 = *(void **)&v4[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *int64_t v12 = v13;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F0D8], v9);
  int64_t v14 = v13;
  char v15 = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if (v15)
  {
    unsigned __int8 v25 = 0;
    v17 = (void *)swift_allocObject();
    v17[2] = v4;
    v17[3] = a1;
    v17[4] = a2;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = &v25;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = partial apply for closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:);
    *(void *)(v18 + 24) = v17;
    aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
    aBlock[3] = &block_descriptor;
    v19 = _Block_copy(aBlock);
    v20 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v14, v19);
    _Block_release(v19);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      uint64_t v22 = v25;
      swift_release();
      return v22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t a1), unsigned char *a6)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int64_t v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  swift_beginAccess();
  if (*(void *)(*v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if (v13)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  int out_token = -1;
  int64_t v14 = *(NSObject **)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a2;
  v16[4] = a3;
  v26 = partial apply for closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:);
  v27 = v16;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  v24 = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  unsigned __int8 v25 = &block_descriptor_42;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v18 = String.utf8CString.getter();
  LODWORD(v14) = notify_register_dispatch((const char *)(v18 + 32), &out_token, v14, v17);
  swift_release();
  _Block_release(v17);
  if (!v14 && out_token != -1)
  {
    uint64_t aBlock = a2;
    uint64_t v23 = a3;
    LODWORD(v24) = out_token;
    unsigned __int8 v25 = a4;
    v26 = a5;
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v12;
    *int64_t v12 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)&aBlock, a2, a3, isUniquelyReferenced_nonNull_native);
    *int64_t v12 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    swift_bridgeObjectRelease();
    *a6 = 1;
  }
}

uint64_t sub_2542460D8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void partial apply for closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)()
{
  closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(void (**)(uint64_t))(v0 + 48), *(unsigned char **)(v0 + 56));
}

void closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for DispatchPredicate();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x25A274AB0](a2 + 16);
  if (v11)
  {
    int64_t v12 = (void *)v11;
    char v13 = *(void **)(v11 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
    *uint64_t v10 = v13;
    (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F0E0], v7);
    id v14 = v13;
    LOBYTE(v13) = _dispatchPreconditionTest(_:)();
    (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
    if (v13)
    {
      DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)(a3, a4);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2542462E8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

Swift::Bool __swiftcall DarwinNotificationHelper.removeObserver(forNotificationName:)(Swift::String forNotificationName)
{
  object = forNotificationName._object;
  uint64_t countAndFlagsBits = forNotificationName._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (void *)((char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0D8], v4);
  uint64_t v9 = v8;
  char v10 = _dispatchPreconditionTest(_:)();
  Swift::Bool result = (*(uint64_t (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
  {
    Swift::Bool v20 = 0;
    int64_t v12 = (void *)swift_allocObject();
    v12[2] = v1;
    v12[3] = countAndFlagsBits;
    v12[4] = object;
    v12[5] = &v20;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = partial apply for closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:);
    *(void *)(v13 + 24) = v12;
    aBlock[4] = thunk for @callee_guaranteed () -> ()partial apply;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
    aBlock[3] = &block_descriptor_13;
    id v14 = _Block_copy(aBlock);
    uint64_t v15 = v1;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v9, v14);
    _Block_release(v14);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    Swift::Bool result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      Swift::Bool v17 = v20;
      swift_release();
      return v17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *v7;
  if (*(void *)(*v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v11 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    int v12 = *(_DWORD *)(*(void *)(v9 + 56) + 40 * v10 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (notify_cancel(v12))
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (uint64_t)v13);
    swift_endAccess();
    outlined release of DarwinNotificationHelper.DarwinNotificationRecord?(v13);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    *a4 = 1;
  }
  return result;
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)()
{
  return closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char **)(v0 + 40));
}

uint64_t sub_254246714()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

Swift::UInt32 __swiftcall DarwinNotificationHelper.state(forNotificationName:)(Swift::String forNotificationName)
{
  object = forNotificationName._object;
  uint64_t countAndFlagsBits = forNotificationName._countAndFlagsBits;
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (void *)((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *uint64_t v7 = v8;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0D8], v4);
  uint64_t v9 = v8;
  char v10 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  v19[0] = 0;
  char v11 = (void *)swift_allocObject();
  v11[2] = v1;
  v11[3] = countAndFlagsBits;
  v11[4] = object;
  v11[5] = v19;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = partial apply for closure #1 in DarwinNotificationHelper.state(forNotificationName:);
  *(void *)(v12 + 24) = v11;
  aBlock[4] = thunk for @callee_guaranteed () -> ()partial apply;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_23;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v13);
  _Block_release(v13);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  unint64_t v16 = v19[0];
  swift_release();
  if (HIDWORD(v16)) {
    goto LABEL_7;
  }
  return v16;
}

uint64_t closure #1 in DarwinNotificationHelper.state(forNotificationName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *v7;
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if (v11)
    {
      int v12 = *(_DWORD *)(*(void *)(v9 + 56) + 40 * v10 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      notify_get_state(v12, a4);
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.state(forNotificationName:)()
{
  return closure #1 in DarwinNotificationHelper.state(forNotificationName:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t **)(v0 + 40));
}

uint64_t sub_254246AF4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  MEMORY[0x270FA5388]();
  v34 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v30 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388]();
  uint64_t v33 = type metadata accessor for DispatchQoS();
  uint64_t v32 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (uint64_t *)((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v14 = *(void **)(v2 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
  *uint64_t v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F0E0], v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    Swift::Bool v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
    uint64_t result = swift_beginAccess();
    uint64_t v18 = *v17;
    if (*(void *)(*v17 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v37, a2);
      if (v20)
      {
        uint64_t v21 = *(void *)(v18 + 56) + 40 * v19;
        long long v40 = *(_OWORD *)v21;
        uint64_t v22 = *(void *)(v21 + 16);
        uint64_t v37 = *(void *)(v21 + 24);
        uint64_t v41 = v22;
        uint64_t v23 = *(void *)(v21 + 32);
        v42[0] = v40;
        outlined retain of String((uint64_t)v42);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for OS_dispatch_queue();
        static DispatchQoS.unspecified.getter();
        aBlock[0] = MEMORY[0x263F8EE78];
        lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        (*(void (**)(char *, void, uint64_t))(v30 + 104))(v7, *MEMORY[0x263F8F130], v31);
        v24 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
        uint64_t v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = v40;
        uint64_t v26 = v37;
        *(void *)(v25 + 32) = v41;
        *(void *)(v25 + 40) = v26;
        *(void *)(v25 + 48) = v23;
        aBlock[4] = partial apply for closure #1 in DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:);
        aBlock[5] = v25;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_33;
        v27 = _Block_copy(aBlock);
        outlined retain of String((uint64_t)v42);
        swift_retain();
        static DispatchQoS.unspecified.getter();
        uint64_t v38 = MEMORY[0x263F8EE78];
        lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        uint64_t v28 = v34;
        uint64_t v29 = v36;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x25A274750](0, v9, v28, v27);
        _Block_release(v27);

        outlined release of String((uint64_t)v42);
        swift_release();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v29);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v33);
        return swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id DarwinNotificationHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DarwinNotificationHelper.init()()
{
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388]();
  type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388]();
  *(void *)&v0[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations] = MEMORY[0x263F8EE80];
  uint64_t v8 = OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue;
  unint64_t v7 = type metadata accessor for OS_dispatch_queue();
  uint64_t v4 = v0;
  static DispatchQoS.unspecified.getter();
  uint64_t v11 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v9);
  *(void *)&v0[v8] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  uint64_t v5 = (objc_class *)type metadata accessor for DarwinNotificationHelper();
  v10.receiver = v4;
  v10.super_class = v5;
  return objc_msgSendSuper2(&v10, sel_init);
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
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

uint64_t method lookup function for DarwinNotificationHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DarwinNotificationHelper);
}

uint64_t dispatch thunk of DarwinNotificationHelper.addObserver(forNotificationName:handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.removeObserver(forNotificationName:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.state(forNotificationName:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t initializeBufferWithCopyOfBuffer for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DarwinNotificationHelper.DarwinNotificationRecord()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for DarwinNotificationHelper.DarwinNotificationRecord()
{
  return &unk_2703AFE18;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined retain of String(uint64_t a1)
{
  return a1;
}

uint64_t sub_2542478C4()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined release of String(uint64_t a1)
{
  return a1;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  Swift::Int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v4;
    uint64_t v19 = *v4;
    *Swift::Int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      uint64_t v12 = v19;
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v12 + 56) + 40 * v8;
    uint64_t v14 = *(void *)v13;
    uint64_t v15 = *(void *)(v13 + 8);
    uint64_t v16 = *(unsigned int *)(v13 + 16);
    long long v18 = *(_OWORD *)(v13 + 24);
    specialized _NativeDictionary._delete(at:)(v8, v12);
    *Swift::Int v4 = v12;
    uint64_t result = swift_bridgeObjectRelease();
    long long v17 = v18;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    long long v17 = 0uLL;
  }
  *(void *)a3 = v14;
  *(void *)(a3 + 8) = v15;
  *(void *)(a3 + 16) = v16;
  *(_OWORD *)(a3 + 24) = v17;
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DarwinNotificationHelper.DarwinNotificationRecord>);
  char v40 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              long long v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 40 * v21;
      uint64_t v33 = *(void *)v32;
      uint64_t v34 = *(void *)(v32 + 8);
      int v35 = *(_DWORD *)(v32 + 16);
      long long v41 = *(_OWORD *)(v32 + 24);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *long long v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 40 * v17;
      *(void *)uint64_t v19 = v33;
      *(void *)(v19 + 8) = v34;
      *(_DWORD *)(v19 + 16) = v35;
      *(_OWORD *)(v19 + 24) = v41;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v11 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          long long v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    long long v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
      long long v21 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 16) = v21;
      *(void *)(v19 + 32) = *(void *)(a1 + 32);
      return result;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v23 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v22;
  long long v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v24 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v24 = a2;
  v24[1] = a3;
  uint64_t v25 = v18[7] + 40 * v12;
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)a1;
  *(_OWORD *)(v25 + 16) = v26;
  *(void *)(v25 + 32) = *(void *)(a1 + 32);
  uint64_t v27 = v18[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v29;
  return swift_bridgeObjectRetain();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *outlined release of DarwinNotificationHelper.DarwinNotificationRecord?(uint64_t *a1)
{
  return a1;
}

uint64_t outlined consume of DarwinNotificationHelper.DarwinNotificationRecord?(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DarwinNotificationHelper.DarwinNotificationRecord>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    int v24 = *(_DWORD *)(v21 + 16);
    uint64_t v25 = (void *)(*(void *)(v4 + 48) + v16);
    long long v26 = *(_OWORD *)(v21 + 24);
    *uint64_t v25 = v19;
    v25[1] = v18;
    uint64_t v27 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v27 = v22;
    *(void *)(v27 + 8) = v23;
    *(_DWORD *)(v27 + 16) = v24;
    *(_OWORD *)(v27 + 24) = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_254248518()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_254248550()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1)
{
  closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}