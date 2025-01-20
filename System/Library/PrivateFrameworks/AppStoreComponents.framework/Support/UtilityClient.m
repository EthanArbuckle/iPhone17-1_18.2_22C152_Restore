@interface UtilityClient
- (_TtC19appstorecomponentsd13UtilityClient)init;
- (void)openURL:(id)a3 withReplyHandler:(id)a4;
- (void)restoreAppStoreWithReplyHandler:(id)a3;
@end

@implementation UtilityClient

- (void)openURL:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_100134D04((uint64_t)v9, (uint64_t)sub_10006239C, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)restoreAppStoreWithReplyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100134EA0((uint64_t)sub_100061788, v5);

  swift_release();
}

- (_TtC19appstorecomponentsd13UtilityClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(UtilityClient *)&v3 init];
}

@end