@interface ParticipantBorderView
- (_TtC15ConversationKit21ParticipantBorderView)initWithCoder:(id)a3;
- (_TtC15ConversationKit21ParticipantBorderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParticipantBorderView

- (_TtC15ConversationKit21ParticipantBorderView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit21ParticipantBorderView *)ParticipantBorderView.init(frame:)();
}

- (_TtC15ConversationKit21ParticipantBorderView)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  ParticipantBorderView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantBorderView_blurView));
}

@end