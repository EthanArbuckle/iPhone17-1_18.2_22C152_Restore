uint64_t PaymentsFlowDelegatePlugin.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  long long v13;
  void *v14;
  void *v15;
  long long v16;
  uint64_t v17;
  void *v18;
  unsigned char v19[40];

  v1 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  v3 = v2;
  __chkstk_darwin(v4);
  OUTLINED_FUNCTION_3();
  v5 = Logger.payments.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "PaymentsFlowDelegatePlugin is being initialized", v8, 2u);
    OUTLINED_FUNCTION_4((uint64_t)v8);
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  static Device.current.getter();
  outlined init with copy of FlowProviding((uint64_t)v19, (uint64_t)&v16);
  v14 = (void *)type metadata accessor for SiriKitContactResolver();
  v15 = &protocol witness table for SiriKitContactResolver;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v13);
  SiriKitContactResolver.init()();
  v9 = type metadata accessor for FlowFactory();
  swift_allocObject();
  v10 = FlowFactory.init(deviceState:contactResolver:)();
  SiriPaymentsFeatureManager.init()();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  v17 = v9;
  v18 = &protocol witness table for FlowFactory;
  *(void *)&v16 = v10;
  v14 = &type metadata for SiriPaymentsFeatureManager;
  v15 = &protocol witness table for SiriPaymentsFeatureManager;
  type metadata accessor for PaymentsFlowDelegatePlugin();
  v11 = swift_allocObject();
  outlined init with take of SiriPaymentsFeatureManaging(&v16, v11 + 16);
  outlined init with take of SiriPaymentsFeatureManaging(&v13, v11 + 56);
  return v11;
}

uint64_t PaymentsFlowDelegatePlugin.findFlowForX(parse:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v4 = v3;
  v28[1] = a1;
  uint64_t v30 = a2;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v28[0] = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v28[2] = (char *)v28 - v10;
  __chkstk_darwin(v9);
  uint64_t v11 = type metadata accessor for Signpost.OpenSignpost();
  __chkstk_darwin(v11 - 8);
  OUTLINED_FUNCTION_2();
  SignpostName.findFlowForX.unsafeMutableAddressor();
  uint64_t v29 = v2;
  static Signpost.begin(_:)();
  Logger.payments.unsafeMutableAddressor();
  v12 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_1();
  v12();
  v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "#PaymentsFlowDelegatePlugin.findFlowForX(): attempting to make flow", v15, 2u);
    OUTLINED_FUNCTION_4((uint64_t)v15);
  }

  v16 = *(void (**)(void))(v6 + 8);
  OUTLINED_FUNCTION_6();
  v16();
  uint64_t v17 = v3[10];
  uint64_t v18 = v3[11];
  __swift_project_boxed_opaque_existential_1(v3 + 7, v17);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18))
  {
    OUTLINED_FUNCTION_1();
    v12();
    v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "#PaymentsFlowDelegatePlugin.findFlowForX(): SiriPayments/NLX=1, converting parse to build flow", v21, 2u);
      OUTLINED_FUNCTION_4((uint64_t)v21);
    }

    OUTLINED_FUNCTION_6();
    v16();
    Swift::Bool Party = Parse.isFirstPartyApp()();
    static PaymentsFlowDelegatePlugin.preWarmExtensionWithIntentSignal(isFirstParty:)(Party);
    outlined init with copy of FlowProviding((uint64_t)(v4 + 2), (uint64_t)v31);
    type metadata accessor for PaymentsFlow();
    swift_allocObject();
    v31[0] = PaymentsFlow.init(flowFactory:)();
    lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin(&lazy protocol witness table cache variable for type PaymentsFlow and conformance PaymentsFlow, 255, (void (*)(uint64_t))&type metadata accessor for PaymentsFlow);
    Flow.eraseToAnyFlow()();
    swift_release();
    static FlowSearchResult.flow(_:)();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_1();
    v12();
    v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "#PaymentsFlowDelegatePlugin.findFlowForX(): SiriPayments/NLX=0, returning noFlow", v25, 2u);
      OUTLINED_FUNCTION_4((uint64_t)v25);
    }

    OUTLINED_FUNCTION_6();
    v16();
    static FlowSearchResult.noFlow.getter();
  }
  uint64_t v26 = v29;
  Signpost.OpenSignpost.end()();
  return outlined destroy of Signpost.OpenSignpost(v26);
}

uint64_t static PaymentsFlowDelegatePlugin.preWarmExtensionWithIntentSignal(isFirstParty:)(char a1)
{
  uint64_t v4 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  __chkstk_darwin();
  OUTLINED_FUNCTION_3();
  type metadata accessor for Signpost.OpenSignpost();
  __chkstk_darwin();
  OUTLINED_FUNCTION_2();
  SignpostName.emitIntentSignal.unsafeMutableAddressor();
  static Signpost.begin(_:)();
  if (a1)
  {
    uint64_t v7 = Logger.payments.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v7, v4);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "#PaymentsFlowDelegatePlugin sending IntentSignal to pre-warm Wallet intent extension", v10, 2u);
      OUTLINED_FUNCTION_4((uint64_t)v10);
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
    id v11 = [objc_allocWithZone((Class)SAIntentGroupIntentSignal) init];
    id v12 = [objc_allocWithZone((Class)INSendPaymentIntent) init];
    uint64_t v13 = static AppUtil.PASSBOOK_APP_BUNDLE_ID.getter();
    outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter(v13, v14, v12, (SEL *)&selRef__setLaunchId_);
    id v15 = v12;
    v16 = (uint64_t *)AppUtil.PASSBOOK_EXTENSION_BUNDLE_ID.unsafeMutableAddressor();
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter(v17, v18, v15, (SEL *)&selRef__setExtensionBundleId_);

    type metadata accessor for SAIntentGroupProtobufMessage();
    id v19 = v15;
    id v20 = SAIntentGroupProtobufMessage.init(intent:)(v19);
    [v11 setIntent:v20];

    static AceService.currentAsync.getter();
    __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    AceServiceInvokerAsync.submitAndForget(_:)();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  Signpost.OpenSignpost.end()();
  return outlined destroy of Signpost.OpenSignpost(v1);
}

id SAIntentGroupProtobufMessage.init(intent:)(void *a1)
{
  id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v3 = outlined bridged method (ob) of @objc PBCodable.data.getter([a1 backingStore]);
  if (v4 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    uint64_t v6 = v3;
    unint64_t v7 = v4;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v6, v7);
  }
  [v2 setData:isa];

  id v8 = [a1 typeName];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter(v9, v11, v2, (SEL *)&selRef_setTypeName_);
  return v2;
}

uint64_t PaymentsFlowDelegatePlugin.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for PaymentsFlowDelegatePlugin()
{
  return self;
}

uint64_t protocol witness for FlowPluginExtended.findFlowForX(parse:) in conformance PaymentsFlowDelegatePlugin@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PaymentsFlowDelegatePlugin.findFlowForX(parse:)(a1, a2);
}

uint64_t protocol witness for FlowPlugin.init() in conformance PaymentsFlowDelegatePlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PaymentsFlowDelegatePlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for FlowPlugin.makeFlowFrame(parse:) in conformance PaymentsFlowDelegatePlugin()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

uint64_t protocol witness for FlowPlugin.makeFlowFor(parse:) in conformance PaymentsFlowDelegatePlugin()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t protocol witness for FlowPlugin.findFlowFor(parse:) in conformance PaymentsFlowDelegatePlugin()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t base witness table accessor for FlowPlugin in PaymentsFlowDelegatePlugin(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin(&lazy protocol witness table cache variable for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin, a2, (void (*)(uint64_t))type metadata accessor for PaymentsFlowDelegatePlugin);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined destroy of Signpost.OpenSignpost(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Signpost.OpenSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t lazy protocol witness table accessor for type PaymentsFlowDelegatePlugin and conformance PaymentsFlowDelegatePlugin(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined bridged method (ob) of @objc PBCodable.data.getter(void *a1)
{
  id v2 = [a1 data];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

void outlined bridged method (mbnn) of @objc SAIntentGroupProtobufMessage.typeName.setter(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

unint64_t type metadata accessor for SAIntentGroupProtobufMessage()
{
  unint64_t result = lazy cache variable for type metadata for SAIntentGroupProtobufMessage;
  if (!lazy cache variable for type metadata for SAIntentGroupProtobufMessage)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAIntentGroupProtobufMessage);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t outlined init with copy of FlowProviding(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t outlined init with take of SiriPaymentsFeatureManaging(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return _swift_slowAlloc(2, -1);
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t static FlowSearchResult.noFlow.getter()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t static FlowSearchResult.flow(_:)()
{
  return static FlowSearchResult.flow(_:)();
}

Swift::Void __swiftcall FlowPlugin.warmup(refId:)(Swift::String refId)
{
}

Swift::Void __swiftcall FlowPlugin.warmup()()
{
}

uint64_t static AceService.currentAsync.getter()
{
  return static AceService.currentAsync.getter();
}

uint64_t AceServiceInvokerAsync.submitAndForget(_:)()
{
  return AceServiceInvokerAsync.submitAndForget(_:)();
}

Swift::Bool __swiftcall Parse.isFirstPartyApp()()
{
  return Parse.isFirstPartyApp()();
}

uint64_t static Device.current.getter()
{
  return static Device.current.getter();
}

uint64_t SiriKitContactResolver.init()()
{
  return SiriKitContactResolver.init()();
}

uint64_t type metadata accessor for SiriKitContactResolver()
{
  return type metadata accessor for SiriKitContactResolver();
}

uint64_t PaymentsFlow.init(flowFactory:)()
{
  return PaymentsFlow.init(flowFactory:)();
}

uint64_t type metadata accessor for PaymentsFlow()
{
  return type metadata accessor for PaymentsFlow();
}

uint64_t SiriPaymentsFeatureManager.init()()
{
  return SiriPaymentsFeatureManager.init()();
}

uint64_t FlowFactory.init(deviceState:contactResolver:)()
{
  return FlowFactory.init(deviceState:contactResolver:)();
}

uint64_t type metadata accessor for FlowFactory()
{
  return type metadata accessor for FlowFactory();
}

uint64_t SignpostName.findFlowForX.unsafeMutableAddressor()
{
  return SignpostName.findFlowForX.unsafeMutableAddressor();
}

uint64_t SignpostName.emitIntentSignal.unsafeMutableAddressor()
{
  return SignpostName.emitIntentSignal.unsafeMutableAddressor();
}

uint64_t Logger.payments.unsafeMutableAddressor()
{
  return Logger.payments.unsafeMutableAddressor();
}

uint64_t static AppUtil.PASSBOOK_APP_BUNDLE_ID.getter()
{
  return static AppUtil.PASSBOOK_APP_BUNDLE_ID.getter();
}

uint64_t AppUtil.PASSBOOK_EXTENSION_BUNDLE_ID.unsafeMutableAddressor()
{
  return AppUtil.PASSBOOK_EXTENSION_BUNDLE_ID.unsafeMutableAddressor();
}

Swift::Void __swiftcall Signpost.OpenSignpost.end()()
{
}

uint64_t type metadata accessor for Signpost.OpenSignpost()
{
  return type metadata accessor for Signpost.OpenSignpost();
}

uint64_t static Signpost.begin(_:)()
{
  return static Signpost.begin(_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}