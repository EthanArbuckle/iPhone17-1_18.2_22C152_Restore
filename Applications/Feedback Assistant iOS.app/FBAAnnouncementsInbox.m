@interface FBAAnnouncementsInbox
- (NSString)displayText;
- (NSString)iconSystemImageName;
- (_TtC18Feedback_Assistant21FBAAnnouncementsInbox)init;
- (id)predicateForTeam:(id)a3;
- (int64_t)type;
- (unint64_t)unreadCountForTeam:(id)a3;
@end

@implementation FBAAnnouncementsInbox

- (NSString)displayText
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  v6 = self;
  v7 = self;
  id v8 = [v6 mainBundle];
  v15._object = (void *)0xE000000000000000;
  v9._object = (void *)0x80000001000E4F20;
  v9._countAndFlagsBits = 0xD000000000000014;
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
  return (NSString *)FBKSystemImageNameQuickFilterAnnouncements;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v5 = a3;
  v6 = self;
  unint64_t v7 = sub_100096EC8((uint64_t)a3);

  return v7;
}

- (id)predicateForTeam:(id)a3
{
  sub_10004DE60((uint64_t *)&unk_1001238F0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000D86F0;
  *(void *)(v5 + 56) = &type metadata for UInt;
  *(void *)(v5 + 32) = 2;
  id v6 = a3;
  unint64_t v7 = self;
  NSString v8 = String._bridgeToObjectiveC()();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v10 = [self predicateWithFormat:v8 argumentArray:isa];

  return v10;
}

- (int64_t)type
{
  return 1;
}

- (_TtC18Feedback_Assistant21FBAAnnouncementsInbox)init
{
  return (_TtC18Feedback_Assistant21FBAAnnouncementsInbox *)sub_100097304(self, (uint64_t)a2, type metadata accessor for FBAAnnouncementsInbox);
}

@end