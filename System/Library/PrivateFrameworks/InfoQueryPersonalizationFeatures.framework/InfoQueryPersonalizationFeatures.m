BOOL isCalendarBasedPersonalizationResultType(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 8;
}

void sub_2529E7F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id IQFLogCategoryDefault()
{
  if (IQFLogCategoryDefault_onceToken != -1) {
    dispatch_once(&IQFLogCategoryDefault_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)IQFLogCategoryDefault_defaultLog;

  return v0;
}

uint64_t __IQFLogCategoryDefault_block_invoke()
{
  IQFLogCategoryDefault_defaultLog = (uint64_t)os_log_create("com.apple.pommes", "InfoQueryPersonalizationFeatures");

  return MEMORY[0x270F9A758]();
}

void sub_2529E8958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2529E8AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2529EABE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2529EAFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id PegasusRequestPersonalizationFeatures.mapsPersonalizationRanker.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t PegasusRequestPersonalizationFeatures.__allocating_init()()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)IQFMapsPersonalizationRanker), sel_init);
  v2 = *(uint64_t (**)(id))(v0 + 88);

  return v2(v1);
}

uint64_t PegasusRequestPersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t PegasusRequestPersonalizationFeatures.init(mapsPersonalizationRanker:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t PegasusRequestPersonalizationFeatures.augmentWithPersonalizationEntities(pegasusRequest:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusRequest();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

uint64_t PegasusRequestPersonalizationFeatures.deinit()
{
  return v0;
}

uint64_t PegasusRequestPersonalizationFeatures.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PegasusRequestPersonalizationFeatures()
{
  return self;
}

uint64_t method lookup function for PegasusRequestPersonalizationFeatures(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PegasusRequestPersonalizationFeatures);
}

uint64_t dispatch thunk of PegasusRequestPersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PegasusRequestPersonalizationFeatures.augmentWithPersonalizationEntities(pegasusRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

ValueMetadata *type metadata accessor for ParsecAlias()
{
  return &type metadata for ParsecAlias;
}

id PegasusResponsePersonalizationFeatures.mapsPersonalizationRanker.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t PegasusResponsePersonalizationFeatures.__allocating_init()()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)IQFMapsPersonalizationRanker), sel_init);
  v2 = *(uint64_t (**)(id))(v0 + 88);

  return v2(v1);
}

uint64_t PegasusResponsePersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t PegasusResponsePersonalizationFeatures.init(mapsPersonalizationRanker:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t PegasusResponsePersonalizationFeatures.rankedMapsEventsForPegasusResponse(pegasusResponse:)()
{
  uint64_t v64 = type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity();
  uint64_t v0 = *(void *)(v64 - 8);
  uint64_t v1 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  v67 = (void (*)(char *, unint64_t, uint64_t))((char *)&v59 - v5);
  MEMORY[0x270FA5388](v4);
  v63 = (char *)&v59 - v6;
  uint64_t v66 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction();
  uint64_t v7 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v14 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  BOOL v17 = v14 == 1936744813 && v16 == 0xE400000000000000;
  if (v17
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || (v14 == 7300455 ? (BOOL v18 = v16 == 0xE300000000000000) : (BOOL v18 = 0), v18))
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = v64;
  }
  else
  {
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t v20 = v64;
    if ((v19 & 1) == 0) {
      return MEMORY[0x263F8EE78];
    }
  }
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter();
  uint64_t v22 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.getter();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v66);
  uint64_t v24 = MEMORY[0x263F8EE78];
  uint64_t v68 = MEMORY[0x263F8EE78];
  uint64_t v66 = *(void *)(v22 + 16);
  if (!v66)
  {
    uint64_t v41 = MEMORY[0x263F8EE78];
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t v42 = *(void *)(v41 + 16);
    if (v42)
    {
      uint64_t v68 = v24;
      specialized ContiguousArray.reserveCapacity(_:)();
      v44 = *(void (**)(char *, unint64_t, uint64_t))(v0 + 16);
      uint64_t v43 = v0 + 16;
      unint64_t v45 = v41 + ((*(unsigned __int8 *)(v43 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 64));
      uint64_t v66 = *(void *)(v43 + 56);
      v67 = v44;
      uint64_t v64 = v41;
      v65 = (void (**)(char *, uint64_t))(v43 - 8);
      do
      {
        v67(v3, v45, v20);
        uint64_t v46 = Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter();
        uint64_t v48 = v47;
        uint64_t v49 = Apple_Parsec_Siri_Context_ResultEntity.name.getter();
        v50 = v3;
        uint64_t v52 = v51;
        id v53 = objc_allocWithZone((Class)IQFMapsPersonalizationLocation);
        v54 = (void *)MEMORY[0x2533C50B0](v46, v48);
        swift_bridgeObjectRelease();
        v55 = (void *)MEMORY[0x2533C50B0](v49, v52);
        v3 = v50;
        swift_bridgeObjectRelease();
        objc_msgSend(v53, sel_initWithMUID_name_, v54, v55);

        (*v65)(v50, v20);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v45 += v66;
        --v42;
      }
      while (v42);
    }
    swift_release();
    v56 = *(void **)(v61 + 16);
    type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationLocation);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v58 = objc_msgSend(v56, sel_rankedEventsForLocations_, isa);

    type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationResult);
    uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    return v21;
  }
  v60 = v3;
  unint64_t v25 = 0;
  v65 = (void (**)(char *, uint64_t))(v0 + 16);
  v26 = (uint64_t (**)(char *, char *, uint64_t))(v0 + 32);
  v62 = (uint64_t (**)(char *, uint64_t))(v0 + 8);
  v27 = v63;
  while (v25 < *(void *)(v22 + 16))
  {
    unint64_t v28 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
    uint64_t v29 = v0;
    uint64_t v30 = *(void *)(v0 + 72);
    uint64_t v31 = v29;
    (*(void (**)(char *, unint64_t, uint64_t))(v29 + 16))(v27, v22 + v28 + v30 * v25, v20);
    uint64_t v32 = Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter();
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    uint64_t v35 = HIBYTE(v34) & 0xF;
    if ((v34 & 0x2000000000000000) == 0) {
      uint64_t v35 = v32 & 0xFFFFFFFFFFFFLL;
    }
    if (v35)
    {
      v36 = *v26;
      (*v26)((char *)v67, v27, v20);
      uint64_t v37 = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v37 + 16) + 1, 1);
        uint64_t v37 = v68;
      }
      unint64_t v39 = *(void *)(v37 + 16);
      unint64_t v38 = *(void *)(v37 + 24);
      if (v39 >= v38 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
        uint64_t v37 = v68;
      }
      *(void *)(v37 + 16) = v39 + 1;
      unint64_t v40 = v37 + v28 + v39 * v30;
      uint64_t v20 = v64;
      uint64_t result = v36((char *)v40, (char *)v67, v64);
      uint64_t v68 = v37;
      v27 = v63;
    }
    else
    {
      uint64_t result = (*v62)(v27, v20);
    }
    ++v25;
    uint64_t v0 = v31;
    if (v66 == v25)
    {
      uint64_t v41 = v68;
      v3 = v60;
      uint64_t v24 = MEMORY[0x263F8EE78];
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t PegasusResponsePersonalizationFeatures.deinit()
{
  return v0;
}

uint64_t PegasusResponsePersonalizationFeatures.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

uint64_t type metadata accessor for IQFMapsPersonalizationLocation(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for PegasusResponsePersonalizationFeatures()
{
  return self;
}

uint64_t method lookup function for PegasusResponsePersonalizationFeatures(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PegasusResponsePersonalizationFeatures);
}

uint64_t dispatch thunk of PegasusResponsePersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PegasusResponsePersonalizationFeatures.rankedMapsEventsForPegasusResponse(pegasusResponse:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_Context_ResultEntity>);
  uint64_t v10 = *(void *)(type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
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

void IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationLocation);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  v9[4] = partial apply for closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed [IQFMapsPersonalizationResult], @guaranteed Error?) -> ();
  v9[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_rankedEventsForLocations_completionHandler_, isa, v8);
  _Block_release(v8);
}

void closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(int a1, id a2, void (*a3)(void))
{
  if (a2)
  {
    id v5 = a2;
    ((void (*)(id, uint64_t))a3)(a2, 1);
  }
  else
  {
    a3();
  }
}

uint64_t sub_2529EC7F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(int a1, void *a2)
{
  closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(a1, a2, *(void (**)(void))(v2 + 16));
}

void thunk for @escaping @callee_guaranteed (@guaranteed [IQFMapsPersonalizationResult], @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationResult);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
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

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusRequest()
{
  return MEMORY[0x270F520F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.getter()
{
  return MEMORY[0x270F520F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction()
{
  return MEMORY[0x270F52110]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter()
{
  return MEMORY[0x270F52118]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata()
{
  return MEMORY[0x270F52130]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter()
{
  return MEMORY[0x270F52138]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter()
{
  return MEMORY[0x270F52140]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter()
{
  return MEMORY[0x270F528D8]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.name.getter()
{
  return MEMORY[0x270F528E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity()
{
  return MEMORY[0x270F528F0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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