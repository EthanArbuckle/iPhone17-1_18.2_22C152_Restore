@interface InAppPurchaseInstallPageViewController
- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)askToBuyRequestNotificationReceived:(id)a3;
- (void)didCompletePurchase:(id)a3;
- (void)didEnterBackground;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willEnterForeground;
@end

@implementation InAppPurchaseInstallPageViewController

- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005BFEE0();
}

- (void)willEnterForeground
{
  v2 = self;
  sub_1005BA790(1);
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 0;
}

- (void)didEnterBackground
{
  v2 = self;
  sub_1005BA790(0);
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_isInBackground) = 1;
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_didProgressWhileForegrounded) = 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005BB034();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1005BB2AC(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1005BB744((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1005BB518(a3);
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1005BB744((SEL *)&selRef_as_viewDidBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didAppear(_:));
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1005BB944();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1005BBB44(a3);
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1005BB744((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1005BBDC8(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1005BBFDC();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(InAppPurchaseInstallPageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)askToBuyRequestNotificationReceived:(id)a3
{
}

- (void)didCompletePurchase:(id)a3
{
}

- (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_installOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_preInstallFreeOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_preInstallPaidOfferView));
  swift_release();
  swift_unknownObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_appAdamId, &qword_10093AE50);
  swift_release();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_lifecycleObserver, (uint64_t *)&unk_100941B70);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38InAppPurchaseInstallPageViewController_overlayViewController);
}

@end