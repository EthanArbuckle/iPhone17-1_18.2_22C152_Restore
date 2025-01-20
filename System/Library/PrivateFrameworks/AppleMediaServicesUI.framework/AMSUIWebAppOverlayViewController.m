@interface AMSUIWebAppOverlayViewController
- (AMSUIWebAppOverlayViewController)initWithAppAdamID:(id)a3 hostBundleIdentifier:(id)a4;
- (AMSUIWebAppOverlayViewController)initWithCoder:(id)a3;
- (AMSUIWebAppOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)preload;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)loadView;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation AMSUIWebAppOverlayViewController

- (AMSUIWebAppOverlayViewController)initWithAppAdamID:(id)a3 hostBundleIdentifier:(id)a4
{
  uint64_t v4 = sub_21C2BF2C0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_21C2BF2C0();
  return (AMSUIWebAppOverlayViewController *)sub_21C21275C(v4, v6, v7, v8);
}

- (AMSUIWebAppOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_21C2BF2C0();
  }
  id v5 = a4;
  sub_21C212894();
}

- (AMSUIWebAppOverlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21C212960();
}

- (void)loadView
{
  v2 = self;
  sub_21C212A1C();
}

- (id)preload
{
  v2 = self;
  id v3 = sub_21C2135A0();

  return v3;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_21C213624();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AMSUIWebAppOverlayViewController_lockupViewPromise);
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21C21387C();

  return 0;
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21C213AB0();
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_21C213CEC();
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_21C213F84();
}

@end