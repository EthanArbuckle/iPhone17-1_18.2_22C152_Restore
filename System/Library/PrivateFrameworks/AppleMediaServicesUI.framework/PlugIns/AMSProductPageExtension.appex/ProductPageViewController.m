@interface ProductPageViewController
- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4;
- (_TtC23AMSProductPageExtension25ProductPageViewController)initWithCoder:(id)a3;
- (_TtC23AMSProductPageExtension25ProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation ProductPageViewController

- (void)loadView
{
  v2 = self;
  sub_1000059F8();
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  uint64_t v6 = sub_100006C60();
  id v7 = a3;
  v8 = self;
  sub_100005AE0(v7, v6);

  swift_bridgeObjectRelease();
  return 0;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100005B84();
}

- (_TtC23AMSProductPageExtension25ProductPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006CA0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC23AMSProductPageExtension25ProductPageViewController *)sub_100006048(v5, v7, a4);
}

- (_TtC23AMSProductPageExtension25ProductPageViewController)initWithCoder:(id)a3
{
  return (_TtC23AMSProductPageExtension25ProductPageViewController *)sub_1000061AC(a3);
}

- (void).cxx_destruct
{
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  if (a4) {
    uint64_t v8 = sub_100006C60();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_1000062EC((uint64_t)v11, v8);

  swift_bridgeObjectRelease();
}

@end