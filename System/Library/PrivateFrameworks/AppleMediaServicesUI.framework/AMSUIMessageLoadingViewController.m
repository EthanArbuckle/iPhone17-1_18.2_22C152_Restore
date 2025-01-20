@interface AMSUIMessageLoadingViewController
+ (id)placeholderStyleLoadingControllerWithMessage:(id)a3;
- (AMSUIMessageLoadingViewController)init;
- (AMSUIMessageLoadingViewController)initWithCoder:(id)a3;
- (AMSUIMessageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)removeMessage;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AMSUIMessageLoadingViewController

+ (id)placeholderStyleLoadingControllerWithMessage:(id)a3
{
  if (a3) {
    sub_21C2BF2C0();
  }
  id v3 = static MessageLoadingViewController.placeholderStyleLoadingController(message:)();
  swift_bridgeObjectRelease();
  return v3;
}

- (AMSUIMessageLoadingViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21C25BAEC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_21C25BB88();
}

- (void)removeMessage
{
  v2 = self;
  sub_21C25BCB0();
}

- (AMSUIMessageLoadingViewController)init
{
}

- (AMSUIMessageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_21C2BF2C0();
  }
  id v5 = a4;
  MessageLoadingViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMSUIMessageLoadingViewController_loadingController));
  id v3 = (char *)self + OBJC_IVAR___AMSUIMessageLoadingViewController_presentationContext;
  uint64_t v4 = sub_21C2BDD20();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end