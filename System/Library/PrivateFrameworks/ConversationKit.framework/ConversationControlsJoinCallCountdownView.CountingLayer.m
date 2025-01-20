@interface ConversationControlsJoinCallCountdownView.CountingLayer
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)init;
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithCoder:(id)a3;
- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithLayer:(id)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation ConversationControlsJoinCallCountdownView.CountingLayer

- (int64_t)value
{
  return ConversationControlsJoinCallCountdownView.CountingLayer.value.getter();
}

- (void)setValue:(int64_t)a3
{
  v4 = self;
  ConversationControlsJoinCallCountdownView.CountingLayer.value.setter(a3);
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)init
{
  return (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer *)ConversationControlsJoinCallCountdownView.CountingLayer.init()();
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithLayer:(id)a3
{
  return (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer *)@objc ConversationControlsJoinCallCountdownView.RingLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))ConversationControlsJoinCallCountdownView.CountingLayer.init(layer:));
}

- (_TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsJoinCallCountdownView.CountingLayer.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC15ConversationKit41ConversationControlsJoinCallCountdownView13CountingLayer_valueFont));
}

@end