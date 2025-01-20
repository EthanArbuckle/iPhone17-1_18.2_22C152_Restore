@interface GKFriendInviteActivityEvent
+ (id)metricsFieldsForStage:(unint64_t)a3 hostApp:(id)a4;
+ (id)stringForStage:(unint64_t)a3;
- (GKFriendInviteActivityEvent)init;
@end

@implementation GKFriendInviteActivityEvent

+ (id)metricsFieldsForStage:(unint64_t)a3 hostApp:(id)a4
{
  if (a4)
  {
    uint64_t v5 = sub_1C2E922F8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_getObjCClassMetadata();
  sub_1C2E46F1C(a3, v5, v7);
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1C2E92218();
  swift_bridgeObjectRelease();

  return v8;
}

+ (id)stringForStage:(unint64_t)a3
{
  sub_1C2E475F0(a3);
  v3 = (void *)sub_1C2E922C8();
  swift_bridgeObjectRelease();

  return v3;
}

- (GKFriendInviteActivityEvent)init
{
  return (GKFriendInviteActivityEvent *)GKFriendInviteActivityEvent.init()();
}

@end