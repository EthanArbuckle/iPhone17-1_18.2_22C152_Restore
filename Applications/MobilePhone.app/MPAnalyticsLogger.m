@interface MPAnalyticsLogger
- (MPAnalyticsLogger)init;
- (void)logCustomGreetingUpdated;
- (void)logEvent:(id)a3;
- (void)logEvent:(id)a3 withCoreAnalyticsDictionary:(id)a4;
@end

@implementation MPAnalyticsLogger

- (void)logEvent:(id)a3 withCoreAnalyticsDictionary:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for NSObject);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  specialized MPAnalyticsLogger.logEvent(_:withCoreAnalyticsDictionary:)(v5, v7, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (MPAnalyticsLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MPAnalyticsLogger();
  return [(MPAnalyticsLogger *)&v3 init];
}

- (void)logEvent:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  v8[4] = MPRTTTranscriptionMessage.confidenceRating.getter;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed () -> (@owned [String : NSObject]?);
  v8[3] = &block_descriptor_4_0;
  uint64_t v7 = _Block_copy(v8);
  AnalyticsSendEventLazy();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)logCustomGreetingUpdated
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, NSNumber)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1002053C0;
  *(void *)(inited + 32) = 0xD000000000000017;
  *(void *)(inited + 40) = 0x80000001002426B0;
  type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v4 = self;
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(1);
  unint64_t v5 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  specialized _dictionaryUpCast<A, B, C, D>(_:)(v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))((swift_isaMask & (uint64_t)v4->super.isa) + 0x58))(0xD00000000000002FLL, 0x80000001002426D0, v7);

  swift_bridgeObjectRelease();
}

@end