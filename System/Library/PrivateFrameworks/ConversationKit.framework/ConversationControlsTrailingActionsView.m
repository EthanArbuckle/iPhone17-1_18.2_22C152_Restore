@interface ConversationControlsTrailingActionsView
- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithFrame:(CGRect)a3;
@end

@implementation ConversationControlsTrailingActionsView

- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsTrailingActionsView.init(coder:)();
}

- (_TtC15ConversationKit39ConversationControlsTrailingActionsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  _s15ConversationKit0A14ControlsRecipeVWOhTm_0((uint64_t)self + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_recipe, (uint64_t (*)(void))type metadata accessor for ConversationControlsRecipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_controlsManager));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView_menuHostViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView____lazy_storage___actionButtonsHStack));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit39ConversationControlsTrailingActionsView____lazy_storage___showCallDetailsButton);
}

@end