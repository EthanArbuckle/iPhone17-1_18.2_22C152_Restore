@interface PregnancyOnboardingConfirmationViewController
- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingConfirmationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24131A0DC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(OBBaseWelcomeController *)&v7 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);
  }
  sub_24162CEF8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(PregnancyOnboardingConfirmationViewController *)&v8 viewDidDisappear:v3];
  sub_24162CEE8();
  id v5 = sub_241319BEC();
  objc_msgSend(v5, sel_hidesBusyIndicator, v8.receiver, v8.super_class);

  id v6 = objc_msgSend(v4, sel_navigationController);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_setNavigationBarHidden_, 0);

    id v4 = v7;
  }
}

- (void)hxui_primaryFooterButtonTapped
{
  v2 = self;
  id v3 = sub_241319BEC();
  objc_msgSend(v3, sel_showsBusyIndicator);

  char v4 = *((unsigned char *)&v2->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController_onboardingStep);
  swift_retain();
  sub_2415E7E28(v4, 2);

  swift_release();
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController____lazy_storage___primaryButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController_animationView);
}

@end