@interface ShareSheetUISession
- (_TtC16SharingUIService19ShareSheetUISession)init;
- (id)customTitleForActivityType:(id)a3;
- (void)connectionInterrupted;
- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3;
- (void)dealloc;
- (void)didSelectCollaborativeAction;
- (void)didSelectSendCopyAction;
- (void)handleActionsEdit;
- (void)handleClose;
- (void)handleCollaborationOptions;
- (void)handleCustomHeaderButton;
- (void)handleInfoSuggestionPress:(id)a3;
- (void)handleNext;
- (void)handleOptions;
- (void)performActionActivityProxy:(id)a3;
- (void)performPeopleSuggestionProxy:(id)a3;
- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4;
- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6;
- (void)removePeopleSuggestionProxy:(id)a3;
- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6;
- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6;
- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5;
@end

@implementation ShareSheetUISession

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  v5 = self;
  if (v4) {
    [v4 invalidate];
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(ShareSheetUISession *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1000183D8((uint64_t)self + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_delegate);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_currentConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_customViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_optionsViewController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_collaborationOptionsViewController);
}

- (_TtC16SharingUIService19ShareSheetUISession)init
{
  result = (_TtC16SharingUIService19ShareSheetUISession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)connectionInterrupted
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetUISession_slotManager);
  v3 = self;
  if (v2) {
    [v2 invalidate];
  }
  sub_10001B304();
}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001C084(v4);
}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  sub_100008D18(0, &qword_100044318);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for UUID();
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  sub_10001C620(v8, v9, v10, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)performPeopleSuggestionProxy:(id)a3
{
}

- (void)removePeopleSuggestionProxy:(id)a3
{
}

- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4
{
  uint64_t v7 = sub_100006E30(&qword_1000432D0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  swift_unknownObjectRetain();
  v12 = self;
  sub_10001D088(a3, (uint64_t)v9);
  swift_unknownObjectRelease();

  sub_1000105A4((uint64_t)v9);
}

- (void)performActionActivityProxy:(id)a3
{
}

- (void)handleActionsEdit
{
  v2 = self;
  sub_10001D780();
}

- (void)handleOptions
{
  v2 = self;
  sub_10001DDDC("handle options", 1);
}

- (void)handleClose
{
  v2 = self;
  sub_10001DDDC("handle close", 5);
}

- (void)handleNext
{
  v2 = self;
  sub_10001DDDC("handle next button", 7);
}

- (void)handleCollaborationOptions
{
  v2 = self;
  sub_10001DDDC("handle collaboration options", 2);
}

- (void)handleCustomHeaderButton
{
  v2 = self;
  sub_10001DDDC("handle custom header button", 0);
}

- (void)handleInfoSuggestionPress:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_10001DB2C();

  swift_bridgeObjectRelease();
}

- (void)didSelectCollaborativeAction
{
  v2 = self;
  sub_10001DDDC("did select collaborative action", 3);
}

- (void)didSelectSendCopyAction
{
  v2 = self;
  sub_10001DDDC("did select send copy action", 4);
}

- (id)customTitleForActivityType:(id)a3
{
  return 0;
}

- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  uint64_t v13 = self;
  sub_10001EA18((uint64_t)v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  BOOL v7 = a4;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  sub_10001ED30(v7, (uint64_t)v13, a6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  sub_100008D18(0, &qword_100044318);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  uint64_t v10 = self;
  sub_10001F054(v8, a5);

  swift_bridgeObjectRelease();
}

- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  v15 = self;
  sub_10001E290(v14, (uint64_t)v13, a5, v6);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

@end