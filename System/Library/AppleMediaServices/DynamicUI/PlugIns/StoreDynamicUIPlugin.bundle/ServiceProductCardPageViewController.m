@interface ServiceProductCardPageViewController
- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)init;
- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissPressed:(id)a3;
- (void)loadView;
- (void)offerPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ServiceProductCardPageViewController

- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D94FC();
}

- (void)loadView
{
  v2 = self;
  sub_D96D8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_D9B64((SEL *)&selRef_viewDidLoad, (uint64_t (*)(uint64_t, void *))&ViewControllerPresenter.viewDidLoad());
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_D9830(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_D9958(a3, (SEL *)&selRef_viewDidDisappear_, (uint64_t (*)(uint64_t, void *))&ViewControllerPresenter.viewDidDisappear());
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_D9958(a3, (SEL *)&selRef_viewWillAppear_, (uint64_t (*)(uint64_t, void *))&ViewControllerPresenter.viewWillAppear());
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_D9A40(a3);
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_D9B64((SEL *)&selRef_didReceiveMemoryWarning, (uint64_t (*)(uint64_t, void *))&ViewControllerPresenter.viewDidReceiveMemoryWarning());
}

- (void)dismissPressed:(id)a3
{
}

- (void)offerPressed:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_DA434();
}

- (void).cxx_destruct
{
  sub_DA6AC((uint64_t)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController_destination], (void (*)(void))type metadata accessor for ServiceProductCardPageDestination);
  swift_release();
  swift_release();
  id v3 = *(void **)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin36ServiceProductCardPageViewController_overlayViewController];
}

@end