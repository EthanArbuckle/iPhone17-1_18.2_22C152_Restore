@interface FBAEnhancedLoggingInbox
- (BOOL)isCountingUnreadOnly;
- (BOOL)supportsDeletion;
- (NSString)displayText;
- (NSString)iconSystemImageName;
- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)init;
- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBAEnhancedLoggingInbox

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNameEnhancedLogging;
}

- (int64_t)type
{
  return 4;
}

- (NSString)displayText
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainBundle];
  v11._countAndFlagsBits = 0xD000000000000022;
  v11._object = (void *)0x80000001000E1550;
  v6._object = (void *)0x80000001000E1510;
  v7._object = (void *)0x80000001000E1530;
  v6._countAndFlagsBits = 0xD000000000000010;
  v7._countAndFlagsBits = 0xD000000000000010;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v11);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v5 = self;
  id v6 = a3;
  Swift::String v7 = self;
  id v8 = [v5 sharedInstance];
  unint64_t v9 = (unint64_t)[v8 loggingSessionCount];

  if ((v9 & 0x8000000000000000) != 0)
  {
    unint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {

    return v9;
  }
  return result;
}

- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4
{
  id v6 = self;
  id v7 = a3;
  id v8 = self;
  id v9 = [v6 sharedInstance];
  id v10 = [v9 items];

  sub_10005AC20();
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100085CD0(v11);
  swift_bridgeObjectRelease();
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (BOOL)isCountingUnreadOnly
{
  return 0;
}

- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAEnhancedLoggingInbox();
  return [(FBAEnhancedLoggingInbox *)&v3 init];
}

@end