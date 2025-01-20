@interface GalleryViewController
- (BOOL)prefersStatusBarHidden;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC18ASMessagesProvider21GalleryViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider21GalleryViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC18ASMessagesProvider21GalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)dismissFrom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)swipeStateChangedOn:(id)a3;
- (void)tapStateChangedOn:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GalleryViewController

- (_TtC18ASMessagesProvider21GalleryViewController)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider21GalleryViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  id v3 = [(GalleryViewController *)v2 navigationController];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 barHideOnTapGestureRecognizer];

    [v5 removeTarget:v2 action:0];
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for GalleryViewController();
  [(GalleryViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)as_viewWillBecomeFullyVisible
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_66DB84();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_66DEB0((uint64_t)a3);
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  id v3 = [(GalleryViewController *)v2 navigationController];
  if (v3)
  {
    v4 = v3;
    unsigned __int8 v5 = [v3 isNavigationBarHidden];

    LOBYTE(v3) = v5;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (void)tapStateChangedOn:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_66E04C(v4);
}

- (void)dismissFrom:(id)a3
{
}

- (void)swipeStateChangedOn:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  if ([v4 state] == (char *)&def_270DE0 + 3) {
    [(GalleryViewController *)v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC18ASMessagesProvider21GalleryViewController_artwork);
  if (!(v4 >> 62)) {
    return *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_77EB40();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_66E668(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  [a3 frame];
  double v11 = v10;
  double v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  type metadata accessor for ArtworkCollectionViewCell();
  double v12 = *(void **)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC18ASMessagesProvider25ArtworkCollectionViewCell_artworkView);
  sub_76E300();
  sub_7133C();
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  id v16 = v12;
  sub_76F150();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_66E320();
}

- (_TtC18ASMessagesProvider21GalleryViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC18ASMessagesProvider21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider21GalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC18ASMessagesProvider21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end