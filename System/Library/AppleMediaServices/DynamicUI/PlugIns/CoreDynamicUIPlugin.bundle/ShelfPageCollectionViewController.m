@interface ShelfPageCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)init;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionViewDidScroll:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ShelfPageCollectionViewController

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_66950();
}

- (void)loadView
{
  v2 = self;
  sub_66D48();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_66E28();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_66EA8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_66FC4(a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_66FC4(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_68308();
}

- (void).cxx_destruct
{
  sub_B990((uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController_delegate]);
  sub_18234(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController__viewDidLayoutSubviews]);
  sub_18234(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController_visibleBoundsCalculator]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_616C((uint64_t)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin33ShelfPageCollectionViewController_spacingModel]);
  swift_release();

  swift_release();
}

- (void)collectionViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_694D0(v4);
}

- (void)collectionView:(id)a3 didEndDisplayingItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_8EA10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (void (*)(char *, uint64_t, uint64_t))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_8E9D0();
  id v10 = a3;
  v11 = self;
  sub_69690((uint64_t)v10, v9);

  (*(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_8EA10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8E9D0();
  id v10 = a3;
  v11 = self;
  sub_69EFC((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_8EA10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8E9D0();
  id v10 = a3;
  v11 = self;
  sub_6AF84(v10, (uint64_t)v9);
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

@end