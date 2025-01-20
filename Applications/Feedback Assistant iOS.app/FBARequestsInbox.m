@interface FBARequestsInbox
- (NSString)displayText;
- (NSString)iconSystemImageName;
- (_TtC18Feedback_Assistant16FBARequestsInbox)init;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBARequestsInbox

- (NSString)displayText
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  v6 = self;
  v7 = self;
  id v8 = [v6 mainBundle];
  v15._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0x5354534555514552;
  v9._object = (void *)0xEF5245544C49465FLL;
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
  return (NSString *)FBKSystemImageNameQuickFilterRequests;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v5 = a3;
  v6 = self;
  unint64_t v7 = sub_1000968CC((uint64_t)a3);

  return v7;
}

- (id)predicateForTeam:(id)a3
{
  id v3 = sub_100097708();

  return v3;
}

- (int64_t)type
{
  return 1;
}

- (_TtC18Feedback_Assistant16FBARequestsInbox)init
{
  return (_TtC18Feedback_Assistant16FBARequestsInbox *)sub_100097304(self, (uint64_t)a2, type metadata accessor for FBARequestsInbox);
}

@end