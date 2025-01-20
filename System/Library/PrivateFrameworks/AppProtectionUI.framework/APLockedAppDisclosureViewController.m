@interface APLockedAppDisclosureViewController
- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithCoder:(id)a3;
- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)buttonTrayForAssistant:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation APLockedAppDisclosureViewController

- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_247E10668();
}

- (_TtC15AppProtectionUI35APLockedAppDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_247E10668();
}

- (id)buttonTrayForAssistant:(id)a3
{
  id v4 = a3;
  v5 = self;
  id result = [(APLockedAppDisclosureViewController *)v5 view];
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

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  v2 = (char *)v5.receiver;
  [(APLockedAppDisclosureViewController *)&v5 viewDidLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant];
  id v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController], sel_scrollView, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_performAdjustmentsForScrollView_, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button));
  id v3 = (char *)self + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate;

  sub_247E0D020((uint64_t)v3);
}

@end