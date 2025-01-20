@interface GKMetricsBridge
+ (void)recordChallengePageEventWithReferrerData:(BOOL)a3;
+ (void)recordInviteFriendClickEventWithType:(int64_t)a3 pageType:(id)a4 pageId:(id)a5;
+ (void)recordLeaderboardPageEventWithPageId:(id)a3 withReferrerData:(BOOL)a4;
- (_TtC12GameCenterUI15GKMetricsBridge)init;
@end

@implementation GKMetricsBridge

+ (void)recordLeaderboardPageEventWithPageId:(id)a3 withReferrerData:(BOOL)a4
{
  uint64_t v5 = sub_1AF7AE0E0();
  static GKMetricsBridge.recordLeaderboardPageEvent(pageId:withReferrerData:)(v5, v6, a4);

  swift_bridgeObjectRelease();
}

+ (void)recordChallengePageEventWithReferrerData:(BOOL)a3
{
}

+ (void)recordInviteFriendClickEventWithType:(int64_t)a3 pageType:(id)a4 pageId:(id)a5
{
  uint64_t v6 = sub_1AF7AE0E0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1AF7AE0E0();
  static GKMetricsBridge.recordInviteFriendClickEvent(type:pageType:pageId:)(a3, v6, v8, v9, v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI15GKMetricsBridge)init
{
  return (_TtC12GameCenterUI15GKMetricsBridge *)GKMetricsBridge.init()();
}

@end