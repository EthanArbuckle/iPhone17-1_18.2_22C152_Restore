@interface CycleHistoryFiltersCollectionViewController
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)init;
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)doneAndDismiss;
- (void)viewDidLoad;
@end

@implementation CycleHistoryFiltersCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)init
{
  return (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)sub_2413022AC();
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_selectedItem) = 51;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController____lazy_storage___filterMapping) = 0;
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryFiltersCollectionViewController();
  id v2 = v3.receiver;
  [(CycleHistoryFiltersCollectionViewController *)&v3 viewDidLoad];
  sub_24130274C();
  sub_2413031B0();
  sub_241302C08();
}

- (void)doneAndDismiss
{
  id v5 = self;
  id v2 = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)[(CycleHistoryFiltersCollectionViewController *)v5 presentingViewController];
  if (v2)
  {
    objc_super v3 = v2;
    [(CycleHistoryFiltersCollectionViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (qword_26F5665D8 > (unint64_t)a4)
  {
    v4 = (void *)self;
    char v5 = *((unsigned char *)&unk_26F5665C8 + a4 + 32);
    id v6 = a3;
    id v7 = v4;
    int64_t v8 = *((void *)sub_24120A3FC(v5) + 2);

    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return self;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return qword_26F5665D8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  v12 = sub_241303488(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_241303A28(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_24162BB18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v13 = v12;
  sub_24162BAA8();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_24130445C(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin43CycleHistoryFiltersCollectionViewController_delegate;

  sub_2411CD138((uint64_t)v3);
}

@end