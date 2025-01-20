void sub_21D937EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

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

void FSFSwitchToMobile()
{
  uid_t v0 = geteuid();
  v1 = getpwnam("mobile");
  if (v1) {
    uid_t pw_uid = v1->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  if (pw_uid != v0)
  {
    if (seteuid(pw_uid)) {
      NSLog(&cfstr_SeteuidToMobil.isa);
    }
  }
}

__CFString *FSFStringFromSourceType(uint64_t a1)
{
  if (a1) {
    return @"SELF";
  }
  else {
    return @"FEATURE_STORE";
  }
}

uint64_t FSFSourceTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"FEATURE_STORE"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"SELF"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = static FeatureStoreService.insertAwait<A>(interactionId:item:);
  return static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:)(0, 0xE000000000000000, a1, a2, a3, a4, a5, a6);
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)()
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  long long v3;
  void *v4;
  uint64_t v6;

  id v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  uint64_t v3 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = static FeatureStoreService.insertAwait<A>(interactionId:item:);
  return MEMORY[0x270FA2318]();
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:), 0, 0);
}

uint64_t static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  v9[5] = a4;
  v9[6] = a5;
  v9[3] = a2;
  v9[4] = a3;
  v9[2] = a1;
  return MEMORY[0x270FA2498](static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:), 0, 0);
}

uint64_t static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v7 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 88) = v2;
  long long v3 = *(_OWORD *)(v0 + 72);
  long long v4 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = v7;
  *(void *)(v2 + 64) = v1;
  *(_OWORD *)(v2 + 72) = v4;
  v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  void *v5 = v0;
  v5[1] = static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:);
  return MEMORY[0x270FA2318]();
}

{
  uint64_t v1;

  OUTLINED_FUNCTION_2();
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #1 in static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_7();
  uint64_t v24 = v23;
  uint64_t v61 = v25;
  uint64_t v62 = v26;
  uint64_t v28 = v27;
  v56[1] = v27;
  uint64_t v30 = v29;
  uint64_t v64 = v31;
  uint64_t v59 = a22;
  uint64_t v60 = v32;
  uint64_t v58 = a21;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v33;
  uint64_t v36 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v37);
  v57 = (char *)v56 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v38;
  uint64_t v41 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v42);
  v43 = (char *)v56 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  uint64_t v65 = v45;
  uint64_t v66 = v44;
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_11();
  static DispatchQoS.userInitiated.getter();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1();
  v46();
  unint64_t v47 = (*(unsigned __int8 *)(v39 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v48 = (char *)swift_allocObject();
  uint64_t v49 = v58;
  *((void *)v48 + 2) = v24;
  *((void *)v48 + 3) = v49;
  *((void *)v48 + 4) = v59;
  *((void *)v48 + 5) = v30;
  *((void *)v48 + 6) = v60;
  *((void *)v48 + 7) = v28;
  uint64_t v50 = v62;
  *((void *)v48 + 8) = v61;
  *((void *)v48 + 9) = v50;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v48[v47], v43, v24);
  v51 = v57;
  uint64_t v52 = v63;
  OUTLINED_FUNCTION_1();
  v53();
  unint64_t v54 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v55 = (uint64_t (*)(uint64_t))swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))((char *)v55 + v54, v51, v52);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v22, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(taskId:interactionId:item:completion:), (uint64_t)v48, (uint64_t (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:), v55);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v22, v66);
  OUTLINED_FUNCTION_10();
}

#error "21D93D610: call analysis failed (funcsize=14)"

void static FeatureStoreService.insertSync<A>(taskId:interactionId:item:)()
{
  OUTLINED_FUNCTION_7();
  uint64_t v79 = v0;
  uint64_t v80 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v85 = v8;
  uint64_t v86 = v9;
  v11 = v10;
  uint64_t v12 = type metadata accessor for LogSignpost();
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v15 = v14 - v13;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_4();
  uint64_t v17 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_3();
  v77 = (char *)(v21 - v22);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v84 = (uint64_t)v71 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v71 - v26;
  Logger.service.unsafeMutableAddressor();
  OUTLINED_FUNCTION_17();
  uint64_t v75 = v28;
  uint64_t v76 = v29;
  uint64_t v78 = v17;
  uint64_t v74 = v30;
  OUTLINED_FUNCTION_1();
  v31();
  uint64_t v82 = v5;
  uint64_t v88 = v3;
  OUTLINED_FUNCTION_1();
  v32();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.debug.getter();
  int v35 = v34;
  BOOL v36 = os_log_type_enabled(v33, v34);
  unint64_t v83 = v7;
  v81 = v11;
  uint64_t v87 = v15;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    uint64_t v73 = swift_slowAlloc();
    v90[0] = v73;
    *(_DWORD *)uint64_t v37 = 136315650;
    v71[1] = v37 + 4;
    uint64_t DynamicType = swift_getDynamicType();
    swift_getMetatypeMetadata();
    int v72 = v35;
    uint64_t v38 = String.init<A>(describing:)();
    uint64_t DynamicType = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v40 = OUTLINED_FUNCTION_12();
    v41(v40);
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, (unint64_t)v11, v90);
    OUTLINED_FUNCTION_13(v42);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, v7, v90);
    OUTLINED_FUNCTION_13(v43);
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21D935000, v33, (os_log_type_t)v72, "Inserting item of type %s with taskId: %s,  interactionId: %s", (uint8_t *)v37, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
    uint64_t v44 = OUTLINED_FUNCTION_12();
    v45(v44);

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_16();
    swift_bridgeObjectRelease_n();
  }
  v46 = *(void (**)(char *, uint64_t))(v19 + 8);
  uint64_t v47 = v78;
  v46(v27, v78);
  inserted = FeatureStoreService.signpostInsertSync.unsafeMutableAddressor();
  uint64_t v49 = *inserted;
  uint64_t v50 = (uint64_t)inserted[1];
  unsigned __int8 v51 = *((unsigned char *)inserted + 16);
  uint64_t v52 = v84;
  default argument 0 of static LogSignpost.begin(logger:_:)(v84);
  static LogSignpost.begin(logger:_:)(v52, v49, v50, v51, v87);
  v46((char *)v52, v47);
  uint64_t v53 = static JSONCoder.encode(codable:)();
  if (v54 >> 60 == 15)
  {
    v55 = v77;
    OUTLINED_FUNCTION_1();
    v56();
    v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_21D935000, v57, v58, "Could not encode the item. Skipping insertion.", v59, 2u);
      OUTLINED_FUNCTION_8();
    }

    v46(v55, v47);
  }
  else
  {
    uint64_t v60 = v53;
    unint64_t v61 = v54;
    v90[0] = swift_getDynamicType();
    swift_getMetatypeMetadata();
    uint64_t v62 = String.init<A>(describing:)();
    uint64_t v64 = v63;
    type metadata accessor for FeatureStoreStreamAccessor();
    static FeatureStoreService.streamIdentifierFor(typeName:taskId:)(v62, v64, v85, v81);
    swift_bridgeObjectRelease();
    uint64_t v65 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    uint64_t v66 = v83;
    swift_bridgeObjectRetain();
    outlined copy of Data?(v60, v61);
    int v67 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    double v68 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    id v69 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(v86, v66, v60, v61, v67, v68);
    (*(void (**)(void))(*(void *)v65 + 104))();
    swift_release();

    outlined consume of Data?(v60, v61);
  }
  uint64_t v70 = v87;
  $defer #1 <A>() in static FeatureStoreService.insertSync<A>(taskId:interactionId:item:)();
  outlined destroy of LogSignpost(v70);
  OUTLINED_FUNCTION_10();
}

#error "21D93DC2C: call analysis failed (funcsize=18)"

void static FeatureStoreService.insert<A>(taskId:interactionId:item:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_7();
  uint64_t v24 = v23;
  v55 = v25;
  v56 = v26;
  uint64_t v52 = v27;
  uint64_t v53 = v28;
  uint64_t v30 = v29;
  uint64_t v50 = a22;
  uint64_t v51 = v31;
  uint64_t v49 = a21;
  uint64_t v54 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  uint64_t v33 = v32;
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_4();
  uint64_t v37 = v36 - v35;
  OUTLINED_FUNCTION_0();
  uint64_t v39 = v38;
  uint64_t v41 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = (char *)&v49 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_1();
  v44();
  unint64_t v45 = (*(unsigned __int8 *)(v39 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v46 = (char *)swift_allocObject();
  uint64_t v47 = v49;
  *((void *)v46 + 2) = v24;
  *((void *)v46 + 3) = v47;
  *((void *)v46 + 4) = v50;
  *((void *)v46 + 5) = v22;
  *((void *)v46 + 6) = v51;
  *((void *)v46 + 7) = v30;
  uint64_t v48 = v53;
  *((void *)v46 + 8) = v52;
  *((void *)v46 + 9) = v48;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v46[v45], v43, v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v37, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(taskId:interactionId:item:completion:), (uint64_t)v46, v55, v56);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v37, v54);
  OUTLINED_FUNCTION_10();
}

#error "21D93DE24: call analysis failed (funcsize=13)"

void static FeatureStoreService.insertSync<A>(interactionId:item:)()
{
}

void $defer #1 <A>() in static FeatureStoreService.insertSync<A>(taskId:interactionId:item:)()
{
  OUTLINED_FUNCTION_7();
  unint64_t v1 = v0;
  uint64_t v26 = v2;
  uint64_t v27 = v3;
  unint64_t v5 = v4;
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_11();
  uint64_t v6 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v11 = v10 - v9;
  LogSignpost.end()();
  Logger.service.unsafeMutableAddressor();
  OUTLINED_FUNCTION_1();
  v12();
  OUTLINED_FUNCTION_1();
  v13();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v25 = v1;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315650;
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    uint64_t v17 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v19 = OUTLINED_FUNCTION_6();
    v20(v19);
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v21 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v5, &v28);
    OUTLINED_FUNCTION_14(v21);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v25, &v28);
    OUTLINED_FUNCTION_14(v22);
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21D935000, v14, v15, "Inserted item of type %s with taskId: %s,  interactionId: %s", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v6);
  }
  else
  {
    uint64_t v23 = OUTLINED_FUNCTION_6();
    v24(v23);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v6);
  }
  OUTLINED_FUNCTION_10();
}

uint64_t outlined destroy of LogSignpost(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static FeatureStoreService.streamIdentifierFor(typeName:taskId:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a1;
  if (a4 && (a3 || a4 != (void *)0xE000000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    v8._countAndFlagsBits = a3;
    v8._object = a4;
    String.append(_:)(v8);
    v9._countAndFlagsBits = 95;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v10 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v13 = v11 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v24 - v15;
  type metadata accessor for StreamQuery();
  uint64_t v17 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v17);
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v17);
  uint64_t v18 = variable initialization expression of StreamQuery.interactionIds();
  uint64_t v19 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v16, v13, v18);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_21D9610A0;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  uint64_t v21 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v19) + 0xA8);
  swift_bridgeObjectRetain();
  v21(v20);
  uint64_t v22 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v19, a3, a4, a5);

  return v22;
}

uint64_t static FeatureStoreService.retrieve<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)();
  if (!v5)
  {
    v14[7] = v9;
    MEMORY[0x270FA5388](v9);
    v14[2] = a2;
    v14[3] = a3;
    v14[4] = a4;
    type metadata accessor for InteractionWrapper();
    uint64_t v10 = type metadata accessor for Array();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v4 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:), (uint64_t)v14, v10, a2, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v12);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)()
{
  type metadata accessor for InteractionWrapper();
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = a5;
  uint64_t v37 = a8;
  v46 = a1;
  uint64_t v47 = a2;
  uint64_t v35 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v48 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v41 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = a4;
  MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(v17 - 8);
  uint64_t v39 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v34 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v33 - v20;
  uint64_t v22 = dispatch thunk of Collection.count.getter();
  if (!v22) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v23 = v22;
  uint64_t v51 = MEMORY[0x223C0DD40](v14);
  uint64_t v40 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v23);
  uint64_t v44 = a6;
  uint64_t result = dispatch thunk of Collection.startIndex.getter();
  if (v23 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v42 = (void (**)(char *))(v41 + 2);
    uint64_t v43 = v16;
    ++v41;
    while (1)
    {
      unint64_t v25 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v26 = v13;
      uint64_t v27 = v13;
      uint64_t v28 = AssociatedTypeWitness;
      (*v42)(v26);
      v25(v50, 0);
      uint64_t v29 = v49;
      v46(v27, v48);
      if (v29) {
        break;
      }
      uint64_t v49 = 0;
      (*v41)(v27, v28);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      --v23;
      uint64_t v13 = v27;
      if (!v23)
      {
        uint64_t v30 = v38;
        uint64_t v31 = v39;
        uint64_t v32 = v34;
        (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v34, v21, v39);
        _expectEnd<A>(of:is:)();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v31);
        return v51;
      }
    }
    (*v41)(v27, v28);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v39);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v37, v48, v36);
  }
  return result;
}

uint64_t closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(void *a1@<X0>, NSObject *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v73 = a3;
  uint64_t v74 = a4;
  uint64_t v8 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v14 = v12 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v64 - v16;
  v81 = a2;
  uint64_t v75 = a2;
  swift_getMetatypeMetadata();
  uint64_t v18 = String.init<A>(describing:)();
  unint64_t v20 = v19;
  Logger.service.unsafeMutableAddressor();
  OUTLINED_FUNCTION_17();
  uint64_t v69 = v21;
  uint64_t v70 = v22;
  uint64_t v68 = v23;
  OUTLINED_FUNCTION_1();
  v24();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRetain_n();
  unint64_t v25 = a1;
  uint64_t v78 = (void (*)(void, void))v17;
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  int v28 = v27;
  BOOL v29 = os_log_type_enabled(v26, v27);
  v71 = a5;
  uint64_t v72 = v14;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v77 = v18;
    uint64_t v31 = v30;
    uint64_t v66 = (void *)swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    v81 = v67;
    *(_DWORD *)uint64_t v31 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v80 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v20, (uint64_t *)&v81);
    uint64_t v76 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 12) = 2112;
    int v65 = v28;
    uint64_t v80 = (uint64_t)v25;
    uint64_t v32 = v10;
    uint64_t v33 = v25;
    uint64_t v8 = v76;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v66 = v25;

    uint64_t v10 = v32;
    _os_log_impl(&dword_21D935000, v26, (os_log_type_t)v65, "Retrieving items of type %s) with query: %@", (uint8_t *)v31, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    uint64_t v18 = v77;
    OUTLINED_FUNCTION_8();

    uint64_t v34 = v32;
  }
  else
  {

    OUTLINED_FUNCTION_16();
    swift_bridgeObjectRelease_n();
    uint64_t v34 = v10;
  }
  uint64_t v35 = v78;
  uint64_t v78 = (void (*)(void, void))v34[1];
  v78(v35, v8);
  type metadata accessor for FeatureStoreStreamAccessor();
  uint64_t v36 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v25) + 0xB8))();
  static FeatureStoreService.streamIdentifierFor(typeName:taskId:)(v18, v20, v36, v37);
  swift_bridgeObjectRelease();
  uint64_t v38 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  uint64_t v39 = v79;
  uint64_t v40 = (*(uint64_t (**)(void *))(*(void *)v38 + 112))(v25);
  if (v39)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    v64[0] = v25;
    v64[1] = v10;
    uint64_t v76 = v8;
    uint64_t v77 = v18;
    unint64_t v42 = v20;
    v81 = v40;
    MEMORY[0x270FA5388](v40);
    uint64_t v43 = (void *)v73;
    v64[-4] = v75;
    v64[-3] = v43;
    v64[-2] = v74;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
    uint64_t v44 = type metadata accessor for InteractionWrapper();
    lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
    uint64_t v45 = Sequence.compactMap<A>(_:)();
    swift_bridgeObjectRelease();
    uint64_t v46 = v72;
    uint64_t v47 = v76;
    OUTLINED_FUNCTION_1();
    v48();
    id v49 = v64[0];
    swift_bridgeObjectRetain();
    uint64_t v50 = v49;
    uint64_t v51 = v45;
    uint64_t v52 = v50;
    uint64_t v79 = v51;
    swift_bridgeObjectRetain();
    uint64_t v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.debug.getter();
    uint64_t v75 = v53;
    LODWORD(v74) = v54;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      v81 = v73;
      *(_DWORD *)uint64_t v55 = 134218498;
      uint64_t v56 = v79;
      uint64_t v80 = MEMORY[0x223C0D920](v79, v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v80 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v77, v42, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v57 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v55 + 22) = 2080;
      uint64_t v77 = v55 + 24;
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v52) + 0xA0))(v57);
      uint64_t v58 = MEMORY[0x223C0D8D0]();
      unint64_t v60 = v59;
      swift_bridgeObjectRelease();
      uint64_t v80 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v60, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      unint64_t v61 = v75;
      _os_log_impl(&dword_21D935000, v75, (os_log_type_t)v74, "Retrieved %ld item(s) of type %s) with query: %s", (uint8_t *)v55, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();

      swift_release();
      uint64_t v62 = v72;
      uint64_t v63 = v76;
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
      uint64_t v56 = v79;
      swift_bridgeObjectRelease();
      uint64_t v62 = v46;
      uint64_t v63 = v47;
    }
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v78)(v62, v63);
    uint64_t *v71 = v56;
  }
  return result;
}

uint64_t closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v40[2] = a3;
  v40[3] = a4;
  v40[0] = a5;
  uint64_t v7 = type metadata accessor for Optional();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v40 - v11;
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v18 = v16 - v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v40 - v20;
  uint64_t v22 = *a1;
  static JSONCoder.decode(data:)(a2, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    uint64_t v41 = 0;
    unint64_t v42 = 0xE000000000000000;
    _StringGuts.grow(_:)(17);
    swift_bridgeObjectRelease();
    uint64_t v41 = 0x6420746F6E6E6163;
    unint64_t v42 = 0xEF203A65646F6365;
    uint64_t v23 = OUTLINED_FUNCTION_15();
    outlined copy of Data._Representation(v23, v24);
    OUTLINED_FUNCTION_15();
    v25._countAndFlagsBits = Data.description.getter();
    String.append(_:)(v25);
    swift_bridgeObjectRelease();
    uint64_t v26 = OUTLINED_FUNCTION_15();
    outlined consume of Data._Representation(v26, v27);
    uint64_t v28 = v41;
    unint64_t v29 = v42;
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(void *)uint64_t v30 = v28;
    *(void *)(v30 + 8) = v29;
    *(unsigned char *)(v30 + 16) = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v12, a2);
    uint64_t v32 = *(void *)((char *)v22 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId);
    uint64_t v33 = *(void *)((char *)v22 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId + 8);
    uint64_t v34 = *(double (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v22) + 0x78);
    uint64_t v35 = swift_bridgeObjectRetain();
    double v36 = v34(v35);
    OUTLINED_FUNCTION_1();
    v37();
    uint64_t v38 = v40[0];
    InteractionWrapper.init(interactionId:timestamp:feature:)(v32, v33, v18, a2, v40[0], v36);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, a2);
    uint64_t v39 = type metadata accessor for InteractionWrapper();
    return __swift_storeEnumTagSinglePayload(v38, 0, 1, v39);
  }
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
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
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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
    return (void *)MEMORY[0x263F8EE78];
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
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

void partial apply for closure #1 in static FeatureStoreService.insert<A>(taskId:interactionId:item:completion:)()
{
}

{
  static FeatureStoreService.insertSync<A>(taskId:interactionId:item:)();
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = type metadata accessor for InteractionWrapper();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1 + *(int *)(v6 + 32), v5);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(*(void **)(v1 + 40), *(NSObject **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), a1);
}

uint64_t partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A]);
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError()
{
  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError;
  if (!lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError);
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

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 80) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_21D940120()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void OUTLINED_FUNCTION_8()
{
  JUMPOUT(0x223C0E840);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)()
{
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  OUTLINED_FUNCTION_3_0();
  *(_OWORD *)uint64_t v0 = xmmword_21D9610B0;
  *(unsigned char *)(v0 + 16) = 1;
  return swift_willThrow();
}

unint64_t FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
{
  v6.isa = v2->isa;
  uint64_t v7 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v37 - v14;
  uint64_t v16 = (*((uint64_t (**)(uint64_t, uint64_t))v6.isa + 14))(a1, a2);
  if (v3) {
    return (unint64_t)v2;
  }
  uint64_t v17 = (void *)v16;
  unint64_t result = type metadata accessor for NSKeyedUnarchiver();
  if (v17[2])
  {
    uint64_t v38 = v9;
    uint64_t v19 = v17[4];
    unint64_t v20 = v17[5];
    outlined copy of Data._Representation(v19, v20);
    swift_bridgeObjectRelease();
    uint64_t v2 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    outlined consume of Data._Representation(v19, v20);
    uint64_t v29 = v38;
    if (!v2)
    {
      Logger.accessor.unsafeMutableAddressor();
      OUTLINED_FUNCTION_1();
      v31();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_21D935000, v32, v33, "Deserialization failed. Returned nil object.", v34, 2u);
        OUTLINED_FUNCTION_8();
      }

      (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v7);
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      uint64_t v35 = (void *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_0(v36, 0xD000000000000026);
      Logger.accessor.unsafeMutableAddressor();
      uint64_t v37 = v7;
      OUTLINED_FUNCTION_1();
      v21();
      id v22 = v35;
      id v23 = v35;
      uint64_t v2 = Logger.logObject.getter();
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v2, v24))
      {
        Swift::String v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = (void *)swift_slowAlloc();
        *(_DWORD *)Swift::String v25 = 138412290;
        id v27 = v35;
        uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v39 = v28;
        uint64_t v29 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v26 = v28;

        _os_log_impl(&dword_21D935000, v2, v24, "Deserialization failed. Error: %@", v25, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v37);
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_0(v30, 0xD000000000000026);
    }
    return (unint64_t)v2;
  }
  __break(1u);
  return result;
}

unint64_t type metadata accessor for NSKeyedUnarchiver()
{
  unint64_t result = lazy cache variable for type metadata for NSKeyedUnarchiver;
  if (!lazy cache variable for type metadata for NSKeyedUnarchiver)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSKeyedUnarchiver);
  }
  return result;
}

uint64_t FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)()
{
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v0 + 120))();
  if (!v1)
  {
    v10[1] = v3;
    MEMORY[0x270FA5388](v3);
    v9[2] = *(void *)(v2 + 144);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    uint64_t v5 = type metadata accessor for InteractionWrapper();
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    unint64_t v7 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    uint64_t v0 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:), (uint64_t)v9, v4, v5, v6, v7, MEMORY[0x263F8E4E0], (uint64_t)v10);
    swift_bridgeObjectRelease();
  }
  return v0;
}

void closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(double *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v43 = a4;
  uint64_t v44 = a3;
  uint64_t v5 = v4;
  uint64_t v8 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v17 = *((void *)a1 + 1);
  double v42 = *a1;
  double v18 = a1[2];
  type metadata accessor for NSKeyedUnarchiver();
  uint64_t v19 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  if (!v4)
  {
    uint64_t v33 = *(void *)&v42;
    uint64_t v34 = v43;
    uint64_t v41 = v14;
    if (v19)
    {
      uint64_t v45 = v19;
      swift_bridgeObjectRetain();
      InteractionWrapper.init(interactionId:timestamp:feature:)(v33, v17, (uint64_t)&v45, a2, v34, v18);
      return;
    }
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v35();
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_21D935000, v36, v37, "Deserialization failed. Returned nil object.", v38, 2u);
      OUTLINED_FUNCTION_8();
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v8);
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    uint64_t v5 = (void *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_1_0(v39, 0xD000000000000026);
    uint64_t v14 = v41;
  }
  Logger.accessor.unsafeMutableAddressor();
  OUTLINED_FUNCTION_1();
  v20();
  id v21 = v5;
  id v22 = v5;
  id v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    Swift::String v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v43 = v8;
    id v27 = (void *)v26;
    uint64_t v41 = v14;
    *(_DWORD *)Swift::String v25 = 138412290;
    id v28 = v5;
    uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v45 = v29;
    uint64_t v14 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v27 = v29;

    _os_log_impl(&dword_21D935000, v23, v24, "Deserialization failed. Error: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    uint64_t v8 = v43;
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();
  }
  else
  {
  }
  uint64_t v30 = v44;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v8);
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  uint64_t v31 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(v32, 0xD000000000000026);

  *uint64_t v30 = v31;
}

id FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  return BaseStreamAccessor.init(identifier:)(a1, a2);
}

uint64_t FeatureStoreNSCodingAccessorWithType.__deallocating_deinit()
{
  uint64_t v0 = BaseStreamAccessor.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)()
{
  return FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)();
}

unint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t result = FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void partial apply for closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(double *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(a1, *(void *)(v3 + 16), a2, a3);
}

unint64_t lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A];
  if (!lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A]);
  }
  return result;
}

uint64_t type metadata instantiation function for FeatureStoreNSCodingAccessorWithType()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for FeatureStoreNSCodingAccessorWithType()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FeatureStoreNSCodingAccessorWithType()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2 | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_allocError();
}

uint64_t runSimulatableTask<A, B>(interactionId:input:_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, void (*a12)(char *, char *, uint64_t))
{
  uint64_t v49 = a9;
  unint64_t v48 = a8;
  v43[1] = a5;
  uint64_t v44 = a4;
  uint64_t v51 = a12;
  OUTLINED_FUNCTION_0();
  uint64_t v47 = a11;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_25();
  v43[2] = type metadata accessor for Optional();
  OUTLINED_FUNCTION_0();
  v43[0] = v19;
  MEMORY[0x270FA5388](v20);
  id v22 = (char *)v43 - v21;
  uint64_t v45 = type metadata accessor for FeatureStoreService();
  static FeatureStoreService.insert<A>(interactionId:item:)(a1, a2, a3, a6, v48, a10);
  uint64_t v46 = a1;
  unint64_t v48 = a2;
  unint64_t v23 = a2;
  uint64_t v24 = v47;
  interactionForInjection<A>(taskId:interactionId:)(0, 0xE000000000000000, a1, v23, a7, v47, v51, (uint64_t)v22);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
  v29(v25, v26, v27, v28);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, a7) == 1)
  {
    uint64_t v31 = v49;
    uint64_t v30 = v50;
    v44(v12);
    if (v30)
    {
      uint64_t v32 = OUTLINED_FUNCTION_7_0();
      v33(v32);
      uint64_t v34 = OUTLINED_FUNCTION_24();
      return v35(v34);
    }
    uint64_t v39 = OUTLINED_FUNCTION_7_0();
    v40(v39);
    uint64_t v41 = OUTLINED_FUNCTION_24();
    v42(v41);
  }
  else
  {
    uint64_t v37 = OUTLINED_FUNCTION_7_0();
    v38(v37);
    uint64_t v31 = v49;
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(a7 - 8) + 32))(v49, v22, a7);
  }
  return static FeatureStoreService.insert<A>(interactionId:item:)(v46, v48, v31, a7, v24, v51);
}

uint64_t interactionForInjection<A>(taskId:interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(char *, char *, uint64_t)@<X6>, uint64_t a8@<X8>)
{
  v101 = a7;
  uint64_t v102 = a6;
  unint64_t v94 = a4;
  uint64_t v91 = a3;
  uint64_t v103 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v99 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v14);
  v97 = ((char *)&v88 - v15);
  OUTLINED_FUNCTION_30();
  MEMORY[0x270FA5388](v16);
  os_log_t v92 = (os_log_t)((char *)&v88 - v17);
  OUTLINED_FUNCTION_30();
  MEMORY[0x270FA5388](v18);
  v95 = (char *)&v88 - v19;
  OUTLINED_FUNCTION_0();
  uint64_t v96 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_3();
  v90 = (char *)(v22 - v23);
  OUTLINED_FUNCTION_30();
  MEMORY[0x270FA5388](v24);
  v93 = (char *)&v88 - v25;
  OUTLINED_FUNCTION_30();
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v88 - v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v29 - 8);
  OUTLINED_FUNCTION_3();
  uint64_t v32 = v30 - v31;
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)&v88 - v34;
  type metadata accessor for FeatureStoreService();
  uint64_t v36 = static FeatureStoreService.interactionIdForInjection()();
  if (v37)
  {
    unint64_t v38 = v37;
    v89 = v28;
    uint64_t v98 = a8;
    uint64_t v39 = v36;
    type metadata accessor for StreamQuery();
    uint64_t v40 = type metadata accessor for Date();
    uint64_t v100 = a5;
    uint64_t v41 = v40;
    __swift_storeEnumTagSinglePayload((uint64_t)v35, 1, 1, v40);
    __swift_storeEnumTagSinglePayload(v32, 1, 1, v41);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_21D9610A0;
    *(void *)(v42 + 32) = v39;
    *(void *)(v42 + 40) = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v43 = v42;
    a5 = v100;
    id v44 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:taskId:)((uint64_t)v35, v32, v43, a1, a2);
    uint64_t v45 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v44, a5, v102, (uint64_t)v101);
    unint64_t v46 = v38;
    uint64_t v47 = v102;
    uint64_t v88 = v39;

    v105[0] = v45;
    type metadata accessor for Array();
    swift_getWitnessTable();
    if (Collection.isEmpty.getter())
    {
      swift_bridgeObjectRelease();
      Logger.service.unsafeMutableAddressor();
      OUTLINED_FUNCTION_31();
      os_log_t v48 = v97;
      uint64_t v49 = v103;
      OUTLINED_FUNCTION_1();
      v50();
      unint64_t v51 = v46;
      swift_bridgeObjectRetain();
      uint64_t v52 = Logger.logObject.getter();
      os_log_type_t v53 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        os_log_t v56 = v48;
        uint64_t v104 = a5;
        v105[0] = v55;
        *(_DWORD *)uint64_t v54 = 136315394;
        swift_getMetatypeMetadata();
        uint64_t v57 = String.init<A>(describing:)();
        uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, v58, v105);
        OUTLINED_FUNCTION_15_0();
        a5 = v100;
        swift_bridgeObjectRelease();
        *(_WORD *)(v54 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v51, v105);
        OUTLINED_FUNCTION_15_0();
        swift_bridgeObjectRelease_n();
        unint64_t v59 = "No injection available for type:%s injectInteractionId:%s";
        unint64_t v60 = v52;
        os_log_type_t v61 = v53;
LABEL_13:
        _os_log_impl(&dword_21D935000, v60, v61, v59, (uint8_t *)v54, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();

        (*(void (**)(os_log_t, uint64_t))(v39 + 8))(v56, v103);
LABEL_17:
        uint64_t v62 = 1;
        a8 = v98;
        return __swift_storeEnumTagSinglePayload(a8, v62, 1, a5);
      }
      goto LABEL_16;
    }
    uint64_t v64 = static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:)(a5, a1, a2, v88, v46, a5, v47, (uint64_t)v101);
    if (v64 >= MEMORY[0x223C0D920](v45, a5))
    {
      swift_bridgeObjectRelease();
      Logger.service.unsafeMutableAddressor();
      OUTLINED_FUNCTION_31();
      os_log_t v48 = v92;
      uint64_t v49 = v103;
      OUTLINED_FUNCTION_1();
      v83();
      swift_bridgeObjectRetain();
      uint64_t v52 = Logger.logObject.getter();
      os_log_type_t v84 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v52, v84))
      {
        uint64_t v54 = swift_slowAlloc();
        uint64_t v85 = swift_slowAlloc();
        os_log_t v56 = v48;
        uint64_t v104 = a5;
        v105[0] = v85;
        *(_DWORD *)uint64_t v54 = 136315394;
        swift_getMetatypeMetadata();
        uint64_t v86 = String.init<A>(describing:)();
        uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, v87, v105);
        OUTLINED_FUNCTION_15_0();
        a5 = v100;
        swift_bridgeObjectRelease();
        *(_WORD *)(v54 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v46, v105);
        OUTLINED_FUNCTION_15_0();
        swift_bridgeObjectRelease_n();
        unint64_t v59 = "Used up all injection values for type: %s injectInteractionId:%s";
        unint64_t v60 = v52;
        os_log_type_t v61 = v84;
        goto LABEL_13;
      }
LABEL_16:

      swift_bridgeObjectRelease_n();
      (*(void (**)(os_log_t, uint64_t))(v39 + 8))(v48, v49);
      goto LABEL_17;
    }
    int v65 = v89;
    Array.subscript.getter();
    swift_bridgeObjectRelease();
    Logger.service.unsafeMutableAddressor();
    uint64_t v66 = v99;
    uint64_t v67 = v95;
    OUTLINED_FUNCTION_1();
    v68();
    uint64_t v69 = v96;
    uint64_t v70 = v93;
    v101 = *(void (**)(char *, char *, uint64_t))(v96 + 16);
    v101(v93, v65, a5);
    unint64_t v71 = v94;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.debug.getter();
    LODWORD(v102) = v73;
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      os_log_t v92 = v72;
      uint64_t v75 = v74;
      v97 = swift_slowAlloc();
      uint64_t v104 = a5;
      v105[0] = (uint64_t)v97;
      *(_DWORD *)uint64_t v75 = 136316162;
      swift_getMetatypeMetadata();
      uint64_t v76 = String.init<A>(describing:)();
      uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v76, v77, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v75 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v104 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v46, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v75 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v91, v71, v105);
      OUTLINED_FUNCTION_28(v78);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v75 + 32) = 2080;
      uint64_t v69 = v96;
      v101(v90, v70, v100);
      uint64_t v79 = String.init<A>(describing:)();
      uint64_t v81 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v80, v105);
      OUTLINED_FUNCTION_28(v81);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v100);
      *(_WORD *)(v75 + 42) = 2048;
      uint64_t v104 = v64;
      a5 = v100;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      os_log_t v82 = v92;
      _os_log_impl(&dword_21D935000, v92, (os_log_type_t)v102, "=== Injecting Value ===\ntype:%s\ninjectInteractionId:%s\ninteractionId:%s\nvalue: %s\nvalueIndex: %ld", (uint8_t *)v75, 0x34u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();

      (*(void (**)(char *, uint64_t))(v66 + 8))(v95, v103);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v70, a5);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v67, v103);
    }
    a8 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v69 + 32))(v98, v89, a5);
    uint64_t v62 = 0;
  }
  else
  {
    uint64_t v62 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a8, v62, 1, a5);
}

uint64_t runSimulatableTask<A, B>(interactionId:input:task:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_8_0();
  *(void *)(v11 + 96) = a10;
  *(void *)(v11 + 104) = a11;
  *(_OWORD *)(v11 + 80) = a9;
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = v13;
  *(void *)(v11 + 48) = v14;
  *(void *)(v11 + 56) = v15;
  *(void *)(v11 + 32) = v16;
  *(void *)(v11 + 40) = v17;
  *(void *)(v11 + 16) = v18;
  *(void *)(v11 + 24) = v19;
  OUTLINED_FUNCTION_0();
  *(void *)(v11 + 112) = v20;
  *(void *)(v11 + 120) = OUTLINED_FUNCTION_17_0();
  uint64_t v21 = type metadata accessor for Optional();
  *(void *)(v11 + 128) = v21;
  OUTLINED_FUNCTION_1_1(v21);
  *(void *)(v11 + 136) = v22;
  *(void *)(v11 + 144) = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_16_0();
  return OUTLINED_FUNCTION_35();
}

#error "21D941DC8: call analysis failed (funcsize=84)"

uint64_t runSimulatableTask<A, B>(interactionId:input:task:)()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  void *v5 = v4;
  *(void *)(v6 + 168) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  OUTLINED_FUNCTION_8_0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t runSimulatableTask<A, B>(interactionId:input:task:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_33();
  uint64_t v12 = OUTLINED_FUNCTION_5_0();
  v13(v12);
  OUTLINED_FUNCTION_9();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_1();
  return v15(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
}

uint64_t runSimulatableTask<A, B>(taskId:interactionId:input:task:)()
{
  OUTLINED_FUNCTION_8_0();
  *(void *)(v0 + 112) = v20;
  *(void *)(v0 + 120) = v21;
  *(_OWORD *)(v0 + 96) = v19;
  *(void *)(v0 + 80) = v17;
  *(void *)(v0 + 88) = v18;
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = v2;
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  *(void *)(v0 + 32) = v5;
  *(void *)(v0 + 40) = v6;
  *(void *)(v0 + 16) = v7;
  *(void *)(v0 + 24) = v8;
  OUTLINED_FUNCTION_0();
  *(void *)(v0 + 128) = v9;
  *(void *)(v0 + 136) = OUTLINED_FUNCTION_17_0();
  uint64_t v10 = type metadata accessor for Optional();
  *(void *)(v0 + 144) = v10;
  OUTLINED_FUNCTION_1_1(v10);
  *(void *)(v0 + 152) = v11;
  *(void *)(v0 + 160) = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  void *v5 = v4;
  *(void *)(v6 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  OUTLINED_FUNCTION_8_0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void runSimulatableTask<A, B>(taskId:interactionId:input:task:)()
{
  uint64_t v1 = v0[20];
  uint64_t v22 = v0[14];
  uint64_t v23 = (void (*)(char *, char *, uint64_t))v0[15];
  uint64_t v2 = v0[12];
  uint64_t v21 = v0[13];
  uint64_t v3 = v0[11];
  unint64_t v4 = v0[6];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[3];
  v0[21] = type metadata accessor for FeatureStoreService();
  OUTLINED_FUNCTION_32();
  static FeatureStoreService.insert<A>(taskId:interactionId:item:)(v8, v9, v10, v11, v12, v13, v2, v21);
  interactionForInjection<A>(taskId:interactionId:)(v7, v6, v5, v4, v3, v22, v23, v1);
  OUTLINED_FUNCTION_21();
  if (!v14)
  {
    uint64_t v18 = v0[3];
    (*(void (**)(void, void, void))(v0[16] + 32))(v0[2], v0[20], v0[11]);
    OUTLINED_FUNCTION_12_0(v18);
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_23();
    __asm { BRAA            X1, X16 }
  }
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[22] = v15;
  *uint64_t v15 = v0;
  v15[1] = runSimulatableTask<A, B>(taskId:interactionId:input:task:);
  OUTLINED_FUNCTION_23();
  __asm { BRAA            X2, X16 }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v3;

  uint64_t v1 = v0[3];
  (*(void (**)(void, void, void))(v0[16] + 32))(v0[2], v0[17], v0[11]);
  OUTLINED_FUNCTION_12_0(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_23();
  __asm { BRAA            X1, X16 }
}

uint64_t one-time initialization function for lock()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_267D18DE8 = result;
  return result;
}

uint64_t one-time initialization function for cursors()
{
  uint64_t result = Dictionary.init(dictionaryLiteral:)();
  qword_267D18DF8 = result;
  return result;
}

uint64_t static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = a1;
  if (_MergedGlobals != -1) {
    a1 = swift_once();
  }
  uint64_t v16 = (os_unfair_lock_s *)qword_267D18DE8;
  MEMORY[0x270FA5388](a1);
  v20[2] = a6;
  v20[3] = a7;
  v20[4] = a8;
  v20[5] = v15;
  v20[6] = a2;
  v20[7] = a3;
  v20[8] = a4;
  v20[9] = a5;
  swift_retain();
  specialized OSAllocatedUnfairLock<A>.withLock<A>(_:)((uint64_t)partial apply for closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:), (uint64_t)v20, v16);
  uint64_t v18 = v17;
  swift_release();
  return v18;
}

uint64_t closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:)@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, void *a4@<X4>, void *a5@<X8>)
{
  uint64_t v11 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_25();
  swift_getMetatypeMetadata();
  uint64_t v34 = String.init<A>(describing:)();
  uint64_t v35 = v15;
  swift_bridgeObjectRetain();
  v16._countAndFlagsBits = 58;
  v16._object = (void *)0xE100000000000000;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = a1;
  v17._object = a2;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v18._countAndFlagsBits = 58;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = a3;
  v19._object = a4;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  unint64_t v20 = v35;
  if (qword_267D18DF0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v21 = qword_267D18DF8;
  if (*(void *)(qword_267D18DF8 + 16))
  {
    uint64_t v22 = v5;
    swift_bridgeObjectRetain();
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v34, v35);
    if (v24) {
      uint64_t v25 = *(void *)(*(void *)(v21 + 56) + 8 * v23);
    }
    else {
      uint64_t v25 = -1;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = v5;
    uint64_t v25 = -1;
  }
  uint64_t result = swift_endAccess();
  if (__OFADD__(v25, 1))
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v25 + 1, v34, v35);
    swift_endAccess();
    swift_bridgeObjectRelease();
    Logger.service.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v27();
    swift_bridgeObjectRetain();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v33 = v34;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 134218242;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v30 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v20, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();

      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v22, v11);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v31 = OUTLINED_FUNCTION_34();
      uint64_t result = v32(v31);
    }
    *a5 = v25 + 1;
  }
  return result;
}

void specialized OSAllocatedUnfairLock<A>.withLock<A>(_:)(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v4, &v5);
  os_unfair_lock_unlock(v3);
}

uint64_t static FeatureStoreService.interactionIdForInjection()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v1 = @nonobjc NSUserDefaults.init(suiteName:)(0xD000000000000013, 0x800000021D962B60);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = (void *)MEMORY[0x223C0D7E0](0xD00000000000001CLL, 0x800000021D962B80);
  id v4 = objc_msgSend(v2, sel_stringForKey_, v3);

  if (!v4)
  {

    return 0;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t static FeatureStoreService.runReplayableOperation<A, B>(interactionId:input:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  OUTLINED_FUNCTION_8_0();
  *(void *)(v11 + 96) = a10;
  *(void *)(v11 + 104) = a11;
  *(_OWORD *)(v11 + 80) = a9;
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = v13;
  *(void *)(v11 + 48) = v14;
  *(void *)(v11 + 56) = v15;
  *(void *)(v11 + 32) = v16;
  *(void *)(v11 + 40) = v17;
  *(void *)(v11 + 16) = v18;
  *(void *)(v11 + 24) = v19;
  OUTLINED_FUNCTION_0();
  *(void *)(v11 + 112) = v20;
  *(void *)(v11 + 120) = OUTLINED_FUNCTION_17_0();
  uint64_t v21 = type metadata accessor for Optional();
  *(void *)(v11 + 128) = v21;
  OUTLINED_FUNCTION_1_1(v21);
  *(void *)(v11 + 136) = v22;
  *(void *)(v11 + 144) = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_16_0();
  return OUTLINED_FUNCTION_35();
}

#error "21D942D2C: call analysis failed (funcsize=87)"

uint64_t static FeatureStoreService.runReplayableOperation<A, B>(interactionId:input:_:)()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_22();
  void *v5 = v4;
  *(void *)(v6 + 168) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_16_0();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t static FeatureStoreService.runReplayableOperation<A, B>(interactionId:input:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_33();
  uint64_t v12 = OUTLINED_FUNCTION_5_0();
  v13(v12);
  OUTLINED_FUNCTION_18();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_1();
  return v15(v14, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
}

id @nonobjc NSUserDefaults.init(suiteName:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x223C0D7E0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

void *specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(uint64_t a1, void *(*a2)(uint64_t *__return_ptr))
{
  uint64_t result = a2(&v4);
  if (!v2) {
    return (void *)v4;
  }
  return result;
}

uint64_t partial apply for closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:)@<X0>(void *a1@<X8>)
{
  return closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:taskId:interactionId:)(*(void *)(v1 + 48), *(void **)(v1 + 56), *(void *)(v1 + 64), *(void **)(v1 + 72), a1);
}

ValueMetadata *type metadata accessor for InjectionCursor()
{
  return &type metadata for InjectionCursor;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Int>);
  uint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    *(void *)(v20[7] + 8 * v16) = a1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  void *v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void *specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)@<X0>(uint64_t a1@<X0>, void *(*a2)(uint64_t *__return_ptr)@<X1>, void *a3@<X8>)
{
  uint64_t result = specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(a1, a2);
  if (!v3) {
    *a3 = result;
  }
  return result;
}

void *partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(a1, *(void *(**)(uint64_t *__return_ptr))(v2 + 16), a2);
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return static FeatureStoreService.insert<A>(taskId:interactionId:item:)(0, 0xE000000000000000, v4, v3, v5, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  return static FeatureStoreService.insert<A>(taskId:interactionId:item:)(a1, v7, v6, v5, v2, v4, v3, v1);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *, uint64_t))
{
  return interactionForInjection<A>(taskId:interactionId:)(0, 0xE000000000000000, v10, v13, v12, v11, a9, v9);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return type metadata accessor for FeatureStoreService();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return static FeatureStoreService.insert<A>(interactionId:item:)(v4, v3, v5, v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return *(void *)(v0 + 144);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return *(void *)(v0 + 120);
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return MEMORY[0x270FA2498]();
}

uint64_t BaseFeatureWrapper.feature.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 88));
}

id @objc BaseFeatureWrapper.interactionId.getter(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + *(void *)(*(void *)a1 + 96));
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)MEMORY[0x223C0D7E0](v2, v3);
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t BaseFeatureWrapper.interactionId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(void *)(*(void *)v0 + 96));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t @objc BaseFeatureWrapper.dataVersion.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + *(void *)(*(void *)a1 + 104));
}

uint64_t BaseFeatureWrapper.dataVersion.getter()
{
  return *(unsigned int *)(v0 + *(void *)(*(void *)v0 + 104));
}

uint64_t BaseFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, a4);
  return v8;
}

uint64_t *BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = *v4;
  uint64_t v6 = (uint64_t *)((char *)v4 + *(void *)(*v4 + 96));
  *uint64_t v6 = a1;
  v6[1] = a2;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 + 104)) = a3;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 32))((uint64_t)v4 + *(void *)(*v4 + 88), a4);
  return v4;
}

uint64_t BaseFeatureWrapper.serialize()()
{
  return 0;
}

uint64_t static BaseFeatureWrapper.deserialize(_:dataVersion:interactionId:)()
{
  return 0;
}

id @objc static BaseFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v8, v10);

  return 0;
}

Swift::String_optional __swiftcall BaseFeatureWrapper.json()()
{
  uint64_t v0 = 0;
  uint64_t v1 = 0;
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t BaseFeatureWrapper.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BaseFeatureWrapper.__deallocating_deinit()
{
  BaseFeatureWrapper.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata completion function for BaseFeatureWrapper()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for BaseFeatureWrapper()
{
  return __swift_instantiateGenericMetadata();
}

id OUTLINED_FUNCTION_0_1()
{
  return 0;
}

uint64_t AceObjectFeatureWrapper.serialize()()
{
  v36[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  id v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)v35 - v8;
  id v10 = objc_msgSend(*(id *)(v0 + 16), sel_dictionary);
  if (!v10)
  {
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v16();
    char v17 = (void *)Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_3_2(v18))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_2_0(&dword_21D935000, v19, v20, "AceObject dictionary is nil.");
      OUTLINED_FUNCTION_1_2();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v1);
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = self;
  v36[0] = 0;
  id v13 = objc_msgSend(v12, sel_dataWithJSONObject_options_error_, v11, 0, v36);
  id v14 = v36[0];
  if (!v13)
  {
    uint64_t v21 = v14;
    uint64_t v22 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v23();
    id v24 = v22;
    id v25 = v22;
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (_DWORD *)swift_slowAlloc();
      v35[0] = swift_slowAlloc();
      *uint64_t v28 = 138412290;
      id v29 = v22;
      uint64_t v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v36[0] = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v31 = v35[0];
      *(void *)v35[0] = v30;

      OUTLINED_FUNCTION_5_1(&dword_21D935000, v32, v33, "Serialization failed. Error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x223C0E840](v31, -1, -1);
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v1);
    return 0;
  }
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v15;
}

Class @objc AceObjectFeatureWrapper.serialize()()
{
  swift_retain();
  uint64_t v0 = AceObjectFeatureWrapper.serialize()();
  unint64_t v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v0, v2);
  }

  return isa;
}

uint64_t static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v45 = a4;
  v46[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v7 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  id v13 = &v43[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v43[-v14];
  unint64_t v16 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v46[0] = 0;
  id v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, isa, 0, v46);

  if (v18)
  {
    id v19 = v46[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_6;
    }
    int v44 = a3;
    id v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    uint64_t v21 = v7;
    Class v22 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(v20, sel_initWithDictionary_, v22);

    uint64_t v7 = v21;
    if (v23)
    {
      type metadata accessor for AceObjectFeatureWrapper();
      swift_bridgeObjectRetain();
      AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(v45, a5, v44, (uint64_t)v23);
      uint64_t result = swift_dynamicCastClass();
      if (result) {
        return result;
      }
      swift_release();
    }
    else
    {
LABEL_6:
      Logger.accessor.unsafeMutableAddressor();
      OUTLINED_FUNCTION_1();
      v25();
      uint64_t v26 = (void *)Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_3_2(v27))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_2_0(&dword_21D935000, v28, v29, "Could not create AceObject.");
        OUTLINED_FUNCTION_1_2();
      }

      (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v15, v7);
    }
  }
  else
  {
    id v30 = v46[0];
    uint64_t v31 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    Logger.accessor.unsafeMutableAddressor();
    uint64_t v45 = v7;
    OUTLINED_FUNCTION_1();
    v32();
    id v33 = v31;
    id v34 = v31;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (_DWORD *)swift_slowAlloc();
      unint64_t v38 = (void *)swift_slowAlloc();
      *unint64_t v37 = 138412290;
      id v39 = v31;
      uint64_t v40 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v46[0] = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v38 = v40;

      OUTLINED_FUNCTION_5_1(&dword_21D935000, v41, v42, "Deserialization failed. Error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x223C0E840](v38, -1, -1);
      OUTLINED_FUNCTION_1_2();
    }
    else
    {
    }
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v13, v45);
  }
  return 0;
}

uint64_t *AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return AceObjectFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, a4);
}

id @objc static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  swift_getObjCClassMetadata();
  uint64_t v15 = (void *)static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);

  return v15;
}

Swift::String_optional __swiftcall AceObjectFeatureWrapper.json()()
{
  uint64_t v1 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 120))(v8);
  if (v10 >> 60 == 15)
  {
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v11();
    uint64_t v12 = (void *)Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_3_2(v13))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_2_0(&dword_21D935000, v14, v15, "Json fetch failed.");
      OUTLINED_FUNCTION_1_2();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
    uint64_t v16 = 0;
    char v17 = 0;
  }
  else
  {
    uint64_t v18 = v9;
    unint64_t v19 = v10;
    static String.Encoding.utf8.getter();
    uint64_t v16 = String.init(data:encoding:)();
    char v17 = v20;
    outlined consume of Data?(v18, v19);
  }
  uint64_t v21 = v16;
  Class v22 = v17;
  result.value._object = v22;
  result.value._countAndFlagsBits = v21;
  return result;
}

id @objc AceObjectFeatureWrapper.json()()
{
  swift_retain();
  Swift::String_optional v0 = AceObjectFeatureWrapper.json()();
  swift_release();
  if (v0.value._object)
  {
    uint64_t v1 = (void *)MEMORY[0x223C0D7E0](v0.value._countAndFlagsBits, v0.value._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t *AceObjectFeatureWrapper.init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = a4;
  return BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, (uint64_t)&v5);
}

uint64_t AceObjectFeatureWrapper.__deallocating_deinit()
{
  uint64_t v0 = BaseFeatureWrapper.deinit();

  return MEMORY[0x270FA0228](v0, 44, 7);
}

uint64_t *vtable thunk for BaseFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:) dispatching to AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  return AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, a3, *a4);
}

uint64_t type metadata accessor for AceObjectFeatureWrapper()
{
  return __swift_instantiateGenericMetadata();
}

void OUTLINED_FUNCTION_1_2()
{
  JUMPOUT(0x223C0E840);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_3_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t protocol witness for Error._domain.getter in conformance FeatureStoreError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance FeatureStoreError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance FeatureStoreError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance FeatureStoreError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t outlined copy of FeatureStoreError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FeatureStoreError(uint64_t a1)
{
  return outlined consume of FeatureStoreError(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t outlined consume of FeatureStoreError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  *(unsigned char *)(v2 + 16) = v5;
  return v2;
}

uint64_t assignWithCopy for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  uint64_t v6 = *(void *)v2;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(v2 + 16);
  *(unsigned char *)(v2 + 16) = v5;
  outlined consume of FeatureStoreError(v6, v7, v8);
  return v2;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of FeatureStoreError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureStoreError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureStoreError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for FeatureStoreError(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for FeatureStoreError(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureStoreError()
{
  return &type metadata for FeatureStoreError;
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  return outlined copy of FeatureStoreError(v4, v5, v3);
}

id INIntentResponse.fsf_serialize()()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unsigned __int8 v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)INSJSONEncodedIntentResponse();
  if (result)
  {
    uint64_t v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    static String.Encoding.utf8.getter();
    uint64_t v6 = String.data(using:allowLossyConversion:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static INIntentResponse.fsf_deserialize(from:)()
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v1 = (id)INIntentResponseCreate();

  return v1;
}

id protocol witness for Serializable.fsf_serialize() in conformance INIntentResponse()
{
  return INIntentResponse.fsf_serialize()();
}

id protocol witness for static Serializable.fsf_deserialize(from:) in conformance INIntentResponse@<X0>(void *a1@<X8>)
{
  id result = static INIntentResponse.fsf_deserialize(from:)();
  *a1 = result;
  return result;
}

uint64_t FeatureStoreStreamAccessor.stream.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC12FeatureStore26FeatureStoreStreamAccessor_stream;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_3_3();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t FeatureStoreStreamAccessor.__allocating_init(identifier:)()
{
  uint64_t v0 = swift_allocObject();
  FeatureStoreStreamAccessor.init(identifier:)();
  return v0;
}

uint64_t FeatureStoreStreamAccessor.init(identifier:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  id v7 = objc_msgSend(self, sel_biomeStoreConfig);
  *(void *)(v0 + 16) = v7;
  type metadata accessor for FeatureStoreBiomeEvent();
  id v8 = v7;
  Streams.StoreStream.init(_:storeConfig:)();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0 + OBJC_IVAR____TtC12FeatureStore26FeatureStoreStreamAccessor_stream, v6, v1);
  return v0;
}

void FeatureStoreStreamAccessor.insert(feature:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>, &demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  id v2 = (id)StoreStreamProtocol.source()();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x78))();
  objc_msgSend(v2, sel_sendEvent_timestamp_, a1);
}

uint64_t FeatureStoreStreamAccessor.retrieve(query:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Filter<BMStoreEvent>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v48 = v3;
  uint64_t v49 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_4_1();
  uint64_t v47 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BookmarkablePublisher<BMStoreEvent>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v45 = v6;
  uint64_t v46 = v5;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_4_1();
  uint64_t v44 = v7;
  uint64_t v8 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_4();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  id v20 = (char *)&v44 - v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  uint64_t v21 = (void *)Streams.StoreStream.inner.getter();
  OUTLINED_FUNCTION_5_2();
  (*(void (**)(void))(v22 + 112))();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v8))
  {
    outlined destroy of Date?((uint64_t)v20);
    id v23 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_1();
    v24();
    outlined destroy of Date?((uint64_t)v20);
    Date.timeIntervalSinceReferenceDate.getter();
    double v26 = v25;
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    id v23 = (void *)MEMORY[0x223C0DA00](v27, v26);
  }
  OUTLINED_FUNCTION_5_2();
  (*(void (**)(void))(v28 + 136))();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v8))
  {
    outlined destroy of Date?((uint64_t)v18);
    uint64_t v29 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_1();
    v30();
    outlined destroy of Date?((uint64_t)v18);
    Date.timeIntervalSinceReferenceDate.getter();
    double v32 = v31;
    uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    uint64_t v29 = (void *)MEMORY[0x223C0DA00](v33, v32);
  }
  id v34 = objc_msgSend(v21, sel_publisherWithStartTime_endTime_maxEvents_lastN_reversed_, v23, v29, 0, 0, 0, v44, v45, v46);

  id v35 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMStoreEvent);
  BookmarkablePublisher.init(_:)();
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = MEMORY[0x263F8EE78];
  unint64_t v37 = (uint64_t *)(v36 + 16);
  *(void *)(swift_allocObject() + 16) = a1;
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type BookmarkablePublisher<BMStoreEvent<FeatureStoreBiomeEvent>> and conformance BookmarkablePublisher<A>, &demangling cache variable for type metadata for BookmarkablePublisher<BMStoreEvent>);
  id v38 = a1;
  PublisherProtocol.filter(isIncluded:)();
  swift_release();
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type Publishers.Filter<BMStoreEvent<FeatureStoreBiomeEvent>> and conformance Publishers.Filter<A>, &demangling cache variable for type metadata for Publishers.Filter<BMStoreEvent>);
  swift_retain();
  id v39 = (void *)PublisherProtocol.sink(completion:receiveInput:)();

  swift_release();
  OUTLINED_FUNCTION_7_1();
  v40();
  OUTLINED_FUNCTION_7_1();
  v41();
  swift_beginAccess();
  uint64_t v42 = *v37;
  swift_bridgeObjectRetain();
  swift_release();
  return v42;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21D9454E4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a2) + 0xA0);
  uint64_t v12 = *(void *)(v11() + 16);
  uint64_t v13 = swift_bridgeObjectRelease();
  if (!v12) {
    return 1;
  }
  uint64_t v14 = ((uint64_t (*)(uint64_t))v11)(v13);
  uint64_t v15 = specialized Set.init<A>(_:)(v14);
  uint64_t v16 = (char *)objc_msgSend(a1, sel_eventBody);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)&v16[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
    uint64_t v19 = *(void *)&v16[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId + 8];
    swift_bridgeObjectRetain();
    LOBYTE(v18) = specialized Set.contains(_:)(v18, v19, v15);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return v18 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v21();
    id v22 = a1;
    id v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      double v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)double v25 = 136315138;
      objc_msgSend(v22, sel_error);
      type metadata accessor for BMStoreError();
      uint64_t v26 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21D935000, v23, v24, "EventBody is nil. Store error: %s", v25, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
    return 0;
  }
}

uint64_t sub_21D9457EC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(void *a1)
{
  return closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(a1, *(void **)(v1 + 16));
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2 = Set.init(minimumCapacity:)();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = objc_msgSend(a1, sel_eventBody);
  if (v11)
  {
    BOOL v12 = v11;
    id v13 = objc_msgSend(a1, sel_timestamp);
    (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v12) + 0x80))(v13);
    swift_beginAccess();
    uint64_t v14 = v12;
    MEMORY[0x223C0D8A0]();
    specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x10));
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
  }
  else
  {
    Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1();
    v15();
    id v16 = a1;
    BOOL v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315138;
      v23[0] = v20;
      LOBYTE(v24) = objc_msgSend(v16, sel_error);
      type metadata accessor for BMStoreError();
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21D935000, v17, v18, "This should not happen as we had already filtered nil eventBody instances! Store Error: %s", v19, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_8();
    }
    else
    {
    }
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
}

void partial apply for closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(void *a1)
{
  closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(a1, v1);
}

uint64_t lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(unint64_t *a1, uint64_t *a2)
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

uint64_t FeatureStoreStreamAccessor.retrieve(interactionId:)()
{
  _StringGuts.grow(_:)(75);
  v0._object = (void *)0x800000021D962C40;
  v0._countAndFlagsBits = 0xD000000000000048;
  String.append(_:)(v0);
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 33;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  swift_allocError();
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0xE000000000000000;
  *(unsigned char *)(v3 + 16) = 0;
  return swift_willThrow();
}

uint64_t FeatureStoreStreamAccessor.deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_1();
  v1();
  return v0;
}

uint64_t FeatureStoreStreamAccessor.__deallocating_deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_1();
  v1();
  uint64_t v2 = *((unsigned int *)*v0 + 12);
  uint64_t v3 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

_UNKNOWN **associated type witness table accessor for StreamAccessor.FeatureType : FeatureMetadata in FeatureStoreStreamAccessor()
{
  return &protocol witness table for FeatureStoreBiomeEvent;
}

uint64_t protocol witness for StreamAccessor.init(identifier:) in conformance FeatureStoreStreamAccessor@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 96))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for StreamAccessor.insert(feature:) in conformance FeatureStoreStreamAccessor()
{
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t protocol witness for StreamAccessor.retrieve(query:) in conformance FeatureStoreStreamAccessor()
{
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t protocol witness for StreamAccessor.retrieve(interactionId:) in conformance FeatureStoreStreamAccessor()
{
  OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t ObjC metadata update function for FeatureStoreStreamAccessor()
{
  return type metadata accessor for FeatureStoreStreamAccessor();
}

uint64_t type metadata accessor for FeatureStoreStreamAccessor()
{
  uint64_t result = type metadata singleton initialization cache for FeatureStoreStreamAccessor;
  if (!type metadata singleton initialization cache for FeatureStoreStreamAccessor) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for FeatureStoreStreamAccessor()
{
  type metadata accessor for Streams.StoreStream<FeatureStoreBiomeEvent>();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for FeatureStoreStreamAccessor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeatureStoreStreamAccessor);
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.__allocating_init(identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.insert(feature:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.retrieve(query:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

void type metadata accessor for Streams.StoreStream<FeatureStoreBiomeEvent>()
{
  if (!lazy cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>)
  {
    type metadata accessor for FeatureStoreBiomeEvent();
    unint64_t v0 = type metadata accessor for Streams.StoreStream();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
    }
  }
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  return result;
}

void type metadata accessor for BMStoreError()
{
  if (!lazy cache variable for type metadata for BMStoreError)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for BMStoreError);
    }
  }
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    BOOL v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      os_log_type_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *id v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t PBCodableFeatureWrapper.serialize()()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_data);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

Class @objc PBCodableFeatureWrapper.serialize()()
{
  swift_retain();
  uint64_t v0 = PBCodableFeatureWrapper.serialize()();
  unint64_t v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v0, v2);
  }

  return isa;
}

uint64_t static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2_2();
  objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  outlined copy of Data._Representation(a1, a2);
  id v10 = @nonobjc PBCodable.init(data:)(a1, a2);
  if (v10)
  {
    uint64_t v11 = (uint64_t)v10;
    type metadata accessor for PBCodableFeatureWrapper();
    swift_bridgeObjectRetain();
    AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a4, a5, a3, v11);
    uint64_t result = swift_dynamicCastClass();
    if (result) {
      return result;
    }
    swift_release();
  }
  else
  {
    Logger.accessor.unsafeMutableAddressor();
    uint64_t v13 = OUTLINED_FUNCTION_1_3();
    v14(v13);
    unint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (_WORD *)swift_slowAlloc();
      *int64_t v17 = 0;
      OUTLINED_FUNCTION_2_0(&dword_21D935000, v18, v19, "Serialization failed");
      MEMORY[0x223C0E840](v17, -1, -1);
    }

    uint64_t v20 = OUTLINED_FUNCTION_4_2();
    v21(v20);
  }
  return 0;
}

id @objc static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  swift_getObjCClassMetadata();
  unint64_t v15 = (void *)static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);

  return v15;
}

Swift::String_optional __swiftcall PBCodableFeatureWrapper.json()()
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_2_2();
  uint64_t v2 = type metadata accessor for String.Encoding();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 120))(v3);
  if (v5 >> 60 == 15)
  {
    Logger.accessor.unsafeMutableAddressor();
    uint64_t v6 = OUTLINED_FUNCTION_1_3();
    v7(v6);
    id v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      unint64_t v10 = (_WORD *)swift_slowAlloc();
      _WORD *v10 = 0;
      OUTLINED_FUNCTION_2_0(&dword_21D935000, v11, v12, "Json fetch failed.");
      MEMORY[0x223C0E840](v10, -1, -1);
    }

    uint64_t v13 = OUTLINED_FUNCTION_4_2();
    v14(v13);
    uint64_t v15 = 0;
    os_log_type_t v16 = 0;
  }
  else
  {
    uint64_t v17 = v4;
    unint64_t v18 = v5;
    static String.Encoding.utf8.getter();
    uint64_t v15 = String.init(data:encoding:)();
    os_log_type_t v16 = v19;
    outlined consume of Data?(v17, v18);
  }
  uint64_t v20 = v15;
  unint64_t v21 = v16;
  result.value._object = v21;
  result.value._countAndFlagsBits = v20;
  return result;
}

id @objc PBCodableFeatureWrapper.json()()
{
  swift_retain();
  Swift::String_optional v0 = PBCodableFeatureWrapper.json()();
  swift_release();
  if (v0.value._object)
  {
    uint64_t v1 = (void *)MEMORY[0x223C0D7E0](v0.value._countAndFlagsBits, v0.value._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

id @nonobjc PBCodable.init(data:)(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a1, a2);
  }
  id v6 = objc_msgSend(v2, sel_initWithData_, isa);

  return v6;
}

uint64_t type metadata accessor for PBCodableFeatureWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t static NSCodingCoder.encode(codable:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v2, sel_setOutputFormat_, 100);
  objc_msgSend(v2, sel_encodeObject_forKey_, a1, *MEMORY[0x263F081D0]);
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t static NSCodingCoder.decode(data:)()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - v3;
  type metadata accessor for NSKeyedUnarchiver();
  uint64_t result = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  if (!result)
  {
    uint64_t v6 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v6, v0);
    id v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl(&dword_21D935000, v7, v8, "Decoding failed, unexpectedly returns . Returning nil object", v9, 2u);
      MEMORY[0x223C0E840](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
  return result;
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance NSCodingCoder<A>(uint64_t *a1)
{
  return static NSCodingCoder.encode(codable:)(*a1);
}

uint64_t protocol witness for static Coder.decode(data:) in conformance NSCodingCoder<A>@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static NSCodingCoder.decode(data:)();
  *a1 = result;
  return result;
}

uint64_t type metadata instantiation function for NSCodingCoder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for NSCodingCoder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of static Coder.encode(codable:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static Coder.decode(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static FeatureStoreService.logger);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static FeatureStoreService.logger);
  Logger.service.unsafeMutableAddressor();
  OUTLINED_FUNCTION_7_2();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v2 + 16);

  return v3(v1);
}

uint64_t FeatureStoreService.logger.unsafeMutableAddressor()
{
  return FeatureStoreService.logger.unsafeMutableAddressor(&one-time initialization token for logger, MEMORY[0x263F90268], (uint64_t)static FeatureStoreService.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static FeatureStoreService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static FeatureStoreService.logger.getter(&one-time initialization token for logger, MEMORY[0x263F90268], (uint64_t)static FeatureStoreService.logger, a1);
}

uint64_t one-time initialization function for signposter()
{
  uint64_t v0 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v7, static FeatureStoreService.signposter);
  __swift_project_value_buffer(v7, (uint64_t)static FeatureStoreService.signposter);
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v0, (uint64_t)static FeatureStoreService.logger);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v6, v8, v0);
  return OSSignposter.init(logger:)();
}

uint64_t FeatureStoreService.signposter.unsafeMutableAddressor()
{
  return FeatureStoreService.logger.unsafeMutableAddressor(&one-time initialization token for signposter, MEMORY[0x263F90228], (uint64_t)static FeatureStoreService.signposter);
}

uint64_t FeatureStoreService.logger.unsafeMutableAddressor(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return __swift_project_value_buffer(v5, a3);
}

uint64_t static FeatureStoreService.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static FeatureStoreService.logger.getter(&one-time initialization token for signposter, MEMORY[0x263F90228], (uint64_t)static FeatureStoreService.signposter, a1);
}

uint64_t static FeatureStoreService.logger.getter@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  __swift_project_value_buffer(v7, a3);
  OUTLINED_FUNCTION_7_2();
  os_log_type_t v9 = *(uint64_t (**)(uint64_t))(v8 + 16);

  return v9(a4);
}

uint64_t static FeatureStoreService.qos.getter()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v1 = (void *)MEMORY[0x223C0D7E0](0xD000000000000014, 0x800000021D962D10);
  id v2 = objc_msgSend(v0, sel_stringForKey_, v1);

  if (v2)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;

    if (v6)
    {
      BOOL v7 = v4 == 0x74696E4972657375 && v6 == 0xED00006465746169;
      if (v7 || (OUTLINED_FUNCTION_5_3() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return static DispatchQoS.userInitiated.getter();
      }
      BOOL v9 = v4 == 0x65746E4972657375 && v6 == 0xEF65766974636172;
      if (v9 || (OUTLINED_FUNCTION_5_3() & 1) != 0)
      {
        uint64_t v10 = swift_bridgeObjectRelease();
        return MEMORY[0x270FA0A10](v10);
      }
      BOOL v11 = v4 == 0x7974696C697475 && v6 == 0xE700000000000000;
      if (v11 || (OUTLINED_FUNCTION_5_3() & 1) != 0)
      {
        uint64_t v12 = swift_bridgeObjectRelease();
        return MEMORY[0x270FA0A28](v12);
      }
      if (v4 != 0x756F72676B636162 || v6 != 0xEA0000000000646ELL) {
        OUTLINED_FUNCTION_5_3();
      }
      uint64_t v3 = swift_bridgeObjectRelease();
    }
  }

  return MEMORY[0x270FA09D8](v3);
}

uint64_t one-time initialization function for fsCaptureQueue()
{
  type metadata accessor for OS_dispatch_queue.Attributes();
  OUTLINED_FUNCTION_7_2();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_25();
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_6_1();
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = OUTLINED_FUNCTION_10_0(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4();
  type metadata accessor for OS_dispatch_queue();
  type metadata accessor for FeatureStoreService();
  static FeatureStoreService.qos.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v0, *MEMORY[0x263F8F138], v2);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static FeatureStoreService.fsCaptureQueue = result;
  return result;
}

uint64_t *FeatureStoreService.fsCaptureQueue.unsafeMutableAddressor()
{
  if (one-time initialization token for fsCaptureQueue != -1) {
    swift_once();
  }
  return &static FeatureStoreService.fsCaptureQueue;
}

id static FeatureStoreService.fsCaptureQueue.getter()
{
  if (one-time initialization token for fsCaptureQueue != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static FeatureStoreService.fsCaptureQueue;

  return v0;
}

char **FeatureStoreService.signpostInsert.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsert;
}

void static FeatureStoreService.signpostInsert.getter()
{
}

char **FeatureStoreService.signpostInsertSync.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsertSync;
}

void static FeatureStoreService.signpostInsertSync.getter()
{
}

char **FeatureStoreService.signpostRetrieve.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostRetrieve;
}

void static FeatureStoreService.signpostRetrieve.getter()
{
}

char **FeatureStoreService.signpostInsertQueueLatency.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsertQueueLatency;
}

void static FeatureStoreService.signpostInsertQueueLatency.getter()
{
}

char **FeatureStoreService.signpostJsonEncode.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostJsonEncode;
}

void static FeatureStoreService.signpostJsonEncode.getter()
{
}

char **FeatureStoreService.signpostBiomeInsert.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostBiomeInsert;
}

void static FeatureStoreService.signpostBiomeInsert.getter()
{
}

char *FeatureStoreService.overrideLegalRestrictions.unsafeMutableAddressor()
{
  return &static FeatureStoreService.overrideLegalRestrictions;
}

uint64_t static FeatureStoreService.overrideLegalRestrictions.getter()
{
  return static FeatureStoreService.overrideLegalRestrictions;
}

uint64_t static FeatureStoreService.overrideLegalRestrictions.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_12_1();
  static FeatureStoreService.overrideLegalRestrictions = a1;
  return result;
}

uint64_t (*static FeatureStoreService.overrideLegalRestrictions.modify())()
{
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

char *FeatureStoreService.overrideSupportedUserCheck.unsafeMutableAddressor()
{
  return &static FeatureStoreService.overrideSupportedUserCheck;
}

uint64_t static FeatureStoreService.overrideSupportedUserCheck.getter()
{
  return static FeatureStoreService.overrideSupportedUserCheck;
}

uint64_t static FeatureStoreService.overrideSupportedUserCheck.setter(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_12_1();
  static FeatureStoreService.overrideSupportedUserCheck = a1;
  return result;
}

uint64_t (*static FeatureStoreService.overrideSupportedUserCheck.modify())()
{
  return static FeatureStoreService.overrideSupportedUserCheck.modify;
}

id static FeatureStoreService.isUnderLegalRestriction.getter()
{
  if (static FeatureStoreService.overrideLegalRestrictions) {
    return 0;
  }
  else {
    return objc_msgSend(self, sel_isUnderLegalRestriction);
  }
}

uint64_t static FeatureStoreService.isSupportedUser.getter()
{
  if (static FeatureStoreService.overrideSupportedUserCheck) {
    return 1;
  }
  else {
    return (uint64_t)objc_msgSend(self, sel_isSupportedUser);
  }
}

uint64_t default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static FeatureStoreService.performInsert(qos:insertBlock:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v54 = a2;
  unint64_t v60 = a5;
  os_log_type_t v61 = a4;
  uint64_t v57 = a1;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v7;
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4();
  uint64_t v56 = v9 - v8;
  uint64_t v10 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = v11;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  os_log_type_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v53 - v18;
  MEMORY[0x270FA5388](v17);
  unint64_t v21 = (char *)&v53 - v20;
  uint64_t v22 = type metadata accessor for LogSignpost();
  uint64_t v23 = OUTLINED_FUNCTION_1_1(v22);
  uint64_t v25 = v24;
  uint64_t v27 = *(void *)(v26 + 64);
  uint64_t v28 = MEMORY[0x270FA5388](v23);
  int64_t v29 = (char *)&v53 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  double v31 = (char *)&v53 - v30;
  if ((static FeatureStoreService.isSupportedUser.getter() & 1) == 0)
  {
    uint64_t v37 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v37, v10);
    id v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_21D935000, v38, v39, "Skipping insertion as process does not run with a supported user", v40, 2u);
      OUTLINED_FUNCTION_8();
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v10);
    goto LABEL_9;
  }
  if (static FeatureStoreService.isUnderLegalRestriction.getter())
  {
    uint64_t v32 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v19, v32, v10);
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v35 = 0;
      _os_log_impl(&dword_21D935000, v33, v34, "Skipping insertion as it's legally restricted.", v35, 2u);
      OUTLINED_FUNCTION_8();
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v19, v10);
LABEL_9:
    if (v61) {
      return v61(result);
    }
    return result;
  }
  uint64_t v41 = (uint64_t (*)())swift_allocObject();
  uint64_t v42 = v54;
  *((void *)v41 + 2) = v55;
  *((void *)v41 + 3) = v42;
  *((void *)v41 + 4) = a3;
  swift_retain();
  default argument 0 of static LogSignpost.begin(logger:_:)((uint64_t)v21);
  static LogSignpost.begin(logger:_:)((uint64_t)v21, "QueueLatency", 12, 2u, (uint64_t)v31);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v21, v10);
  if (one-time initialization token for fsCaptureQueue != -1) {
    swift_once();
  }
  outlined init with copy of LogSignpost((uint64_t)v31, (uint64_t)v29);
  unint64_t v43 = (*(unsigned __int8 *)(v25 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v44 = (v27 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v45 = swift_allocObject();
  outlined init with take of LogSignpost((uint64_t)v29, v45 + v43);
  uint64_t v46 = (uint64_t (**)())(v45 + v44);
  char *v46 = partial apply for closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:);
  v46[1] = v41;
  uint64_t v47 = (uint64_t (**)(uint64_t))(v45 + ((v44 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v49 = v60;
  uint64_t v48 = (uint64_t)v61;
  *uint64_t v47 = v61;
  v47[1] = v49;
  aBlock[4] = partial apply for closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:);
  aBlock[5] = v45;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor;
  uint64_t v50 = _Block_copy(aBlock);
  uint64_t v62 = MEMORY[0x263F8EE78];
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed () -> ())?(v48);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  uint64_t v51 = v56;
  uint64_t v52 = v59;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x223C0DB00](0, v57, v51, v50);
  _Block_release(v50);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v51, v52);
  outlined destroy of LogSignpost((uint64_t)v31);
  return swift_release();
}

uint64_t closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(void (*a1)(uint64_t))
{
  uint64_t v4 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_1();
  uint64_t v8 = type metadata accessor for LogSignpost();
  uint64_t v9 = OUTLINED_FUNCTION_10_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_25();
  default argument 0 of static LogSignpost.begin(logger:_:)(v2);
  static LogSignpost.begin(logger:_:)(v2, "Insert", 6, 2u, v1);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
  a1(v10);
  LogSignpost.end()();
  return outlined destroy of LogSignpost(v1);
}

uint64_t closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DispatchQoS.QoSClass?);
  uint64_t v8 = OUTLINED_FUNCTION_10_0(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21D9610A0;
  qos_class_self();
  DispatchQoS.QoSClass.init(rawValue:)();
  uint64_t v10 = type metadata accessor for DispatchQoS.QoSClass();
  *(void *)(v9 + 56) = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v9 + 32));
  if (__swift_getEnumTagSinglePayload(v4, 1, v10) == 1)
  {
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(uint64_t *))(v12 + 104))(boxed_opaque_existential_0);
    outlined destroy of DispatchQoS.QoSClass?(v4);
  }
  else
  {
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 32))(boxed_opaque_existential_0, v4, v10);
  }
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  LogSignpost.end()();
  uint64_t result = a2();
  if (a4) {
    return a4(result);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t static FeatureStoreService.performRetrieve<A>(retrieveBlock:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  OUTLINED_FUNCTION_0();
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v9 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_4();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for LogSignpost();
  uint64_t v17 = OUTLINED_FUNCTION_10_0(v16);
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_4();
  uint64_t v20 = v19 - v18;
  if (objc_msgSend(self, sel_isSupportedUser))
  {
    default argument 0 of static LogSignpost.begin(logger:_:)(v15);
    static LogSignpost.begin(logger:_:)(v15, "Retrieve", 8, 2u, v20);
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
    a1(v21);
    if (!v3) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(a3, v4, a2);
    }
    LogSignpost.end()();
    return outlined destroy of LogSignpost(v20);
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(void *)uint64_t v23 = 0xD000000000000040;
    *(void *)(v23 + 8) = 0x800000021D962D30;
    *(unsigned char *)(v23 + 16) = 0;
    return swift_willThrow();
  }
}

id FeatureStoreService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id FeatureStoreService.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreService();
  return objc_msgSendSuper2(&v2, sel_init);
}

id FeatureStoreService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21D94906C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)()
{
  return closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(*(void (**)(uint64_t))(v0 + 24));
}

uint64_t outlined init with copy of LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D949110()
{
  id v1 = (int *)(type metadata accessor for LogSignpost() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  unint64_t v4 = (((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v0 + v3;
  swift_release();
  uint64_t v6 = v5 + v1[8];
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  swift_release();
  if (*(void *)(v0 + v4)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + 16, v2 | 7);
}

uint64_t outlined init with take of LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)()
{
  uint64_t v1 = type metadata accessor for LogSignpost();
  OUTLINED_FUNCTION_1_1(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + v7);
  uint64_t v9 = *(void *)(v0 + v7 + 8);
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8));

  return closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v0 + v6, v8, v9, v10);
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

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for FeatureStoreService()
{
  return self;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined destroy of DispatchQoS.QoSClass?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DispatchQoS.QoSClass?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_beginAccess();
}

uint64_t SerializableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v15[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(*v4 + 144);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v15 - v8;
  type metadata accessor for SerializableFeatureWrapper();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  swift_bridgeObjectRetain();
  uint64_t v10 = SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)();
  uint64_t v11 = (void *)v4[2];
  v15[0] = 0;
  if (objc_msgSend(v11, sel_insert_error_, v10, v15))
  {
    id v12 = v15[0];
  }
  else
  {
    id v13 = v15[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return swift_release();
}

uint64_t SerializableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v4 = v3;
  uint64_t result = (*(uint64_t (**)(void))(v5 + 112))();
  if (!v1)
  {
    uint64_t v7 = (void *)result;
    uint64_t v8 = *(void *)(v4 + 144);
    uint64_t result = type metadata accessor for SerializableFeatureWrapper();
    if (v7[2])
    {
      uint64_t v9 = v7[4];
      unint64_t v10 = v7[5];
      outlined copy of Data._Representation(v9, v10);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_3();
      uint64_t v12 = v11();
      outlined consume of Data._Representation(v9, v10);
      if (v12)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, v12 + *(void *)(*(void *)v12 + 88), v8);
        return swift_release();
      }
      else
      {
        lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
        swift_allocError();
        return OUTLINED_FUNCTION_1_5(v13, (uint64_t)"Stored data could not be deserialized!");
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t SerializableStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 120))();
  if (!v3)
  {
    v19[1] = v9;
    MEMORY[0x270FA5388](v9);
    long long v18 = *(_OWORD *)(v7 + 144);
    v15[1] = v18;
    uint64_t v16 = a1;
    uint64_t v17 = a2;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    uint64_t v11 = type metadata accessor for InteractionWrapper();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    unint64_t v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    uint64_t v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in SerializableStreamAccessor.retrieve(interactionId:), (uint64_t)v15, v10, v11, v12, v13, MEMORY[0x263F8E4E0], (uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t closure #1 in SerializableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v14 = *(double *)(v11 + 16);
  type metadata accessor for SerializableFeatureWrapper();
  OUTLINED_FUNCTION_2_3();
  uint64_t v16 = v15();
  if (v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v16 + *(void *)(*(void *)v16 + 88), a4);
    swift_bridgeObjectRetain();
    InteractionWrapper.init(interactionId:timestamp:feature:)(a2, a3, (uint64_t)v13, a4, a6, v14);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    uint64_t v18 = swift_allocError();
    uint64_t result = OUTLINED_FUNCTION_1_5(v19, (uint64_t)"Stored data could not be deserialized!");
    *uint64_t v21 = v18;
  }
  return result;
}

uint64_t partial apply for closure #1 in SerializableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return closure #1 in SerializableStreamAccessor.retrieve(interactionId:)(a1, v3[4], v3[5], v3[2], a2, a3);
}

uint64_t type metadata completion function for SerializableStreamAccessor()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SerializableStreamAccessor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_5@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a1 = 0xD000000000000026;
  *(void *)(a1 + 8) = (a2 - 32) | 0x8000000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t static PBCodableCoder.encode(codable:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_data);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id static PBCodableCoder.decode(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  outlined copy of Data._Representation(a1, a2);
  id v9 = @nonobjc PBCodable.init(data:)(a1, a2);
  if (!v9)
  {
    uint64_t v10 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_21D935000, v11, v12, "Serialization failed", v13, 2u);
      MEMORY[0x223C0E840](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v9;
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance PBCodableCoder<A>(void **a1)
{
  return static PBCodableCoder.encode(codable:)(*a1);
}

id protocol witness for static Coder.decode(data:) in conformance PBCodableCoder<A>@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  id result = static PBCodableCoder.decode(data:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for PBCodableCoder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t one-time initialization function for accessor(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.accessor);
}

uint64_t Logger.accessor.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for accessor, (uint64_t)static Logger.accessor);
}

uint64_t static Logger.accessor.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for accessor, (uint64_t)static Logger.accessor, a1);
}

uint64_t one-time initialization function for contextProviding(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.contextProviding);
}

uint64_t Logger.contextProviding.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for contextProviding, (uint64_t)static Logger.contextProviding);
}

uint64_t static Logger.contextProviding.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for contextProviding, (uint64_t)static Logger.contextProviding, a1);
}

uint64_t one-time initialization function for service(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.service);
}

uint64_t Logger.service.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for service, (uint64_t)static Logger.service);
}

uint64_t static Logger.service.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for service, (uint64_t)static Logger.service, a1);
}

uint64_t one-time initialization function for SELF(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.SELF);
}

uint64_t Logger.SELF.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for SELF, (uint64_t)static Logger.SELF);
}

uint64_t static Logger.SELF.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for SELF, (uint64_t)static Logger.SELF, a1);
}

uint64_t one-time initialization function for signpost(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.signpost);
}

uint64_t one-time initialization function for accessor(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.signpost.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for signpost, (uint64_t)static Logger.signpost);
}

uint64_t Logger.accessor.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for signpost, (uint64_t)static Logger.signpost, a1);
}

uint64_t static Logger.accessor.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t StreamQuery.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  return StreamQuery.startDate.getter(&OBJC_IVAR___FSFStreamQuery_startDate, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t StreamQuery.startDate.setter(uint64_t a1)
{
  return StreamQuery.startDate.setter(a1, &OBJC_IVAR___FSFStreamQuery_startDate);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t key path getter for StreamQuery.startDate : StreamQuery(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x70))();
}

uint64_t key path setter for StreamQuery.startDate : StreamQuery(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x78))(v6);
}

uint64_t (*StreamQuery.startDate.modify())()
{
  return static FeatureStoreService.overrideSupportedUserCheck.modify;
}

uint64_t variable initialization expression of StreamQuery.endDate@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

Class @objc StreamQuery.startDate.getter(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v4 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v7 = v6 - v5;
  a3();
  uint64_t v8 = type metadata accessor for Date();
  Class isa = 0;
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }

  return isa;
}

uint64_t StreamQuery.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  return StreamQuery.startDate.getter(&OBJC_IVAR___FSFStreamQuery_endDate, a1);
}

uint64_t StreamQuery.startDate.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return outlined init with copy of Date?(v4, a2);
}

void @objc StreamQuery.startDate.setter(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_4();
  uint64_t v10 = v9 - v8;
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for Date();
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v10, v12, 1, v11);
  id v13 = a1;
  a4(v10);
}

uint64_t StreamQuery.endDate.setter(uint64_t a1)
{
  return StreamQuery.startDate.setter(a1, &OBJC_IVAR___FSFStreamQuery_endDate);
}

uint64_t StreamQuery.startDate.setter(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  OUTLINED_FUNCTION_2_4();
  outlined assign with take of Date?(a1, v4);
  return swift_endAccess();
}

uint64_t key path getter for StreamQuery.endDate : StreamQuery(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
}

uint64_t key path setter for StreamQuery.endDate : StreamQuery(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x90))(v6);
}

uint64_t (*StreamQuery.endDate.modify())()
{
  return static FeatureStoreService.overrideSupportedUserCheck.modify;
}

uint64_t variable initialization expression of StreamQuery.interactionIds()
{
  return MEMORY[0x263F8EE78];
}

uint64_t StreamQuery.interactionIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StreamQuery.interactionIds.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___FSFStreamQuery_interactionIds);
  OUTLINED_FUNCTION_3_4();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t key path getter for StreamQuery.interactionIds : StreamQuery@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t key path setter for StreamQuery.interactionIds : StreamQuery(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0xA8);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*StreamQuery.interactionIds.modify())()
{
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

uint64_t key path getter for StreamQuery.taskId : StreamQuery@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t key path setter for StreamQuery.taskId : StreamQuery(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0xC0);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t StreamQuery.taskId.getter()
{
  OUTLINED_FUNCTION_5_4();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StreamQuery.taskId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___FSFStreamQuery_taskId);
  OUTLINED_FUNCTION_3_4();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*StreamQuery.taskId.modify())()
{
  return static FeatureStoreService.overrideSupportedUserCheck.modify;
}

id StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return StreamQuery.init(startDate:endDate:interactionIds:)(a1, a2, a3);
}

id StreamQuery.init(startDate:endDate:interactionIds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_startDate];
  uint64_t v8 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  uint64_t v9 = (uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_endDate];
  __swift_storeEnumTagSinglePayload((uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_endDate], 1, 1, v8);
  uint64_t v10 = &v3[OBJC_IVAR___FSFStreamQuery_interactionIds];
  *(void *)&v3[OBJC_IVAR___FSFStreamQuery_interactionIds] = MEMORY[0x263F8EE78];
  uint64_t v11 = &v3[OBJC_IVAR___FSFStreamQuery_taskId];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  OUTLINED_FUNCTION_2_4();
  uint64_t v12 = v3;
  outlined assign with copy of Date?(a1, v7);
  swift_endAccess();
  OUTLINED_FUNCTION_2_4();
  outlined assign with copy of Date?(a2, v9);
  swift_endAccess();
  OUTLINED_FUNCTION_3_4();
  *(void *)uint64_t v10 = a3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_4();
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;

  swift_bridgeObjectRelease();
  v15.receiver = v12;
  v15.super_class = (Class)type metadata accessor for StreamQuery();
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  outlined destroy of Date?(a2);
  outlined destroy of Date?(a1);
  return v13;
}

uint64_t outlined assign with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for StreamQuery()
{
  uint64_t result = type metadata singleton initialization cache for StreamQuery;
  if (!type metadata singleton initialization cache for StreamQuery) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id StreamQuery.__allocating_init(startDate:endDate:interactionIds:taskId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return StreamQuery.init(startDate:endDate:interactionIds:taskId:)(a1, a2, a3, a4, a5);
}

id StreamQuery.init(startDate:endDate:interactionIds:taskId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (uint64_t)&v5[OBJC_IVAR___FSFStreamQuery_startDate];
  uint64_t v11 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  uint64_t v12 = (uint64_t)&v5[OBJC_IVAR___FSFStreamQuery_endDate];
  __swift_storeEnumTagSinglePayload((uint64_t)&v5[OBJC_IVAR___FSFStreamQuery_endDate], 1, 1, v11);
  id v13 = &v5[OBJC_IVAR___FSFStreamQuery_interactionIds];
  *(void *)&v5[OBJC_IVAR___FSFStreamQuery_interactionIds] = MEMORY[0x263F8EE78];
  double v14 = &v5[OBJC_IVAR___FSFStreamQuery_taskId];
  *(void *)double v14 = 0;
  *((void *)v14 + 1) = 0;
  OUTLINED_FUNCTION_2_4();
  objc_super v15 = v5;
  outlined assign with copy of Date?(a1, v10);
  swift_endAccess();
  OUTLINED_FUNCTION_2_4();
  outlined assign with copy of Date?(a2, v12);
  swift_endAccess();
  OUTLINED_FUNCTION_3_4();
  *(void *)id v13 = a3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_4();
  *(void *)double v14 = a4;
  *((void *)v14 + 1) = a5;

  swift_bridgeObjectRelease();
  v19.receiver = v15;
  v19.super_class = (Class)type metadata accessor for StreamQuery();
  id v16 = objc_msgSendSuper2(&v19, sel_init);
  outlined destroy of Date?(a2);
  outlined destroy of Date?(a1);
  return v16;
}

uint64_t StreamQuery.description.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4();
  _StringGuts.grow(_:)(72);
  v1._countAndFlagsBits = 0xD000000000000017;
  v1._object = (void *)0x800000021D962E10;
  String.append(_:)(v1);
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(void))(v2 + 112))();
  v3._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x746144646E65202CLL;
  v4._object = (void *)0xEB00000000203A65;
  String.append(_:)(v4);
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(void))(v5 + 136))();
  v6._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._object = (void *)0x800000021D962E30;
  v7._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v7);
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(void))(v8 + 160))();
  v9._countAndFlagsBits = MEMORY[0x223C0D8D0]();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x64496B736174202CLL;
  v10._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v10);
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(void))(v11 + 184))();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v12._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 41;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  return 0;
}

id StreamQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void StreamQuery.init()()
{
}

id StreamQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StreamQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ObjC metadata update function for StreamQuery()
{
  return type metadata accessor for StreamQuery();
}

void type metadata completion function for StreamQuery()
{
  type metadata accessor for Date?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for StreamQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StreamQuery);
}

uint64_t dispatch thunk of StreamQuery.startDate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of StreamQuery.startDate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of StreamQuery.startDate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of StreamQuery.endDate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of StreamQuery.endDate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of StreamQuery.endDate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of StreamQuery.taskId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of StreamQuery.taskId.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of StreamQuery.taskId.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of StreamQuery.__allocating_init(startDate:endDate:interactionIds:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of StreamQuery.__allocating_init(startDate:endDate:interactionIds:taskId:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

void type metadata accessor for Date?()
{
  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_beginAccess();
}

uint64_t LogSignpost.name.getter()
{
  return *(void *)v0;
}

uint64_t LogSignpost.state.getter()
{
  return swift_retain();
}

uint64_t LogSignpost.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LogSignpost() + 24);
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_3_3();
  Swift::String v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);

  return v6(a1, v3, v4);
}

uint64_t type metadata accessor for LogSignpost()
{
  uint64_t result = type metadata singleton initialization cache for LogSignpost;
  if (!type metadata singleton initialization cache for LogSignpost) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LogSignpost.init(name:state:signposter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  uint64_t v7 = a6 + *(int *)(type metadata accessor for LogSignpost() + 24);
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_3_3();
  Swift::String v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);

  return v10(v7, a5, v8);
}

uint64_t default argument 0 of static LogSignpost.begin(logger:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = Logger.signpost.unsafeMutableAddressor();
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_3_3();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v2, v3);
}

uint64_t static LogSignpost.begin(logger:_:)@<X0>(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v46 = a3;
  unint64_t v44 = a2;
  int v45 = a4;
  uint64_t v42 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  Swift::String v13 = (char *)&v40 - v12;
  uint64_t v14 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_4();
  uint64_t v20 = v19 - v18;
  uint64_t v43 = type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_0_0();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_4();
  uint64_t v26 = v25 - v24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v20, a1, v14);
  uint64_t v27 = v13;
  uint64_t v28 = v46;
  OSSignposter.init(logger:)();
  OSSignposter.logHandle.getter();
  OSSignpostID.init(log:)();
  int64_t v29 = OSSignposter.logHandle.getter();
  os_signpost_type_t v30 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v41 = v22;
  if ((v45 & 1) == 0)
  {
    uint64_t v32 = v44;
    if (v44)
    {
      uint64_t v33 = v27;
LABEL_9:
      os_log_type_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v34 = 0;
      os_signpost_id_t v35 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_21D935000, v29, v30, v35, v32, "", v34, 2u);
      uint64_t v36 = v34;
      uint64_t v27 = v33;
      MEMORY[0x223C0E840](v36, -1, -1);
      uint64_t v28 = v46;
      uint64_t v22 = v41;
LABEL_10:

      uint64_t v37 = v42;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v27, v42);
      type metadata accessor for OSSignpostIntervalState();
      swift_allocObject();
      uint64_t v38 = OSSignpostIntervalState.init(id:isOpen:)();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v27, v37);
      *(void *)a5 = v44;
      *(void *)(a5 + 8) = v28;
      *(unsigned char *)(a5 + 16) = v45;
      *(void *)(a5 + 24) = v38;
      uint64_t v39 = type metadata accessor for LogSignpost();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(a5 + *(int *)(v39 + 24), v26, v43);
    }
    __break(1u);
    goto LABEL_12;
  }
  if ((unint64_t)v44 >> 32)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v44 >> 11 != 27)
  {
    if (v44 >> 16 <= 0x10)
    {
      uint64_t v33 = v27;
      uint64_t v32 = &v47;
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

Swift::Void __swiftcall LogSignpost.end()()
{
  type metadata accessor for OSSignpostError();
  OUTLINED_FUNCTION_0_0();
  uint64_t v26 = v2;
  uint64_t v27 = v1;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v28 = v4 - v3;
  uint64_t v5 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_0_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v16, v0 + *(int *)(v17 + 24), v11);
  int64_t v29 = *(const char **)v0;
  char v18 = *(unsigned char *)(v0 + 16);
  uint64_t v19 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v25 = static os_signpost_type_t.end.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
LABEL_13:

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v5);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v11);
    return;
  }
  uint64_t v24 = v7;
  if ((v18 & 1) == 0)
  {
    uint64_t v20 = v28;
    if (v29)
    {
LABEL_9:
      swift_retain();
      checkForErrorAndConsumeState(state:)();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v26 + 88))(v20, v27) == *MEMORY[0x263F90238])
      {
        uint64_t v21 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v20, v27);
        uint64_t v21 = "";
      }
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      os_signpost_id_t v23 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_21D935000, v19, v25, v23, v29, v21, v22, 2u);
      MEMORY[0x223C0E840](v22, -1, -1);
      uint64_t v7 = v24;
      goto LABEL_13;
    }
    __break(1u);
  }
  uint64_t v20 = v28;
  if ((unint64_t)v29 >> 32)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v29 >> 11 != 27)
  {
    if (v29 >> 16 <= 0x10)
    {
      int64_t v29 = &v30;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
}

void *initializeBufferWithCopyOfBuffer for LogSignpost(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v8 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    type metadata accessor for OSSignposter();
    OUTLINED_FUNCTION_3_3();
    uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
    swift_retain();
    uint64_t v7 = OUTLINED_FUNCTION_4_4();
    v6(v7);
  }
  return v3;
}

uint64_t destroy for LogSignpost(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_3_3();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);

  return v7(v4, v5);
}

uint64_t initializeWithCopy for LogSignpost(__n128 *a1, __n128 *a2)
{
  OUTLINED_FUNCTION_3_5(a1, a2);
  *(void *)(v4 + 24) = *(void *)(v3 + 24);
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_3_3();
  uint64_t v6 = *(void (**)(uint64_t))(v5 + 16);
  swift_retain();
  uint64_t v7 = OUTLINED_FUNCTION_4_4();
  v6(v7);
  return v2;
}

uint64_t assignWithCopy for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(a3, a2);
  return a1;
}

uint64_t initializeWithTake for LogSignpost(__n128 *a1, __n128 *a2)
{
  OUTLINED_FUNCTION_3_5(a1, a2);
  *(void *)(v4 + 24) = *(void *)(v3 + 24);
  uint64_t v6 = *(int *)(v5 + 24);
  uint64_t v7 = v4 + v6;
  uint64_t v8 = v3 + v6;
  type metadata accessor for OSSignposter();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v7, v8);
  return v2;
}

uint64_t assignWithTake for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(a3, a2);
  return a1;
}

uint64_t getEnumTagSinglePayload for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21D94C55C);
}

uint64_t sub_21D94C55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for OSSignposter();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21D94C5F8);
}

uint64_t sub_21D94C5F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for OSSignposter();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for LogSignpost()
{
  uint64_t result = type metadata accessor for OSSignposter();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 OUTLINED_FUNCTION_3_5(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return type metadata accessor for OSSignposter();
}

uint64_t SiriTurn.dictionaryRepresentation()()
{
  uint64_t v1 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)type metadata accessor for SiriTurn();
  v19.receiver = v0;
  v19.super_class = v7;
  id v8 = objc_msgSendSuper2(&v19, sel_dictionaryRepresentation);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v20 = v9;
  uint64_t v15 = 0x64496E727574;
  unint64_t v16 = 0xE600000000000000;
  uint64_t v10 = MEMORY[0x263F8D310];
  AnyHashable.init<A>(_:)();
  dispatch thunk of SiriTurn.turnId.getter();
  uint64_t v11 = UUID.uuidString.getter();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  uint64_t v17 = v10;
  uint64_t v15 = v11;
  unint64_t v16 = v13;
  specialized Dictionary.subscript.setter((uint64_t)&v15, (uint64_t)v18);
  return v20;
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v4);
    specialized Dictionary._Variant.setValue(_:forKey:)(v4, a2);
    return outlined destroy of AnyHashable(a2);
  }
  else
  {
    outlined destroy of InstrumentationStreamsProviderProtocol?(a1, &demangling cache variable for type metadata for Any?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, v4);
    outlined destroy of AnyHashable(a2);
    return outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)v4, &demangling cache variable for type metadata for Any?);
  }
}

id @objc SiriTurn.dictionaryRepresentation()(void *a1, uint64_t a2)
{
  return @objc SiriTurn.dictionaryRepresentation()(a1, a2, (void (*)(void))SiriTurn.dictionaryRepresentation());
}

char *EventGraph.dictionaryRepresentation()()
{
  uint64_t v0 = dispatch thunk of EventGraph.componentIdentifiers.getter();
  uint64_t v1 = specialized Sequence.reduce<A>(into:_:)(MEMORY[0x263F8EE80], v0);
  swift_bridgeObjectRelease();
  unint64_t v2 = dispatch thunk of EventGraph.events()();
  unint64_t v3 = v2;
  if (v2 >> 62) {
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  }
  else {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v4)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21D9615B0;
    OUTLINED_FUNCTION_15_1();
    EventGraph.timestamp.getter();
    *(void *)(inited + 96) = MEMORY[0x263F8D538];
    *(void *)(inited + 72) = v15;
    OUTLINED_FUNCTION_15_1();
    *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    *(void *)(inited + 144) = v1;
    OUTLINED_FUNCTION_15_1();
    *(void *)(inited + 240) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[AnyHashable : Any]]);
    *(void *)(inited + 216) = v7;
    return (char *)Dictionary.init(dictionaryLiteral:)();
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  __n128 result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = v1;
    uint64_t v6 = 0;
    uint64_t v7 = v17;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x223C0DCA0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_dictionaryRepresentation);
      uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      unint64_t v13 = *(void *)(v17 + 16);
      unint64_t v12 = *(void *)(v17 + 24);
      if (v13 >= v12 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v12 > 1), v13 + 1, 1);
      }
      ++v6;
      *(void *)(v17 + 16) = v13 + 1;
      *(void *)(v17 + 8 * v13 + 32) = v11;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    uint64_t v1 = v16;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence.reduce<A>(into:_:)(void *a1, uint64_t a2)
{
  uint64_t v57 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v56 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for ComponentIdentifier();
    lazy protocol witness table accessor for type ComponentIdentifier and conformance NSObject(&lazy protocol witness table cache variable for type ComponentIdentifier and conformance NSObject, MEMORY[0x263F6D950]);
    Set.Iterator.init(_cocoa:)();
    a2 = v62;
    uint64_t v53 = v63;
    uint64_t v6 = v64;
    int64_t v7 = v65;
    unint64_t v8 = v66;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 56);
    uint64_t v53 = a2 + 56;
    uint64_t v11 = ~v9;
    uint64_t v12 = -v9;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v8 = v13 & v10;
    swift_bridgeObjectRetain();
    uint64_t v6 = v11;
    int64_t v7 = 0;
  }
  v51[1] = v6;
  v51[4] = a2 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v52 = (unint64_t)(v6 + 64) >> 6;
  uint64_t v55 = (void (**)(char *, uint64_t))(v4 + 8);
  v51[3] = MEMORY[0x263F8EE50] + 8;
  uint64_t v54 = a2;
  if (a2 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v8)
  {
    uint64_t v14 = (v8 - 1) & v8;
    unint64_t v15 = __clz(__rbit64(v8)) | (v7 << 6);
    int64_t v16 = v7;
    goto LABEL_29;
  }
  int64_t v19 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v19 >= v52) {
      goto LABEL_42;
    }
    unint64_t v20 = *(void *)(v53 + 8 * v19);
    int64_t v16 = v7 + 1;
    if (!v20)
    {
      int64_t v16 = v7 + 2;
      if (v7 + 2 >= v52) {
        goto LABEL_42;
      }
      unint64_t v20 = *(void *)(v53 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v7 + 3;
        if (v7 + 3 >= v52) {
          goto LABEL_42;
        }
        unint64_t v20 = *(void *)(v53 + 8 * v16);
        if (!v20)
        {
          int64_t v16 = v7 + 4;
          if (v7 + 4 >= v52) {
            goto LABEL_42;
          }
          unint64_t v20 = *(void *)(v53 + 8 * v16);
          if (!v20)
          {
            int64_t v16 = v7 + 5;
            if (v7 + 5 >= v52) {
              goto LABEL_42;
            }
            unint64_t v20 = *(void *)(v53 + 8 * v16);
            if (!v20)
            {
              int64_t v21 = v7 + 6;
              while (v21 < v52)
              {
                unint64_t v20 = *(void *)(v53 + 8 * v21++);
                if (v20)
                {
                  int64_t v16 = v21 - 1;
                  goto LABEL_28;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v14 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_29:
    id v18 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
    if (v18)
    {
      while (1)
      {
        unint64_t v59 = v14;
        int64_t v60 = v16;
        signed int v22 = ComponentIdentifier.componentName.getter();
        os_signpost_id_t v23 = @"COMPONENTNAME_UNKNOWN";
        uint64_t v24 = @"COMPONENTNAME_UNKNOWN";
        if (v22 <= 0x3F)
        {
          uint64_t v24 = (__CFString *)*((void *)&off_264464AD0 + v22);
          os_signpost_id_t v23 = (__CFString *)*((void *)&off_264464CD0 + v22);
        }
        os_signpost_type_t v25 = v24;
        uint64_t v26 = v23;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v29 = v28;

        char v30 = v56;
        id v58 = v18;
        dispatch thunk of ComponentIdentifier.uuid.getter();
        uint64_t v31 = UUID.uuidString.getter();
        uint64_t v33 = v32;
        (*v55)(v30, v57);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v67 = a1;
        unint64_t v35 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v29);
        uint64_t v37 = a1[2];
        BOOL v38 = (v36 & 1) == 0;
        Swift::Int v39 = v37 + v38;
        if (__OFADD__(v37, v38)) {
          break;
        }
        unint64_t v40 = v35;
        char v41 = v36;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, String>);
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v39))
        {
          unint64_t v42 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v29);
          if ((v41 & 1) != (v43 & 1)) {
            goto LABEL_46;
          }
          unint64_t v40 = v42;
        }
        a1 = v67;
        if (v41)
        {
          unint64_t v44 = (uint64_t *)(v67[7] + 16 * v40);
          swift_bridgeObjectRelease();
          *unint64_t v44 = v31;
          v44[1] = v33;
        }
        else
        {
          v67[(v40 >> 6) + 8] |= 1 << v40;
          int v45 = (uint64_t *)(a1[6] + 16 * v40);
          *int v45 = v27;
          v45[1] = v29;
          uint64_t v46 = (uint64_t *)(a1[7] + 16 * v40);
          uint64_t *v46 = v31;
          v46[1] = v33;
          uint64_t v47 = a1[2];
          BOOL v48 = __OFADD__(v47, 1);
          uint64_t v49 = v47 + 1;
          if (v48) {
            goto LABEL_44;
          }
          a1[2] = v49;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v8 = v59;
        int64_t v7 = v60;
        a2 = v54;
        if ((v54 & 0x8000000000000000) == 0) {
          goto LABEL_8;
        }
LABEL_10:
        uint64_t v17 = __CocoaSet.Iterator.next()();
        if (v17)
        {
          uint64_t v61 = v17;
          type metadata accessor for ComponentIdentifier();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v18 = v67;
          swift_unknownObjectRelease();
          int64_t v16 = v7;
          uint64_t v14 = v8;
          if (v18) {
            continue;
          }
        }
        goto LABEL_42;
      }
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
LABEL_42:
    outlined consume of Set<ComponentIdentifier>.Iterator._Variant();
    return (uint64_t)a1;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo21SISchemaComponentNameVSay19SiriInstrumentation0E10IdentifierCGG_SSs5NeverOTg506_sSo21def6VSay19g19Instrumentation0B10i30CGSSIgygo_AB3key_AF5valuetSSs5j138OIegnrzr_TR0109_s12FeatureStore27CurareInteractionSELFStreamC8retrieveSDys11AnyHashableVSDyAFSayypGGGyYaKFSaySSGycfu4_SSSo21abc7V_Say19d19N24J10F9CGtXEfU1_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v18 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  uint64_t v2 = v18;
  uint64_t result = specialized Dictionary.startIndex.getter(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v6 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      uint64_t v7 = a1 + 64;
      while ((*(void *)(v7 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v5 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_18;
        }
        int64_t v16 = v1;
        int v17 = v5;
        uint64_t v8 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v6);
        unint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
        swift_bridgeObjectRetain();
        uint64_t v10 = closure #3 in implicit closure #6 in CurareInteractionSELFStream.retrieve()(v8, v9);
        uint64_t v12 = v11;
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v14 = *(void *)(v18 + 16);
        unint64_t v13 = *(void *)(v18 + 24);
        if (v14 >= v13 >> 1) {
          uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
        }
        *(void *)(v18 + 16) = v14 + 1;
        uint64_t v15 = v18 + 16 * v14;
        *(void *)(v15 + 32) = v10;
        *(void *)(v15 + 40) = v12;
        if ((uint64_t)v6 >= -(-1 << *(unsigned char *)(a1 + 32))) {
          goto LABEL_19;
        }
        uint64_t v7 = a1 + 64;
        if ((*(void *)(a1 + 64 + 8 * (v6 >> 6)) & (1 << v6)) == 0) {
          goto LABEL_20;
        }
        if (v17 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_21;
        }
        uint64_t result = _HashTable.occupiedBucket(after:)();
        int64_t v1 = v16 - 1;
        if (v16 == 1) {
          return v2;
        }
        unint64_t v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          int v5 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

id @objc EventGraph.dictionaryRepresentation()(void *a1, uint64_t a2)
{
  return @objc SiriTurn.dictionaryRepresentation()(a1, a2, (void (*)(void))EventGraph.dictionaryRepresentation());
}

id @objc SiriTurn.dictionaryRepresentation()(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  Dictionary._bridgeToObjectiveC()();
  OUTLINED_FUNCTION_19_0();
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t variable initialization expression of CurareInteractionSELFStream.logger@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = Logger.SELF.unsafeMutableAddressor();
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_3_3();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v5(a1, v2, v3);
}

double variable initialization expression of CurareInteractionSELFStream.provider@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

id CurareInteractionSELFStream.__allocating_init(filter:)()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)OUTLINED_FUNCTION_19_0();
  return CurareInteractionSELFStream.init(filter:)(v2);
}

id CurareInteractionSELFStream.init(filter:)(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___FSFCurareInteractionSELFStream_logger];
  uint64_t v4 = v1;
  uint64_t v5 = Logger.SELF.unsafeMutableAddressor();
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t))(v6 + 16))(v3, v5);
  uint64_t v7 = &v4[OBJC_IVAR___FSFCurareInteractionSELFStream_provider];
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(void *)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_filter] = a1;
  id v8 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for CurareInteractionSELFStream();
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

void *CurareInteractionSELFStream.__allocating_init(provider:)()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)OUTLINED_FUNCTION_19_0();
  return CurareInteractionSELFStream.init(provider:)(v2);
}

void *CurareInteractionSELFStream.init(provider:)(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR___FSFCurareInteractionSELFStream_logger];
  uint64_t v4 = v1;
  uint64_t v5 = Logger.SELF.unsafeMutableAddressor();
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t))(v6 + 16))(v3, v5);
  uint64_t v7 = (uint64_t)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_provider];
  *(_OWORD *)uint64_t v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(void *)(v7 + 32) = 0;
  outlined init with copy of InstrumentationStreamsProviderProtocol((uint64_t)a1, (uint64_t)v12);
  swift_beginAccess();
  outlined assign with take of InstrumentationStreamsProviderProtocol?((uint64_t)v12, v7);
  swift_endAccess();
  id v8 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  *(void *)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_filter] = dispatch thunk of InstrumentationStreamsProviderProtocol.filter.getter();

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for CurareInteractionSELFStream();
  objc_msgSendSuper2(&v11, sel_init);
  uint64_t v9 = OUTLINED_FUNCTION_19_0();
  __swift_destroy_boxed_opaque_existential_0(v9);
  return v8;
}

uint64_t CurareInteractionSELFStream.retrieve()()
{
  OUTLINED_FUNCTION_8_0();
  v1[75] = v0;
  uint64_t v2 = type metadata accessor for UUID();
  v1[76] = v2;
  OUTLINED_FUNCTION_1_1(v2);
  v1[77] = v3;
  v1[78] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BookmarkablePublisher<EventGraph>);
  v1[79] = v4;
  OUTLINED_FUNCTION_1_1(v4);
  v1[80] = v5;
  v1[81] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v1[82] = swift_task_alloc();
  return MEMORY[0x270FA2498](CurareInteractionSELFStream.retrieve(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v21;

  id v1 = v0[75];
  uint64_t v2 = OBJC_IVAR___FSFCurareInteractionSELFStream_provider;
  v0[83] = OBJC_IVAR___FSFCurareInteractionSELFStream_provider;
  uint64_t v3 = v1 + v2;
  swift_beginAccess();
  outlined init with copy of InstrumentationStreamsProviderProtocol?(v3, (uint64_t)(v0 + 2));
  uint64_t v4 = v0[5];
  outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)(v0 + 2), &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  if (v4)
  {
    OUTLINED_FUNCTION_18_0();
    if (v0[10])
    {
      OUTLINED_FUNCTION_1_7();
      uint64_t v5 = (void *)swift_task_alloc();
      v0[86] = v5;
      uint64_t v6 = lazy protocol witness table accessor for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>();
      char *v5 = v0;
      v5[1] = CurareInteractionSELFStream.retrieve();
      uint64_t v7 = v0[79];
      return MEMORY[0x270F08558](v7, v6);
    }
    else
    {
      outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)(v0 + 7), &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
      unint64_t v14 = Logger.logObject.getter();
      uint64_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_17_1(&dword_21D935000, v16, v17, "Stream should have both provider and filter. Returning empty result.");
        OUTLINED_FUNCTION_8();
      }

      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
      Dictionary.init(dictionaryLiteral:)();
      OUTLINED_FUNCTION_11_1();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v18 = OUTLINED_FUNCTION_20();
      return v19(v18);
    }
  }
  else
  {
    id v8 = v0[82];
    uint64_t v9 = v0[75];
    type metadata accessor for InstrumentationStreamsFactory();
    uint64_t v10 = *(void *)(v9 + OBJC_IVAR___FSFCurareInteractionSELFStream_filter);
    objc_super v11 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload(v8, 1, 1, v11);
    v0[15] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static InstrumentationStreamsFactory.construct(filter:startTime:endTime:maxEvents:lastN:storageURL:)>>.0);
    v0[16] = swift_getOpaqueTypeConformance2();
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 12);
    unint64_t v13 = (void *)swift_task_alloc();
    v0[84] = v13;
    char *v13 = v0;
    v13[1] = CurareInteractionSELFStream.retrieve();
    return MEMORY[0x270F085A8](boxed_opaque_existential_0, v10, 0, 1, 0, 1, 0, 1);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)();
  uint64_t v7;

  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_22();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 680) = v0;
  swift_task_dealloc();
  outlined destroy of InstrumentationStreamsProviderProtocol?(*(void *)(v1 + 656), &demangling cache variable for type metadata for URL?);
  if (v0) {
    uint64_t v5 = CurareInteractionSELFStream.retrieve();
  }
  else {
    uint64_t v5 = CurareInteractionSELFStream.retrieve();
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v12;

  OUTLINED_FUNCTION_8_2();
  id v1 = v0[75] + v0[83];
  swift_beginAccess();
  outlined assign with take of InstrumentationStreamsProviderProtocol?((uint64_t)(v0 + 12), v1);
  swift_endAccess();
  OUTLINED_FUNCTION_18_0();
  if (v0[10])
  {
    OUTLINED_FUNCTION_1_7();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[86] = v2;
    uint64_t v3 = lazy protocol witness table accessor for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>();
    *uint64_t v2 = v0;
    v2[1] = CurareInteractionSELFStream.retrieve();
    uint64_t v4 = v0[79];
    return MEMORY[0x270F08558](v4, v3);
  }
  else
  {
    outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)(v0 + 7), &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
    uint64_t v5 = Logger.logObject.getter();
    uint64_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_17_1(&dword_21D935000, v7, v8, "Stream should have both provider and filter. Returning empty result.");
      OUTLINED_FUNCTION_8();
    }

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
    Dictionary.init(dictionaryLiteral:)();
    OUTLINED_FUNCTION_11_1();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = OUTLINED_FUNCTION_20();
    return v10(v9);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v11;

  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_22();
  *uint64_t v4 = v3;
  uint64_t v5 = *v2;
  OUTLINED_FUNCTION_22();
  *uint64_t v6 = v5;
  *(void *)(v8 + 696) = v7;
  *(void *)(v8 + 704) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v1[80] + 8))(v1[81], v1[79]);
  if (v0) {
    uint64_t v9 = CurareInteractionSELFStream.retrieve();
  }
  else {
    uint64_t v9 = CurareInteractionSELFStream.retrieve();
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

{
  void *v0;
  void *v1;
  unint64_t v2;
  long long v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __n128 v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  const char *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  Class isa;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  Swift::String v99;
  Swift::String v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  char v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  os_log_type_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  __n128 v134;
  id v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  uint64_t (*v145)(uint64_t);
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  long long v151;
  uint64_t *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint8_t *v163;
  uint8_t **v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  _OWORD *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  uint64_t *v175;
  uint64_t *v176;
  uint64_t v177;
  _OWORD *v178;
  uint64_t v179;
  _OWORD *v180;
  uint64_t v181;
  void (**v182)(uint64_t, uint64_t);
  uint64_t v183;
  void *v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  NSObject *v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  void (*v192)(uint64_t, uint64_t);
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197[3];
  void *v198;
  uint64_t v199;

  v198 = v0;
  id v1 = v0;
  uint64_t v2 = v0[87];
  v193 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  if (v2 >> 62) {
    goto LABEL_122;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    goto LABEL_109;
  }
LABEL_3:
  v179 = (uint64_t)(v1 + 30);
  v169 = (uint64_t)(v1 + 34);
  v181 = (uint64_t)(v1 + 42);
  v170 = (uint64_t)(v1 + 56);
  v173 = (uint64_t)(v1 + 62);
  v155 = (uint64_t)(v1 + 72);
  v167 = (uint64_t)(v1 + 60);
  v168 = v1 + 22;
  v178 = v1 + 26;
  v180 = v1 + 38;
  v156 = v1 + 64;
  v171 = v1 + 65;
  v149 = v1 + 66;
  v175 = v1 + 69;
  v176 = v1 + 68;
  v159 = v1 + 71;
  v153 = v1 + 73;
  v154 = v1 + 70;
  v152 = v1 + 74;
  *(void *)&uint64_t v3 = 136315906;
  v151 = v3;
  v162 = v1[75];
  v166 = v2 & 0xC000000000000001;
  v160 = v1[87] + 32;
  v161 = OBJC_IVAR___FSFCurareInteractionSELFStream_filter;
  v182 = (void (**)(uint64_t, uint64_t))(v1[77] + 8);
  v150 = (uint64_t)(v1 + 75);
  v177 = v1[88];
  v148 = MEMORY[0x263F8EE58] + 8;
  v184 = v1;
  v164 = (uint8_t **)(v1 + 67);
  v165 = v4;
  uint64_t v5 = 0;
  do
  {
    specialized Array._checkSubscript(_:wasNativeTypeChecked:)(v5, v166 == 0, v1[87]);
    if (v166) {
      uint64_t v6 = (id)MEMORY[0x223C0DCA0](v5, v1[87]);
    }
    else {
      uint64_t v6 = *(id *)(v160 + 8 * v5);
    }
    uint64_t v7 = __OFADD__(v5, 1);
    id v8 = v5 + 1;
    if (v7) {
      goto LABEL_118;
    }
    v174 = v6;
    uint64_t v9 = dispatch thunk of EventGraph.componentIdentifiers.getter();
    uint64_t v10 = specialized Dictionary.init<A>(grouping:by:)(v9);
    objc_super v11 = specialized Dictionary.subscript.getter(1u, v10);
    v172 = v8;
    if (!v11)
    {
      objc_super v11 = specialized Dictionary.subscript.getter(9u, v10);
      if (!v11)
      {
        swift_bridgeObjectRelease();
        uint64_t v49 = v174;
        uint64_t v50 = Logger.logObject.getter();
        uint64_t v51 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v50, v51))
        {
          int64_t v52 = (uint8_t *)swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          uint64_t v62 = objc_retainAutoreleasedReturnValue(objc_msgSend(v49, sel_dictionaryRepresentation, OUTLINED_FUNCTION_10_1(v53, v54, v55, v56, v57, v58, v59, v60, v147, v148, (uint64_t)v149, v150, v151, *((uint64_t *)&v151 + 1), (uint64_t)v152,
                      (uint64_t)v153,
                      (uint64_t)v154,
                      v155,
                      (uint64_t)v156,
                      v157,
                      v158,
                      (uint64_t)v159,
                      v160,
                      v161,
                      v162,
                      (uint64_t)v163,
                      (uint64_t)v164,
                      v165,
                      v166,
                      v167,
                      (uint64_t)v168,
                      v169,
                      v170,
                      (uint64_t)v171,
                      v172,
                      v173,
                      v61).n128_f64[0]));
          static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v63 = Dictionary.description.getter();
          uint64_t v65 = v64;
          swift_bridgeObjectRelease();
          unint64_t v66 = v63;
          id v1 = v184;
          uint64_t v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v65, &v194);
          OUTLINED_FUNCTION_16_1(v67, v149);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();

          uint64_t v68 = v50;
          uint64_t v69 = v51;
          uint64_t v70 = "Event graph missed both orchId and mhID! Ignoring: %s";
          goto LABEL_102;
        }
LABEL_103:

LABEL_104:
        goto LABEL_108;
      }
    }
    uint64_t v2 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v123 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v123 != 1
        || (swift_bridgeObjectRetain(), v124 = _CocoaArrayWrapper.endIndex.getter(), swift_bridgeObjectRelease(), !v124))
      {
LABEL_100:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v49 = v174;
        uint64_t v50 = Logger.logObject.getter();
        v125 = static os_log_type_t.error.getter();
        if (!os_log_type_enabled(v50, v125)) {
          goto LABEL_103;
        }
        int64_t v52 = (uint8_t *)swift_slowAlloc();
        v126 = swift_slowAlloc();
        v135 = objc_retainAutoreleasedReturnValue(objc_msgSend(v49, sel_dictionaryRepresentation, OUTLINED_FUNCTION_10_1(v126, v127, v128, v129, v130, v131, v132, v133, v147, v148, (uint64_t)v149, v150, v151, *((uint64_t *)&v151 + 1), (uint64_t)v152,
                     (uint64_t)v153,
                     (uint64_t)v154,
                     v155,
                     (uint64_t)v156,
                     v157,
                     v158,
                     (uint64_t)v159,
                     v160,
                     v161,
                     v162,
                     (uint64_t)v163,
                     (uint64_t)v164,
                     v165,
                     v166,
                     v167,
                     (uint64_t)v168,
                     v169,
                     v170,
                     (uint64_t)v171,
                     v172,
                     v173,
                     v134).n128_f64[0]));
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        v136 = Dictionary.description.getter();
        v138 = v137;
        swift_bridgeObjectRelease();
        v139 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v136, v138, &v194);
        OUTLINED_FUNCTION_16_1(v139, v156);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        id v1 = v184;
        swift_bridgeObjectRelease();

        uint64_t v68 = v50;
        uint64_t v69 = v125;
        uint64_t v70 = "Event graph has multiple UUIDs for component to key! Ignoring: %s";
LABEL_102:
        _os_log_impl(&dword_21D935000, v68, v69, v70, v52, 0xCu);
        uint64_t v2 = (unint64_t)v192;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_8();
        goto LABEL_104;
      }
    }
    else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
    {
      goto LABEL_100;
    }
    if ((v11 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = (id)MEMORY[0x223C0DCA0](0, v11);
    }
    else
    {
      if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_120;
      }
      uint64_t v12 = *(id *)(v11 + 32);
    }
    unint64_t v13 = v12;
    unint64_t v14 = v1[78];
    uint64_t v15 = v1[76];
    swift_bridgeObjectRelease();
    dispatch thunk of ComponentIdentifier.uuid.getter();

    v183 = UUID.uuidString.getter();
    v185 = v16;
    v192 = *v182;
    (*v182)(v14, v15);
    int v17 = v10 + 64;
    uint64_t v18 = -1 << *(unsigned char *)(v10 + 32);
    if (-v18 < 64) {
      int64_t v19 = ~(-1 << -(char)v18);
    }
    else {
      int64_t v19 = -1;
    }
    uint64_t v2 = v19 & *(void *)(v10 + 64);
    unint64_t v20 = (unint64_t)(63 - v18) >> 6;
    swift_bridgeObjectRetain();
    int64_t v21 = 0;
    if (v2)
    {
LABEL_19:
      signed int v22 = __clz(__rbit64(v2));
      v2 &= v2 - 1;
      os_signpost_id_t v23 = v22 | (v21 << 6);
      goto LABEL_34;
    }
    while (1)
    {
      uint64_t v24 = v21 + 1;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
LABEL_118:
        __break(1u);
        goto LABEL_119;
      }
      if (v24 >= v20) {
        goto LABEL_51;
      }
      os_signpost_type_t v25 = *(void *)(v17 + 8 * v24);
      ++v21;
      if (!v25)
      {
        int64_t v21 = v24 + 1;
        if (v24 + 1 >= v20) {
          goto LABEL_51;
        }
        os_signpost_type_t v25 = *(void *)(v17 + 8 * v21);
        if (!v25)
        {
          int64_t v21 = v24 + 2;
          if (v24 + 2 >= v20) {
            goto LABEL_51;
          }
          os_signpost_type_t v25 = *(void *)(v17 + 8 * v21);
          if (!v25)
          {
            uint64_t v26 = v24 + 3;
            if (v26 >= v20)
            {
LABEL_51:
              swift_release();
              swift_bridgeObjectRelease();
LABEL_55:
              unint64_t v83 = v177;
              goto LABEL_56;
            }
            os_signpost_type_t v25 = *(void *)(v17 + 8 * v26);
            if (!v25)
            {
              while (1)
              {
                int64_t v21 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  break;
                }
                if (v21 >= v20) {
                  goto LABEL_51;
                }
                os_signpost_type_t v25 = *(void *)(v17 + 8 * v21);
                ++v26;
                if (v25) {
                  goto LABEL_33;
                }
              }
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
              goto LABEL_121;
            }
            int64_t v21 = v26;
          }
        }
      }
LABEL_33:
      uint64_t v2 = (v25 - 1) & v25;
      os_signpost_id_t v23 = __clz(__rbit64(v25)) + (v21 << 6);
LABEL_34:
      uint64_t v27 = *(void *)(*(void *)(v10 + 56) + 8 * v23);
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      if (v28 >= 2) {
        break;
      }
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_19;
      }
    }
    uint64_t v29 = v174;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v30 = v29;
    uint64_t v31 = Logger.logObject.getter();
    uint64_t v32 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_release();

      goto LABEL_55;
    }
    HIDWORD(v158) = v32;
    v186 = v30;
    v188 = v31;
    v190 = v10;
    uint64_t v33 = swift_slowAlloc();
    v157 = swift_slowAlloc();
    v197[0] = v157;
    *(_DWORD *)uint64_t v33 = v151;
    os_log_type_t v34 = SISchemaComponentName.description.getter();
    char v36 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, v197);
    OUTLINED_FUNCTION_16_1(v36, v154);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v163 = (uint8_t *)v33;
    *(_WORD *)(v33 + 12) = 2080;
    v194 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28, 0);
    uint64_t v37 = 0;
    do
    {
      if ((v27 & 0xC000000000000001) != 0) {
        BOOL v38 = (id)MEMORY[0x223C0DCA0](v37, v27);
      }
      else {
        BOOL v38 = *(id *)(v27 + 8 * v37 + 32);
      }
      Swift::Int v39 = v38;
      unint64_t v40 = v1[78];
      char v41 = v1[76];
      dispatch thunk of ComponentIdentifier.uuid.getter();
      unint64_t v42 = UUID.uuidString.getter();
      unint64_t v44 = v43;
      v192(v40, v41);

      int v45 = v194;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v45 + 16) + 1, 1);
        int v45 = v194;
      }
      uint64_t v47 = *(void *)(v45 + 16);
      uint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v46 > 1), v47 + 1, 1);
        int v45 = v194;
      }
      ++v37;
      *(void *)(v45 + 16) = v47 + 1;
      BOOL v48 = v45 + 16 * v47;
      *(void *)(v48 + 32) = v42;
      *(void *)(v48 + 40) = v44;
      id v1 = v184;
    }
    while (v28 != v37);
    unint64_t v71 = MEMORY[0x223C0D8D0](v45, MEMORY[0x263F8D310]);
    os_log_type_t v73 = v72;
    swift_bridgeObjectRelease();
    uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v73, v197);
    OUTLINED_FUNCTION_16_1(v74, v159);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 22) = 2080;
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo21SISchemaComponentNameVSay19SiriInstrumentation0E10IdentifierCGG_SSs5NeverOTg506_sSo21def6VSay19g19Instrumentation0B10i30CGSSIgygo_AB3key_AF5valuetSSs5j138OIegnrzr_TR0109_s12FeatureStore27CurareInteractionSELFStreamC8retrieveSDys11AnyHashableVSDyAFSayypGGGyYaKFSaySSGycfu4_SSSo21abc7V_Say19d19N24J10F9CGtXEfU1_Tf3nnnpf_nTf1cn_n(v190);
    uint64_t v75 = MEMORY[0x223C0D8D0]();
    unint64_t v77 = v76;
    swift_bridgeObjectRelease();
    uint64_t v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v77, v197);
    OUTLINED_FUNCTION_16_1(v78, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *((_WORD *)v163 + 16) = 2080;
    uint64_t v79 = objc_msgSend(v186, sel_dictionaryRepresentation);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v80 = Dictionary.description.getter();
    os_log_t v82 = v81;
    swift_bridgeObjectRelease();
    *v152 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v80, v82, v197);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    unint64_t v83 = v177;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21D935000, v188, BYTE4(v158), "Event graph has multiple UUIDs for some components. Could this be a product error?\nComponent: %s Identifiers: %s\nComponentIdentifiers: %s\nEventGraph: %s", v163, 0x2Au);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_8();

    swift_release();
LABEL_56:
    os_log_type_t v84 = dispatch thunk of EventGraph.events()();
    uint64_t v85 = *(void **)(v162 + v161);
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v85;
    uint64_t v86 = swift_task_alloc();
    *(void *)(v86 + 16) = partial apply for implicit closure #9 in implicit closure #8 in CurareInteractionSELFStream.retrieve();
    *(void *)(v86 + 24) = v2;
    unint64_t v87 = v85;
    uint64_t v88 = specialized _ArrayProtocol.filter(_:)(v84, partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool), v86);
    v177 = v83;
    swift_release();
    swift_task_dealloc();
    if (v88 >> 62)
    {
      OUTLINED_FUNCTION_21_0();
      v89 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v89) {
        goto LABEL_107;
      }
LABEL_58:
      v192 = (void (*)(uint64_t, uint64_t))self;
      if (v89 >= 1)
      {
        v90 = 0;
        v189 = v88;
        v191 = v88 & 0xC000000000000001;
        v187 = v89;
        while (1)
        {
          if (v191) {
            uint64_t v91 = (id)MEMORY[0x223C0DCA0](v90, v88);
          }
          else {
            uint64_t v91 = *(id *)(v88 + 8 * v90 + 32);
          }
          os_log_t v92 = v91;
          v93 = objc_msgSend(v91, sel_dictionaryRepresentation);
          unint64_t v94 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          uint64_t v2 = (unint64_t)objc_msgSend(v192, sel_isValidJSONObject_, isa);

          if (v2)
          {
            uint64_t v96 = OrderedEvent.innerType.getter();
            if (v96)
            {
              v97 = v96;
              *v176 = OrderedEvent.outerType.getter();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaTopLevelUnionType.Type);
              v194 = String.init<A>(describing:)();
              v195 = v98;
              v99._countAndFlagsBits = 46;
              v99._object = (void *)0xE100000000000000;
              String.append(_:)(v99);
              *v175 = v97;
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaInstrumentationMessage.Type);
              v100._countAndFlagsBits = String.init<A>(describing:)();
              String.append(_:)(v100);
              swift_bridgeObjectRelease();
              v101 = v194;
              uint64_t v102 = v195;
            }
            else
            {
              *v171 = OrderedEvent.outerType.getter();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaTopLevelUnionType.Type);
              v101 = String.init<A>(describing:)();
              uint64_t v102 = v110;
            }
            v1[52] = v101;
            v1[53] = v102;
            swift_bridgeObjectRetain_n();
            v111 = objc_msgSend(v193, sel___swift_objectForKeyedSubscript_, _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());
            swift_unknownObjectRelease();
            if (v111)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
            }
            else
            {
              *v180 = 0u;
              v180[1] = 0u;
            }
            outlined init with take of Any?((uint64_t)v180, v181);
            if (!v1[45])
            {
              swift_bridgeObjectRelease();
              v114 = v181;
              goto LABEL_85;
            }
            type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableDictionary);
            if ((swift_dynamicCast() & 1) == 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_86;
            }
            uint64_t v103 = v1[63];
            swift_bridgeObjectRelease();
            v1[56] = v183;
            v1[57] = v185;
            swift_bridgeObjectRetain_n();
            v112 = [v103 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
            swift_unknownObjectRelease();
            if (v112)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
              v113 = (uint64_t)v168;
            }
            else
            {
              v113 = (uint64_t)v168;
              *v168 = 0u;
              v168[1] = 0u;
            }
            outlined init with take of Any?(v113, v169);
            if (!v1[37])
            {

              swift_bridgeObjectRelease();
              v114 = v169;
LABEL_85:
              outlined destroy of InstrumentationStreamsProviderProtocol?(v114, &demangling cache variable for type metadata for Any?);
LABEL_86:
              v1[54] = v101;
              v1[55] = v102;
              swift_bridgeObjectRetain_n();
              v116 = objc_msgSend(v193, sel___swift_objectForKeyedSubscript_, _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());
              swift_unknownObjectRelease();
              if (v116)
              {
                _bridgeAnyObjectToAny(_:)();
                swift_unknownObjectRelease();
              }
              else
              {
                *v178 = 0u;
                v178[1] = 0u;
              }
              outlined init with take of Any?((uint64_t)v178, v179);
              if (v1[33])
              {
                type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableDictionary);
                v117 = swift_dynamicCast();
                swift_bridgeObjectRelease();
                if (v117)
                {
                  uint64_t v2 = v1[62];
                  swift_bridgeObjectRelease();
                  type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
                  v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
                  v194 = v94;
                  swift_bridgeObjectRetain();
                  v118 = @nonobjc NSMutableArray.__allocating_init(object:)(&v194);
                  v1[60] = v183;
                  v1[61] = v185;
                  swift_bridgeObjectRetain();
                  objc_msgSend((id)v2, sel___swift_setObject_forKeyedSubscript_, v118, _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());

                  swift_unknownObjectRelease();
LABEL_94:
                  swift_bridgeObjectRelease();
                  goto LABEL_95;
                }
              }
              else
              {
                swift_bridgeObjectRelease();
                outlined destroy of InstrumentationStreamsProviderProtocol?(v179, &demangling cache variable for type metadata for Any?);
              }
              type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
              v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
              v194 = v94;
              v119 = @nonobjc NSMutableArray.__allocating_init(object:)(&v194);
              uint64_t v2 = MEMORY[0x223C0D7E0](v183, v185);
              v120 = self;
              v121 = v119;
              v122 = objc_msgSend(v120, sel_dictionaryWithObject_forKey_, v121, v2);

              v1[58] = v101;
              v1[59] = v102;
              swift_bridgeObjectRetain();
              objc_msgSend(v193, sel___swift_setObject_forKeyedSubscript_, v122, _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)());

              swift_unknownObjectRelease();
              goto LABEL_94;
            }
            type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
            if ((swift_dynamicCast() & 1) == 0)
            {

              swift_bridgeObjectRelease();
              goto LABEL_86;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v163 = *v164;
            swift_bridgeObjectRelease();
            v115 = objc_msgSend(v92, sel_dictionaryRepresentation);
            static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v2 = (unint64_t)Dictionary._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            [(uint8_t *)v163 addObject:v2];
          }
          else
          {
            swift_bridgeObjectRetain();
            uint64_t v103 = Logger.logObject.getter();
            uint64_t v104 = static os_log_type_t.error.getter();
            if (!os_log_type_enabled(v103, v104))
            {

              swift_bridgeObjectRelease_n();
              goto LABEL_95;
            }
            v105 = swift_slowAlloc();
            uint64_t v2 = swift_slowAlloc();
            v194 = v2;
            *(_DWORD *)v105 = 136315138;
            swift_bridgeObjectRetain();
            v106 = Dictionary.description.getter();
            v108 = v107;
            swift_bridgeObjectRelease();
            v109 = v106;
            id v1 = v184;
            *(void *)(v105 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v109, v108, &v194);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_21D935000, v103, v104, "Event is not a valid JSON Object! Ignoring: %s", (uint8_t *)v105, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_8();
            OUTLINED_FUNCTION_8();
          }
LABEL_95:
          uint64_t v88 = v189;
          if (v187 == ++v90) {
            goto LABEL_107;
          }
        }
      }
LABEL_121:
      __break(1u);
LABEL_122:
      swift_bridgeObjectRetain();
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v4) {
        break;
      }
      goto LABEL_3;
    }
    v89 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v89) {
      goto LABEL_58;
    }
LABEL_107:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_108:
    uint64_t v5 = v172;
  }
  while (v172 != v165);
LABEL_109:
  swift_bridgeObjectRelease();
  v194 = 0;
  v140 = v193;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

  v141 = v194;
  if (v194)
  {
  }
  else
  {
    v142 = Logger.logObject.getter();
    v143 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v144 = 0;
      OUTLINED_FUNCTION_8();
    }

    v141 = MEMORY[0x263F8EE80];
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 17));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v145 = (uint64_t (*)(uint64_t))v1[1];
  return v145(v141);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  OUTLINED_FUNCTION_8_2();
  __swift_deallocate_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_11_1();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_2();
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  OUTLINED_FUNCTION_8_2();
  __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  OUTLINED_FUNCTION_11_1();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_2();
  return v1();
}

uint64_t specialized Dictionary.init<A>(grouping:by:)(uint64_t a1)
{
  uint64_t v1 = a1;
  Swift::Int v39 = (void *)MEMORY[0x263F8EE80];
  if ((a1 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for ComponentIdentifier();
    lazy protocol witness table accessor for type ComponentIdentifier and conformance NSObject(&lazy protocol witness table cache variable for type ComponentIdentifier and conformance NSObject, MEMORY[0x263F6D950]);
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v34;
    uint64_t v32 = v35;
    uint64_t v2 = v36;
    int64_t v3 = v37;
    unint64_t v4 = v38;
  }
  else
  {
    int64_t v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
  }
  int64_t v31 = (unint64_t)(v2 + 64) >> 6;
  id v8 = (void *)MEMORY[0x263F8EE80];
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    int64_t v11 = v3;
    goto LABEL_29;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v31) {
      goto LABEL_42;
    }
    unint64_t v14 = *(void *)(v32 + 8 * v13);
    int64_t v11 = v3 + 1;
    if (!v14)
    {
      int64_t v11 = v3 + 2;
      if (v3 + 2 >= v31) {
        goto LABEL_42;
      }
      unint64_t v14 = *(void *)(v32 + 8 * v11);
      if (!v14)
      {
        int64_t v11 = v3 + 3;
        if (v3 + 3 >= v31) {
          goto LABEL_42;
        }
        unint64_t v14 = *(void *)(v32 + 8 * v11);
        if (!v14)
        {
          int64_t v11 = v3 + 4;
          if (v3 + 4 >= v31) {
            goto LABEL_42;
          }
          unint64_t v14 = *(void *)(v32 + 8 * v11);
          if (!v14)
          {
            int64_t v11 = v3 + 5;
            if (v3 + 5 >= v31) {
              goto LABEL_42;
            }
            unint64_t v14 = *(void *)(v32 + 8 * v11);
            if (!v14)
            {
              int64_t v15 = v3 + 6;
              while (v15 < v31)
              {
                unint64_t v14 = *(void *)(v32 + 8 * v15++);
                if (v14)
                {
                  int64_t v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (v12)
    {
      while (1)
      {
        Swift::UInt32 v16 = ComponentIdentifier.componentName.getter();
        unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(v16);
        uint64_t v19 = v8[2];
        BOOL v20 = (v17 & 1) == 0;
        uint64_t v21 = v19 + v20;
        if (__OFADD__(v19, v20)) {
          break;
        }
        char v22 = v17;
        if (v8[3] < v21)
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v21, 1);
          id v8 = v39;
          unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v16);
          if ((v22 & 1) != (v24 & 1)) {
            goto LABEL_46;
          }
          unint64_t v18 = v23;
        }
        if (v22)
        {
          id v8 = v39;
          os_signpost_type_t v25 = (void *)(v39[7] + 8 * v18);
          MEMORY[0x223C0D8A0]();
          if (*(void *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
          uint64_t v26 = swift_allocObject();
          *(_OWORD *)(v26 + 16) = xmmword_21D9615C0;
          *(void *)(v26 + 32) = v12;
          uint64_t v33 = (void *)v26;
          specialized Array._endMutation()();
          v8[(v18 >> 6) + 8] |= 1 << v18;
          *(_DWORD *)(v8[6] + 4 * v18) = v16;
          *(void *)(v8[7] + 8 * v18) = v33;
          uint64_t v27 = v8[2];
          BOOL v28 = __OFADD__(v27, 1);
          uint64_t v29 = v27 + 1;
          if (v28) {
            goto LABEL_44;
          }
          v8[2] = v29;
        }
        int64_t v3 = v11;
        unint64_t v4 = v9;
        if ((v1 & 0x8000000000000000) == 0) {
          goto LABEL_8;
        }
LABEL_10:
        if (__CocoaSet.Iterator.next()())
        {
          type metadata accessor for ComponentIdentifier();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v12 = v33;
          swift_unknownObjectRelease();
          int64_t v11 = v3;
          uint64_t v9 = v4;
          if (v33) {
            continue;
          }
        }
        goto LABEL_42;
      }
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
LABEL_42:
    outlined consume of Set<ComponentIdentifier>.Iterator._Variant();
    return (uint64_t)v39;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  type metadata accessor for SISchemaComponentName();
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized Dictionary.subscript.getter(Swift::UInt32 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

char *closure #3 in implicit closure #6 in CurareInteractionSELFStream.retrieve()(uint64_t a1, unint64_t a2)
{
  uint64_t v26 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = SISchemaComponentName.description.getter();
  uint64_t v29 = v8;
  v9._countAndFlagsBits = 2112032;
  v9._object = (void *)0xE300000000000000;
  String.append(_:)(v9);
  if (a2 >> 62)
  {
    OUTLINED_FUNCTION_21_0();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (!v10)
  {
LABEL_14:
    v23._countAndFlagsBits = MEMORY[0x223C0D8D0](v11, MEMORY[0x263F8D310]);
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (char *)v28;
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = 0;
    unint64_t v24 = a2 & 0xC000000000000001;
    unint64_t v25 = a2;
    unint64_t v14 = (void (**)(char *, uint64_t))(v4 + 8);
    do
    {
      if (v24) {
        id v15 = (id)MEMORY[0x223C0DCA0](v13, a2);
      }
      else {
        id v15 = *(id *)(a2 + 8 * v13 + 32);
      }
      Swift::UInt32 v16 = v15;
      dispatch thunk of ComponentIdentifier.uuid.getter();
      uint64_t v17 = UUID.uuidString.getter();
      uint64_t v19 = v18;
      (*v14)(v7, v26);

      uint64_t v11 = v27;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v11 + 16) + 1, 1);
        uint64_t v11 = v27;
      }
      unint64_t v21 = *(void *)(v11 + 16);
      unint64_t v20 = *(void *)(v11 + 24);
      if (v21 >= v20 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v20 > 1), v21 + 1, 1);
        uint64_t v11 = v27;
      }
      ++v13;
      *(void *)(v11 + 16) = v21 + 1;
      uint64_t v22 = v11 + 16 * v21;
      *(void *)(v22 + 32) = v17;
      *(void *)(v22 + 40) = v19;
      a2 = v25;
    }
    while (v10 != v13);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(void *a1, uint64_t (*a2)(void *))
{
  v7[3] = type metadata accessor for OrderedEvent();
  v7[4] = MEMORY[0x263F20870];
  v7[0] = a1;
  id v4 = a1;
  char v5 = a2(v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5 & 1;
}

uint64_t specialized _ArrayProtocol.filter(_:)(unint64_t a1, uint64_t (*a2)(id), uint64_t a3)
{
  unint64_t v6 = a1;
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v6 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v6 & 0xC000000000000001;
      unint64_t v15 = v6;
      while (v17)
      {
        id v9 = (id)MEMORY[0x223C0DCA0](v8, v6);
LABEL_7:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        uint64_t v12 = a3;
        char v13 = a2(v9);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          unint64_t v6 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v18;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v6 + 8 * v8 + 32);
    goto LABEL_7;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

id @nonobjc NSMutableArray.__allocating_init(object:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  uint64_t v2 = _bridgeAnythingToObjectiveC<A>(_:)();
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_arrayWithObject_, v2);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t @objc closure #1 in CurareInteractionSELFStream.retrieve()(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *id v4 = v2;
  v4[1] = @objc closure #1 in CurareInteractionSELFStream.retrieve();
  return CurareInteractionSELFStream.retrieve()();
}

uint64_t @objc closure #1 in CurareInteractionSELFStream.retrieve()()
{
  OUTLINED_FUNCTION_8_2();
  uint64_t v2 = v0;
  OUTLINED_FUNCTION_2();
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_22();
  void *v5 = v4;
  uint64_t v7 = *(void **)(v6 + 16);
  uint64_t v8 = *v1;
  OUTLINED_FUNCTION_5_6();
  void *v9 = v8;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v10 = _convertErrorToNSError(_:)();

    Class isa = 0;
    uint64_t v12 = (void *)v10;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    uint64_t v12 = isa;
  }
  char v13 = *(void (***)(void, void, void))(v4 + 24);
  ((void (**)(void, Class, uint64_t))v13)[2](v13, isa, v10);

  _Block_release(v13);
  OUTLINED_FUNCTION_12_2();
  return v14();
}

uint64_t _runTaskForBridgedAsyncMethod(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  void v9[4] = &_sIeghH_IeAgH_TRTATu;
  v9[5] = v8;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v6, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v9);
  return swift_release();
}

id CurareInteractionSELFStream.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CurareInteractionSELFStream.init()()
{
}

id CurareInteractionSELFStream.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CurareInteractionSELFStream();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SISchemaComponentName()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(Swift::UInt32 a1)
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SISchemaComponentName(int a1)
{
  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(int a1, Swift::UInt32 a2)
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SISchemaComponentName(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, Swift::UInt32 a2)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SISchemaComponentName(int *a1, int *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

BOOL specialized == infix<A>(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SISchemaComponentName@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SISchemaComponentName.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t SISchemaComponentName.init(rawValue:)(uint64_t result)
{
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SISchemaComponentName@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = destructiveProjectEnumData for FeatureStoreError(*v1);
  *a1 = result;
  return result;
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    outlined destroy of InstrumentationStreamsProviderProtocol?(a1, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_5_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_2();
  return v3();
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
    return swift_arrayInitWithCopy();
  }
  return result;
}

{
  BOOL v3;
  uint64_t result;
  uint64_t vars8;

  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  BOOL v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    *BOOL v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<AnyHashable, Any>);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
    outlined destroy of AnyHashable(*(void *)(v12 + 48) + 40 * v6);
    outlined init with take of Any((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    _NativeDictionary._delete(at:)();
    *BOOL v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt32 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  BOOL v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<SISchemaComponentName, [ComponentIdentifier]>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = *(void *)(v5 + 64);
    int64_t v31 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & v9;
    int64_t v30 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    if ((v11 & v9) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (unint64_t i = v14 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v8 << 6))
    {
      Swift::UInt32 v19 = *(_DWORD *)(*(void *)(v5 + 48) + 4 * i);
      uint64_t v20 = *(void *)(*(void *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v19);
      uint64_t result = Hasher._finalize()();
      uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) == 0)
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          BOOL v27 = v23 == v26;
          if (v23 == v26) {
            unint64_t v23 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v23);
          if (v28 != -1)
          {
            unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v24) = v19;
      *(void *)(*(void *)(v7 + 56) + 8 * v24) = v20;
      ++*(void *)(v7 + 16);
      if (v12) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_41;
      }
      if (v16 >= v30) {
        goto LABEL_32;
      }
      unint64_t v17 = v31[v16];
      ++v8;
      if (!v17)
      {
        int64_t v8 = v16 + 1;
        if (v16 + 1 >= v30) {
          goto LABEL_32;
        }
        unint64_t v17 = v31[v8];
        if (!v17)
        {
          int64_t v18 = v16 + 2;
          if (v18 >= v30)
          {
LABEL_32:
            if ((a2 & 1) == 0)
            {
              uint64_t result = swift_release();
              BOOL v3 = v2;
              goto LABEL_39;
            }
            uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
            if (v29 >= 64) {
              specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v31);
            }
            else {
              *int64_t v31 = -1 << v29;
            }
            BOOL v3 = v2;
            *(void *)(v5 + 16) = 0;
            break;
          }
          unint64_t v17 = v31[v18];
          if (!v17)
          {
            while (1)
            {
              int64_t v8 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v8 >= v30) {
                goto LABEL_32;
              }
              unint64_t v17 = v31[v8];
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          int64_t v8 = v18;
        }
      }
LABEL_18:
      unint64_t v12 = (v17 - 1) & v17;
    }
  }
  uint64_t result = swift_release();
LABEL_39:
  *BOOL v3 = v7;
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  int64_t v8 = (void *)*v3;
  unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<AnyHashable, Any>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  int64_t v18 = *v4;
  if (v15)
  {
    Swift::UInt32 v19 = (_OWORD *)(v18[7] + 32 * v14);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return outlined init with take of Any(a1, v19);
  }
  else
  {
    outlined init with copy of AnyHashable(a2, (uint64_t)v21);
    return specialized _NativeDictionary._insert(at:key:value:)(v14, (uint64_t)v21, a1, v18);
  }
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C0DC30](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  unint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

{
  uint64_t *v3;
  char *result;

  unint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for CurareInteractionSELFStream()
{
  uint64_t result = type metadata singleton initialization cache for CurareInteractionSELFStream;
  if (!type metadata singleton initialization cache for CurareInteractionSELFStream) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined init with copy of InstrumentationStreamsProviderProtocol(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined assign with take of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x223C0E840);
  }
  return result;
}

uint64_t outlined init with take of InstrumentationStreamsProviderProtocol(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t lazy protocol witness table accessor for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>;
  if (!lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BookmarkablePublisher<EventGraph>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>);
  }
  return result;
}

uint64_t sub_21D95174C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for implicit closure #9 in implicit closure #8 in CurareInteractionSELFStream.retrieve()()
{
  return dispatch thunk of EventFilter.isAllowed(_:)() & 1;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(void *a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(a1, *(uint64_t (**)(void *))(v1 + 16)) & 1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for NSMutableArray(uint64_t a1, unint64_t *a2)
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

uint64_t ObjC metadata update function for CurareInteractionSELFStream()
{
  return type metadata accessor for CurareInteractionSELFStream();
}

uint64_t type metadata completion function for CurareInteractionSELFStream()
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

uint64_t method lookup function for CurareInteractionSELFStream(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CurareInteractionSELFStream);
}

uint64_t dispatch thunk of CurareInteractionSELFStream.__allocating_init(filter:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CurareInteractionSELFStream.retrieve()()
{
  OUTLINED_FUNCTION_8_2();
  unint64_t v1 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  uint64_t v6 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v2 = swift_task_alloc();
  long long v3 = (void *)OUTLINED_FUNCTION_13_2(v2);
  *long long v3 = v4;
  v3[1] = dispatch thunk of CurareInteractionSELFStream.retrieve();
  return v6();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;

  OUTLINED_FUNCTION_8_0();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_2();
  long long v3 = *v0;
  OUTLINED_FUNCTION_5_6();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_21D951B34()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve()()
{
  OUTLINED_FUNCTION_8_2();
  unint64_t v1 = *(const void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_13_2(v3);
  *uint64_t v4 = v5;
  v4[1] = partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve();
  uint64_t v6 = (uint64_t (*)(const void *, void *))((char *)&async function pointer to @objc closure #1 in CurareInteractionSELFStream.retrieve()
                                                    + async function pointer to @objc closure #1 in CurareInteractionSELFStream.retrieve());
  return v6(v1, v2);
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2();
  unint64_t v1 = *v0;
  OUTLINED_FUNCTION_5_6();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12_2();
  return v3();
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_13_2(v4);
  void *v5 = v6;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_13_2(v6);
  *uint64_t v7 = v8;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))&_sIeAgH_ytIeAgHr_TRTu[*(int *)_sIeAgH_ytIeAgHr_TRTu];
  return v9(a1, v3, v4, v5);
}

uint64_t outlined destroy of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_21D951EF8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA()
{
  OUTLINED_FUNCTION_8_2();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_13_2(v4);
  void *v5 = v6;
  v5[1] = partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve();
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu);
  return v7(v2, v3);
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[AnyHashable : Any]>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  Swift::Int v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  Swift::Int v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined consume of Set<ComponentIdentifier>.Iterator._Variant()
{
  return swift_release();
}

void type metadata accessor for SISchemaComponentName()
{
  if (!lazy cache variable for type metadata for SISchemaComponentName)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for SISchemaComponentName);
    }
  }
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t base witness table accessor for Equatable in SISchemaComponentName()
{
  return lazy protocol witness table accessor for type ComponentIdentifier and conformance NSObject(&lazy protocol witness table cache variable for type SISchemaComponentName and conformance SISchemaComponentName, (void (*)(uint64_t))type metadata accessor for SISchemaComponentName);
}

uint64_t lazy protocol witness table accessor for type ComponentIdentifier and conformance NSObject(unint64_t *a1, void (*a2)(uint64_t))
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

void CurareInteractionSELFStream.provider.setter()
{
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  outlined init with take of InstrumentationStreamsProviderProtocol(v0, (uint64_t)(v1 + 17));
  uint64_t v2 = v1[20];
  uint64_t v3 = v1[21];
  __swift_project_boxed_opaque_existential_1Tm(v1 + 17, v2);
  return MEMORY[0x270F08590](v2, v3);
}

__n128 OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,__n128 a37)
{
  *(void *)(v38 - 144) = a1;
  *(void *)(v38 - 128) = a1;
  __n128 result = a37;
  *uint64_t v37 = a37.n128_u32[0];
  *(void *)(v38 - 152) = v37 + 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return AnyHashable.init<A>(_:)();
}

void *OUTLINED_FUNCTION_16_1@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return a2;
}

void OUTLINED_FUNCTION_17_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v3 = *(void *)(v1 + 600) + *(void *)(v1 + 664);
  return outlined init with copy of InstrumentationStreamsProviderProtocol?(v3, v0);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of Serializable.fsf_serialize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Serializable.fsf_deserialize(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t InteractionWrapper.interactionId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double InteractionWrapper.timestamp.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t InteractionWrapper.feature.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t InteractionWrapper.init(interactionId:timestamp:feature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(double *)(a5 + 16) = a6;
  uint64_t v8 = a5 + *(int *)(type metadata accessor for InteractionWrapper() + 32);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32);

  return v9(v8, a3, a4);
}

uint64_t type metadata accessor for InteractionWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of FeatureMetadata.interactionId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureMetadata.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamAccessor.init(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of StreamAccessor.insert(feature:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StreamAccessor.retrieve(query:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of StreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata instantiation function for InteractionWrapper(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata completion function for InteractionWrapper()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for InteractionWrapper(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 24) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    size_t v11 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    BOOL v12 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    void *v11 = *v12;
    uint64_t v13 = ((unint64_t)v11 + v6 + 8) & ~v6;
    uint64_t v14 = ((unint64_t)v12 + v6 + 8) & ~v6;
    char v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v15(v13, v14, v4);
  }
  return a1;
}

uint64_t destroy for InteractionWrapper(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *initializeWithCopy for InteractionWrapper(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  OUTLINED_FUNCTION_2_5((uint64_t)a2, (uint64_t)a1 + 23);
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = (v7 + 8 + v8) & ~v7;
  uint64_t v11 = (v7 + 8 + v10) & ~v7;
  swift_bridgeObjectRetain();
  v6(v9, v11, v5);
  return a1;
}

void *assignWithCopy for InteractionWrapper(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_8();
  uint64_t v4 = OUTLINED_FUNCTION_0_6(v3);
  v5(v4);
  return a1;
}

_OWORD *initializeWithTake for InteractionWrapper(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  OUTLINED_FUNCTION_2_5((uint64_t)a2, (uint64_t)a1 + 23);
  uint64_t v4 = OUTLINED_FUNCTION_0_6(v3);
  v5(v4);
  return a1;
}

void *assignWithTake for InteractionWrapper(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_8();
  uint64_t v5 = OUTLINED_FUNCTION_0_6(v4);
  v6(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractionWrapper(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v5 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v9 = a2 - v8;
  if (a2 <= v8) {
    goto LABEL_23;
  }
  uint64_t v10 = ((v7 + 24) & ~v7) + *(void *)(*(void *)(v4 - 8) + 64);
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_23:
      if ((v6 & 0x80000000) != 0) {
        return __swift_getEnumTagSinglePayload(((((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8) + v7 + 8) & ~v7, v6, v4);
      }
      unint64_t v16 = *((void *)a1 + 1);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_23;
  }
LABEL_15:
  int v15 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v15 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v10 | v15) + 1;
}

void storeEnumTagSinglePayload for InteractionWrapper(char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  size_t v11 = ((v10 + 24) & ~v10) + *(void *)(*(void *)(v6 - 8) + 64);
  char v12 = 8 * v11;
  BOOL v13 = a3 >= v9;
  unsigned int v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v9 < a2)
  {
    unsigned int v16 = ~v9 + a2;
    if (v11 < 4)
    {
      int v17 = (v16 >> v12) + 1;
      if (v11)
      {
        int v19 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v17;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v11] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x21D952FACLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v8 & 0x80000000) != 0)
        {
          unint64_t v20 = (((unint64_t)(a1 + 23) & 0xFFFFFFFFFFFFFFF8) + v10 + 8) & ~v10;
          __swift_storeEnumTagSinglePayload(v20, a2, v8, v6);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X8>)
{
  return (v1 + 8 + a1) & ~v1;
}

double OUTLINED_FUNCTION_1_8()
{
  uint64_t v2 = (double *)((v0 + 23) & 0xFFFFFFFFFFFFFFF8);
  double result = *v2;
  *(double *)((v1 + 23) & 0xFFFFFFFFFFFFFFF8) = *v2;
  return result;
}

void OUTLINED_FUNCTION_2_5(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 & 0xFFFFFFFFFFFFFFF8) = *(void *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t NSCodingFeatureWrapper.serialize()()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v1, sel_setOutputFormat_, 100);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)MEMORY[0x223C0D7E0](1953460082, 0xE400000000000000);
  objc_msgSend(v1, sel_encodeObject_forKey_, v2, v3);

  objc_msgSend(v1, sel_finishEncoding);
  id v4 = objc_msgSend(v1, sel_encodedData);
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

Class @objc NSCodingFeatureWrapper.serialize()()
{
  swift_retain();
  uint64_t v0 = NSCodingFeatureWrapper.serialize()();
  unint64_t v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v0, v2);
  }

  return isa;
}

uint64_t static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = a5;
  uint64_t v7 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v9 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  MEMORY[0x270FA5388](v11);
  BOOL v13 = (char *)&v21 - v12;
  type metadata accessor for NSKeyedUnarchiver();
  uint64_t v14 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  uint64_t v15 = v22;
  if (v14)
  {
    type metadata accessor for NSCodingFeatureWrapper();
    swift_bridgeObjectRetain();
    AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a4, v15, a3, v14);
    uint64_t result = swift_dynamicCastClass();
    if (result) {
      return result;
    }
    swift_release();
  }
  else
  {
    uint64_t v17 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v17, v7);
    unsigned int v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_21D935000, v18, v19, "Deserialization failed. Returned nil object.", v20, 2u);
      OUTLINED_FUNCTION_8();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v7);
  }
  return 0;
}

id @objc static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  swift_getObjCClassMetadata();
  uint64_t v15 = (void *)static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);

  return v15;
}

Swift::String_optional __swiftcall NSCodingFeatureWrapper.json()()
{
  uint64_t v1 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 120))(v8);
  if (v10 >> 60 == 15)
  {
    uint64_t v11 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v11, v1);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_21D935000, v12, v13, "Json fetch failed.", v14, 2u);
      OUTLINED_FUNCTION_8();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
    uint64_t v15 = 0;
    unsigned int v16 = 0;
  }
  else
  {
    uint64_t v17 = v9;
    unint64_t v18 = v10;
    static String.Encoding.utf8.getter();
    uint64_t v15 = String.init(data:encoding:)();
    unsigned int v16 = v19;
    outlined consume of Data?(v17, v18);
  }
  uint64_t v20 = v15;
  uint64_t v21 = v16;
  result.value._object = v21;
  result.value._countAndFlagsBits = v20;
  return result;
}

id @objc NSCodingFeatureWrapper.json()()
{
  swift_retain();
  Swift::String_optional v0 = NSCodingFeatureWrapper.json()();
  swift_release();
  if (v0.value._object)
  {
    uint64_t v1 = (void *)MEMORY[0x223C0D7E0](v0.value._countAndFlagsBits, v0.value._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t type metadata accessor for NSCodingFeatureWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static FeatureStoreService.insertAceObject<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a4;
  void v12[3] = a3;
  v12[4] = a1;
  v12[5] = a2;
  id v13 = a3;
  swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v11, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertAceObject<A>(interactionId:item:), (uint64_t)v12, 0, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_21D95398C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insertAceObject<A>(interactionId:item:)()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  swift_getObjectType();
  swift_getMetatypeMetadata();
  uint64_t v4 = String.init<A>(describing:)();
  uint64_t v6 = v5;
  type metadata accessor for AceObjectStreamAccessor();
  id v7 = FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v4, v6);
  uint64_t v9 = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v7 + 104))(v2, v3, &v9);
  return swift_release();
}

void static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, void *a2, uint64_t a3)
{
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  Swift::String v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  uint64_t v5 = v3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_9();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_0_7(v4);
  OUTLINED_FUNCTION_0_7((uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  id v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_21D9610A0;
  *(void *)(v13 + 32) = a1;
  *(void *)(v13 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v14 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(v4, (uint64_t)v12, v13);
  uint64_t v15 = static FeatureStoreService.retrieveAceObject<A>(query:)((uint64_t)v14, a3);

  if (!v5)
  {
    uint64_t v22 = v15;
    type metadata accessor for Array();
    swift_getWitnessTable();
    Collection.first.getter();
    swift_bridgeObjectRelease();
    if (!v20)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      uint64_t v20 = 0xD000000000000028;
      uint64_t v21 = 0x800000021D9635B0;
      v16._countAndFlagsBits = a1;
      v16._object = a2;
      String.append(_:)(v16);
      uint64_t v17 = v20;
      unint64_t v18 = v21;
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      swift_allocError();
      *(void *)os_log_type_t v19 = v17;
      *(void *)(v19 + 8) = v18;
      *(unsigned char *)(v19 + 16) = 0;
      swift_willThrow();
    }
  }
}

uint64_t static FeatureStoreService.retrieveAceObject<A>(query:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)();
  if (!v3)
  {
    v10[5] = v5;
    MEMORY[0x270FA5388](v5);
    void v10[2] = a2;
    type metadata accessor for InteractionWrapper();
    uint64_t v6 = type metadata accessor for Array();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in static FeatureStoreService.retrieveAceObject<A>(query:), (uint64_t)v10, v6, a2, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v8);
    swift_bridgeObjectRelease();
  }
  return v2;
}

void static FeatureStoreService.retrieveAceObject<A>(interactionId:)(uint64_t a1, void *a2, uint64_t a3)
{
}

uint64_t static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)()
{
  type metadata accessor for InteractionWrapper();
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

id partial apply for closure #1 in static FeatureStoreService.retrieveAceObject<A>(query:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void **)(a1 + 24);
  *a2 = v2;
  return v2;
}

uint64_t static FeatureStoreService.retrieveWithInteractionWrapper<A>(interactionId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_9();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_0_7(v2);
  OUTLINED_FUNCTION_0_7((uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21D9610A0;
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  id v10 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(v2, (uint64_t)v8, v9);
  uint64_t v11 = static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)();

  return v11;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  type metadata accessor for StreamQuery();
  id v10 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21D9610A0;
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v12 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v9, (uint64_t)v7, v11);
  uint64_t v13 = static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)();

  return v13;
}

{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1_9();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_0_7(v2);
  OUTLINED_FUNCTION_0_7((uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21D9610A0;
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  id v10 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(v2, (uint64_t)v8, v9);
  uint64_t v11 = static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)();

  return v11;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void **)(v1 + 24);
  swift_getMetatypeMetadata();
  uint64_t v5 = String.init<A>(describing:)();
  uint64_t v7 = v6;
  type metadata accessor for AceObjectStreamAccessor();
  id v8 = FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v5, v7);
  uint64_t v9 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0xA0);
  uint64_t v10 = *(void *)(v9() + 16);
  uint64_t v11 = swift_bridgeObjectRelease();
  if (v10 != 1) {
    goto LABEL_6;
  }
  uint64_t v12 = (void *)((uint64_t (*)(uint64_t))v9)(v11);
  if (!v12[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(void *)uint64_t v17 = 0xD000000000000075;
    *(void *)(v17 + 8) = 0x800000021D9635E0;
    *(unsigned char *)(v17 + 16) = 0;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v13 = v12[4];
  uint64_t v14 = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 136))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (!v2) {
    *a1 = v15;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return type metadata accessor for StreamQuery();
}

uint64_t static FeatureStoreService.insertCoding(interactionId:item:)()
{
  swift_getObjectType();
  uint64_t v0 = OUTLINED_FUNCTION_0_8();

  return static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(v0, v1, v2, v3);
}

uint64_t static FeatureStoreService.insertPBCodable(interactionId:item:)()
{
  type metadata accessor for PBCodable();
  uint64_t v0 = OUTLINED_FUNCTION_0_8();

  return static FeatureStoreService.insert<A>(interactionId:item:)(v0, v1, v2, v3);
}

unint64_t type metadata accessor for PBCodable()
{
  unint64_t result = lazy cache variable for type metadata for PBCodable;
  if (!lazy cache variable for type metadata for PBCodable)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PBCodable);
  }
  return result;
}

uint64_t @objc static FeatureStoreService.insertCoding(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, uint64_t, id))
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a4;
  a5(v7, v9, v10);

  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return v0;
}

uint64_t static FeatureStoreService.insertSerializable<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a1;
  uint64_t v25 = a5;
  uint64_t v8 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a3, a4);
  unint64_t v19 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v25;
  *(void *)(v20 + 16) = a4;
  *(void *)(v20 + 24) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v20 + v19, (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  uint64_t v22 = (void *)(v20 + ((v17 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v22 = v26;
  v22[1] = a2;
  swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v13, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertSerializable<A>(interactionId:item:), v20, 0, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v8);
}

uint64_t sub_21D954540()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v5 + 16, v4);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insertSerializable<A>(interactionId:item:)()
{
  OUTLINED_FUNCTION_0();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = v0 + v2;
  unint64_t v5 = (uint64_t *)(v0 + ((*(void *)(v3 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  swift_getDynamicType();
  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for SerializableStreamAccessor();
  id v8 = OUTLINED_FUNCTION_1_10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v8 + 104))(v6, v7, v4);
  return swift_release();
}

uint64_t static FeatureStoreService.retrieveSerializable<A>(interactionId:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveSerializable<A>(interactionId:), a1, a2);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveSerializable<A>(interactionId:)()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for SerializableStreamAccessor();
  id v3 = OUTLINED_FUNCTION_1_10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 128))(v1, v2);
  return swift_release();
}

uint64_t static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)()
{
  type metadata accessor for InteractionWrapper();
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void **)(v1 + 32);
  swift_getMetatypeMetadata();
  uint64_t v5 = String.init<A>(describing:)();
  uint64_t v7 = v6;
  type metadata accessor for SerializableStreamAccessor();
  id v8 = FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v5, v7);
  uint64_t v9 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0xA0);
  uint64_t v10 = *(void *)(v9() + 16);
  uint64_t v11 = swift_bridgeObjectRelease();
  if (v10 != 1) {
    goto LABEL_6;
  }
  uint64_t v12 = (void *)((uint64_t (*)(uint64_t))v9)(v11);
  if (!v12[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(void *)uint64_t v17 = 0xD000000000000075;
    *(void *)(v17 + 8) = 0x800000021D9635E0;
    *(unsigned char *)(v17 + 16) = 0;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v13 = v12[4];
  uint64_t v14 = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 136))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (!v2) {
    *a1 = v15;
  }
  return result;
}

id OUTLINED_FUNCTION_1_10()
{
  return FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v0, v1);
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](static FeatureStoreService.insertAwait<A>(interactionId:item:), 0, 0);
}

uint64_t closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v20 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v17 = (uint64_t (*)(uint64_t))swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v17 + v16, (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  static FeatureStoreService.insert<A>(interactionId:item:completion:)(a3, a4, a5, (uint64_t (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(taskId:interactionId:item:), v17, v20);
  return swift_release();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1)
{
  return closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(a1, *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48), *(void *)(v1 + 16));
}

uint64_t static FeatureStoreService.insert<A>(interactionId:item:completion:)(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v12 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a6;
  v18[3] = a3;
  v18[4] = a1;
  v18[5] = a2;
  id v19 = a3;
  swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v17, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:), (uint64_t)v18, a4, a5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v12);
}

uint64_t static FeatureStoreService.insert<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return static FeatureStoreService.insert<A>(interactionId:item:completion:)(a1, a2, a3, 0, 0, a4);
}

uint64_t closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static PBCodableCoder.encode(codable:)(a1);
  if (v13 >> 60 == 15)
  {
    uint64_t v14 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v14, v6);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21D935000, v15, v16, "Could not encode the item. Skipping insertion.", v17, 2u);
      MEMORY[0x223C0E840](v17, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  }
  else
  {
    uint64_t v19 = v12;
    unint64_t v20 = v13;
    v25[1] = swift_getObjectType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    type metadata accessor for FeatureStoreStreamAccessor();
    uint64_t v21 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v19, v20);
    int v22 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    double v23 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    id v24 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(a2, a3, v19, v20, v22, v23);
    (*(void (**)(void))(*(void *)v21 + 104))();
    swift_release();

    return outlined consume of Data?(v19, v20);
  }
}

uint64_t sub_21D9552CC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)()
{
  return closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)(*(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t static FeatureStoreService.retrieve<A>(query:)()
{
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for FeatureStoreStreamAccessor();
  uint64_t v5 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 112))(a1);
  if (v2) {
    return swift_release();
  }
  MEMORY[0x270FA5388](v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
  lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
  uint64_t v8 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in static FeatureStoreService.retrieve<A>(query:)(*(void *)(v1 + 24), a1);
}

id partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = static PBCodableCoder.decode(data:)(*(void *)(*a1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData), *(void *)(*a1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData + 8));
  *a2 = result;
  return result;
}

uint64_t sub_21D955554()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t AceObjectStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for AceObjectFeatureWrapper();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v8 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, a3);
  uint64_t v9 = *(void **)(v4 + 16);
  v13[0] = 0;
  if (objc_msgSend(v9, sel_insert_error_, v8, v13))
  {
    id v10 = v13[0];
  }
  else
  {
    id v11 = v13[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return swift_release();
}

uint64_t AceObjectStreamAccessor.retrieve(interactionId:)()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 112))();
  if (v1) {
    return v0;
  }
  uint64_t v4 = v3;
  uint64_t result = type metadata accessor for AceObjectFeatureWrapper();
  if (*(void *)(v4 + 16))
  {
    uint64_t v6 = result;
    uint64_t v7 = OUTLINED_FUNCTION_2_6();
    outlined copy of Data._Representation(v7, v8);
    swift_bridgeObjectRelease();
    uint64_t v9 = OUTLINED_FUNCTION_2_6();
    uint64_t v0 = v6;
    uint64_t v11 = v10(v9);
    uint64_t v12 = OUTLINED_FUNCTION_2_6();
    outlined consume of Data._Representation(v12, v13);
    if (v11)
    {
      uint64_t v0 = *(void *)(v11 + 16);
      swift_unknownObjectRetain();
      swift_release();
    }
    else
    {
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      swift_allocError();
      OUTLINED_FUNCTION_1_5(v14, (uint64_t)"Stored data could not be deserialized!");
    }
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t AceObjectStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 120))();
  if (!v3)
  {
    v16[1] = v9;
    MEMORY[0x270FA5388](v9);
    _OWORD v15[2] = *(void *)(v7 + 144);
    v15[3] = a1;
    v15[4] = a2;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    uint64_t v11 = type metadata accessor for InteractionWrapper();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    unint64_t v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    uint64_t v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in AceObjectStreamAccessor.retrieve(interactionId:), (uint64_t)v15, v10, v11, v12, v13, MEMORY[0x263F8E4E0], (uint64_t)v16);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in AceObjectStreamAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  double v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 3);
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = type metadata accessor for AceObjectFeatureWrapper();
  if ((*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 128))(v8, v9, 0, v5, v6))
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v11 = OUTLINED_FUNCTION_2_6();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v11, v12, v13, v4, v14, v7);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    uint64_t v16 = swift_allocError();
    uint64_t result = OUTLINED_FUNCTION_1_5(v17, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v16;
  }
  return result;
}

uint64_t type metadata accessor for AceObjectStreamAccessor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to AceObjectStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return AceObjectStreamAccessor.insert(interactionId:feature:)(a1, a2, *a3);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to AceObjectStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AceObjectStreamAccessor.retrieve(interactionId:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

uint64_t PBCodableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for PBCodableFeatureWrapper();
  swift_bridgeObjectRetain();
  uint64_t v8 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, (uint64_t)a3);
  uint64_t v9 = *(void **)(v4 + 16);
  v13[0] = 0;
  if (objc_msgSend(v9, sel_insert_error_, v8, v13))
  {
    id v10 = v13[0];
  }
  else
  {
    id v11 = v13[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return swift_release();
}

uint64_t PBCodableStreamAccessor.retrieve(interactionId:)()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v0)
  {
    uint64_t v3 = result;
    uint64_t result = type metadata accessor for PBCodableFeatureWrapper();
    if (*(void *)(v3 + 16))
    {
      uint64_t v4 = OUTLINED_FUNCTION_2_6();
      outlined copy of Data._Representation(v4, v5);
      swift_bridgeObjectRelease();
      uint64_t v6 = OUTLINED_FUNCTION_2_6();
      uint64_t v8 = v7(v6);
      uint64_t v9 = OUTLINED_FUNCTION_2_6();
      outlined consume of Data._Representation(v9, v10);
      if (v8)
      {
        id v11 = *(id *)(v8 + 16);
        swift_release();
        return (uint64_t)v11;
      }
      else
      {
        lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
        swift_allocError();
        return OUTLINED_FUNCTION_1_5(v12, (uint64_t)"Stored data could not be deserialized!");
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t PBCodableStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 120))();
  if (!v3)
  {
    v16[1] = v9;
    MEMORY[0x270FA5388](v9);
    _OWORD v15[2] = *(void *)(v7 + 144);
    v15[3] = a1;
    v15[4] = a2;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    uint64_t v11 = type metadata accessor for InteractionWrapper();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    unint64_t v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    uint64_t v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in PBCodableStreamAccessor.retrieve(interactionId:), (uint64_t)v15, v10, v11, v12, v13, MEMORY[0x263F8E4E0], (uint64_t)v16);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in PBCodableStreamAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  double v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 3);
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = type metadata accessor for PBCodableFeatureWrapper();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 128))(v8, v9, 0, v5, v6);
  if (v11)
  {
    uint64_t v12 = *(void **)(v11 + 16);
    swift_bridgeObjectRetain();
    id v13 = v12;
    uint64_t v14 = OUTLINED_FUNCTION_2_6();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v14, v15, v16, v4, v17, v7);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    uint64_t v19 = swift_allocError();
    uint64_t result = OUTLINED_FUNCTION_1_5(v20, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v19;
  }
  return result;
}

uint64_t type metadata accessor for PBCodableStreamAccessor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to PBCodableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void **a3)
{
  return PBCodableStreamAccessor.insert(interactionId:feature:)(a1, a2, *a3);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to PBCodableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PBCodableStreamAccessor.retrieve(interactionId:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t SerializableFeatureWrapper.serialize()()
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)v0 + 152) + 16))(*(void *)(*(void *)v0 + 144));
}

Class @objc SerializableFeatureWrapper.serialize()()
{
  swift_retain();
  uint64_t v0 = SerializableFeatureWrapper.serialize()();
  unint64_t v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v0, v2);
  }

  return isa;
}

uint64_t static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = a5;
  uint64_t v25 = a4;
  int v26 = a3;
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v6 = *(void *)(v5 + 144);
  uint64_t v24 = type metadata accessor for Optional();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v28 = v5;
  uint64_t v12 = *(void *)(v5 + 152);
  swift_getAssociatedTypeWitness();
  uint64_t v13 = type metadata accessor for Optional();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_0();
  uint64_t v15 = v14;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v23 - v20;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24))(v29, v30, v6, v12);
  if (swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v21, v11, v6);
    type metadata accessor for SerializableFeatureWrapper();
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v21, v6);
    swift_bridgeObjectRetain();
    SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v6);
    uint64_t result = swift_dynamicCastClass();
    if (result) {
      return result;
    }
    swift_release();
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v24);
  }
  return 0;
}

uint64_t type metadata accessor for SerializableFeatureWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t *SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)()
{
  return SerializableFeatureWrapper.init(interactionId:dataVersion:feature:)();
}

id @objc static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  swift_getObjCClassMetadata();
  uint64_t v15 = (void *)static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);

  return v15;
}

id @objc SerializableFeatureWrapper.json()()
{
  return 0;
}

uint64_t *SerializableFeatureWrapper.init(interactionId:dataVersion:feature:)()
{
  OUTLINED_FUNCTION_1_11();
  uint64_t v5 = *(void *)(*(void *)v1 + 144);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v14 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - v9, v11, v5);
  uint64_t v12 = BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(v4, v3, v2, (uint64_t)v10);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
  return v12;
}

uint64_t SerializableFeatureWrapper.__deallocating_deinit()
{
  uint64_t v0 = BaseFeatureWrapper.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

id BaseStreamAccessor.stream.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t BaseStreamAccessor.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  BaseStreamAccessor.init(identifier:)(a1, a2);
  return v4;
}

id BaseStreamAccessor.init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_allocWithZone((Class)FSFCurareInteractionStream);
  id result = @nonobjc FSFCurareInteractionStream.init(streamId:sourceType:)(a1, a2, 0);
  if (result)
  {
    *(void *)(v3 + 16) = result;
    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t BaseStreamAccessor.insert(interactionId:feature:)()
{
  OUTLINED_FUNCTION_1_12();
  _StringGuts.grow(_:)(47);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_9();
  v0._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v1 = 0xD00000000000002CLL;
  *(void *)(v1 + 8) = 0x800000021D9636B0;
  *(unsigned char *)(v1 + 16) = 1;
  return swift_willThrow();
}

uint64_t BaseStreamAccessor.retrieveSerializedInteractions(interactionId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D9610A0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_retrieve_, isa);

  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v9 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    OUTLINED_FUNCTION_3_0();
    *(void *)uint64_t v11 = 0xD000000000000014;
    uint64_t v12 = "Item does not exist!";
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  specialized Dictionary.subscript.getter((uint64_t)v13, v9, &v14);
  swift_bridgeObjectRelease();
  outlined destroy of AnyHashable((uint64_t)v13);
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if (swift_dynamicCast()) {
      return a1;
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v14);
  }
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v11 = 0xD000000000000018;
  uint64_t v12 = "Stored item is not Data!";
LABEL_10:
  *(void *)(v11 + 8) = (unint64_t)(v12 - 32) | 0x8000000000000000;
  *(unsigned char *)(v11 + 16) = 0;
  return swift_willThrow();
}

double specialized Dictionary.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    outlined init with copy of Any(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *BaseStreamAccessor.retrieveSerializedInteractions(interactionId:)(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21D9610A0;
  *(void *)(inited + 32) = a1;
  *(void *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_retrieveWithInteractionWrapper_, isa);

  if (!v8
    || (__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FSFFeatureStoreBiomeEvent]),
        unint64_t v5 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v8,
        swift_bridgeObjectRetain(),
        unint64_t v9 = specialized Dictionary.subscript.getter(a1, a2, (uint64_t)v5),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        !v9))
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    OUTLINED_FUNCTION_3_0();
    *(void *)uint64_t v32 = 0xD000000000000014;
    *(void *)(v32 + 8) = 0x800000021D9636E0;
    *(unsigned char *)(v32 + 16) = 0;
    swift_willThrow();
    return v5;
  }
  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v10)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (void *)MEMORY[0x263F8EE78];
  }
LABEL_5:
  Swift::Int v39 = (void *)MEMORY[0x263F8EE78];
  double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = 0;
    unint64_t v5 = v39;
    unint64_t v34 = v9 & 0xC000000000000001;
    unint64_t v35 = v9;
    do
    {
      if (v34) {
        id v13 = (id)MEMORY[0x223C0DCA0](v12, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v12 + 32);
      }
      long long v14 = v13;
      id v15 = objc_msgSend(v13, sel_interactionId, v33);
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v18 = v17;

      objc_msgSend(v14, sel_timestamp);
      double v20 = v19;
      id v21 = objc_msgSend(v14, sel_featureData);
      uint64_t v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v24 = v23;

      v36[0] = v22;
      v36[1] = v24;
      InteractionWrapper.init(interactionId:timestamp:feature:)(v16, v18, (uint64_t)v36, MEMORY[0x263F06F78], (uint64_t)v37, v20);

      uint64_t v25 = v37[0];
      uint64_t v26 = v37[1];
      uint64_t v27 = v37[2];
      long long v28 = v38;
      Swift::Int v39 = v5;
      unint64_t v30 = v5[2];
      unint64_t v29 = v5[3];
      if (v30 >= v29 >> 1)
      {
        long long v33 = v38;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v29 > 1), v30 + 1, 1);
        long long v28 = v33;
        unint64_t v5 = v39;
      }
      ++v12;
      v5[2] = v30 + 1;
      int64_t v31 = &v5[5 * v30];
      v31[4] = v25;
      v31[5] = v26;
      v31[6] = v27;
      *(_OWORD *)(v31 + 7) = v28;
      unint64_t v9 = v35;
    }
    while (v10 != v12);
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t BaseStreamAccessor.retrieve(interactionId:)()
{
  OUTLINED_FUNCTION_1_12();
  _StringGuts.grow(_:)(54);
  v0._object = (void *)0x800000021D963720;
  v0._countAndFlagsBits = 0xD000000000000033;
  String.append(_:)(v0);
  OUTLINED_FUNCTION_0_9();
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  uint64_t v2 = OUTLINED_FUNCTION_3_0();
  return OUTLINED_FUNCTION_4_6(v2, v3);
}

{
  Swift::String v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_12();
  _StringGuts.grow(_:)(74);
  v0._object = (void *)0x800000021D963760;
  v0._countAndFlagsBits = 0xD000000000000047;
  String.append(_:)(v0);
  OUTLINED_FUNCTION_0_9();
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  uint64_t v2 = OUTLINED_FUNCTION_3_0();
  return OUTLINED_FUNCTION_4_6(v2, v3);
}

uint64_t BaseStreamAccessor.deinit()
{
  return v0;
}

uint64_t BaseStreamAccessor.__deallocating_deinit()
{
  BaseStreamAccessor.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

id @nonobjc FSFCurareInteractionStream.init(streamId:sourceType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unint64_t v5 = (void *)MEMORY[0x223C0D7E0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = 0;
  }
  id v6 = objc_msgSend(v3, sel_initWithStreamId_sourceType_, v5, a3);

  return v6;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    id v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      id v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    double v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *double v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t type metadata completion function for BaseStreamAccessor()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BaseStreamAccessor()
{
  return __swift_instantiateGenericMetadata();
}

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InteractionWrapper<Data>>);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for InteractionWrapper<Data>);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void OUTLINED_FUNCTION_3_6()
{
  uint64_t v1 = 33;
  unint64_t v2 = 0xE100000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for NSCodingFeatureWrapper();
  swift_bridgeObjectRetain();
  uint64_t v8 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, (uint64_t)a3);
  uint64_t v9 = *(void **)(v4 + 16);
  v13[0] = 0;
  if (objc_msgSend(v9, sel_insert_error_, v8, v13))
  {
    id v10 = v13[0];
  }
  else
  {
    id v11 = v13[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return swift_release();
}

uint64_t FeatureStoreNSCodingAccessor.retrieve(interactionId:)()
{
  OUTLINED_FUNCTION_0_4();
  uint64_t result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v0)
  {
    uint64_t v3 = result;
    uint64_t result = type metadata accessor for NSCodingFeatureWrapper();
    if (*(void *)(v3 + 16))
    {
      uint64_t v4 = OUTLINED_FUNCTION_2_6();
      outlined copy of Data._Representation(v4, v5);
      swift_bridgeObjectRelease();
      uint64_t v6 = OUTLINED_FUNCTION_2_6();
      uint64_t v8 = v7(v6);
      uint64_t v9 = OUTLINED_FUNCTION_2_6();
      outlined consume of Data._Representation(v9, v10);
      if (v8)
      {
        id v11 = *(id *)(v8 + 16);
        swift_release();
        return (uint64_t)v11;
      }
      else
      {
        lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
        swift_allocError();
        return OUTLINED_FUNCTION_1_5(v12, (uint64_t)"Stored data could not be deserialized!");
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t FeatureStoreNSCodingAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 120))();
  if (!v3)
  {
    v16[1] = v9;
    MEMORY[0x270FA5388](v9);
    _OWORD v15[2] = *(void *)(v7 + 144);
    v15[3] = a1;
    v15[4] = a2;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    uint64_t v11 = type metadata accessor for InteractionWrapper();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    unint64_t v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    uint64_t v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in FeatureStoreNSCodingAccessor.retrieve(interactionId:), (uint64_t)v15, v10, v11, v12, v13, MEMORY[0x263F8E4E0], (uint64_t)v16);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in FeatureStoreNSCodingAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2)
{
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  double v7 = a1[2];
  uint64_t v8 = *((void *)a1 + 3);
  uint64_t v9 = *((void *)a1 + 4);
  uint64_t v10 = type metadata accessor for NSCodingFeatureWrapper();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 128))(v8, v9, 0, v5, v6);
  if (v11)
  {
    uint64_t v12 = *(void **)(v11 + 16);
    swift_bridgeObjectRetain();
    id v13 = v12;
    uint64_t v14 = OUTLINED_FUNCTION_2_6();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v14, v15, v16, v4, v17, v7);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    uint64_t v19 = swift_allocError();
    uint64_t result = OUTLINED_FUNCTION_1_5(v20, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v19;
  }
  return result;
}

uint64_t type metadata accessor for FeatureStoreNSCodingAccessor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void **a3)
{
  return FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(a1, a2, *a3);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to FeatureStoreNSCodingAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FeatureStoreNSCodingAccessor.retrieve(interactionId:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

NSDataCompressionAlgorithm_optional __swiftcall CompressionPolicy.compressionAlgorithm()()
{
  NSDataCompressionAlgorithm v1 = (unint64_t)*v0;
  Swift::Bool v2 = 1;
  switch(*v0)
  {
    case 1:
      NSDataCompressionAlgorithm v1 = NSDataCompressionAlgorithmLZFSE;
      Swift::Bool v2 = 0;
      break;
    case 2:
      Swift::Bool v2 = 0;
      NSDataCompressionAlgorithm v1 = NSDataCompressionAlgorithmLZ4;
      break;
    case 3:
      Swift::Bool v2 = 0;
      NSDataCompressionAlgorithm v1 = NSDataCompressionAlgorithmLZMA;
      break;
    case 4:
      Swift::Bool v2 = 0;
      NSDataCompressionAlgorithm v1 = NSDataCompressionAlgorithmZlib;
      break;
    default:
      break;
  }
  result.value = v1;
  result.is_nil = v2;
  return result;
}

BOOL static CompressionPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CompressionPolicy.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL static CompressionPolicy.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void CompressionPolicy.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t CompressionPolicy.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D6F43746F4E6F64 && a2 == 0xED00007373657270;
  if (v3 || (OUTLINED_FUNCTION_9_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6573667A6CLL && a2 == 0xE500000000000000;
    if (v6 || (OUTLINED_FUNCTION_9_0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 3439212 && a2 == 0xE300000000000000;
      if (v7 || (OUTLINED_FUNCTION_9_0() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 1634564716 && a2 == 0xE400000000000000;
        if (v8 || (OUTLINED_FUNCTION_9_0() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 1651076218 && a2 == 0xE400000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = OUTLINED_FUNCTION_9_0();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

Swift::Int CompressionPolicy.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t CompressionPolicy.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aDonotcomlzfse[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CompressionPolicy.CodingKeys(char *a1, char *a2)
{
  return static CompressionPolicy.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CompressionPolicy.CodingKeys()
{
  return CompressionPolicy.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance CompressionPolicy.CodingKeys(uint64_t a1)
{
  CompressionPolicy.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CompressionPolicy.CodingKeys()
{
  return CompressionPolicy.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CompressionPolicy.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = CompressionPolicy.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance CompressionPolicy.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CompressionPolicy.Lz4CodingKeys@<X0>(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = CompressionPolicy.Lz4CodingKeys.init(stringValue:)(a1);
  *a2 = 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.Lz4CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.Lz4CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.LzfseCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.LzfseCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.LzmaCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.LzmaCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.ZlibCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.ZlibCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

void CompressionPolicy.encode(to:)()
{
  OUTLINED_FUNCTION_26();
  Swift::Bool v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.ZlibCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19_1(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.LzmaCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_18_1(v6, v16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.Lz4CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_4_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.LzfseCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.DoNotCompressCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_8_1();
  uint64_t v11 = *v0;
  __swift_project_boxed_opaque_existential_1Tm(v2, v2[3]);
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch(v11)
  {
    case 1:
      lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
      OUTLINED_FUNCTION_3_7();
      goto LABEL_8;
    case 2:
      lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
      OUTLINED_FUNCTION_3_7();
      goto LABEL_7;
    case 3:
      lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
      OUTLINED_FUNCTION_3_7();
      goto LABEL_7;
    case 4:
      lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
      OUTLINED_FUNCTION_3_7();
LABEL_7:
      OUTLINED_FUNCTION_30_0();
LABEL_8:
      OUTLINED_FUNCTION_7_1();
      v13();
      break;
    default:
      lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      OUTLINED_FUNCTION_7_1();
      v12();
      break;
  }
  OUTLINED_FUNCTION_7_1();
  v14();
  OUTLINED_FUNCTION_28_0();
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

Swift::Int CompressionPolicy.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void CompressionPolicy.init(from:)()
{
  OUTLINED_FUNCTION_26();
  uint64_t v69 = v1;
  uint64_t v3 = v2;
  uint64_t v65 = v4;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.ZlibCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v63 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_4_1();
  uint64_t v66 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.LzmaCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v61 = v8;
  uint64_t v62 = v9;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_19_1(v10, v50);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.Lz4CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v59 = v12;
  uint64_t v60 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_4_1();
  uint64_t v64 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.LzfseCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v57 = v15;
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.DoNotCompressCodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v56 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_4();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v26 = v25;
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_25();
  uint64_t v28 = v3[3];
  uint64_t v68 = v3;
  __swift_project_boxed_opaque_existential_1Tm(v3, v28);
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  uint64_t v29 = v69;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v29)
  {
LABEL_10:
    uint64_t v43 = (uint64_t)v68;
LABEL_11:
    __swift_destroy_boxed_opaque_existential_0(v43);
    goto LABEL_12;
  }
  uint64_t v52 = v18;
  uint64_t v53 = v23;
  uint64_t v54 = v17;
  uint64_t v69 = v26;
  uint64_t v30 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v31 = *(void *)(v30 + 16);
  if (!v31)
  {
    uint64_t v39 = v0;
LABEL_9:
    uint64_t v40 = type metadata accessor for DecodingError();
    swift_allocError();
    unint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *unint64_t v42 = &type metadata for CompressionPolicy;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v42, *MEMORY[0x263F8DCB0], v40);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v39, v24);
    goto LABEL_10;
  }
  uint64_t v51 = 0;
  uint64_t v55 = v24;
  uint64_t v32 = v0;
  uint64_t v33 = *(unsigned __int8 *)(v30 + 32);
  specialized ArraySlice.subscript.getter(1, v31, v30, v30 + 32, 0, (2 * v31) | 1);
  uint64_t v35 = v34;
  unint64_t v37 = v36;
  swift_bridgeObjectRelease();
  if (v35 != v37 >> 1)
  {
    uint64_t v39 = v32;
    uint64_t v24 = v55;
    goto LABEL_9;
  }
  switch(v33)
  {
    case 1:
      long long v38 = v65;
      lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
      uint64_t v44 = v51;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (!v44) {
        goto LABEL_6;
      }
      swift_unknownObjectRelease();
      uint64_t v45 = OUTLINED_FUNCTION_21_1();
      v46(v45);
      uint64_t v43 = (uint64_t)v68;
      goto LABEL_11;
    case 2:
      long long v38 = v65;
      lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
      OUTLINED_FUNCTION_5_7();
      goto LABEL_6;
    case 3:
      long long v38 = v65;
      lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
      OUTLINED_FUNCTION_5_7();
      goto LABEL_6;
    case 4:
      long long v38 = v65;
      lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_30_0();
      goto LABEL_19;
    default:
      long long v38 = v65;
      lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
      OUTLINED_FUNCTION_5_7();
LABEL_6:
      OUTLINED_FUNCTION_30_0();
LABEL_19:
      OUTLINED_FUNCTION_7_1();
      v47();
      swift_unknownObjectRelease();
      uint64_t v48 = OUTLINED_FUNCTION_21_1();
      v49(v48);
      *long long v38 = v33;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v68);
      break;
  }
LABEL_12:
  OUTLINED_FUNCTION_28_0();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CompressionPolicy.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Decodable.init(from:) in conformance CompressionPolicy()
{
}

void protocol witness for Encodable.encode(to:) in conformance CompressionPolicy()
{
}

uint64_t FeatureStoreBiomeEvent.interactionId.getter()
{
  return OUTLINED_FUNCTION_17_2();
}

uint64_t FeatureStoreBiomeEvent.featureData.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_17_2();
  outlined copy of Data._Representation(v0, v1);
  return OUTLINED_FUNCTION_17_2();
}

double FeatureStoreBiomeEvent.timestamp.getter()
{
  OUTLINED_FUNCTION_5_4();
  return *(double *)v0;
}

uint64_t FeatureStoreBiomeEvent.timestamp.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

void key path getter for FeatureStoreBiomeEvent.timestamp : FeatureStoreBiomeEvent(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
}

uint64_t key path setter for FeatureStoreBiomeEvent.timestamp : FeatureStoreBiomeEvent(double *a1, void **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x263F8EED0] & **a2) + 0x80))(*a1);
}

uint64_t (*FeatureStoreBiomeEvent.timestamp.modify())()
{
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

uint64_t FeatureStoreBiomeEvent.dataVersion.getter()
{
  OUTLINED_FUNCTION_5_4();
  return *v0;
}

uint64_t FeatureStoreBiomeEvent.dataVersion.setter(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t key path getter for FeatureStoreBiomeEvent.dataVersion : FeatureStoreBiomeEvent@<X0>(void **a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t key path setter for FeatureStoreBiomeEvent.dataVersion : FeatureStoreBiomeEvent(int *a1)
{
  return FeatureStoreBiomeEvent.dataVersion.setter(*a1);
}

char **FeatureStoreBiomeEvent.signpostBiomeEncodeCompress.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.signpostBiomeEncodeCompress;
}

const char *static FeatureStoreBiomeEvent.signpostBiomeEncodeCompress.getter()
{
  return "BiomeEncodeCompress";
}

char **FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress;
}

const char *static FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress.getter()
{
  return "BiomeDecodeDecompress";
}

void *FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression;
}

unint64_t static FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression.getter()
{
  return 0xD000000000000028;
}

uint64_t static FeatureStoreBiomeEvent.maximumSizeBeforeCompression.getter()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_standardUserDefaults);
  Swift::Bool v2 = (void *)MEMORY[0x223C0D7E0](0xD000000000000028, 0x800000021D9637F0);
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined destroy of Any?((uint64_t)v8);
    id v4 = objc_msgSend(v0, sel_standardUserDefaults);
    uint64_t v5 = (void *)MEMORY[0x223C0D7E0](0xD000000000000028, 0x800000021D9637F0);
    id v6 = objc_msgSend(v4, sel_integerForKey_, v5);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    outlined destroy of Any?((uint64_t)v8);
    return 700000;
  }
  return (uint64_t)v6;
}

uint64_t default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)()
{
  return 1;
}

double default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)()
{
  uint64_t v0 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5 - v4;
  static Date.now.getter();
  Date.timeIntervalSinceReferenceDate.getter();
  double v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return v8;
}

id FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(a1, a2, a3, a4, a5, a6);
}

id FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5, double a6)
{
  double v7 = v6;
  uint64_t v14 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_33_0();
  uint64_t v60 = v18;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v59 = (char *)&v54 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v54 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v54 - v25;
  uint64_t v27 = &v7[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
  *(void *)uint64_t v27 = a1;
  *((void *)v27 + 1) = a2;
  *(_DWORD *)&v7[OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion] = a5;
  uint64_t v28 = (uint64_t *)&v7[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];
  *uint64_t v28 = a3;
  v28[1] = a4;
  *(double *)&v7[OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp] = a6;
  if (a5)
  {
    outlined copy of Data._Representation(a3, a4);
    uint64_t v57 = v7;
    uint64_t v29 = Logger.accessor.unsafeMutableAddressor();
    uint64_t v58 = v16;
    uint64_t v30 = *(void (**)(void))(v16 + 16);
    uint64_t v56 = v29;
    OUTLINED_FUNCTION_22_0();
    v30();
    outlined copy of Data._Representation(a3, a4);
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.debug.getter();
    unint64_t v33 = a4;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v55 = v14;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = v30;
      *(_DWORD *)uint64_t v34 = 134217984;
      uint64_t v61 = Data.count.getter();
      uint64_t v30 = v54;
      uint64_t v14 = v55;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      outlined consume of Data._Representation(a3, v33);
      _os_log_impl(&dword_21D935000, v31, v32, "Data size in bytes: %ld", v34, 0xCu);
      OUTLINED_FUNCTION_8();
    }
    else
    {
      outlined consume of Data._Representation(a3, a4);
    }

    uint64_t v39 = *(void (**)(char *, uint64_t))(v58 + 8);
    v39(v24, v14);
    uint64_t v40 = Data.count.getter();
    if (static FeatureStoreBiomeEvent.maximumSizeBeforeCompression.getter() >= v40)
    {
      OUTLINED_FUNCTION_22_0();
      v30();
      uint64_t v46 = (void *)Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_14_1(v47))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_37(&dword_21D935000, v48, v49, "No compression is needed.");
        OUTLINED_FUNCTION_8();
      }

      v39(v60, v14);
      uint64_t v50 = v57;
      v57[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = 0;
    }
    else
    {
      OUTLINED_FUNCTION_22_0();
      v30();
      char v41 = (void *)Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_14_1(v42))
      {
        *(_WORD *)swift_slowAlloc() = 0;
        OUTLINED_FUNCTION_37(&dword_21D935000, v43, v44, "Compression is needed.");
        OUTLINED_FUNCTION_8();
      }

      v39(v59, v14);
      uint64_t v45 = v57;
      v57[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = 1;
    }
  }
  else
  {
    v7[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = 0;
    outlined copy of Data._Representation(a3, a4);
    uint64_t v35 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v26, v35, v14);
    unint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.debug.getter();
    unint64_t v33 = a4;
    if (os_log_type_enabled(v36, v37))
    {
      long long v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v38 = 0;
      _os_log_impl(&dword_21D935000, v36, v37, "No compression is needed", v38, 2u);
      OUTLINED_FUNCTION_8();
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v26, v14);
  }
  uint64_t v51 = (objc_class *)type metadata accessor for FeatureStoreBiomeEvent();
  v62.receiver = v7;
  v62.super_class = v51;
  id v52 = objc_msgSendSuper2(&v62, sel_init);
  outlined consume of Data._Representation(a3, v33);
  return v52;
}

uint64_t static FeatureStoreBiomeEvent.event(with:dataVersion:)(uint64_t a1, uint64_t a2, int a3)
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_20_0();
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();
  uint64_t v5 = (_DWORD *)(v7 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion);
  swift_beginAccess();
  _DWORD *v5 = a3;
  return v7;
}

uint64_t FeatureStoreBiomeEvent.serialize()()
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_20_0();
  uint64_t v1 = type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_4();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  type metadata accessor for FeatureStoreBiomeEvent();
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent);
  uint64_t v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v2;
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional __swiftcall FeatureStoreBiomeEvent.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FeatureStoreBiomeEvent.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)4;
  }
  else {
    return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)v3;
  }
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional __swiftcall FeatureStoreBiomeEvent.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)4;
}

uint64_t FeatureStoreBiomeEvent.CodingKeys.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_12_3();
      break;
    case 2:
      uint64_t result = 0x7372655661746164;
      break;
    case 3:
      return result;
    default:
      uint64_t result = OUTLINED_FUNCTION_4_7();
      break;
  }
  return result;
}

uint64_t FeatureStoreBiomeEvent.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_12_3();
      break;
    case 2:
      uint64_t result = 0x7372655661746164;
      break;
    case 3:
      return result;
    default:
      uint64_t result = OUTLINED_FUNCTION_4_7();
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance FeatureStoreBiomeEvent.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000021D963820;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x65727574616566;
      break;
    case 2:
      unint64_t v5 = 0x7372655661746164;
      unint64_t v3 = 0xEB000000006E6F69;
      break;
    case 3:
      break;
    default:
      unint64_t v5 = 0x7463617265746E69;
      unint64_t v3 = 0xED000064496E6F69;
      break;
  }
  unint64_t v6 = 0x800000021D963820;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v2 = 0x65727574616566;
      break;
    case 2:
      unint64_t v2 = 0x7372655661746164;
      unint64_t v6 = 0xEB000000006E6F69;
      break;
    case 3:
      break;
    default:
      unint64_t v2 = 0x7463617265746E69;
      unint64_t v6 = 0xED000064496E6F69;
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional protocol witness for RawRepresentable.init(rawValue:) in conformance FeatureStoreBiomeEvent.CodingKeys@<W0>(Swift::String *a1@<X0>, FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional *a2@<X8>)
{
  result.value = FeatureStoreBiomeEvent.CodingKeys.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = FeatureStoreBiomeEvent.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  return FeatureStoreBiomeEvent.CodingKeys.stringValue.getter(*v0);
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance FeatureStoreBiomeEvent.CodingKeys@<W0>(uint64_t a1@<X0>, FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional *a2@<X8>)
{
  result.value = FeatureStoreBiomeEvent.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance FeatureStoreBiomeEvent.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B0](v0);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  uint64_t v0 = OUTLINED_FUNCTION_2_7();

  return MEMORY[0x270FA00B8](v0);
}

void FeatureStoreBiomeEvent.encode(to:)()
{
  OUTLINED_FUNCTION_26();
  uint64_t v57 = v1;
  unint64_t v3 = v0;
  unint64_t v5 = v4;
  v59[2] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  uint64_t v55 = v6;
  uint64_t v56 = v7;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_33_0();
  uint64_t v54 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = type metadata accessor for LogSignpost();
  MEMORY[0x270FA5388](v12 - 8);
  OUTLINED_FUNCTION_11();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for KeyedEncodingContainer<FeatureStoreBiomeEvent.CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_4();
  uint64_t v19 = v18 - v17;
  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v59[0]) = 0;
  uint64_t v20 = v57;
  uint64_t v21 = KeyedEncodingContainer.encode(_:forKey:)();
  if (v20)
  {
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  }
  else
  {
    uint64_t v22 = v56;
    uint64_t v53 = v2;
    uint64_t v57 = v15;
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x90))(v21);
    LOBYTE(v59[0]) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v23 = v3;
    uint64_t v24 = OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy;
    LOBYTE(v59[0]) = v3[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy];
    char v58 = 3;
    lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v51 = v19;
    uint64_t v52 = v13;
    uint64_t v25 = 0;
    uint64_t v26 = v55;
    switch(v23[v24])
    {
      case 1:
        goto LABEL_8;
      case 2:
        uint64_t v25 = 1;
        goto LABEL_8;
      case 3:
        uint64_t v25 = 2;
        goto LABEL_8;
      case 4:
        uint64_t v25 = 3;
LABEL_8:
        default argument 0 of static LogSignpost.begin(logger:_:)((uint64_t)v11);
        uint64_t v31 = v53;
        static LogSignpost.begin(logger:_:)((uint64_t)v11, "BiomeEncodeCompress", 19, 2u, v53);
        Class isa = (void (*)(char *, uint64_t))v22[1].isa;
        uint64_t v50 = v22 + 1;
        isa(v11, v26);
        uint64_t v48 = *(void *)&v23[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData + 8];
        Class v32 = Data._bridgeToObjectiveC()().super.isa;
        v59[0] = 0;
        id v33 = [(objc_class *)v32 compressedDataUsingAlgorithm:v25 error:v59];

        id v34 = v59[0];
        if (v33)
        {
          uint64_t v35 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v27 = v36;

          outlined copy of Data._Representation(v35, (unint64_t)v27);
          uint64_t v37 = Logger.accessor.unsafeMutableAddressor();
          long long v38 = v54;
          ((void (*)(char *, uint64_t, uint64_t))v22[2].isa)(v54, v37, v26);
          outlined copy of Data._Representation(v35, (unint64_t)v27);
          uint64_t v39 = v23;
          uint64_t v40 = Logger.logObject.getter();
          os_log_type_t v41 = static os_log_type_t.debug.getter();
          uint64_t v56 = v40;
          if (os_log_type_enabled(v40, v41))
          {
            os_log_type_t v42 = v39;
            uint64_t v43 = swift_slowAlloc();
            *(_DWORD *)uint64_t v43 = 134218240;
            v59[0] = (id)Data.count.getter();
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            *(_WORD *)(v43 + 12) = 2048;
            uint64_t v44 = (void *)Data.count.getter();
            OUTLINED_FUNCTION_31_0();
            v59[0] = v44;
            long long v38 = v54;
            uint64_t v26 = v55;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v28 = (void *)v35;
            OUTLINED_FUNCTION_31_0();
            _os_log_impl(&dword_21D935000, v56, v41, "Compressed data of size %ld to a data of size %ld", (uint8_t *)v43, 0x16u);
            MEMORY[0x223C0E840](v43, -1, -1);
          }
          else
          {
            OUTLINED_FUNCTION_31_0();

            uint64_t v28 = (void *)v35;
            OUTLINED_FUNCTION_31_0();
          }
          uint64_t v29 = v57;
          uint64_t v30 = v52;
          uint64_t v46 = v53;

          isa(v38, v26);
          LogSignpost.end()();
          outlined destroy of LogSignpost(v46);
LABEL_14:
          v59[0] = v28;
          v59[1] = v27;
          char v58 = 1;
          lazy protocol witness table accessor for type Data and conformance Data();
          uint64_t v47 = v51;
          KeyedEncodingContainer.encode<A>(_:forKey:)();
          outlined consume of Data._Representation((uint64_t)v28, (unint64_t)v27);
          (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v47, v30);
        }
        else
        {
          uint64_t v45 = v34;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          outlined destroy of LogSignpost(v31);
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v51, v52);
        }
        break;
      default:
        uint64_t v27 = *(void **)&v23[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData + 8];
        uint64_t v28 = *(void **)&v23[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];
        outlined copy of Data._Representation((uint64_t)v28, (unint64_t)v27);
        uint64_t v29 = v57;
        uint64_t v30 = v52;
        goto LABEL_14;
    }
  }
  OUTLINED_FUNCTION_28_0();
}

void FeatureStoreBiomeEvent.__allocating_init(from:)()
{
  id v1 = objc_allocWithZone(v0);
  FeatureStoreBiomeEvent.init(from:)();
}

void FeatureStoreBiomeEvent.init(from:)()
{
  OUTLINED_FUNCTION_26();
  uint64_t v4 = v3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_25();
  uint64_t v6 = type metadata accessor for LogSignpost();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_18_1(v7, v33);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FeatureStoreBiomeEvent.CodingKeys>);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_1();
  uint64_t v37 = (uint64_t)v4;
  __swift_project_boxed_opaque_existential_1Tm(v4, v4[3]);
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  uint64_t v9 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0(v37);

LABEL_4:
    type metadata accessor for FeatureStoreBiomeEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v38 = v0;
    OUTLINED_FUNCTION_32_0();
    uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v11 = (uint64_t *)&v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
    uint64_t *v11 = v10;
    v11[1] = v12;
    LOBYTE(v41) = 2;
    OUTLINED_FUNCTION_32_0();
    uint64_t v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    if ((v13 & 0x100000000) != 0) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    *(_DWORD *)&v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion] = v14;
    char v40 = 3;
    lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy();
    OUTLINED_FUNCTION_15_2();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    char v15 = (char)v41;
    if (v41 == 5) {
      char v15 = 0;
    }
    uint64_t v16 = OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy;
    v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = v15;
    char v40 = 1;
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_15_2();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    unint64_t v19 = v42;
    uint64_t v20 = 0;
    switch(v9[v16])
    {
      case 1:
        goto LABEL_16;
      case 2:
        uint64_t v20 = 1;
        goto LABEL_16;
      case 3:
        uint64_t v20 = 2;
        goto LABEL_16;
      case 4:
        uint64_t v20 = 3;
LABEL_16:
        uint64_t v34 = v20;
        unint64_t v35 = v42;
        uint64_t v22 = (uint64_t)v41;
        default argument 0 of static LogSignpost.begin(logger:_:)(v38);
        static LogSignpost.begin(logger:_:)(v38, "BiomeDecodeDecompress", 21, 2u, v36);
        OUTLINED_FUNCTION_7_1();
        v23();
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        id v41 = 0;
        id v25 = [(objc_class *)isa decompressedDataUsingAlgorithm:v34 error:&v41];

        id v26 = v41;
        if (!v25)
        {
          Class v32 = v26;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          outlined consume of Data._Representation(v22, v35);
          outlined destroy of LogSignpost(v36);
          uint64_t v17 = OUTLINED_FUNCTION_34_0();
          v18(v17);
          __swift_destroy_boxed_opaque_existential_0(v37);

          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v29 = v28;

        uint64_t v30 = (uint64_t *)&v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];
        *uint64_t v30 = v27;
        v30[1] = v29;
        LogSignpost.end()();
        outlined destroy of LogSignpost(v36);
        outlined consume of Data._Representation(v22, v35);
LABEL_18:
        OUTLINED_FUNCTION_7_1();
        v31();
        *(void *)&v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp] = 0x7FF0000000000000;

        v39.receiver = v9;
        v39.super_class = (Class)type metadata accessor for FeatureStoreBiomeEvent();
        objc_msgSendSuper2(&v39, sel_init);
        __swift_destroy_boxed_opaque_existential_0(v37);
        break;
      default:
        uint64_t v21 = &v9[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];
        *(void *)uint64_t v21 = v41;
        *((void *)v21 + 1) = v19;
        goto LABEL_18;
    }
  }
  OUTLINED_FUNCTION_28_0();
}

id FeatureStoreBiomeEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void FeatureStoreBiomeEvent.init()()
{
}

id FeatureStoreBiomeEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreBiomeEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FeatureStoreBiomeEvent@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_29();
  uint64_t result = v3();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FeatureStoreBiomeEvent()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xD0))();
}

uint64_t protocol witness for FeatureMetadata.interactionId.getter in conformance FeatureStoreBiomeEvent()
{
  return FeatureStoreBiomeEvent.interactionId.getter();
}

uint64_t protocol witness for FeatureMetadata.timestamp.getter in conformance FeatureStoreBiomeEvent()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x78))();
}

uint64_t specialized ArraySlice.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FeatureStoreBiomeEvent()
{
  return self;
}

uint64_t lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FeatureStoreBiomeEvent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy()
{
  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

void type metadata accessor for CompressionPolicy()
{
}

uint64_t method lookup function for FeatureStoreBiomeEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeatureStoreBiomeEvent);
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.dataVersion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.serialize()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_29();
  return v0();
}

uint64_t getEnumTagSinglePayload for FeatureStoreBiomeEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeatureStoreBiomeEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x21D95B5A4);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for FeatureStoreBiomeEvent.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for FeatureStoreBiomeEvent.CodingKeys(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for FeatureStoreBiomeEvent.CodingKeys()
{
}

uint64_t getEnumTagSinglePayload for CompressionPolicy(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CompressionPolicy(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x21D95B73CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for CompressionPolicy.CodingKeys()
{
}

void type metadata accessor for CompressionPolicy.DoNotCompressCodingKeys()
{
}

void type metadata accessor for CompressionPolicy.LzfseCodingKeys()
{
}

void type metadata accessor for CompressionPolicy.Lz4CodingKeys()
{
}

void type metadata accessor for CompressionPolicy.LzmaCodingKeys()
{
}

void type metadata accessor for CompressionPolicy.ZlibCodingKeys()
{
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return 0x7463617265746E69;
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_6_2(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return 0x65727574616566;
}

BOOL OUTLINED_FUNCTION_14_1(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return v0;
}

void OUTLINED_FUNCTION_18_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_19_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return outlined consume of Data._Representation(v0, v1);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return v0;
}

id OUTLINED_FUNCTION_35_0(float a1)
{
  *uint64_t v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

void OUTLINED_FUNCTION_37(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_38(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t static JSONCoder.encode(codable:)()
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_4();
  uint64_t v1 = type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_4();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  uint64_t v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v2;
}

uint64_t static JSONCoder.decode(data:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_4();
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();

  return __swift_storeEnumTagSinglePayload(a2, 0, 1, a1);
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance JSONCoder<A>()
{
  return static JSONCoder.encode(codable:)();
}

uint64_t protocol witness for static Coder.decode(data:) in conformance JSONCoder<A>@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return static JSONCoder.decode(data:)(*(void *)(a1 + 16), a2);
}

uint64_t type metadata accessor for JSONCoder()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_3_8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

id INIntent.fsf_serialize()()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)INSJSONEncodedIntent();
  if (result)
  {
    os_log_type_t v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    static String.Encoding.utf8.getter();
    uint64_t v6 = String.data(using:allowLossyConversion:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static INIntent.fsf_deserialize(from:)()
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v1 = (id)INIntentCreate();

  return v1;
}

id protocol witness for Serializable.fsf_serialize() in conformance INIntent()
{
  return INIntent.fsf_serialize()();
}

id protocol witness for static Serializable.fsf_deserialize(from:) in conformance INIntent@<X0>(void *a1@<X8>)
{
  id result = static INIntent.fsf_deserialize(from:)();
  *a1 = result;
  return result;
}

uint64_t static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0_3();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a3;
  v14[4] = a1;
  v14[5] = a2;
  id v15 = a3;
  swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v13, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:), (uint64_t)v14, 0, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v4);
}

uint64_t closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0_3();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static NSCodingCoder.encode(codable:)(a1);
  if (v13 >> 60 == 15)
  {
    uint64_t v14 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v14, v3);
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21D935000, v15, v16, "Could not encode the item. Skipping insertion.", v17, 2u);
      MEMORY[0x223C0E840](v17, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v3);
  }
  else
  {
    uint64_t v19 = v12;
    unint64_t v20 = v13;
    v25[1] = swift_getObjectType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    type metadata accessor for FeatureStoreStreamAccessor();
    uint64_t v21 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v19, v20);
    int v22 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    double v23 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    id v24 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(a2, a3, v19, v20, v22, v23);
    (*(void (**)(void))(*(void *)v21 + 104))();
    swift_release();

    return outlined consume of Data?(v19, v20);
  }
}

uint64_t sub_21D95C938()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)()
{
  return closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(v0[3], v0[4], v0[5]);
}

void static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1_9();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_0_7(v3);
  OUTLINED_FUNCTION_0_7((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21D9610A0;
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  id v12 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(v3, (uint64_t)v10, v11);
  uint64_t v13 = static FeatureStoreService.retrieveNSCoding<A>(query:)();

  if (!v4)
  {
    uint64_t v20 = v13;
    type metadata accessor for Array();
    swift_getWitnessTable();
    Collection.first.getter();
    swift_bridgeObjectRelease();
    if (!v18)
    {
      unint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      unint64_t v18 = 0xD000000000000028;
      unint64_t v19 = 0x800000021D9635B0;
      v14._countAndFlagsBits = a1;
      v14._object = a2;
      String.append(_:)(v14);
      unint64_t v15 = v18;
      unint64_t v16 = v19;
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      swift_allocError();
      *(void *)uint64_t v17 = v15;
      *(void *)(v17 + 8) = v16;
      *(unsigned char *)(v17 + 16) = 0;
      swift_willThrow();
    }
  }
}

uint64_t static FeatureStoreService.retrieveNSCoding<A>(query:)()
{
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for FeatureStoreStreamAccessor();
  uint64_t v5 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 112))(a1);
  if (v2) {
    return swift_release();
  }
  MEMORY[0x270FA5388](v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
  lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
  uint64_t v8 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)(*(void *)(v1 + 24), a1);
}

uint64_t static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)()
{
  type metadata accessor for InteractionWrapper();
  uint64_t v1 = type metadata accessor for Array();
  uint64_t result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:), v1, (uint64_t)&v3);
  if (!v0) {
    return v3;
  }
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *(void **)(v1 + 24);
  swift_getMetatypeMetadata();
  uint64_t v5 = String.init<A>(describing:)();
  uint64_t v7 = v6;
  type metadata accessor for FeatureStoreNSCodingAccessor();
  id v8 = FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v5, v7);
  uint64_t v9 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0xA0);
  uint64_t v10 = *(void *)(v9() + 16);
  uint64_t v11 = swift_bridgeObjectRelease();
  if (v10 != 1) {
    goto LABEL_6;
  }
  id v12 = (void *)((uint64_t (*)(uint64_t))v9)(v11);
  if (!v12[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(void *)uint64_t v17 = 0xD000000000000075;
    *(void *)(v17 + 8) = 0x800000021D9635E0;
    *(unsigned char *)(v17 + 16) = 0;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v13 = v12[4];
  uint64_t v14 = v12[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 136))(v13, v14);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if (!v2) {
    *a1 = v15;
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static NSCodingCoder.decode(data:)();
  *a1 = result;
  return result;
}

BOOL static FeatureStoreService.EventStreamState.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void FeatureStoreService.EventStreamState.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int FeatureStoreService.EventStreamState.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FeatureStoreService.EventStreamState(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static FeatureStoreService.EventStreamState.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FeatureStoreService.EventStreamState()
{
  return FeatureStoreService.EventStreamState.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance FeatureStoreService.EventStreamState(uint64_t a1)
{
  FeatureStoreService.EventStreamState.hash(into:)(a1, *v1);
}

unint64_t one-time initialization function for timers()
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t result = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  static FeatureStoreService.timers = result;
  return result;
}

uint64_t *FeatureStoreService.timers.unsafeMutableAddressor()
{
  if (one-time initialization token for timers != -1) {
    swift_once();
  }
  return &static FeatureStoreService.timers;
}

uint64_t static FeatureStoreService.timers.getter()
{
  if (one-time initialization token for timers != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static FeatureStoreService.timers.setter(uint64_t a1)
{
  if (one-time initialization token for timers != -1) {
    swift_once();
  }
  swift_beginAccess();
  static FeatureStoreService.timers = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FeatureStoreService.timers.modify())()
{
  if (one-time initialization token for timers != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

uint64_t static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = v3;
  default argument 1 of AsyncStream.init(_:bufferingPolicy:_:)((uint64_t)&v10[-v8]);
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  OUTLINED_FUNCTION_7();
  uint64_t v48 = v1;
  uint64_t v49 = v0;
  uint64_t v46 = v2;
  uint64_t v47 = v3;
  uint64_t v50 = v4;
  type metadata accessor for AsyncStream.Continuation();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v6;
  uint64_t v45 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)v41 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  v41[0] = (char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  unint64_t v19 = (char *)v41 - v18;
  v41[1] = (char *)v41 - v18;
  static Date.now.getter();
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = 0;
  type metadata accessor for NSTimer();
  id v20 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v21 = type metadata accessor for NSRunLoop.SchedulerOptions();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v21);
  uint64_t v22 = static NSTimer.publish(every:tolerance:on:in:options:)();

  outlined destroy of NSRunLoop.SchedulerOptions?((uint64_t)v10);
  uint64_t v51 = v22;
  type metadata accessor for NSTimer.TimerPublisher();
  lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(&lazy protocol witness table cache variable for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher, MEMORY[0x263F07CE8]);
  uint64_t v23 = ConnectablePublisher.autoconnect()();
  swift_release();
  uint64_t v51 = v23;
  uint64_t v24 = v13;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v11);
  id v26 = v43;
  uint64_t v25 = v44;
  uint64_t v27 = v45;
  OUTLINED_FUNCTION_1_14();
  v28();
  unint64_t v29 = (*(unsigned __int8 *)(v24 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  unint64_t v30 = (v15 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (*(unsigned __int8 *)(v25 + 80) + v31 + 8) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = OUTLINED_FUNCTION_6_3(v33);
  *(void *)(v34 + 32) = v35;
  (*(void (**)(unint64_t, void, uint64_t))(v24 + 32))(v34 + v29, v41[0], v11);
  *(void *)(v33 + v30) = v46;
  *(void *)(v33 + v31) = v42;
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v33 + v32, v26, v27);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Autoconnect<NSTimer.TimerPublisher>);
  lazy protocol witness table accessor for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>();
  uint64_t v36 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = OUTLINED_FUNCTION_6_3(v37);
  *(void *)(v38 + 32) = v39;
  *(void *)(v38 + 40) = v36;
  AsyncStream.Continuation.onTermination.setter();
  OUTLINED_FUNCTION_7_3();
  v40();
  swift_release();
  OUTLINED_FUNCTION_10();
}

void partial apply for closure #1 in static FeatureStoreService.streamEvents<A>()()
{
}

void closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  OUTLINED_FUNCTION_7();
  os_log_type_t v73 = v1;
  uint64_t v74 = v2;
  uint64_t v4 = v3;
  uint64_t v69 = v5;
  uint64_t v65 = v6;
  unint64_t v71 = v7;
  uint64_t v72 = v8;
  uint64_t v75 = (uint64_t *)type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v67 = v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v68 = type metadata accessor for AsyncStream.Continuation.YieldResult();
  OUTLINED_FUNCTION_0();
  uint64_t v59 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v57 - v13;
  OUTLINED_FUNCTION_0();
  uint64_t v66 = v15;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v64 = (char *)&v57 - v20;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v62 = type metadata accessor for Optional();
  OUTLINED_FUNCTION_0();
  uint64_t v61 = v21;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v70 = (char *)&v57 - v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v27 - 8);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x270FA5388](v28);
  unint64_t v30 = (char *)&v57 - v29;
  type metadata accessor for StreamQuery();
  uint64_t v31 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 1, 1, v31);
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v31);
  uint64_t v32 = variable initialization expression of StreamQuery.interactionIds();
  uint64_t v33 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v30, v0, v32);
  (*(void (**)(char *, void (**)(char *, uint64_t), uint64_t))(*(void *)(v31 - 8) + 16))(v30, v71, v31);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v31);
  (*(void (**)(char *))((*MEMORY[0x263F8EED0] & *v33) + 0x78))(v30);
  uint64_t v34 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v33, v4, (uint64_t)v73, v74);
  uint64_t v67 = v14;
  id v60 = v33;
  uint64_t v35 = (uint64_t *)(v65 + 2);
  uint64_t v58 = v34;
  v76[4] = v34;
  uint64_t v36 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x223C0D890](v76, v36, WitnessTable);
  v76[3] = v76[0];
  type metadata accessor for EnumeratedSequence();
  EnumeratedSequence.makeIterator()();
  uint64_t v75 = v35;
  swift_beginAccess();
  uint64_t v74 = type metadata accessor for EnumeratedSequence.Iterator();
  EnumeratedSequence.Iterator.next()();
  uint64_t v38 = v61 + 32;
  uint64_t v39 = (uint64_t *)v70;
  uint64_t v40 = v62;
  os_log_type_t v73 = *(void (**)(char *, char *, uint64_t))(v61 + 32);
  v73(v70, v25, v62);
  uint64_t v41 = TupleTypeMetadata2;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v39, 1, TupleTypeMetadata2);
  uint64_t v43 = v64;
  if (EnumTagSinglePayload != 1)
  {
    uint64_t v44 = v66 + 4;
    uint64_t v72 = v66[4];
    v66 += 2;
    uint64_t v65 = (void (**)(char *, uint64_t))(v59 + 8);
    unint64_t v71 = (void (**)(char *, uint64_t))(v44 - 3);
    do
    {
      uint64_t v45 = *v39;
      v72(v43, (char *)v39 + *(int *)(v41 + 48), v4);
      if (v45 >= *v75)
      {
        (*v66)(v19, v43, v4);
        type metadata accessor for AsyncStream.Continuation();
        uint64_t v46 = v25;
        uint64_t v47 = v38;
        uint64_t v48 = v40;
        uint64_t v49 = v41;
        uint64_t v50 = v4;
        uint64_t v51 = v43;
        uint64_t v52 = v44;
        uint64_t v53 = v67;
        AsyncStream.Continuation.yield(_:)();
        uint64_t v54 = v53;
        uint64_t v44 = v52;
        uint64_t v43 = v51;
        uint64_t v4 = v50;
        uint64_t v41 = v49;
        uint64_t v40 = v48;
        uint64_t v38 = v47;
        uint64_t v25 = v46;
        uint64_t v39 = (uint64_t *)v70;
        (*v65)(v54, v68);
      }
      (*v71)(v43, v4);
      EnumeratedSequence.Iterator.next()();
      v73((char *)v39, v25, v40);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v41) != 1);
  }
  swift_bridgeObjectRelease();
  uint64_t v55 = MEMORY[0x223C0D920](v58, v4);
  swift_bridgeObjectRelease();

  uint64_t v56 = v75;
  swift_beginAccess();
  *uint64_t v56 = v55;
  OUTLINED_FUNCTION_10();
}

void closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  OUTLINED_FUNCTION_7();
  a19 = v20;
  a20 = v21;
  uint64_t v23 = v22;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_2_8();
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  MEMORY[0x270FA5388](v26);
  uint64_t v27 = type metadata accessor for AsyncStream.Continuation.Termination();
  OUTLINED_FUNCTION_0();
  uint64_t v29 = v28;
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&a9 - v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))((char *)&a9 - v31, v23, v27);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v29 + 88))(v32, v27);
  if (v33 == *MEMORY[0x263F8F540])
  {
    Logger.service.unsafeMutableAddressor();
    OUTLINED_FUNCTION_1_14();
    v34();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_21D935000, v35, v36, "Stream finished.", v37, 2u);
      OUTLINED_FUNCTION_8();
    }
LABEL_8:

    OUTLINED_FUNCTION_7_3();
    v43();
    goto LABEL_12;
  }
  int v38 = v33;
  int v39 = *MEMORY[0x263F8F548];
  Logger.service.unsafeMutableAddressor();
  if (v38 == v39)
  {
    OUTLINED_FUNCTION_1_14();
    v40();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_21D935000, v35, v41, "Stream cancelled.", v42, 2u);
      OUTLINED_FUNCTION_8();
    }
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_1_14();
  v44();
  uint64_t v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_21D935000, v45, v46, "Unknown termination condition!", v47, 2u);
    OUTLINED_FUNCTION_8();
  }

  OUTLINED_FUNCTION_7_3();
  v48();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v27);
LABEL_12:
  AnyCancellable.cancel()();
  OUTLINED_FUNCTION_10();
}

uint64_t default argument 1 of AsyncStream.init(_:bufferingPolicy:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F580];
  uint64_t v3 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

unint64_t lazy protocol witness table accessor for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState()
{
  unint64_t result = lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState;
  if (!lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureStoreService.EventStreamState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeatureStoreService.EventStreamState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21D95E5ECLL);
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

unsigned char *destructiveInjectEnumTag for FeatureStoreService.EventStreamState(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureStoreService.EventStreamState()
{
  return &type metadata for FeatureStoreService.EventStreamState;
}

uint64_t sub_21D95E630()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t type metadata accessor for NSTimer()
{
  unint64_t result = lazy cache variable for type metadata for NSTimer;
  if (!lazy cache variable for type metadata for NSTimer)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSTimer);
  }
  return result;
}

uint64_t outlined destroy of NSRunLoop.SchedulerOptions?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21D95E6E0()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = type metadata accessor for Date();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  type metadata accessor for AsyncStream.Continuation();
  OUTLINED_FUNCTION_0();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v1);
  swift_release();
  OUTLINED_FUNCTION_7_3();
  v5();
  OUTLINED_FUNCTION_10();
  return MEMORY[0x270FA0238](v6, v7, v8);
}

void partial apply for closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  type metadata accessor for Date();
  type metadata accessor for AsyncStream.Continuation();

  closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()();
}

unint64_t lazy protocol witness table accessor for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>;
  if (!lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Publishers.Autoconnect<NSTimer.TimerPublisher>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>);
  }
  return result;
}

uint64_t sub_21D95E95C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void partial apply for closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(a1, *(void *)(v20 + 40), *(void *)(v20 + 16), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

unint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyCancellable>);
    unint64_t result = static _SetStorage.allocate(capacity:)();
    unint64_t v3 = result;
    goto LABEL_6;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_25;
    }
  }
  unint64_t v6 = 0;
  unint64_t v7 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v18 = v1 + 32;
  uint64_t v19 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v20 = v1;
  while (1)
  {
    if (v21)
    {
      unint64_t result = MEMORY[0x223C0DCA0](v6, v1);
      unint64_t v8 = result;
    }
    else
    {
      if (v6 >= *(void *)(v19 + 16)) {
        goto LABEL_28;
      }
      unint64_t v8 = *(void *)(v18 + 8 * v6);
      unint64_t result = swift_retain();
    }
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      break;
    }
    type metadata accessor for AnyCancellable();
    lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, MEMORY[0x263EFDD18]);
    unint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v11 = result & ~v10;
    unint64_t v12 = v11 >> 6;
    uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
    uint64_t v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      uint64_t v15 = ~v10;
      lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher((unint64_t *)&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, MEMORY[0x263EFDD18]);
      while (1)
      {
        unint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v11 = (v11 + 1) & v15;
        unint64_t v12 = v11 >> 6;
        uint64_t v13 = *(void *)(v7 + 8 * (v11 >> 6));
        uint64_t v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          unint64_t v1 = v20;
          goto LABEL_21;
        }
      }
      unint64_t result = swift_release();
      unint64_t v1 = v20;
    }
    else
    {
LABEL_21:
      *(void *)(v7 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v8;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v9 = __OFADD__(v16, 1);
      uint64_t v17 = v16 + 1;
      if (v9) {
        goto LABEL_27;
      }
      *(void *)(v3 + 16) = v17;
    }
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_6_3(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 - 104);
  *(void *)(result + 16) = *(void *)(v1 - 120);
  *(void *)(result + 24) = v2;
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x270EF0020]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x270EF02C8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
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

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t PublisherProtocol.sink(completion:receiveInput:)()
{
  return MEMORY[0x270F10B28]();
}

uint64_t PublisherProtocol.filter(isIncluded:)()
{
  return MEMORY[0x270F10B38]();
}

uint64_t BookmarkablePublisher.init(_:)()
{
  return MEMORY[0x270F10B58]();
}

uint64_t Streams.StoreStream.inner.getter()
{
  return MEMORY[0x270F10B88]();
}

uint64_t type metadata accessor for Streams.StoreStream()
{
  return MEMORY[0x270F10B90]();
}

uint64_t Streams.StoreStream.init(_:storeConfig:)()
{
  return MEMORY[0x270F10B98]();
}

uint64_t StoreStreamProtocol.source()()
{
  return MEMORY[0x270F10BE0]();
}

uint64_t OrderedEvent.innerType.getter()
{
  return MEMORY[0x270F08568]();
}

uint64_t OrderedEvent.outerType.getter()
{
  return MEMORY[0x270F08570]();
}

uint64_t type metadata accessor for OrderedEvent()
{
  return MEMORY[0x270F66188]();
}

uint64_t ComponentIdentifier.componentName.getter()
{
  return MEMORY[0x270F661C8]();
}

uint64_t dispatch thunk of ComponentIdentifier.uuid.getter()
{
  return MEMORY[0x270F661E0]();
}

uint64_t type metadata accessor for ComponentIdentifier()
{
  return MEMORY[0x270F661E8]();
}

uint64_t dispatch thunk of InstrumentationStreamsProviderProtocol.filter.getter()
{
  return MEMORY[0x270F08580]();
}

uint64_t type metadata accessor for InstrumentationStreamsFactory()
{
  return MEMORY[0x270F085B0]();
}

uint64_t dispatch thunk of EventGraph.componentIdentifiers.getter()
{
  return MEMORY[0x270F085B8]();
}

uint64_t dispatch thunk of EventGraph.events()()
{
  return MEMORY[0x270F085E0]();
}

uint64_t EventGraph.timestamp.getter()
{
  return MEMORY[0x270F085E8]();
}

uint64_t dispatch thunk of EventFilter.isAllowed(_:)()
{
  return MEMORY[0x270F08610]();
}

uint64_t dispatch thunk of SiriTurn.turnId.getter()
{
  return MEMORY[0x270F08640]();
}

uint64_t type metadata accessor for SiriTurn()
{
  return MEMORY[0x270F08648]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x270FA2DF0]();
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

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t DispatchQoS.QoSClass.init(rawValue:)()
{
  return MEMORY[0x270FA09B8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1830]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
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

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.Termination()
{
  return MEMORY[0x270FA1F20]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x270FA1F90]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1C18]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
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

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x270EF1F60]();
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

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t SISchemaComponentName.description.getter()
{
  return MEMORY[0x270F66260]();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return MEMORY[0x270EF2150]();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return MEMORY[0x270EF2160]();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return MEMORY[0x270EF2310]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x270F9E890]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x270F9F048]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x270F9F050]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F490]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
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

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t INIntentCreate()
{
  return MEMORY[0x270EF51E0]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x270EF51F8]();
}

uint64_t INSJSONEncodedIntent()
{
  return MEMORY[0x270F44640]();
}

uint64_t INSJSONEncodedIntentResponse()
{
  return MEMORY[0x270F44648]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
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

uint64_t __user_local_dirname()
{
  return MEMORY[0x270ED7F30]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x270EDB3E0](*(void *)&a1);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}