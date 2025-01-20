@interface CycleTimelineCollectionViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)collectionViewLayout;
- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
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
@end

@implementation CycleTimelineCollectionViewController

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2412C61C4();
}

- (void)dealloc
{
  v2 = self;
  sub_2412BE26C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_calendarCache));
  swift_unknownObjectRelease();
  sub_2411CD138((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_cycleLoggingDataProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_today;
  uint64_t v4 = sub_241631AC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2412C6100((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController_indexableDays, (uint64_t (*)(void))sub_2411FEB18);
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)collectionViewLayout
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = [(CycleTimelineCollectionViewController *)&v5 collectionViewLayout];
  type metadata accessor for CycleTimelineCollectionViewLayout();
  id v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2412BE864();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_2412BECF8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_2412BEE94(a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2412BEFAC((uint64_t)a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2412BF5F4();
}

- (void)didReceiveSignificantTimeChangeNotification
{
  v2 = self;
  sub_2412C001C();
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
  v12 = (void *)sub_2412C0CE8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  sub_2411FEB18();
  sub_241631AC8();
  sub_2412C60B8((unint64_t *)&unk_268CFC5C0, MEMORY[0x263F090E8]);
  id v6 = a3;
  uint64_t v7 = self;
  sub_241632C68();

  return v9;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2412C627C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_2412C6A2C(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_2412C70C0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = (uint64_t (*)(char *, uint64_t))a3;
  id v5 = self;
  sub_2412C4C14(v4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2412C733C();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2412C7548();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2412C7600(a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2412C77F8();
}

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin37CycleTimelineCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2412C79EC(a4, "[%{public}s] splitViewController willHide %ld", (uint64_t)&unk_26F56D748, (uint64_t)sub_2412C80C4, (uint64_t)&unk_26F56D760);
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2412C79EC(a4, "[%{public}s] splitViewController willShow %ld", (uint64_t)&unk_26F56D6F8, (uint64_t)sub_2412C80C4, (uint64_t)&unk_26F56D710);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_2412C5D1C(v4);

  return self & 1;
}

@end