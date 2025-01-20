@interface ParticipantAlertView
- (CGSize)intrinsicContentSize;
- (_TtC15ConversationKit20ParticipantAlertView)init;
- (_TtC15ConversationKit20ParticipantAlertView)initWithCoder:(id)a3;
- (_TtC15ConversationKit20ParticipantAlertView)initWithFrame:(CGRect)a3;
@end

@implementation ParticipantAlertView

- (_TtC15ConversationKit20ParticipantAlertView)init
{
  return (_TtC15ConversationKit20ParticipantAlertView *)ParticipantAlertView.init()();
}

- (_TtC15ConversationKit20ParticipantAlertView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantAlertView.init(coder:)();
}

- (_TtC15ConversationKit20ParticipantAlertView)initWithFrame:(CGRect)a3
{
}

- (CGSize)intrinsicContentSize
{
  double v2 = 240.0;
  double v3 = 47.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20ParticipantAlertView_visualEffectView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit20ParticipantAlertView_titleLabel);
}

@end