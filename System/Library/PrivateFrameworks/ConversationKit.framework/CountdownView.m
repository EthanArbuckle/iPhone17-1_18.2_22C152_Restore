@interface CountdownView
- (_TtC15ConversationKit13CountdownView)init;
- (_TtC15ConversationKit13CountdownView)initWithCoder:(id)a3;
- (_TtC15ConversationKit13CountdownView)initWithFrame:(CGRect)a3;
@end

@implementation CountdownView

- (_TtC15ConversationKit13CountdownView)init
{
  return (_TtC15ConversationKit13CountdownView *)CountdownView.init()();
}

- (_TtC15ConversationKit13CountdownView)initWithCoder:(id)a3
{
  id v3 = a3;
  CountdownView.init(coder:)();
}

- (_TtC15ConversationKit13CountdownView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit13CountdownView_countdownLabel));
}

@end