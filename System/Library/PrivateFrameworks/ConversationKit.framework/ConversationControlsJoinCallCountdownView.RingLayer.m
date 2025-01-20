@interface ConversationControlsJoinCallCountdownView.RingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)init;
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithCoder:(id)a3;
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithLayer:(id)a3;
- (double)percentage;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setPercentage:(double)a3;
@end

@implementation ConversationControlsJoinCallCountdownView.RingLayer

- (double)percentage
{
  return ConversationControlsJoinCallCountdownView.RingLayer.percentage.getter();
}

- (void)setPercentage:(double)a3
{
  v4 = self;
  ConversationControlsJoinCallCountdownView.RingLayer.percentage.setter(a3);
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)init
{
  return (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *)ConversationControlsJoinCallCountdownView.RingLayer.init()();
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithLayer:(id)a3
{
  return (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer *)@objc ConversationControlsJoinCallCountdownView.RingLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))ConversationControlsJoinCallCountdownView.RingLayer.init(layer:));
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsJoinCallCountdownView.RingLayer.init(coder:)();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  char v3 = static ConversationControlsJoinCallCountdownView.RingLayer.needsDisplay(forKey:)();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = ConversationControlsJoinCallCountdownView.RingLayer.action(forKey:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  ConversationControlsJoinCallCountdownView.RingLayer.draw(in:)(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer_fillColor));
  char v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView9RingLayer_strokeColor);
}

@end