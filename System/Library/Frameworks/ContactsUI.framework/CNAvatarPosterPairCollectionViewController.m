@interface CNAvatarPosterPairCollectionViewController
- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCoder:(id)a3;
- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7;
- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4;
- (void)pageControlDidChangePage:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(void *)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNAvatarPosterPairCollectionViewController

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithConfiguration:(id)a3 contact:(id)a4 contactForSharedProfile:(id)a5 mode:(int64_t)a6 delegate:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  return (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)sub_18B70D5E4(v10, v11, v12, a6);
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18B718AAC();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModelSubscriber))
  {
    id v3 = self;
    swift_retain();
    sub_18B984668();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  [(CNAvatarPosterPairCollectionViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contact));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_contactForSharedProfile));
  sub_18B66EA04((uint64_t)self + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_centeredPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_addPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_lastPosterConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_layout));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController____lazy_storage___feedbackGenerator);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18B70DC04();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[CNAvatarPosterPairCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_18B719158;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_18B70E0C4;
  v11[3] = &block_descriptor_124;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  objc_msgSend(a4, sel_animateAlongsideTransition_completion_, v9, 0);
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewController();
  id v2 = v3.receiver;
  [(CNAvatarPosterPairCollectionViewController *)&v3 viewWillLayoutSubviews];
  sub_18B713B10();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_18B70E2B4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_18B70ED14(a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = v6;
  sub_18B9846D8();

  swift_release();
  swift_release();
  if (v12 >> 62)
  {
    sub_18B984478();
    int64_t v10 = sub_18B986788();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v10 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18B983D68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  int64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B983D08();
  id v11 = a3;
  unint64_t v12 = self;
  v13 = (void *)sub_18B70EF3C(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  sub_18B985E68();
  uint64_t v7 = sub_18B983D68();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B983D08();
  id v12 = a3;
  v13 = self;
  id v14 = sub_18B70F430(v12);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_18B983D68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B983D08();
  id v11 = a3;
  id v12 = self;
  sub_18B718BA0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_18B7106E4(v6, a4);
}

- (void)pageControlDidChangePage:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_18B714544(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_18B715AF0(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  uint64_t v9 = self;
  sub_18B718D00(&a5->x, x);
}

- (void)scrollViewDidEndScrollingAnimation:(void *)a3
{
  int v3 = a1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling];
  a1[OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling] = 0;
  if (v3 == 1)
  {
    id v5 = a3;
    id v6 = a1;
    sub_18B71489C(0, 1);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    char v5 = *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling);
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC10ContactsUI42CNAvatarPosterPairCollectionViewController_isScrollingOrSettling) = 0;
    if (v5)
    {
      id v6 = a3;
      id v7 = self;
      sub_18B71489C(0, 1);
    }
  }
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10ContactsUI42CNAvatarPosterPairCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end