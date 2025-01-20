@interface UberedCollectionViewController
- (int64_t)preferredStatusBarStyle;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UberedCollectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1005B5A04();
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1005B5C1C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1005B5D24(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1005B61B0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1005B62F4(a3);
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1005B6840();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  id v4 = v5.receiver;
  [(StoreCollectionViewController *)&v5 viewDidDisappear:v3];
  sub_100759190();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1005B6990(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1005B6B28();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UberedCollectionViewController();
  v2 = v3.receiver;
  [(UberedCollectionViewController *)&v3 viewSafeAreaInsetsDidChange];
  v2[OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_contentInsetsInvalid] = 1;
}

- (int64_t)preferredStatusBarStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_statusBarStyle);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberScrollObserver))
  {
    type metadata accessor for UberScrollObserver();
    sub_1005B7910(&qword_100951DE8, (void (*)(uint64_t))type metadata accessor for UberScrollObserver);
    id v7 = a3;
    v8 = self;
    swift_retain();
    sub_100759D60();

    swift_release();
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberScrollObserver))
  {
    id v4 = a3;
    objc_super v5 = self;
    swift_retain();
    sub_100581A54(v4);

    swift_release();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1005B7388((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30UberedCollectionViewController_uberHeaderView));

  swift_release();
}

@end