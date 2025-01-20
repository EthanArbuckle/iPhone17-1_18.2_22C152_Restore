@interface MPSuggestionsSearchController
- (BOOL)sectionNeedsIndexing;
- (MPSearchResultsUpdatingProtocol)delegate;
- (MPSuggestedSearch)suggestionsDelegate;
- (MPSuggestionsSearchController)init;
- (MPSuggestionsSearchController)initWithTableViewController:(id)a3;
- (NSArray)resultIDs;
- (NSArray)results;
- (NSString)sectionTitle;
- (UINavigationController)hostingNavigationController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)viewForDetails;
- (int64_t)maximumNumberOfRowsInSection;
- (int64_t)numberOfRowsInConsolidatedView;
- (int64_t)sectionIndex;
- (unsigned)sectionType;
- (void)cancelPreviousSearchRequests;
- (void)highlightMatchedTextIn:(id)a3;
- (void)registerCellWith:(id)a3;
- (void)searchWith:(NSString *)a3 searchTokens:(NSArray *)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHostingNavigationController:(id)a3;
- (void)setResultIDs:(id)a3;
- (void)setResults:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setSectionType:(unsigned int)a3;
- (void)setSuggestionsDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MPSuggestionsSearchController

- (MPSuggestedSearch)suggestionsDelegate
{
  return (MPSuggestedSearch *)@objc CallsSearchController.delegate.getter();
}

- (void)setSuggestionsDelegate:(id)a3
{
}

- (int64_t)maximumNumberOfRowsInSection
{
  return 5;
}

- (int64_t)sectionIndex
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_sectionIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionIndex:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_sectionIndex);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)sectionTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unsigned)sectionType
{
  NSString v2 = (unsigned int *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_sectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionType:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_sectionType);
  swift_beginAccess();
  unsigned int *v4 = a3;
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

- (NSArray)results
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResults:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_results);
  swift_beginAccess();
  uint64_t *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  SuggestionsSearchController.results.didset();
}

- (NSArray)resultIDs
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResultIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MPSuggestionsSearchController_resultIDs);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MPSuggestionsSearchController)initWithTableViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = objc_allocWithZone((Class)TUFeatureFlags);
  id v6 = a3;
  id v7 = [v5 init];
  id v8 = objc_allocWithZone(ObjectType);
  v9 = (MPSuggestionsSearchController *)specialized SuggestionsSearchController.init(tableViewController:featureFlags:)(v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)searchWith:(NSString *)a3 searchTokens:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v15[4] = &async function pointer to partial apply for @objc closure #1 in SuggestionsSearchController.search(with:searchTokens:);
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
  NSString v2 = self;
  SuggestionsSearchController.cancelPreviousSearchRequests()();
}

- (void)registerCellWith:(id)a3
{
  type metadata accessor for SuggestionsSearchViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  id v7 = self;
  id v8 = String._bridgeToObjectiveC()();
  [v6 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  specialized SuggestionsSearchTableViewController.tableView(_:didSelectRowAt:)();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v10 deselectRowAtIndexPath:isa animated:0];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)SuggestionsSearchTableViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)highlightMatchedTextIn:(id)a3
{
  type metadata accessor for SuggestionsSearchViewCell();
  if (swift_dynamicCastClass())
  {
    id v5 = (uint64_t *)(*(char **)((char *)&self->super.isa
                              + OBJC_IVAR___MPSuggestionsSearchController_suggestionsTableViewController)
                   + OBJC_IVAR___MPSuggestionsSearchTableViewController_searchText);
    swift_beginAccess();
    uint64_t v6 = (void *)v5[1];
    if (v6)
    {
      uint64_t v7 = *v5;
      swift_bridgeObjectRetain();
      id v8 = a3;
      uint64_t v9 = self;
      v10.value._countAndFlagsBits = v7;
      v10.value._object = v6;
      SuggestionsSearchViewCell.configure(withSearchText:)(v10);

      swift_bridgeObjectRelease();
    }
  }
}

- (int64_t)numberOfRowsInConsolidatedView
{
  NSString v2 = (char *)self + OBJC_IVAR___MPSuggestionsSearchController_results;
  swift_beginAccess();
  if (*(void *)(*(void *)v2 + 16) >= 5uLL) {
    return 5;
  }
  else {
    return *(void *)(*(void *)v2 + 16);
  }
}

- (BOOL)sectionNeedsIndexing
{
  return 0;
}

- (id)viewForDetails
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___MPSuggestionsSearchController_suggestionsTableViewController));
}

- (MPSuggestionsSearchController)init
{
  result = (MPSuggestionsSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MPSuggestionsSearchController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MPSuggestionsSearchController____lazy_storage___searchManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPSuggestionsSearchController_suggestionsDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MPSuggestionsSearchController_suggestionsTableViewController));
  swift_bridgeObjectRelease();
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPSuggestionsSearchController_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end