@interface InteractiveTimelineCollectionViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSString)description;
- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)collectionViewLayout;
- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveSignificantTimeChangeNotification;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation InteractiveTimelineCollectionViewController

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_241161A00();
  sub_241160860();
  swift_bridgeObjectRelease();
  sub_241160860();
  sub_241161690();

  v4 = (void *)sub_2411606F0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24105E27C();
}

- (void)dealloc
{
  v2 = self;
  sub_241056CB8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super._tabElement
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_nextCollectionViewLayoutConfig));
  swift_unknownObjectRelease();
  sub_241060128((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_timelineDataProvider);
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_today;
  uint64_t v4 = sub_2411605E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24106002C((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_indexableDays, (uint64_t (*)(void))sub_2410346F4);
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)collectionViewLayout
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = [(InteractiveTimelineCollectionViewController *)&v5 collectionViewLayout];
  type metadata accessor for InteractiveTimelineCollectionViewLayout();
  id v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_241057118();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_2410574E4(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_241057680(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_241057798((uint64_t)a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2410584C0();
}

- (void)didReceiveSignificantTimeChangeNotification
{
  v2 = self;
  sub_241059158();
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24115CE00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_24105A25C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  sub_2410346F4(0);
  sub_2411605E0();
  sub_24105FDB0((unint64_t *)&qword_268CF09A0, MEMORY[0x263F090E8]);
  id v6 = a3;
  uint64_t v7 = self;
  sub_241161460();

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24115CE00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v10 = a3;
  v11 = self;
  sub_24105E348((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24115CE00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_24105E734(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24115CE00();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController_state) == 2)
  {
    id v12 = a3;
    id v13 = a4;
    uint64_t v14 = self;
    sub_24105B438();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24105CA34(v4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24105EE1C();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24105F0D0();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24105F188(a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24105F42C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_24105D30C(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin43InteractiveTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_24105D810(v4);

  return self & 1;
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24105F6D4(a4, "[%{public}s] splitViewController willHide %ld", (uint64_t)&unk_26F555928, (uint64_t)sub_24105FDAC, (uint64_t)&unk_26F555940);
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24105F6D4(a4, "[%{public}s] splitViewController willShow %ld", (uint64_t)&unk_26F5558D8, (uint64_t)sub_24105FDAC, (uint64_t)&unk_26F5558F0);
}

@end