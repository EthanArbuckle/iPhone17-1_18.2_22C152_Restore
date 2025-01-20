@interface ShelfPageViewController
- (NSString)title;
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)init;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ShelfPageViewController

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_7F12C();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_7F234();

  return (UINavigationItem *)v3;
}

- (NSString)title
{
  v2 = self;
  sub_7F370();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_8F9A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_8F9D0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_7F4E0(v4, v6);
}

- (void)loadView
{
  v2 = self;
  sub_7F5FC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_7F6DC((uint64_t)a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_7F7B0();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_7F87C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_7F964(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_7FA5C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_7FB84(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_7FD10();
}

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin23ShelfPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_8283C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end