@interface WelcomeOnboardingView
- (_TtC12GameCenterUI21WelcomeOnboardingView)initWithCoder:(id)a3;
- (void)primaryAction;
- (void)secondaryAction;
@end

@implementation WelcomeOnboardingView

- (_TtC12GameCenterUI21WelcomeOnboardingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF660B78();
}

- (void)primaryAction
{
  v2 = self;
  sub_1AF661250();
}

- (void)secondaryAction
{
  v2 = self;
  sub_1AF6616C4();
}

- (void).cxx_destruct
{
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_privacyLinkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_welcomeArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_primaryTrayButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView____lazy_storage___secondaryBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView____lazy_storage___artworkHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_gameCenterIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_whatsNewSubtitleView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI21WelcomeOnboardingView_whatsNewBullets);
}

@end