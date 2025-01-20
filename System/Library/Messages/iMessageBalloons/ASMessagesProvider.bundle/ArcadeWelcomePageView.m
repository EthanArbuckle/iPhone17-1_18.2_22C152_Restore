@interface ArcadeWelcomePageView
@end

@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ArcadeWelcomePageView_continueButton));
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider21ArcadeWelcomePageView_delegate;

  sub_174B8((uint64_t)v3);
}

@end