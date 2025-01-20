@interface ShelfPageCollectionLayoutViewController
- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)init;
- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionViewDidScroll:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ShelfPageCollectionLayoutViewController

- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_61928();
}

- (void)loadView
{
  v2 = self;
  sub_61A38();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_61B28();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_61C04(a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_61C04(a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_61CB4();
}

- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_63408();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_18234(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin39ShelfPageCollectionLayoutViewController_artworkFetcher]);
  swift_release();

  swift_release();

  swift_release();
}

- (void)collectionViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_63598();
}

@end