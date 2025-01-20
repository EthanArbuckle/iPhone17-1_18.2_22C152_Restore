@interface ServiceProductBadgedPageViewController
- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)init;
- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissPressed:(id)a3;
- (void)loadView;
- (void)offerPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ServiceProductBadgedPageViewController

- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D09B0();
}

- (void)loadView
{
  v2 = self;
  sub_D0B8C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_D0C70();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_D0E88();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_D11B0();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_D1294();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_D1378(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_D14F0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_D1598();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_D1700();
}

- (void)dismissPressed:(id)a3
{
}

- (void)offerPressed:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_D1EE0();
}

- (void).cxx_destruct
{
  sub_D2188((uint64_t)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController_destination], (void (*)(void))type metadata accessor for ServiceProductBadgedPageDestination);
  swift_release();
  swift_release();

  swift_release();
  id v3 = *(void **)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin38ServiceProductBadgedPageViewController_pageView];
}

@end