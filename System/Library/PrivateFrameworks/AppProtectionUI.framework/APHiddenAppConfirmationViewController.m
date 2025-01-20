@interface APHiddenAppConfirmationViewController
- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithCoder:(id)a3;
- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)buttonTrayForAssistant:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation APHiddenAppConfirmationViewController

- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_247E1018C();
}

- (_TtC15AppProtectionUI37APHiddenAppConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_247E1018C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_247E0FE04(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_247E0FF18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_app));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button));
  id v3 = (char *)self + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate;

  sub_247E0D020((uint64_t)v3);
}

- (id)buttonTrayForAssistant:(id)a3
{
  id v4 = a3;
  v5 = self;
  id result = [(APHiddenAppConfirmationViewController *)v5 view];
  if (result)
  {
    id v7 = result;
    type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
    id v8 = objc_retainAutoreleaseReturnValue(*(id *)(swift_dynamicCastClassUnconditional()
                                                 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end