@interface CallAgainHUDView
- (UIButton)callBackButton;
- (UIButton)closeButton;
- (UIButton)videoMessageButton;
- (_TtC15ConversationKit16CallAgainHUDView)initWithCoder:(id)a3;
- (_TtC15ConversationKit16CallAgainHUDView)initWithFrame:(CGRect)a3;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)layoutSubviews;
@end

@implementation CallAgainHUDView

- (UIButton)callBackButton
{
  id v2 = CallAgainHUDView.callBackButton.getter();
  return (UIButton *)v2;
}

- (UIButton)closeButton
{
  id v2 = CallAgainHUDView.closeButton.getter();
  return (UIButton *)v2;
}

- (UIButton)videoMessageButton
{
  id v2 = CallAgainHUDView.videoMessageButton.getter();
  return (UIButton *)v2;
}

- (_TtC15ConversationKit16CallAgainHUDView)initWithCoder:(id)a3
{
  id v3 = a3;
  CallAgainHUDView.init(coder:)();
}

- (void)layoutSubviews
{
  id v2 = self;
  CallAgainHUDView.layoutSubviews()();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  CallAgainHUDView.handleContentSizeCategoryDidChange(_:)();

  outlined destroy of Notification?((uint64_t)v7);
}

- (_TtC15ConversationKit16CallAgainHUDView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_recipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_bottomButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_avatarBottomConstraint));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_callTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_avatarStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_videoMessageStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_callBackButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_videoMessageButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_effectsView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit16CallAgainHUDView_showCallDetailsButton);
}

@end