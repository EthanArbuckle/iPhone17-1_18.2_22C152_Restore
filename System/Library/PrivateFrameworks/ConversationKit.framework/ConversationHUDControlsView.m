@interface ConversationHUDControlsView
- (_TtC15ConversationKit27ConversationHUDControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit27ConversationHUDControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ConversationHUDControlsView

- (_TtC15ConversationKit27ConversationHUDControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationHUDControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ConversationHUDControlsView.layoutSubviews()();
}

- (_TtC15ConversationKit27ConversationHUDControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_recipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_controlsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlertTimer));
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlert), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_ephemeralAlert));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView_buttonShelfView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit27ConversationHUDControlsView____lazy_storage___ephemeralAlertNotice);
}

@end