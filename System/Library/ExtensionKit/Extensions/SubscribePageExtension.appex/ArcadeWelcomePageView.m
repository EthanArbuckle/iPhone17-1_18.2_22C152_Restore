@interface ArcadeWelcomePageView
@end

@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_continueButton));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_delegate;

  sub_10000FB1C((uint64_t)v3);
}

@end