@interface PHCountingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC13InCallService15PHCountingLayer)init;
- (_TtC13InCallService15PHCountingLayer)initWithCoder:(id)a3;
- (_TtC13InCallService15PHCountingLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation PHCountingLayer

- (int64_t)value
{
  return sub_10014302C();
}

- (void)setValue:(int64_t)a3
{
  v4 = self;
  sub_100143090(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  char v3 = sub_100143198();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_100143298(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (_TtC13InCallService15PHCountingLayer)init
{
  return (_TtC13InCallService15PHCountingLayer *)sub_100143448();
}

- (_TtC13InCallService15PHCountingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC13InCallService15PHCountingLayer *)sub_1001434AC(v4);
}

- (_TtC13InCallService15PHCountingLayer)initWithCoder:(id)a3
{
  return (_TtC13InCallService15PHCountingLayer *)sub_100143584(a3);
}

@end