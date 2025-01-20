@interface InAppPurchaseInstallPageViewController
- (_TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5B0950();
}

- (void)willEnterForeground
{
  v2 = self;
  sub_5AB92C(1);
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_isInBackground) = 0;
}

- (void)didEnterBackground
{
  v2 = self;
  sub_5AB92C(0);
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_isInBackground) = 1;
  *((unsigned char *)&v2->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_didProgressWhileForegrounded) = 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_5AC1D0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_5AC448(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_5AC8E0((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_5AC6B4(a3);
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_5AC8E0((SEL *)&selRef_as_viewDidBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didAppear(_:));
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_5ACAE0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_5ACCE0(a3);
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_5AC8E0((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:));
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_5ACF64(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_5AD178();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(InAppPurchaseInstallPageViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
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

- (_TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_installOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_preInstallFreeOfferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_preInstallPaidOfferView));
  swift_release();
  swift_unknownObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_appAdamId, (uint64_t *)&unk_952560);
  swift_release();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_lifecycleObserver, (uint64_t *)&unk_974F50);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider38InAppPurchaseInstallPageViewController_overlayViewController);
}

@end