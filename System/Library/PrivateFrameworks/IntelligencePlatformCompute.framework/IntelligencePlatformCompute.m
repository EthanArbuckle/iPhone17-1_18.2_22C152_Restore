void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = protocol witness for ViewUpdateGenerationRunner.update(viewName:requests:) in conformance ComputeOrchestration.ViewRunner;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.update(viewName:requests:), 0, 0);
}

uint64_t @objc ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    v14 = 0;
  }
  swift_retain();
  static ViewOrchestrationSystem.sourceUpdater(config:)();
  v15._countAndFlagsBits = specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(v9, v11, v12, v14);
  ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(v15, a6 & 1);
  if (v16)
  {
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a5)
    {
      v17 = (void *)_convertErrorToNSError(_:)();

      id v18 = v17;
      uint64_t result = 0;
      *a5 = v17;
    }
    else
    {

      return 0;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a1;
  if (a4)
  {
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = 0x7365746F6D65723ALL;
    v7._object = (void *)0xE90000000000003ALL;
    String.append(_:)(v7);
    v8._countAndFlagsBits = a3;
    v8._object = a4;
    String.append(_:)(v8);
    return a1;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)()
{
  uint64_t v1 = *(void **)(v0[6] + 16);
  v2 = (void *)MEMORY[0x25A2718B0](v0[3], v0[4]);
  type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateSourceRequest);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[2] = 0;
  id v4 = objc_msgSend(v1, sel_updateViewWithName_viewUpdateSourceRequests_error_, v2, isa, v0 + 2);

  v5 = (void *)v0[2];
  if (v4)
  {
    type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateSourceResponse);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v7 = v5;

    Swift::String v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v6);
  }
  else
  {
    id v10 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t type metadata accessor for GDViewUpdateSourceRequest(uint64_t a1, unint64_t *a2)
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

void sub_253E96B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

id GDCLog()
{
  if (GDCLog_onceToken != -1) {
    dispatch_once(&GDCLog_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)GDCLog_log;

  return v0;
}

void sub_253E96C40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_253E96D88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

uint64_t ComputeOrchestration.ViewRunner.update(viewName:requests:)()
{
  return ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)();
}

void sub_253E973CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_253E97748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_253E97A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_253E97CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t __GDCLog_block_invoke()
{
  GDCLog_log = (uint64_t)os_log_create("com.apple.intelligenceplatform.IntelligencePlatformCompute", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t ComputeOrchestration.ViewRunner.update(viewName:requests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.update(viewName:requests:), 0, 0);
}

uint64_t ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:), 0, 0);
}

uint64_t ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:)()
{
  uint64_t v1 = *(void **)(v0[6] + 16);
  uint64_t v2 = (void *)MEMORY[0x25A2718B0](v0[3], v0[4]);
  type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateNameAndRequests);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v0[2] = 0;
  id v4 = objc_msgSend(v1, sel_updateGroupWithName_namesAndRequests_error_, v2, isa, v0 + 2);

  v5 = (void *)v0[2];
  if (v4)
  {
    type metadata accessor for GDViewUpdateSourceRequest(0, &lazy cache variable for type metadata for GDViewUpdateNameAndResponses);
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v7 = v5;

    Swift::String v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v6);
  }
  else
  {
    id v10 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.fullRebuild(viewName:requests:), 0, 0);
}

uint64_t ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = v3;
  *(unsigned char *)(v4 + 48) = a3;
  *(void *)(v4 + 24) = a1;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:), 0, 0);
}

uint64_t ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:)()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v2 = *(void **)(*(void *)(v0 + 40) + 16);
  uint64_t v3 = (void *)MEMORY[0x25A2718B0](*(void *)(v0 + 24), *(void *)(v0 + 32));
  *(void *)(v0 + 16) = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_clearViewWithName_fullRebuild_error_, v3, v1, v0 + 16);

  uint64_t v4 = *(void **)(v0 + 16);
  if (v2)
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    id v5 = v4;
    uint64_t v6 = v9;
  }
  else
  {
    id v7 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:)(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = v3;
  *(unsigned char *)(v4 + 48) = a3;
  *(void *)(v4 + 24) = a1;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:), 0, 0);
}

uint64_t ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:)()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v2 = *(void **)(*(void *)(v0 + 40) + 16);
  uint64_t v3 = (void *)MEMORY[0x25A2718B0](*(void *)(v0 + 24), *(void *)(v0 + 32));
  *(void *)(v0 + 16) = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_truncateViewWithName_fullRebuild_error_, v3, v1, v0 + 16);

  uint64_t v4 = *(void **)(v0 + 16);
  if (v2)
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    id v5 = v4;
    uint64_t v6 = v9;
  }
  else
  {
    id v7 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t ComputeOrchestration.ViewRunner.stop()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.stop(), 0, 0);
}

{
  void *v0;
  void *v1;
  unsigned int v2;
  void *v3;
  id v4;
  uint64_t (*v5)(void);
  id v6;
  uint64_t (*v8)(void);
  uint64_t v9;

  uint64_t v1 = *(void **)(v0[3] + 16);
  v0[2] = 0;
  uint64_t v2 = objc_msgSend(v1, sel_stopWithError_, v0 + 2);
  uint64_t v3 = (void *)v0[2];
  if (v2)
  {
    Swift::String v8 = (uint64_t (*)(void))v0[1];
    uint64_t v4 = v3;
    id v5 = v8;
  }
  else
  {
    uint64_t v6 = v3;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    id v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t ComputeOrchestration.ViewRunner.deinit()
{
  return v0;
}

uint64_t ComputeOrchestration.ViewRunner.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.update(groupName:namesAndRequests:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = protocol witness for ViewUpdateGenerationRunner.update(groupName:namesAndRequests:) in conformance ComputeOrchestration.ViewRunner;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.update(groupName:namesAndRequests:), 0, 0);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.clear(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *(void *)uint64_t v9 = v4;
  *(void *)(v9 + 8) = protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = v8;
  *(unsigned char *)(v9 + 48) = a3;
  *(void *)(v9 + 24) = a1;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.clear(viewName:fullRebuild:), 0, 0);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *(void *)uint64_t v9 = v4;
  *(void *)(v9 + 8) = protocol witness for ViewUpdateGenerationRunner.truncate(viewName:fullRebuild:) in conformance ComputeOrchestration.ViewRunner;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = v8;
  *(unsigned char *)(v9 + 48) = a3;
  *(void *)(v9 + 24) = a1;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.truncate(viewName:fullRebuild:), 0, 0);
}

uint64_t protocol witness for ViewUpdateGenerationRunner.stop() in conformance ComputeOrchestration.ViewRunner()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = protocol witness for ViewUpdateGenerationRunner.stop() in conformance ComputeOrchestration.ViewRunner;
  v3[3] = v2;
  return MEMORY[0x270FA2498](ComputeOrchestration.ViewRunner.stop(), 0, 0);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id ComputeOrchestration.ViewRunnerProvider.runner(for:)@<X0>(uint64_t *a1@<X8>)
{
  id v6 = *(id *)(v1 + 16);
  uint64_t v3 = type metadata accessor for ComputeOrchestration.ViewRunner();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v6;
  a1[3] = v3;
  a1[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner, (void (*)(void))type metadata accessor for ComputeOrchestration.ViewRunner);
  *a1 = v4;

  return v6;
}

uint64_t type metadata accessor for ComputeOrchestration.ViewRunner()
{
  return self;
}

id protocol witness for ViewUpdateGenerationRunnerProvider.runner(for:) in conformance ComputeOrchestration.ViewRunnerProvider@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void **)(*(void *)v1 + 16);
  uint64_t v4 = type metadata accessor for ComputeOrchestration.ViewRunner();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  a1[3] = v4;
  a1[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner, (void (*)(void))type metadata accessor for ComputeOrchestration.ViewRunner);
  *a1 = v5;
  return v3;
}

id ComputeOrchestration.NullEventReporter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t ComputeOrchestration.EventReporterProvider.GuardedData.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t closure #1 in ComputeOrchestration.EventReporterProvider.eventReporter()@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  if ((*(unsigned char *)(*a1 + 16) & 1) == 0 && (objc_msgSend(self, sel_isClassCLocked) & 1) == 0)
  {
    uint64_t v4 = type metadata accessor for ComputeOrchestration.ViewRunnerProvider();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = objc_msgSend(objc_allocWithZone((Class)GDCComputeService), sel_init);
    uint64_t v6 = type metadata accessor for Configuration();
    uint64_t v7 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388]();
    uint64_t v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v13[3] = v4;
    v13[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunnerProvider and conformance ComputeOrchestration.ViewRunnerProvider, (void (*)(void))type metadata accessor for ComputeOrchestration.ViewRunnerProvider);
    v13[0] = v5;
    static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    type metadata accessor for ComputeOrchestration.EventReporter();
    uint64_t v10 = swift_allocObject();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v10 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config, v9, v6);
    *(void *)(v3 + 24) = v10;
    swift_unknownObjectRelease();
    *(unsigned char *)(v3 + 16) = 1;
  }
  *a2 = *(void *)(v3 + 24);
  return swift_unknownObjectRetain();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamPruned(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.EventReporter.streamDeletion(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

uint64_t ComputeOrchestration.EventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  uint64_t result = static ViewOrchestrationSystem.sourceUpdater(config:)();
  if (!v5)
  {
    v12._countAndFlagsBits = specialized ComputeOrchestration.EventReporter.annotatedStreamIdentifier(streamIdentifier:remoteName:)(a1, a2, a3, a4);
    ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(v12, a5 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ComputeOrchestration.EventReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config;
  uint64_t v2 = type metadata accessor for Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ComputeOrchestration.EventReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config;
  uint64_t v2 = type metadata accessor for Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamPruned(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

uint64_t @objc ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6)
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v12 = a1;
  specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(v9, v11, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComputeOrchestration.NullEventReporter.streamDeletion(streamIdentifier:remoteName:)(Swift::String streamIdentifier, Swift::String_optional remoteName)
{
}

uint64_t @objc ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6)
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_retain();
  ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(v8, v10, v11, a4, a6);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return 1;
}

id ComputeOrchestration.WrappedEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, SEL *a5)
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMViewEventReporter & Sendable);
  UnfairLockedBox.access<A>(_:)();
  id v10 = v15[0];
  uint64_t v11 = (void *)MEMORY[0x25A2718B0](a1, a2);
  if (a4) {
    a4 = (void *)MEMORY[0x25A2718B0](a3, a4);
  }
  v15[0] = 0;
  unsigned int v12 = objc_msgSend(v10, *a5, v11, a4, v15);
  swift_unknownObjectRelease();

  if (v12) {
    return v15[0];
  }
  id v14 = v15[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t ComputeOrchestration.EventReporterProvider.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

id ComputeOrchestration.NullEventReporter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id @objc ComputeOrchestration.NullEventReporter.init()(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ComputeOrchestration.NullEventReporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
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

uint64_t specialized ComputeOrchestration.NullEventReporter.streamUpdated(streamIdentifier:remoteName:)(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  swift_bridgeObjectRetain_n();
  size_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    id v18 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v19 = v7;
    id v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v3;
    uint64_t v16 = v15;
    uint64_t v22 = v15;
    *(_DWORD *)id v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v21 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_253E94000, v11, v12, v18, v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A271E20](v16, -1, -1);
    MEMORY[0x25A271E20](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

id specialized static ComputeOrchestration.start()()
{
  if (MEMORY[0x263F4E910])
  {
    if (objc_msgSend(self, sel_isClassCLocked))
    {
      type metadata accessor for ComputeOrchestration.WrappedEventReporter();
      uint64_t v0 = swift_allocObject();
      type metadata accessor for ComputeOrchestration.EventReporterProvider();
      uint64_t v1 = swift_allocObject();
      type metadata accessor for ComputeOrchestration.EventReporterProvider.GuardedData();
      uint64_t v2 = swift_allocObject();
      *(unsigned char *)(v2 + 16) = 0;
      *(void *)(v2 + 24) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComputeOrchestration.NullEventReporter()), sel_init);
      v18[0] = v2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UnfairLockedBox<ComputeOrchestration.EventReporterProvider.GuardedData>);
      swift_allocObject();
      *(void *)(v1 + 16) = UnfairLockedBox.init(contents:)();
      *(void *)(v0 + 16) = v1;
    }
    else
    {
      uint64_t v10 = type metadata accessor for ComputeOrchestration.ViewRunnerProvider();
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = objc_msgSend(objc_allocWithZone((Class)GDCComputeService), sel_init);
      uint64_t v12 = type metadata accessor for Configuration();
      uint64_t v13 = *(void *)(v12 - 8);
      MEMORY[0x270FA5388]();
      uint64_t v15 = (char *)&v18[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18[3] = v10;
      v18[4] = lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(&lazy protocol witness table cache variable for type ComputeOrchestration.ViewRunnerProvider and conformance ComputeOrchestration.ViewRunnerProvider, (void (*)(void))type metadata accessor for ComputeOrchestration.ViewRunnerProvider);
      v18[0] = v11;
      static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
      type metadata accessor for ComputeOrchestration.EventReporter();
      uint64_t v0 = swift_allocObject();
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v0 + OBJC_IVAR____TtCC27IntelligencePlatformCompute20ComputeOrchestration13EventReporter_config, v15, v12);
    }
  }
  else
  {
    uint64_t v3 = type metadata accessor for Logger();
    uint64_t v4 = *(void *)(v3 - 8);
    MEMORY[0x270FA5388]();
    unint64_t v6 = (char *)&v18[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    Logger.init(subsystem:category:)();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_253E94000, v7, v8, "Failed to locate the IntelligencePlatformCore framework. The view system will not start up. This is unexpected on non-factory images", v9, 2u);
      MEMORY[0x25A271E20](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ComputeOrchestration.NullEventReporter()), sel_init);
  }
  return (id)v0;
}

uint64_t type metadata accessor for ComputeOrchestration()
{
  return self;
}

uint64_t method lookup function for ComputeOrchestration.ViewRunner(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ComputeOrchestration.ViewRunner);
}

uint64_t type metadata accessor for ComputeOrchestration.ViewRunnerProvider()
{
  return self;
}

uint64_t method lookup function for ComputeOrchestration.ViewRunnerProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ComputeOrchestration.ViewRunnerProvider);
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporterProvider()
{
  return self;
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporterProvider.GuardedData()
{
  return self;
}

uint64_t ObjC metadata update function for ComputeOrchestration.EventReporter()
{
  return type metadata accessor for ComputeOrchestration.EventReporter();
}

uint64_t type metadata accessor for ComputeOrchestration.EventReporter()
{
  uint64_t result = type metadata singleton initialization cache for ComputeOrchestration.EventReporter;
  if (!type metadata singleton initialization cache for ComputeOrchestration.EventReporter) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for ComputeOrchestration.EventReporter()
{
  uint64_t result = type metadata accessor for Configuration();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ComputeOrchestration.EventReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ComputeOrchestration.EventReporter);
}

uint64_t type metadata accessor for ComputeOrchestration.NullEventReporter()
{
  return self;
}

uint64_t type metadata accessor for ComputeOrchestration.WrappedEventReporter()
{
  return self;
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

uint64_t lazy protocol witness table accessor for type ComputeOrchestration.ViewRunner and conformance ComputeOrchestration.ViewRunner(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
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

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF828]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF838]();
}

uint64_t UnfairLockedBox.access<A>(_:)()
{
  return MEMORY[0x270F41D08]();
}

uint64_t UnfairLockedBox.init(contents:)()
{
  return MEMORY[0x270F41D10]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ViewUpdate.SourceUpdater.streamUpdated(streamName:isDelete:)(Swift::String streamName, Swift::Bool isDelete)
{
}

uint64_t type metadata accessor for Configuration()
{
  return MEMORY[0x270F41EC8]();
}

uint64_t static ViewOrchestrationSystem.sourceUpdater(config:)()
{
  return MEMORY[0x270F41ED0]();
}

uint64_t static ViewOrchestrationSystem.start(viewUpdateRunnerProvider:)()
{
  return MEMORY[0x270F41ED8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E28]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19A8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19F0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B90]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E88]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}