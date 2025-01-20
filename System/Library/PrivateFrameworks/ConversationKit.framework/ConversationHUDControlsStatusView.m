@interface ConversationHUDControlsStatusView
- (_TtC15ConversationKit23ConversationDetailsView)conversationDetailsView;
- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithCoder:(id)a3;
- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setConversationDetailsView:(id)a3;
- (void)setupRootView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ConversationHUDControlsStatusView

- (_TtC15ConversationKit23ConversationDetailsView)conversationDetailsView
{
  v2 = self;
  id v3 = ConversationHUDControlsStatusView.conversationDetailsView.getter();

  return (_TtC15ConversationKit23ConversationDetailsView *)v3;
}

- (void)setConversationDetailsView:(id)a3
{
  id v4 = a3;
  v5 = self;
  ConversationHUDControlsStatusView.conversationDetailsView.setter((uint64_t)v4);
}

- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationHUDControlsStatusView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ConversationHUDControlsStatusView.traitCollectionDidChange(_:)(v9);
}

- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_recipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_controlsManager));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_menuHostViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___conversationStatusHStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___trailingActionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___conversationDetailsView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_leadingAccessoryView);
}

- (void)setupRootView
{
  v2 = self;
  ConversationHUDControlsStatusView.setupRootView()();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v14 = (void *)ConversationHUDControlsStatusView.pointerInteraction(_:regionFor:defaultRegion:)((UIPointerInteraction)v8, v12, v13);

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v10 = (void *)ConversationHUDControlsStatusView.pointerInteraction(_:styleFor:)((UIPointerInteraction)v6, v9);

  return v10;
}

@end