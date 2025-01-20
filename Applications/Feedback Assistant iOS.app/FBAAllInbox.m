@interface FBAAllInbox
- (BOOL)isCountingUnreadOnly;
- (NSString)displayText;
- (NSString)iconSystemImageName;
- (_TtC18Feedback_Assistant11FBAAllInbox)init;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (uint64_t)unreadCountForTeam:;
@end

@implementation FBAAllInbox

- (NSString)displayText
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  v6 = self;
  v7 = self;
  id v8 = [v6 mainBundle];
  v15._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0x544C49465F4C4C41;
  v9._object = (void *)0xEA00000000005245;
  v10.value._countAndFlagsBits = v3;
  v10.value._object = v5;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v15);

  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v12;
}

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNameQuickFilterAll;
}

- (id)predicateForTeam:(id)a3
{
  id v3 = [self predicateWithValue:1];

  return v3;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)isCountingUnreadOnly
{
  return 0;
}

- (_TtC18Feedback_Assistant11FBAAllInbox)init
{
  return (_TtC18Feedback_Assistant11FBAAllInbox *)sub_100097304(self, (uint64_t)a2, type metadata accessor for FBAAllInbox);
}

- (uint64_t)unreadCountForTeam:
{
  id v0 = [self sharedInstance];
  id v1 = [v0 currentUser];

  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t)[v1 contentItems];

  if (v2)
  {
    sub_100056B94(0, (unint64_t *)&qword_100122990);
    sub_100097820();
    uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    if ((v3 & 0xC000000000000001) == 0)
    {
      uint64_t v2 = *(void *)(v3 + 16);
      swift_bridgeObjectRelease();
      return v2;
    }
    uint64_t v2 = __CocoaSet.count.getter();
    swift_bridgeObjectRelease();
    if (v2 < 0)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return 0;
    }
  }
  return v2;
}

@end