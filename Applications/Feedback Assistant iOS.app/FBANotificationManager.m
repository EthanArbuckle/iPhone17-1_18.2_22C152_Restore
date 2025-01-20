@interface FBANotificationManager
+ (_TtC18Feedback_Assistant22FBANotificationManager)sharedManager;
- (NSString)apnsToken;
- (_TtC18Feedback_Assistant22FBANotificationManager)init;
- (void)registerAPNSWithParticipantID:(id)a3 api:(id)a4;
- (void)requestPermission;
- (void)saveToken:(id)a3;
- (void)setApnsToken:(id)a3;
@end

@implementation FBANotificationManager

- (void)requestPermission
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentNotificationCenter];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v9[4] = sub_10004DDF8;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10004D1A4;
  v9[3] = &unk_1000F41A8;
  v7 = _Block_copy(v9);
  id v8 = v5;
  swift_release();
  [v8 getNotificationSettingsWithCompletionHandler:v7];
  _Block_release(v7);
}

- (NSString)apnsToken
{
  if (*(void *)&self->apnsToken[OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setApnsToken:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken);
  *uint64_t v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

+ (_TtC18Feedback_Assistant22FBANotificationManager)sharedManager
{
  if (qword_100121E08 != -1) {
    swift_once();
  }
  NSString v2 = (void *)qword_100125F58;

  return (_TtC18Feedback_Assistant22FBANotificationManager *)v2;
}

- (_TtC18Feedback_Assistant22FBANotificationManager)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken);
  uint64_t v4 = (objc_class *)type metadata accessor for FBANotificationManager();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(FBANotificationManager *)&v6 init];
}

- (void)saveToken:(id)a3
{
  id v4 = a3;
  id v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  sub_1000822EC(v5, v7);
  sub_1000537FC(v5, v7);
}

- (void)registerAPNSWithParticipantID:(id)a3 api:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10008255C(v6, v7);
}

- (void).cxx_destruct
{
}

@end