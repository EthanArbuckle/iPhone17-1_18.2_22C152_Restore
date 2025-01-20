@interface MPSuggestionsSearchTableViewController
- (MPSuggestedSearch)suggestionsDelegate;
- (MPSuggestionsSearchTableViewController)initWithCoder:(id)a3;
- (MPSuggestionsSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPSuggestionsSearchTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setSuggestionsDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation MPSuggestionsSearchTableViewController

- (MPSuggestedSearch)suggestionsDelegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MPSuggestedSearch *)Strong;
}

- (void)setSuggestionsDelegate:(id)a3
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)SuggestionsSearchTableViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  specialized SuggestionsSearchTableViewController.tableView(_:didSelectRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (MPSuggestionsSearchTableViewController)initWithStyle:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = self;
  Logger.init(subsystem:category:)();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___MPSuggestionsSearchTableViewController_suggestions) = (Class)_swiftEmptyArrayStorage;
  uint64_t v7 = (Class *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___MPSuggestionsSearchTableViewController_searchText);
  *uint64_t v7 = 0;
  v7[1] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(MPSuggestionsSearchTableViewController *)&v9 initWithStyle:a3];
}

- (MPSuggestionsSearchTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MPSuggestionsSearchTableViewController *)SuggestionsSearchTableViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (MPSuggestionsSearchTableViewController)initWithCoder:(id)a3
{
  return (MPSuggestionsSearchTableViewController *)SuggestionsSearchTableViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___MPSuggestionsSearchTableViewController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of weak (UIViewController & ContactAvatarCardControllerProtocol)?((uint64_t)self + OBJC_IVAR___MPSuggestionsSearchTableViewController_suggestionsDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end