@interface FullSheetOverlayPageViewController
- (UINavigationItem)navigationItem;
- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)init;
- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissButtonPressed:(id)a3;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FullSheetOverlayPageViewController

- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8A78C();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_8A9AC();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_8AA74();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_8AB4C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_8AD64();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_8AE38();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_8AF1C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_8B000(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_8B178();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_8B220();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_8B330();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_8B40C(a3);
}

- (void)dismissButtonPressed:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_10B110();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_8BCBC();

  sub_36518((uint64_t)v6, &qword_152E40);
}

- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_8C094();
}

- (void).cxx_destruct
{
  sub_8C33C((uint64_t)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController_destination], (void (*)(void))type metadata accessor for FullSheetOverlayPageDestination);
  swift_release();
  swift_release();

  swift_release();
  id v3 = *(void **)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin34FullSheetOverlayPageViewController_pageView];
}

@end