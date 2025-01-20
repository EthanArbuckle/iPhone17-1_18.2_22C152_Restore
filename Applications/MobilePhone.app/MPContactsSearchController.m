@interface MPContactsSearchController
- (BOOL)sectionNeedsIndexing;
- (MPContactsSearchController)init;
- (MPContactsSearchController)initWithContactSearchType:(int64_t)a3;
- (MPSearchResultsUpdatingProtocol)delegate;
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
@end

@implementation MPContactsSearchController

- (NSString)sectionTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)sectionIndex
{
  NSString v2 = (int64_t *)((char *)self + OBJC_IVAR___MPContactsSearchController_sectionIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionIndex:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MPContactsSearchController_sectionIndex);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (unsigned)sectionType
{
  NSString v2 = (unsigned int *)((char *)self + OBJC_IVAR___MPContactsSearchController_sectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionType:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___MPContactsSearchController_sectionType);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (NSArray)resultIDs
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResultIDs:(id)a3
{
}

- (NSArray)results
{
  return (NSArray *)@objc VoicemailsSearchController.results.getter();
}

- (void)setResults:(id)a3
{
}

- (int64_t)maximumNumberOfRowsInSection
{
  return 5;
}

- (MPSearchResultsUpdatingProtocol)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MPSearchResultsUpdatingProtocol *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)hostingNavigationController
{
  NSString v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.isa
                                          + OBJC_IVAR___MPContactsSearchController_contactsTableViewController) & swift_isaMask)
                           + 0x108);
  v3 = self;
  v4 = (void *)v2();

  return (UINavigationController *)v4;
}

- (void)setHostingNavigationController:(id)a3
{
  v5 = *(void (**)(id))((**(void **)((char *)&self->super.isa
                                                + OBJC_IVAR___MPContactsSearchController_contactsTableViewController) & swift_isaMask)
                                 + 0x110);
  id v6 = a3;
  v7 = self;
  v5(a3);
}

- (MPContactsSearchController)initWithContactSearchType:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = objc_allocWithZone((Class)CNContactStore);
  v7 = self;
  id v8 = [v6 init];
  id v9 = objc_allocWithZone((Class)type metadata accessor for ContactSearchManager());
  id v10 = specialized ContactSearchManager.init(type:contactStore:)(a3, v8);

  id v11 = [objc_allocWithZone((Class)TUFeatureFlags) init];
  id v12 = objc_allocWithZone(ObjectType);
  v13 = (MPContactsSearchController *)ContactsSearchController.init(contactSearchType:searchManager:featureFlags:)(a3, v10, v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (void)searchWith:(NSString *)a3 searchTokens:(NSArray *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
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
  v15[4] = &async function pointer to partial apply for @objc closure #1 in ContactsSearchController.search(with:searchTokens:);
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
  ContactsSearchController.cancelPreviousSearchRequests()();
}

- (void)registerCellWith:(id)a3
{
  type metadata accessor for ContactSearchViewCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  v7 = self;
  id v8 = String._bridgeToObjectiveC()();
  [v6 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(void (**)(id, char *))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                                         + OBJC_IVAR___MPContactsSearchController_contactsTableViewController))
                                          + 0x1A0);
  id v11 = a3;
  id v12 = self;
  v10(v11, v9);
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v11 deselectRowAtIndexPath:isa animated:0];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(uint64_t (**)(id, char *))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                                            + OBJC_IVAR___MPContactsSearchController_contactsTableViewController))
                                             + 0x198);
  id v11 = a3;
  id v12 = self;
  v13 = (void *)v10(v11, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (int64_t)numberOfRowsInConsolidatedView
{
  NSString v2 = (char *)self + OBJC_IVAR___MPContactsSearchController_results;
  swift_beginAccess();
  if (*(void *)(*(void *)v2 + 16) >= 5uLL) {
    return 5;
  }
  else {
    return *(void *)(*(void *)v2 + 16);
  }
}

- (void)highlightMatchedTextIn:(id)a3
{
  v4 = *(void (**)(id))((**(void **)((char *)&self->super.isa
                                                + OBJC_IVAR___MPContactsSearchController_contactsTableViewController) & swift_isaMask)
                                 + 0x1A8);
  id v5 = a3;
  uint64_t v6 = self;
  v4(v5);
}

- (BOOL)sectionNeedsIndexing
{
  return 0;
}

- (int64_t)configureWithCardController:(id)a3 presentationResultForIndex:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(uint64_t (**)(id, char *))((swift_isaMask & **(void **)((char *)&self->super.isa
                                                                            + OBJC_IVAR___MPContactsSearchController_contactsTableViewController))
                                             + 0x1C8);
  id v11 = a3;
  id v12 = self;
  int64_t v13 = v10(v11, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)viewForDetails
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___MPContactsSearchController_contactsTableViewController));
}

- (MPContactsSearchController)init
{
  result = (MPContactsSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPContactsSearchController_delegate);
  v3 = (char *)self + OBJC_IVAR___MPContactsSearchController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactsSearchController_contactsTableViewController);
}

@end