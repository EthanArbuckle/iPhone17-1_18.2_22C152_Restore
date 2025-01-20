@interface PHRingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC13InCallService11PHRingLayer)init;
- (_TtC13InCallService11PHRingLayer)initWithCoder:(id)a3;
- (_TtC13InCallService11PHRingLayer)initWithLayer:(id)a3;
- (double)percentage;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setPercentage:(double)a3;
@end

@implementation PHRingLayer

- (double)percentage
{
  return sub_100173470();
}

- (void)setPercentage:(double)a3
{
  v4 = self;
  sub_1001734D8(a3);
}

- (_TtC13InCallService11PHRingLayer)init
{
  return (_TtC13InCallService11PHRingLayer *)sub_1001734F4();
}

- (_TtC13InCallService11PHRingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC13InCallService11PHRingLayer *)sub_100173628(v4);
}

- (_TtC13InCallService11PHRingLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100173890();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  char v3 = sub_1001739B4();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = sub_100173AB0(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_100173C54(v4);
}

- (void).cxx_destruct
{
  char v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13InCallService11PHRingLayer_strokeColor);
}

@end