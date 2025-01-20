id sub_100003DAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  v3 = sub_10000B570();
  sub_100004A6C();
  v5 = v4;
  __chkstk_darwin();
  sub_100004A88();
  v8 = v7 - v6;
  sub_1000046F4(&qword_100015558);
  __chkstk_darwin();
  sub_100004A88();
  v11 = v10 - v9;
  sub_1000046F4(&qword_100015560);
  __chkstk_darwin();
  sub_100004A88();
  v14 = v13 - v12;
  v15 = sub_10000B550();
  sub_100004A6C();
  v17 = v16;
  __chkstk_darwin();
  sub_100004A88();
  v20 = v19 - v18;
  v21 = v1 + OBJC_IVAR___GDEntityRelevanceHistoricalFeatureViewWrapper_db;
  swift_beginAccess();
  sub_100004738(v21, v11);
  if (sub_1000047A0(v11, 1, v3))
  {
    sub_1000047F0(v11, &qword_100015558);
    sub_1000047C8(v14, 1, 1, v15);
    sub_1000047F0(v14, &qword_100015560);
    if (qword_1000154F8 != -1) {
      swift_once();
    }
    v22 = sub_10000B590();
    sub_10000484C(v22, (uint64_t)static Logging.defaultLog);
    v23 = sub_10000B580();
    v24 = sub_10000B5D0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unable to access entityRelevanceHistoricalFeatureView", v25, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v11, v3);
    sub_1000047F0(v11, &qword_100015558);
    sub_10000B560();
    v28 = sub_100004A98();
    v29(v28);
    sub_1000047C8(v14, 0, 1, v15);
    v30 = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v20, v14, v15);
    v31 = sub_10000B540();
    v32 = v31;
    v33 = *(void *)(v31 + 16);
    if (v33)
    {
      sub_10000B620();
      v34 = (uint64_t *)(v32 + 48);
      do
      {
        v35 = *(v34 - 2);
        v36 = (void *)*(v34 - 1);
        v37 = *v34;
        v34 += 3;
        objc_allocWithZone((Class)GBDTLabeledFeatureVector);
        swift_bridgeObjectRetain();
        sub_100004884(v35, v36, v37);
        sub_10000B600();
        sub_10000B630();
        sub_10000B640();
        sub_10000B610();
        --v33;
      }
      while (v33);
      swift_bridgeObjectRelease();
      v30 = v17;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v38 = *(void *)(sub_10000B530() + 16);
    swift_bridgeObjectRelease();
    v39 = objc_allocWithZone((Class)GBDTLabeledFeatureVectors);
    v26 = sub_100004918((uint64_t)&_swiftEmptyArrayStorage, a1, v38);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v20, v15);
  }
  return v26;
}

id sub_100004348()
{
  sub_1000046F4(&qword_100015558);
  __chkstk_darwin();
  sub_100004A88();
  uint64_t v3 = v2 - v1;
  uint64_t v4 = (uint64_t)v0 + OBJC_IVAR___GDEntityRelevanceHistoricalFeatureViewWrapper_db;
  uint64_t v5 = sub_10000B570();
  sub_1000047C8(v4, 1, 1, v5);
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for EntityRelevanceHistoricalFeatureViewWrapper();
  id v6 = objc_msgSendSuper2(&v11, "init");
  sub_10000B520();
  id v7 = v6;
  v8 = (void *)sub_10000B510();
  sub_10000B500();

  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR___GDEntityRelevanceHistoricalFeatureViewWrapper_db;
  swift_beginAccess();
  sub_100004A04(v3, v9);
  swift_endAccess();
  return v7;
}

id sub_100004558()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EntityRelevanceHistoricalFeatureViewWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000045BC()
{
  return type metadata accessor for EntityRelevanceHistoricalFeatureViewWrapper();
}

uint64_t type metadata accessor for EntityRelevanceHistoricalFeatureViewWrapper()
{
  uint64_t result = qword_100015540;
  if (!qword_100015540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000460C()
{
  sub_10000469C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000469C()
{
  if (!qword_100015550)
  {
    sub_10000B570();
    unint64_t v0 = sub_10000B5F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100015550);
    }
  }
}

uint64_t sub_1000046F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046F4(&qword_100015558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000047A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000047C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000047F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000046F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000484C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_100004884(uint64_t a1, void *a2, uint64_t a3)
{
  sub_1000049C8(0, &qword_100015570);
  Class isa = sub_10000B5B0().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 initWithInputVector:isa target:a2 entityType:a3];

  return v7;
}

id sub_100004918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000049C8(0, &qword_100015568);
  Class isa = sub_10000B5B0().super.isa;
  swift_bridgeObjectRelease();
  Class v6 = sub_10000B5B0().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 initWithLabeledVector:isa orderedFeatureNames:v6 numberOfEntityTypes:a3];

  return v7;
}

uint64_t sub_1000049C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100004A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000046F4(&qword_100015558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004A98()
{
  return v0;
}

uint64_t Logging.defaultLog.unsafeMutableAddressor()
{
  return sub_100004C2C(&qword_1000154F8, (uint64_t)static Logging.defaultLog);
}

uint64_t sub_100004AD4(uint64_t a1)
{
  return sub_100004BA0(a1, static Logging.defaultLog, (uint64_t (*)(void))PluginDefaultLog);
}

uint64_t static Logging.defaultLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100004CA4(&qword_1000154F8, (uint64_t)static Logging.defaultLog, a1);
}

uint64_t sub_100004B18(uint64_t a1)
{
  return sub_100004BA0(a1, static Logging.pfl, (uint64_t (*)(void))PluginPFLLog);
}

uint64_t Logging.pfl.unsafeMutableAddressor()
{
  return sub_100004C2C(&qword_100015500, (uint64_t)static Logging.pfl);
}

uint64_t static Logging.pfl.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100004CA4(&qword_100015500, (uint64_t)static Logging.pfl, a1);
}

uint64_t sub_100004B80(uint64_t a1)
{
  return sub_100004BA0(a1, static Logging.gbdt, (uint64_t (*)(void))PluginGBDTLog);
}

uint64_t sub_100004BA0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_10000B590();
  sub_100004D4C(v5, a2);
  sub_10000484C(v5, (uint64_t)a2);
  id v6 = (id)a3();
  return sub_10000B5A0();
}

uint64_t Logging.gbdt.unsafeMutableAddressor()
{
  return sub_100004C2C(&qword_100015508, (uint64_t)static Logging.gbdt);
}

uint64_t sub_100004C2C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10000B590();
  return sub_10000484C(v3, a2);
}

uint64_t static Logging.gbdt.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100004CA4(&qword_100015508, (uint64_t)static Logging.gbdt, a1);
}

uint64_t sub_100004CA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000B590();
  uint64_t v6 = sub_10000484C(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

uint64_t *sub_100004D4C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_1000055D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v10 = (id)v8;
  if (v8) {
    id v9 = (id)v8;
  }
  else {
    id v9 = v6;
  }
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

int64_t sub_1000099C8(id a1, id a2, id a3)
{
  return (int64_t)_[a2 compare:a3 options:64];
}

id PluginDefaultLog()
{
  if (qword_100015688 != -1) {
    dispatch_once(&qword_100015688, &stru_100010540);
  }
  uint64_t v0 = (void *)qword_100015680;
  return v0;
}

void sub_10000B380(id a1)
{
  qword_100015680 = (uint64_t)os_log_create((const char *)[@"com.apple.intelligenceplatform.ERMLRuntimePlugin" UTF8String], "default");
  _objc_release_x1();
}

id PluginPFLLog()
{
  if (qword_100015698 != -1) {
    dispatch_once(&qword_100015698, &stru_100010560);
  }
  uint64_t v0 = (void *)qword_100015690;
  return v0;
}

void sub_10000B41C(id a1)
{
  qword_100015690 = (uint64_t)os_log_create((const char *)[@"com.apple.intelligenceplatform.ERMLRuntimePlugin" UTF8String], "pfl");
  _objc_release_x1();
}

id PluginGBDTLog()
{
  if (qword_1000156A8 != -1) {
    dispatch_once(&qword_1000156A8, &stru_100010580);
  }
  uint64_t v0 = (void *)qword_1000156A0;
  return v0;
}

void sub_10000B4B8(id a1)
{
  qword_1000156A0 = (uint64_t)os_log_create((const char *)[@"com.apple.intelligenceplatform.ERMLRuntimePlugin" UTF8String], "GBDTEvaluator");
  _objc_release_x1();
}

uint64_t sub_10000B500()
{
  return ViewService.entityRelevanceHistoricalFeatureView.getter();
}

uint64_t sub_10000B510()
{
  return static ViewService.clientService.getter();
}

uint64_t sub_10000B520()
{
  return type metadata accessor for ViewService();
}

uint64_t sub_10000B530()
{
  return static BehaviorType.allCases.getter();
}

uint64_t sub_10000B540()
{
  return GDGBDTLabeledFeatureVectors.labeledVectors.getter();
}

uint64_t sub_10000B550()
{
  return type metadata accessor for GDGBDTLabeledFeatureVectors();
}

uint64_t sub_10000B560()
{
  return EntityRelevanceHistoricalFeatureView.getPFLTrainingDataForAllEvents(orderedFeatureNames:entityTypes:)();
}

uint64_t sub_10000B570()
{
  return type metadata accessor for EntityRelevanceHistoricalFeatureView();
}

uint64_t sub_10000B580()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000B590()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000B5A0()
{
  return Logger.init(_:)();
}

NSArray sub_10000B5B0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000B5C0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000B5D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000B5E0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10000B5F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10000B600()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10000B610()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10000B620()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10000B630()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10000B640()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  return _exp(__x);
}

void free(void *a1)
{
}

float logf(float a1)
{
  return _logf(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_once()
{
  return _swift_once();
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

id objc_msgSend_GBDTQuestions(void *a1, const char *a2, ...)
{
  return _[a1 GBDTQuestions];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__computeBasicMetricsForTargets_predictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeBasicMetricsForTargets:predictions:");
}

id objc_msgSend__computeFirstOrderGradientsWithTargets_predictions_positiveSampleWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeFirstOrderGradientsWithTargets:predictions:positiveSampleWeight:");
}

id objc_msgSend__computePredictionsFromModelWithInputVectors_currentModel_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computePredictionsFromModelWithInputVectors:currentModel:error:");
}

id objc_msgSend__computeSecondOrderGradientsWithTargets_predictions_positiveSampleWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeSecondOrderGradientsWithTargets:predictions:positiveSampleWeight:");
}

id objc_msgSend__computeSumOfGradientsLeftAndRightOfSplitWithFeature_threshold_inputVectors_gradients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:");
}

id objc_msgSend__differenceArrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_differenceArrayWithArray:");
}

id objc_msgSend__evaluateResultWithGradients_questions_inputVectors_reportGradientsBothSidesOfSplit_reportNodeSumGradients_reportPerFeatureResultDifference_reportPerNodeResultDifference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluateResultWithGradients:questions:inputVectors:reportGradientsBothSidesOfSplit:reportNodeSumGradients:reportPerFeatureResultDifference:reportPerNodeResultDifference:");
}

id objc_msgSend__findNodeSamplesWithDecisionPath_inputVectors_gradients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findNodeSamplesWithDecisionPath:inputVectors:gradients:");
}

id objc_msgSend__firstOrderGradientWithPrediction_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_firstOrderGradientWithPrediction:label:");
}

id objc_msgSend__l1NormWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_l1NormWithArray:");
}

id objc_msgSend__l2NormWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_l2NormWithArray:");
}

id objc_msgSend__makeKeysWithInputVectors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeKeysWithInputVectors:");
}

id objc_msgSend__secondOrderGradientWithPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_secondOrderGradientWithPrediction:");
}

id objc_msgSend__sigmoidWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sigmoidWithValue:");
}

id objc_msgSend__sumAbsoluteErrorWithPredictions_targets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sumAbsoluteErrorWithPredictions:targets:");
}

id objc_msgSend__sumAccuratePredictionsWithPredictions_targets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sumAccuratePredictionsWithPredictions:targets:");
}

id objc_msgSend__translateResultWithTranslateVector_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateResultWithTranslateVector:result:");
}

id objc_msgSend__weightResultWithWeightVector_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_weightResultWithWeightVector:result:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentURLsForBasename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentURLsForBasename:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _[a1 attachments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_BOOLValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForKey:defaultValue:");
}

id objc_msgSend_compileModelAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compileModelAtURL:error:");
}

id objc_msgSend_computeFirstOrderGradients(void *a1, const char *a2, ...)
{
  return _[a1 computeFirstOrderGradients];
}

id objc_msgSend_computeSecondOrderGradients(void *a1, const char *a2, ...)
{
  return _[a1 computeSecondOrderGradients];
}

id objc_msgSend_configBoltTaskIDSpecification(void *a1, const char *a2, ...)
{
  return _[a1 configBoltTaskIDSpecification];
}

id objc_msgSend_configDepthSpecification(void *a1, const char *a2, ...)
{
  return _[a1 configDepthSpecification];
}

id objc_msgSend_configEntityTypesSpecification(void *a1, const char *a2, ...)
{
  return _[a1 configEntityTypesSpecification];
}

id objc_msgSend_configOrderedFeatureNamesSpecification(void *a1, const char *a2, ...)
{
  return _[a1 configOrderedFeatureNamesSpecification];
}

id objc_msgSend_configTreeSpecification(void *a1, const char *a2, ...)
{
  return _[a1 configTreeSpecification];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countClassInFullDataByEntityTypeWithLabeledData_returnDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countClassInFullDataByEntityTypeWithLabeledData:returnDictionary:");
}

id objc_msgSend_countClassInSampledDataByEntityTypeWithPositiveInputVectors_positiveEntityTypes_negativeInputVectors_negativeEntityTypes_numberOfEntityTypes_returnDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countClassInSampledDataByEntityTypeWithPositiveInputVectors:positiveEntityTypes:negativeInputVectors:negativeEntityTypes:numberOfEntityTypes:returnDictionary:");
}

id objc_msgSend_createDataSourceForDodMLRecipe_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDataSourceForDodMLRecipe:error:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultRecipeParams(void *a1, const char *a2, ...)
{
  return _[a1 defaultRecipeParams];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_entityType(void *a1, const char *a2, ...)
{
  return _[a1 entityType];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateWithModelURL_dataSource_processDataReturnDict_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithModelURL:dataSource:processDataReturnDict:error:");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floatValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValueForKey:defaultValue:");
}

id objc_msgSend_generateResultsDictionaryWithModelURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateResultsDictionaryWithModelURL:error:");
}

id objc_msgSend_getPFLTrainingDataForAllEventsWithOrderedFeatureNames_entityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPFLTrainingDataForAllEventsWithOrderedFeatureNames:entityTypes:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFloat:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithJSONResult_unprivatizedVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONResult:unprivatizedVector:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:forKeys:");
}

id objc_msgSend_initWithRecipe_inputVectors_targetVector_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipe:inputVectors:targetVector:error:");
}

id objc_msgSend_inputVector(void *a1, const char *a2, ...)
{
  return _[a1 inputVector];
}

id objc_msgSend_inputVectors(void *a1, const char *a2, ...)
{
  return _[a1 inputVectors];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integerValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValueForKey:defaultValue:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_labeledVectors(void *a1, const char *a2, ...)
{
  return _[a1 labeledVectors];
}

id objc_msgSend_logResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logResults:");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfEntityTypes(void *a1, const char *a2, ...)
{
  return _[a1 numberOfEntityTypes];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orderedFeatureNames(void *a1, const char *a2, ...)
{
  return _[a1 orderedFeatureNames];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_processDataForFeatureView_taskParameters_orderedFeatureNames_entityTypes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDataForFeatureView:taskParameters:orderedFeatureNames:entityTypes:error:");
}

id objc_msgSend_processDataReturnDict(void *a1, const char *a2, ...)
{
  return _[a1 processDataReturnDict];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return _[a1 recipe];
}

id objc_msgSend_reportGradientsBothSidesOfSplit(void *a1, const char *a2, ...)
{
  return _[a1 reportGradientsBothSidesOfSplit];
}

id objc_msgSend_reportNodeSumGradients(void *a1, const char *a2, ...)
{
  return _[a1 reportNodeSumGradients];
}

id objc_msgSend_reportPerFeatureResultDifference(void *a1, const char *a2, ...)
{
  return _[a1 reportPerFeatureResultDifference];
}

id objc_msgSend_reportPerNodeResultDifference(void *a1, const char *a2, ...)
{
  return _[a1 reportPerNodeResultDifference];
}

id objc_msgSend_runTask_featureView_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTask:featureView:error:");
}

id objc_msgSend_setConfigBoltTaskIDSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigBoltTaskIDSpecification:");
}

id objc_msgSend_setConfigDepthSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigDepthSpecification:");
}

id objc_msgSend_setConfigEntityTypesSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigEntityTypesSpecification:");
}

id objc_msgSend_setConfigOrderedFeatureNamesSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigOrderedFeatureNamesSpecification:");
}

id objc_msgSend_setConfigTreeSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigTreeSpecification:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProcessDataReturnDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessDataReturnDict:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringValueForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForKey:defaultValue:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetVector(void *a1, const char *a2, ...)
{
  return _[a1 targetVector];
}

id objc_msgSend_taskResultFromDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskResultFromDict:");
}

id objc_msgSend_translateVector(void *a1, const char *a2, ...)
{
  return _[a1 translateVector];
}

id objc_msgSend_weightVector(void *a1, const char *a2, ...)
{
  return _[a1 weightVector];
}