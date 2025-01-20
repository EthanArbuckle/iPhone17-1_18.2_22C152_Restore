@interface AMSUIDDynamicViewController
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUIDDynamicViewController)init;
- (AMSUIDDynamicViewController)initWithBag:(id)a3 URL:(id)a4;
- (AMSUIDDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4;
- (AMSUIDDynamicViewController)initWithCoder:(id)a3;
- (AMSUIDDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AMSUIDDynamicViewControllerDelegate)delegate;
- (AMSUIMediaContentDelegate)mediaContentDelegate;
- (BOOL)anonymousMetrics;
- (NSDictionary)clientOptions;
- (NSDictionary)internalClientOptions;
- (NSDictionary)metricsOverlay;
- (NSString)mediaClientIdentifier;
- (NSString)title;
- (UINavigationItem)navigationItem;
- (id)animationControllerForDismissedController:(id)a3;
- (id)preload;
- (void)cancelButtonAction;
- (void)dealloc;
- (void)didEnterBackground;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)legacyPurchaseDidSucceed:(id)a3;
- (void)loadView;
- (void)reloadContentViewImpressionItems;
- (void)setAccount:(id)a3;
- (void)setAnonymousMetrics:(BOOL)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInternalClientOptions:(id)a3;
- (void)setMediaClientIdentifier:(id)a3;
- (void)setMediaContentDelegate:(id)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willEnterForeground;
@end

@implementation AMSUIDDynamicViewController

- (AMSUIDDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  return (AMSUIDDynamicViewController *)DynamicViewController.init(bag:bagValue:)((uint64_t)a3, a4);
}

- (AMSUIDDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  uint64_t v4 = sub_1BF464E58();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF464E08();
  uint64_t v7 = swift_unknownObjectRetain();
  return (AMSUIDDynamicViewController *)DynamicViewController.init(bag:URL:)(v7, (uint64_t)v6);
}

- (AMSUIDDynamicViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF409C24();
}

- (void)dealloc
{
  v2 = self;
  DynamicViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR___AMSUIDDynamicViewController_delegate);
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR___AMSUIDDynamicViewController_mediaContentDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMSUIDDynamicViewController____lazy_storage___childNavigationController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (ACAccount)account
{
  v2 = DynamicViewController.account.getter();

  return (ACAccount *)v2;
}

- (void)setAccount:(id)a3
{
  id v5 = a3;
  v6 = self;
  DynamicViewController.account.setter(a3);
}

- (BOOL)anonymousMetrics
{
  return DynamicViewController.anonymousMetrics.getter() & 1;
}

- (void)setAnonymousMetrics:(BOOL)a3
{
}

- (AMSBagProtocol)bag
{
  v2 = (void *)DynamicViewController.bag.getter();

  return (AMSBagProtocol *)v2;
}

- (void)setBag:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  DynamicViewController.bag.setter((uint64_t)a3);
}

- (AMSProcessInfo)clientInfo
{
  v2 = DynamicViewController.clientInfo.getter();

  return (AMSProcessInfo *)v2;
}

- (void)setClientInfo:(id)a3
{
  id v5 = a3;
  v6 = self;
  DynamicViewController.clientInfo.setter(a3);
}

- (NSDictionary)clientOptions
{
  return (NSDictionary *)sub_1BF40A9FC((uint64_t)self, (uint64_t)a2, DynamicViewController.clientOptions.getter);
}

- (void)setClientOptions:(id)a3
{
}

- (AMSUIDDynamicViewControllerDelegate)delegate
{
  v2 = (void *)DynamicViewController.delegate.getter();

  return (AMSUIDDynamicViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  DynamicViewController.delegate.setter();
}

- (AMSUIMediaContentDelegate)mediaContentDelegate
{
  v2 = (void *)DynamicViewController.mediaContentDelegate.getter();

  return (AMSUIMediaContentDelegate *)v2;
}

- (void)setMediaContentDelegate:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  DynamicViewController.mediaContentDelegate.setter();
}

- (NSDictionary)internalClientOptions
{
  return (NSDictionary *)sub_1BF40A9FC((uint64_t)self, (uint64_t)a2, DynamicViewController.internalClientOptions.getter);
}

- (void)setInternalClientOptions:(id)a3
{
}

- (NSString)mediaClientIdentifier
{
  DynamicViewController.mediaClientIdentifier.getter();
  if (v2)
  {
    id v3 = (void *)sub_1BF465F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setMediaClientIdentifier:(id)a3
{
}

- (NSDictionary)metricsOverlay
{
  return (NSDictionary *)sub_1BF40A9FC((uint64_t)self, (uint64_t)a2, DynamicViewController.metricsOverlay.getter);
}

- (void)setMetricsOverlay:(id)a3
{
}

- (id)preload
{
  uint64_t v2 = self;
  id v3 = sub_1BF40AFC4();

  return v3;
}

- (void)reloadContentViewImpressionItems
{
  uint64_t v2 = self;
  sub_1BF40B188();
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1BF414C08;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  DynamicViewController.dismiss(animated:completion:)(a3, v6, v7);
  sub_1BF3CBCFC((uint64_t)v6);
}

- (UINavigationItem)navigationItem
{
  uint64_t v2 = self;
  id v3 = DynamicViewController.navigationItem.getter();

  return (UINavigationItem *)v3;
}

- (NSString)title
{
  uint64_t v2 = self;
  DynamicViewController.title.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1BF465F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
}

- (void)loadView
{
  uint64_t v2 = self;
  DynamicViewController.loadView()();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  DynamicViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  DynamicViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2 = self;
  DynamicViewController.viewWillLayoutSubviews()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  DynamicViewController.viewDidDisappear(_:)(a3);
}

- (void)cancelButtonAction
{
  uint64_t v2 = self;
  sub_1BF3F4B58();
}

- (void)legacyPurchaseDidSucceed:(id)a3
{
  uint64_t v4 = sub_1BF464C98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF464C68();
  v8 = self;
  sub_1BF410A6C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didEnterBackground
{
  uint64_t v2 = self;
  sub_1BF412F4C();
}

- (void)willEnterForeground
{
  uint64_t v2 = self;
  sub_1BF413220();
}

- (AMSUIDDynamicViewController)init
{
}

- (AMSUIDDynamicViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1BF465FA8();
  }
  id v5 = a4;
  DynamicViewController.init(nibName:bundle:)();
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DynamicViewController.animationController(forDismissed:)();

  return 0;
}

@end