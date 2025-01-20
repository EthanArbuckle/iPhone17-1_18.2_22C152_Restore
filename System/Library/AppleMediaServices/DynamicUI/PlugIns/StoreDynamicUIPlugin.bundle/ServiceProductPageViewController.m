@interface ServiceProductPageViewController
- (UINavigationItem)navigationItem;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)init;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissAction:(id)a3;
- (void)loadView;
- (void)primaryAction:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
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

@implementation ServiceProductPageViewController

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_EB280();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_EB4A0();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_EB568();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_EB64C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  sub_EB864();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  sub_EB94C();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_EBA44();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_EBB28(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_EBCA0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_EBD48();
}

- (void)didReceiveMemoryWarning
{
  v2 = self;
  sub_EBF28();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_EC004(a3);
}

- (void)dismissAction:(id)a3
{
}

- (void)primaryAction:(id)a3
{
}

- (void)secondaryAction:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_ECF6C();
}

- (void).cxx_destruct
{
  sub_ED524((uint64_t)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination], (void (*)(void))type metadata accessor for ServiceProductPageDestination);
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  id v3 = *(void **)&self->didApply[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_ED1C0();
}

@end