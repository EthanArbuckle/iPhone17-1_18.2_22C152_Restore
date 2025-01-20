@interface DOCGoToSuggestionsViewController
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (_TtC18DocumentAppIntents32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3;
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
  id v11 = sub_1000C83F8();
  v12 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DOCGoToSuggestionsCollectionView()), "initWithFrame:collectionViewLayout:", v11, x, y, width, height);

  v13 = (_TtC18DocumentAppIntents32DOCGoToSuggestionsViewController **)&v12[OBJC_IVAR____TtC18DocumentAppIntentsP33_71C0D8EBB0064BCF752BF6E72476006132DOCGoToSuggestionsCollectionView_focusableCollectionViewDelegate];
  *v13 = self;
  v13[1] = (_TtC18DocumentAppIntents32DOCGoToSuggestionsViewController *)&off_1005ECF98;

  swift_unknownObjectRelease();
  return v12;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000C8FA4();
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
        + OBJC_IVAR____TtC18DocumentAppIntents32DOCGoToSuggestionsViewController_isFiltering) & 1) != 0)
    return 1;
  else {
    return (*(void **)((char *)&self->super.super.super.super.super.isa
  }
                       + OBJC_IVAR____TtC18DocumentAppIntents32DOCGoToSuggestionsViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_1000CC118(a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004F1860();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F17F0();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)sub_1000C9A74(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1004F1860();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F4510();
  sub_1004F17F0();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1000CA398(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1004F1860();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F17F0();
  id v10 = a3;
  id v11 = self;
  sub_1000CC174();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18DocumentAppIntents32DOCGoToSuggestionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18DocumentAppIntents32DOCGoToSuggestionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->metrics[OBJC_IVAR____TtC18DocumentAppIntents32DOCGoToSuggestionsViewController_metrics + 88];

  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents32DOCGoToSuggestionsViewController_suggestionsTableViewDelegate);
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
  id v3 = sub_1000CB7A8();

  if (v3)
  {
    sub_100032070(0, (unint64_t *)&unk_10065F2C0);
    v4.super.isa = sub_1004F47D0().super.isa;
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