@interface PHSOSUIWebViewEventsHelper
- (_TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper)init;
- (int64_t)serverAuthenticationChallengeWithChallenge:(id)a3;
- (void)connectedWithAddresses:(id)a3;
- (void)stateChangeWithState:(id)a3;
- (void)videoStreamLost;
- (void)videoStreamQualityChangedWithQuality:(id)a3;
- (void)webRTCErrorWithError:(id)a3;
@end

@implementation PHSOSUIWebViewEventsHelper

- (_TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper)init
{
  return (_TtC13InCallServiceP33_9515DAA0F91B8B6E1F143ED1CB3A5EF126PHSOSUIWebViewEventsHelper *)sub_100159908();
}

- (void)webRTCErrorWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100159B08(v4);
}

- (void)videoStreamQualityChangedWithQuality:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100159BD0((uint64_t)v4);
}

- (void)videoStreamLost
{
  v2 = self;
  sub_100159C50();
}

- (void)stateChangeWithState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100159CF0((uint64_t)v4);
}

- (int64_t)serverAuthenticationChallengeWithChallenge:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_100159D70((uint64_t)v4);

  return v6;
}

- (void)connectedWithAddresses:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100159E2C(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end