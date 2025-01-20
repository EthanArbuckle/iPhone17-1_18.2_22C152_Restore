@interface SystemApertureControlsView
- (_TtC15ConversationKit26SystemApertureControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit26SystemApertureControlsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SystemApertureControlsView

- (_TtC15ConversationKit26SystemApertureControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemApertureControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureControlsView.layoutSubviews()();
}

- (_TtC15ConversationKit26SystemApertureControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_controlsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlertTimer));
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlert), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_ephemeralAlert));
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_recipe);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView____lazy_storage___ephemeralAlertNotice));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_buttonShelfView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_trailingActionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_leadingAccessoryView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit26SystemApertureControlsView_appLaunchPillView);
}

@end