@interface MomentsIndicatorBubble
- (NSString)description;
- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithCoder:(id)a3;
- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithFrame:(CGRect)a3;
- (void)start;
@end

@implementation MomentsIndicatorBubble

- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithCoder:(id)a3
{
  id v3 = a3;
  MomentsIndicatorBubble.init(coder:)();
}

- (void)start
{
  v2 = self;
  MomentsIndicatorBubble.start()();
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = MomentsIndicatorBubble.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit22MomentsIndicatorBubble)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of MomentsIndicatorBubbleDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_indicator));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit22MomentsIndicatorBubble_timer);
}

@end