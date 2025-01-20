@interface MPVoicemailsSearchController
- (BOOL)sectionNeedsIndexing;
- (MPSearchResultsUpdatingProtocol)delegate;
- (MPVoicemailsSearchController)init;
- (MPVoicemailsSearchController)initWithNavigationController:(id)a3 voicemailController:(id)a4;
- (NSArray)resultIDs;
- (NSArray)results;
- (NSString)sectionTitle;
- (UINavigationController)hostingNavigationController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)viewForDetails;
- (int64_t)configureWithCardController:(id)a3 presentationResultForIndex:(id)a4;
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
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewController:(id)a3 didChangeVoicemails:(id)a4;
@end

@implementation MPVoicemailsSearchController

- (NSString)sectionTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)sectionIndex
{
  NSString v2 = (int64_t *)((char *)self + OBJC_IVAR___MPVoicemailsSearchController_sectionIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionIndex:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MPVoicemailsSearchController_sectionIndex);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (unsigned)sectionType
{
  NSString v2 = (unsigned int *)((char *)self + OBJC_IVAR___MPVoicemailsSearchController_sectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionType:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___MPVoicemailsSearchController_sectionType);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (NSArray)results
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResults:(id)a3
{
}

- (NSArray)resultIDs
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResultIDs:(id)a3
{
}

- (int64_t)maximumNumberOfRowsInSection
{
  return 3;
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

- (MPVoicemailsSearchController)initWithNavigationController:(id)a3 voicemailController:(id)a4
{
  return (MPVoicemailsSearchController *)VoicemailsSearchController.init(navigationController:voicemailController:)(a3, a4);
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
  v15[4] = &async function pointer to partial apply for @objc closure #1 in VoicemailsSearchController.search(with:searchTokens:);
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
  VoicemailsSearchController.cancelPreviousSearchRequests()();
}

- (int64_t)numberOfRowsInConsolidatedView
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVoicemailsSearchController_featureFlags);
  v3 = self;
  if ([v2 voicemailSearchEnabled])
  {
    v4 = (char *)v3 + OBJC_IVAR___MPVoicemailsSearchController_results;
    swift_beginAccess();
    unint64_t v5 = *(void *)(*(void *)v4 + 16);

    if (v5 >= 3) {
      return 3;
    }
    else {
      return v5;
    }
  }
  else
  {

    return 0;
  }
}

- (void)registerCellWith:(id)a3
{
  type metadata accessor for VoicemailSearchViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  v7 = self;
  id v8 = String._bridgeToObjectiveC()();
  [v6 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v8];
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
  v12 = VoicemailSearchTableViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

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
  v11 = self;
  VoicemailsSearchController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)highlightMatchedTextIn:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  VoicemailsSearchController.highlightMatchedText(in:)((UITableViewCell)v4);
}

- (void)tableViewController:(id)a3 didChangeVoicemails:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Message);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  specialized VoicemailsSearchController.tableViewController(_:didChangeVoicemails:)(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)sectionNeedsIndexing
{
  type metadata accessor for SpotlightIndexManagerUtilities();
  v3 = self;
  if (static SpotlightIndexManagerUtilities.voicemailsNeedsDeferredReindexing(defaults:)()) {
    char v4 = 1;
  }
  else {
    char v4 = static SpotlightIndexManagerUtilities.voicemailsNeedIndexingDueToVersionMismatch(defaults:)();
  }

  return v4 & 1;
}

- (int64_t)configureWithCardController:(id)a3 presentationResultForIndex:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  int64_t v12 = VoicemailSearchTableViewController.configure(cardController:presentationResultForIndex:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)viewForDetails
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___MPVoicemailsSearchController_voicemailsTableViewController));
}

- (MPVoicemailsSearchController)init
{
  result = (MPVoicemailsSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPVoicemailsSearchController_delegate);
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR___MPVoicemailsSearchController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MPVoicemailsSearchController____lazy_storage___searchManager));
  unint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVoicemailsSearchController_voicemailsTableViewController);
}

@end