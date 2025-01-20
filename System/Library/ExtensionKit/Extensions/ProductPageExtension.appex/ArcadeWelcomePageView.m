@interface ArcadeWelcomePageView
@end

@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_continueButton));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_delegate;

  sub_10000F76C((uint64_t)v3);
}

@end