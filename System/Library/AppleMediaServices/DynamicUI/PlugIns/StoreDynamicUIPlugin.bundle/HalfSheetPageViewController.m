@interface HalfSheetPageViewController
- (UINavigationItem)navigationItem;
- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)init;
- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissAction:(id)a3;
- (void)loadView;
- (void)primaryAction:(id)a3;
- (void)secondaryAction:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HalfSheetPageViewController

- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_96624();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_96844();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_9690C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_969F0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_97028();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_970FC();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_971E0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_972C4(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_9743C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_974E4();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_9763C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_97718(a3);
}

- (void)dismissAction:(id)a3
{
}

- (void)secondaryAction:(id)a3
{
}

- (void)primaryAction:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin27HalfSheetPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_980A0();
}

- (void).cxx_destruct
{
  sub_982E4((uint64_t)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin27HalfSheetPageViewController_destination], (void (*)(void))type metadata accessor for HalfSheetPageDestination);
  swift_release();
  swift_release();

  swift_release();
  id v3 = *(void **)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin27HalfSheetPageViewController_pageView];
}

@end