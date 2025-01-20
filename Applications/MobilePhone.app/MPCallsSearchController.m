@interface MPCallsSearchController
- (BOOL)sectionNeedsIndexing;
- (MPCallsSearchController)init;
- (MPCallsSearchController)initWithRecentsController:(id)a3 searchResultsController:(id)a4;
- (MPSearchResultsUpdatingProtocol)delegate;
- (NSArray)resultIDs;
- (NSArray)results;
- (NSString)sectionTitle;
- (UINavigationController)hostingNavigationController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)viewForDetails;
- (int64_t)configureWithCardController:(id)a3 presentationResultForIndex:(id)a4;
- (int64_t)maximumNumberOfRowsInSection;
- (int64_t)numberOfRowsInConsolidatedView;
- (int64_t)sectionIndex;
- (unsigned)sectionType;
- (void)cancelPreviousSearchRequests;
- (void)highlightMatchedTextIn:(id)a3;
- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)registerCellWith:(id)a3;
- (void)searchWith:(NSString *)a3 searchTokens:(NSArray *)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHostingNavigationController:(id)a3;
- (void)setMaximumNumberOfRowsInSection:(int64_t)a3;
- (void)setResultIDs:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSectionType:(unsigned int)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation MPCallsSearchController

- (NSString)sectionTitle
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSectionTitle:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_sectionTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)sectionIndex
{
  NSString v2 = (int64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_sectionIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionIndex:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_sectionIndex);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (unsigned)sectionType
{
  NSString v2 = (unsigned int *)((char *)self + OBJC_IVAR___MPCallsSearchController_sectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionType:(unsigned int)a3
{
  uint64_t v4 = (unsigned int *)((char *)self + OBJC_IVAR___MPCallsSearchController_sectionType);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSArray)resultIDs
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setResultIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_resultIDs);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)results
{
  swift_beginAccess();
  v3 = self;
  unint64_t v4 = swift_bridgeObjectRetain();
  specialized _arrayForceCast<A, B>(_:)(v4, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);

  swift_bridgeObjectRelease();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (int64_t)maximumNumberOfRowsInSection
{
  NSArray v2 = (int64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_maximumNumberOfRowsInSection);
  swift_beginAccess();
  return *v2;
}

- (void)setMaximumNumberOfRowsInSection:(int64_t)a3
{
  unint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___MPCallsSearchController_maximumNumberOfRowsInSection);
  swift_beginAccess();
  *unint64_t v4 = a3;
}

- (MPSearchResultsUpdatingProtocol)delegate
{
  return (MPSearchResultsUpdatingProtocol *)@objc CallsSearchController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)hostingNavigationController
{
  return (UINavigationController *)@objc CallsSearchController.delegate.getter();
}

- (void)setHostingNavigationController:(id)a3
{
}

- (MPCallsSearchController)initWithRecentsController:(id)a3 searchResultsController:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v7 = objc_allocWithZone((Class)TUFeatureFlags);
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 init];
  id v11 = objc_allocWithZone(ObjectType);
  v12 = (MPCallsSearchController *)CallsSearchController.init(recentsController:featureFlags:)(v8, v10);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)searchWith:(NSString *)a3 searchTokens:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in CallsSearchController.search(with:searchTokens:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTATu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v16);
  swift_release();
}

- (void)cancelPreviousSearchRequests
{
  NSArray v2 = self;
  CallsSearchController.cancelPreviousSearchRequests()();
}

- (int64_t)numberOfRowsInConsolidatedView
{
  NSArray v2 = self;
  Swift::Int v3 = CallsSearchController.numberOfRowsInConsolidatedView()();

  return v3;
}

- (void)registerCellWith:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  id v6 = CallsSearchController.cellConfigurator(for:)(v4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPCallsSearchController_recentsController);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  [v12 continuousScrollingReachedIndexPath:IndexPath.row.getter()];

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  v12 = (void *)CallsSearchController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  CallsSearchController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  uint64_t v12 = (void *)CallsSearchController.tableView(_:trailingSwipeActionsConfigurationForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)highlightMatchedTextIn:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  CallsSearchController.highlightMatchedText(in:)((UITableViewCell)v4);
}

- (BOOL)sectionNeedsIndexing
{
  Swift::Int v3 = self;
  id v4 = self;
  if ([v3 shouldReindexCallsDueToVersionMismatch]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v3 shouldReindexCallsDueToDeferredReindexing];
  }

  return v5;
}

- (int64_t)configureWithCardController:(id)a3 presentationResultForIndex:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  int64_t v12 = CallsSearchController.configure(cardController:presentationResultForIndex:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)viewForDetails
{
  NSArray v2 = self;
  v3.super.super.isa = CallsSearchController.viewForDetails()().super.super.isa;

  return v3.super.super.isa;
}

- (MPCallsSearchController)init
{
  result = (MPCallsSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPCallsSearchController_delegate);
  swift_unknownObjectWeakDestroy();
  UIViewController v3 = (char *)self + OBJC_IVAR___MPCallsSearchController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___MPCallsSearchController____lazy_storage___callAction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MPCallsSearchController____lazy_storage___recentsDetailPresenter));
  unsigned __int8 v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPCallsSearchController____lazy_storage___callReportingViewModel);
}

- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v5 recentCalls];
  if (v7)
  {
    uint64_t v8 = v7;
    type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
    uint64_t v9 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
  CallsSearchController.update(with:)((unint64_t)v9);

  swift_bridgeObjectRelease();
}

@end