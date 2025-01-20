@interface DOCGoToSuggestionsViewController
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (_TtC14RecentsAvocado32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)performKeyCommand:(id)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation DOCGoToSuggestionsViewController

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  id v11 = sub_1000C42B0();
  v12 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DOCGoToSuggestionsCollectionView()), "initWithFrame:collectionViewLayout:", v11, x, y, width, height);

  v13 = (_TtC14RecentsAvocado32DOCGoToSuggestionsViewController **)&v12[OBJC_IVAR____TtC14RecentsAvocadoP33_7DC32410FCC7E2C44CD79C3659C3C01732DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate];
  *v13 = self;
  v13[1] = (_TtC14RecentsAvocado32DOCGoToSuggestionsViewController *)&off_1005BBBC0;

  swift_unknownObjectRelease();
  return v12;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000C4E5C();
}

- (void)viewLayoutMarginsDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToSuggestionsViewController();
  id v2 = v6.receiver;
  [(DOCGoToSuggestionsViewController *)&v6 viewLayoutMarginsDidChange];
  id v3 = objc_msgSend(v2, "collectionView", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 collectionViewLayout];

    [v5 invalidateLayout];
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC14RecentsAvocado32DOCGoToSuggestionsViewController_isFiltering) & 1) != 0)
    return 1;
  else {
    return (*(void **)((char *)&self->super.super.super.super.super.isa
  }
                       + OBJC_IVAR____TtC14RecentsAvocado32DOCGoToSuggestionsViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_1000C7FD0(a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CAF60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CAEF0();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_1000C592C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1004CAF60();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CDB50();
  sub_1004CAEF0();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000C6250(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004CAF60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CAEF0();
  id v10 = a3;
  id v11 = self;
  sub_1000C802C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC14RecentsAvocado32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC14RecentsAvocado32DOCGoToSuggestionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->metrics[OBJC_IVAR____TtC14RecentsAvocado32DOCGoToSuggestionsViewController_metrics + 88];

  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado32DOCGoToSuggestionsViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  id v2 = self;
  id v3 = sub_1000C7660();

  if (v3)
  {
    sub_1000333C8(0, (unint64_t *)&unk_10062F800);
    v4.super.isa = sub_1004CDE10().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)performKeyCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(DOCGoToSuggestionsViewController *)v5 collectionView];
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v9 = v6;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = swift_conformsToProtocol2();
  if (!v8)
  {
LABEL_7:
    __break(1u);
    return;
  }
  (*(void (**)(id, uint64_t, uint64_t))(v8 + 104))(v4, ObjectType, v8);
}

@end