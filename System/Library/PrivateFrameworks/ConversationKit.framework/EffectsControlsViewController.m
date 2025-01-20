@interface EffectsControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)effectsButtonIsVisible;
- (_TtC15ConversationKit19InCallControlButton)effectsButton;
- (_TtC15ConversationKit29EffectsControlsViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit29EffectsControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setEffectsButtonIsVisible:(BOOL)a3;
@end

@implementation EffectsControlsViewController

- (BOOL)effectsButtonIsVisible
{
  return EffectsControlsViewController.effectsButtonIsVisible.getter() & 1;
}

- (void)setEffectsButtonIsVisible:(BOOL)a3
{
  v4 = self;
  EffectsControlsViewController.effectsButtonIsVisible.setter(a3);
}

- (_TtC15ConversationKit19InCallControlButton)effectsButton
{
  id v2 = EffectsControlsViewController.effectsButton.getter();
  return (_TtC15ConversationKit19InCallControlButton *)v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit29EffectsControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  EffectsControlsViewController.init(coder:)();
}

- (_TtC15ConversationKit29EffectsControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  EffectsControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_effectsBrowserViewController));
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_effectsButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit29EffectsControlsViewController_backgroundBlurView);
}

@end