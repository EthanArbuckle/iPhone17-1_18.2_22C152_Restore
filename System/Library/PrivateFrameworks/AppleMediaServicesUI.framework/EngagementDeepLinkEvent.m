@interface EngagementDeepLinkEvent
- (NSDictionary)engagementData;
- (_TtC20AppleMediaServicesUI23EngagementDeepLinkEvent)init;
@end

@implementation EngagementDeepLinkEvent

- (NSDictionary)engagementData
{
  if (EngagementDeepLinkEvent.engagementData.getter())
  {
    v2 = (void *)sub_21C2BF1F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (_TtC20AppleMediaServicesUI23EngagementDeepLinkEvent)init
{
}

- (void).cxx_destruct
{
}

@end