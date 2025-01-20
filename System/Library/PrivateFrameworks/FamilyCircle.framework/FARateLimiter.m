@interface FARateLimiter
- (BOOL)isAllowedWithClientName:(id)a3;
- (FARateLimiter)init;
- (FARateLimiter)initWithIdentifier:(id)a3;
- (FARateLimiter)initWithPersistence:(id)a3 identifier:(id)a4 getDate:(id)a5;
- (void)recordCallWithClientName:(id)a3;
@end

@implementation FARateLimiter

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
}

- (FARateLimiter)initWithPersistence:(id)a3 identifier:(id)a4 getDate:(id)a5
{
  v5 = _Block_copy(a5);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = swift_unknownObjectRetain();
  v11 = (FARateLimiter *)sub_1000059FC(v10, v6, v8, (uint64_t)sub_10002A8EC, v9);
  swift_unknownObjectRelease();
  swift_release();
  return v11;
}

- (FARateLimiter)initWithIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = [self standardUserDefaults];
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v9[4] = j___s10Foundation4DateV3nowACvgZ;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10002749C;
  v9[3] = &unk_10004EAA0;
  uint64_t v6 = _Block_copy(v9);
  uint64_t v7 = [(FARateLimiter *)self initWithPersistence:v4 identifier:v5 getDate:v6];
  _Block_release(v6);

  return v7;
}

- (BOOL)isAllowedWithClientName:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = self;
  OS_dispatch_queue.sync<A>(execute:)();

  swift_bridgeObjectRelease();
  return v6;
}

- (void)recordCallWithClientName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  RateLimiter.recordCall(clientName:)(v8);

  swift_bridgeObjectRelease();
}

- (FARateLimiter)init
{
  result = (FARateLimiter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end