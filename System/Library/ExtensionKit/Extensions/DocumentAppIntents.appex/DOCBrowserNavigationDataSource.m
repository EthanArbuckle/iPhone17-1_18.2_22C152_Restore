@interface DOCBrowserNavigationDataSource
- (NSArray)columnViewControllers;
- (NSArray)containerControllers;
- (NSArray)currentContainers;
- (NSArray)currentViewControllers;
- (NSString)description;
- (NSString)shortDebugID;
- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator;
- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)init;
- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)initWithConfiguration:(id)a3 sourceObserver:(id)a4;
- (_TtP18DocumentAppIntents42DOCBrowserNavigationDataSourceItemProvider_)itemProvider;
- (_TtP18DocumentAppIntents44DOCBrowserNavigationDataSourceUpdateObserver_)updateObserver;
- (void)hierarchyController:(id)a3 didAppend:(id)a4 animated:(BOOL)a5;
- (void)hierarchyController:(id)a3 didPopLocations:(int64_t)a4 animated:(BOOL)a5;
- (void)hierarchyController:(id)a3 didPrepend:(id)a4 source:(id)a5;
- (void)hierarchyController:(id)a3 didReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6;
- (void)hierarchyController:(id)a3 didReveal:(id)a4 source:(id)a5;
- (void)hierarchyController:(id)a3 didSet:(id)a4 animated:(BOOL)a5;
- (void)hierarchyController:(id)a3 didUpdateLastDisplayedLocationPath:(id)a4 anchorLocation:(id)a5 source:(id)a6;
- (void)hierarchyController:(id)a3 prepareByDismissingSearchWithCompletion:(id)a4;
- (void)hierarchyController:(id)a3 prepareControllersFor:(id)a4 :(id)a5 isUserInteraction:(BOOL)a6 isBrowsingTrash:(BOOL)a7 completion:(id)a8;
- (void)hierarchyController:(id)a3 willAppend:(id)a4 animated:(BOOL)a5;
- (void)hierarchyController:(id)a3 willPopLocations:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)hierarchyController:(id)a3 willReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)hierarchyController:(id)a3 willSet:(id)a4 animated:(BOOL)a5;
- (void)popLastViewController;
- (void)setColumnViewControllers:(id)a3;
- (void)setContainerControllers:(id)a3;
- (void)setCurrentContainers:(id)a3;
- (void)setCurrentViewControllers:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setShortDebugID:(id)a3;
- (void)setUpdateObserver:(id)a3;
@end

@implementation DOCBrowserNavigationDataSource

- (NSArray)containerControllers
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_containerControllers);
  swift_beginAccess();
  if (*v2)
  {
    type metadata accessor for DOCBrowserContainerController();
    swift_bridgeObjectRetain();
    v3.super.isa = sub_1004F47D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSArray *)v3.super.isa;
}

- (void)setContainerControllers:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for DOCBrowserContainerController();
    uint64_t v3 = sub_1004F47F0();
  }
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_containerControllers);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)columnViewControllers
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_columnViewControllers))
  {
    type metadata accessor for DOCColumnViewController(0);
    swift_bridgeObjectRetain();
    v2.super.isa = sub_1004F47D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)setColumnViewControllers:(id)a3
{
  if (a3)
  {
    type metadata accessor for DOCColumnViewController(0);
    v4 = (objc_class *)sub_1004F47F0();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_columnViewControllers) = v4;

  swift_bridgeObjectRelease();
}

- (NSArray)currentViewControllers
{
  NSArray v2 = self;
  sub_10020B32C();

  sub_100032070(0, (unint64_t *)&qword_10065D760);
  v3.super.isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)setCurrentViewControllers:(id)a3
{
  sub_100032070(0, (unint64_t *)&qword_10065D760);
  unint64_t v4 = sub_1004F47F0();
  v5 = self;
  sub_10020B594(v4);
}

- (NSArray)currentContainers
{
  swift_beginAccess();
  type metadata accessor for DOCBrowserContainerController();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setCurrentContainers:(id)a3
{
  type metadata accessor for DOCBrowserContainerController();
  uint64_t v4 = sub_1004F47F0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_currentContainers);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)popLastViewController
{
  NSArray v2 = self;
  sub_10020B7E4();
}

- (NSString)shortDebugID
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1004F44D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setShortDebugID:(id)a3
{
  uint64_t v4 = sub_1004F4510();
  uint64_t v6 = v5;
  v7 = self;
  sub_10020BAAC(v4, v6);
}

- (_TtP18DocumentAppIntents44DOCBrowserNavigationDataSourceUpdateObserver_)updateObserver
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18DocumentAppIntents44DOCBrowserNavigationDataSourceUpdateObserver_ *)Strong;
}

- (void)setUpdateObserver:(id)a3
{
}

- (_TtP18DocumentAppIntents42DOCBrowserNavigationDataSourceItemProvider_)itemProvider
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP18DocumentAppIntents42DOCBrowserNavigationDataSourceItemProvider_ *)Strong;
}

- (void)setItemProvider:(id)a3
{
}

- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource *)sub_100217984(v5, v6);

  return v7;
}

- (NSString)description
{
  NSString v2 = self;
  sub_10020D0E4();

  NSString v3 = sub_1004F44D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)init
{
  result = (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_historyDataSource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_sourceObserver));
  swift_bridgeObjectRelease();
  sub_100037E24((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_updateObserver);
  NSString v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_itemProvider;

  sub_100037E24((uint64_t)v3);
}

- (void)hierarchyController:(id)a3 prepareByDismissingSearchWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100217BF8((uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    id v5 = self;
    id v6 = [v4 hierarchyChangeTransitionCoordinator];

    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = 0;
  }

  return (UIViewControllerTransitionCoordinator *)v6;
}

- (void)hierarchyController:(id)a3 prepareControllersFor:(id)a4 :(id)a5 isUserInteraction:(BOOL)a6 isBrowsingTrash:(BOOL)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  sub_100032070(0, &qword_1006580B0);
  unint64_t v14 = sub_1004F47F0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  id v16 = a3;
  id v17 = a5;
  v18 = self;
  sub_10021805C(v14, a5, a6, a7, (uint64_t)sub_10021AB38, v15);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)hierarchyController:(id)a3 willSet:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  v8 = self;
  sub_100218258(a5);
}

- (void)hierarchyController:(id)a3 didSet:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  sub_100032070(0, (unint64_t *)&qword_10065D760);
  unint64_t v8 = sub_1004F47F0();
  id v9 = a3;
  v10 = self;
  sub_10020E178(v8, 0, v5);

  swift_bridgeObjectRelease();
}

- (void)hierarchyController:(id)a3 willAppend:(id)a4 animated:(BOOL)a5
{
  type metadata accessor for DOCBrowserContainerController();
  uint64_t v9 = swift_dynamicCastClass();
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = a4;
    id v12 = a3;
    v13 = self;
    sub_100218680((uint64_t)v12, (uint64_t)v13, v10);
    sub_100218258(a5);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)hierarchyController:(id)a3 didAppend:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  type metadata accessor for DOCBrowserContainerController();
  uint64_t v9 = swift_dynamicCastClass();
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = a4;
    id v12 = a3;
    v13 = self;
    unint64_t v14 = sub_100218680((uint64_t)v12, (uint64_t)v13, v10);
    sub_10020E178(v14, v15, v5);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)hierarchyController:(id)a3 willReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  id v11 = _Block_copy(a7);
  sub_100032070(0, (unint64_t *)&qword_10065D760);
  unint64_t v12 = sub_1004F47F0();
  _Block_copy(v11);
  id v13 = a3;
  unint64_t v14 = self;
  sub_100218B6C((int)v13, a4, v12, a6, (uint64_t)v14, v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
}

- (void)hierarchyController:(id)a3 didReplaceTrailingLocations:(int64_t)a4 with:(id)a5 animated:(BOOL)a6
{
  sub_100032070(0, (unint64_t *)&qword_10065D760);
  unint64_t v10 = sub_1004F47F0();
  id v11 = a3;
  unint64_t v12 = self;
  sub_10020F180((uint64_t)v11, a4, v10, a6);

  swift_bridgeObjectRelease();
}

- (void)hierarchyController:(id)a3 didReveal:(id)a4 source:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = self;
  sub_10021939C();
}

- (void)hierarchyController:(id)a3 didPrepend:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_10020F8DC((uint64_t)v8, (uint64_t)v9, (uint64_t)a5);
}

- (void)hierarchyController:(id)a3 willPopLocations:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  unint64_t v12 = self;
  sub_1002188F4(a4, a5, (uint64_t)v12, (void (**)(void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)hierarchyController:(id)a3 didPopLocations:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = self;
  sub_100219B14((uint64_t *)a4, v5);
}

- (void)hierarchyController:(id)a3 didUpdateLastDisplayedLocationPath:(id)a4 anchorLocation:(id)a5 source:(id)a6
{
  sub_100032070(0, &qword_1006580B0);
  unint64_t v10 = sub_1004F47F0();
  id v11 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_historyDataSource);
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = self;
  id v16 = v11;
  sub_1003C6C04(v10, a5, v14);

  swift_bridgeObjectRelease();
}

@end