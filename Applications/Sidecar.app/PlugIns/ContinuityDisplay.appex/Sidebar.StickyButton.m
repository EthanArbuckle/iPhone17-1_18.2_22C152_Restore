@interface Sidebar.StickyButton
- (_TtCO17ContinuityDisplay7Sidebar12StickyButton)initWithCoder:(id)a3;
- (void)_buttonDownWithSender:(id)a3;
- (void)_buttonUpWithSender:(id)a3;
- (void)_keyboardButtonGestureTriggeredWithRecognizer:(id)a3;
@end

@implementation Sidebar.StickyButton

- (void)_keyboardButtonGestureTriggeredWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003ECBC(v4);
}

- (void)_buttonDownWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003EE24();
}

- (void)_buttonUpWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10003F08C();
}

- (_TtCO17ContinuityDisplay7Sidebar12StickyButton)initWithCoder:(id)a3
{
  return (_TtCO17ContinuityDisplay7Sidebar12StickyButton *)sub_10003F7A8(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtCO17ContinuityDisplay7Sidebar12StickyButton_doubleTapRecognizer));

  swift_unknownObjectRelease();
}

@end