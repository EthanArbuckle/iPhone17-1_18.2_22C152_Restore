@interface ConversationHUDAppLaunchPillView
- (_TtC15ConversationKit32ConversationHUDAppLaunchPillView)initWithCoder:(id)a3;
- (_TtC15ConversationKit32ConversationHUDAppLaunchPillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ConversationHUDAppLaunchPillView

- (_TtC15ConversationKit32ConversationHUDAppLaunchPillView)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationHUDAppLaunchPillView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ConversationHUDAppLaunchPillView.layoutSubviews()();
}

- (_TtC15ConversationKit32ConversationHUDAppLaunchPillView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_controlsManager));
  outlined destroy of ConversationControlsAppLaunchButtonType((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_buttonType, (void (*)(void))type metadata accessor for ConversationControlsAppLaunchButtonType);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_featureFlags));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_activity, &demangling cache variable for type metadata for Activity?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___backgroundMaterialView));
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___appStoreLockup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___contentHStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___labelsVStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_callToAction));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit32ConversationHUDAppLaunchPillView_menuHostViewController);
}

@end