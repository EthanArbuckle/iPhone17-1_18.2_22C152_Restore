@interface ConversationControlsJoinCallCountdownView
- (CGRect)frame;
- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithCoder:(id)a3;
- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithFrame:(CGRect)a3;
- (void)initializeCountdownWithInitialValue:(double)a3 fullValue:(double)a4;
- (void)setFrame:(CGRect)a3;
- (void)startCountdown;
@end

@implementation ConversationControlsJoinCallCountdownView

- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView *)ConversationControlsJoinCallCountdownView.init(frame:)();
}

- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsJoinCallCountdownView.init(coder:)();
}

- (CGRect)frame
{
  v2 = self;
  ConversationControlsJoinCallCountdownView.frame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v3 = self;
  ConversationControlsJoinCallCountdownView.frame.setter();
}

- (void)initializeCountdownWithInitialValue:(double)a3 fullValue:(double)a4
{
  double v6 = self;
  ConversationControlsJoinCallCountdownView.initializeCountdown(with:fullValue:)(a3, a4);
}

- (void)startCountdown
{
  v2 = self;
  ConversationControlsJoinCallCountdownView.startCountdown()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_ringLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_countdownLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_percentageAnimation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_fillColor));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_strokeColor);
}

@end