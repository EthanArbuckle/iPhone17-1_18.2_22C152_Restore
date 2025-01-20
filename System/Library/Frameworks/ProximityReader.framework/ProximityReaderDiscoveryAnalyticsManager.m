@interface ProximityReaderDiscoveryAnalyticsManager
- (_TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager)init;
- (void)discoveryItemWithIdentifier:(id)a3 position:(double)a4;
@end

@implementation ProximityReaderDiscoveryAnalyticsManager

- (_TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_discoveryService) = 0;
  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_sessionData);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ProximityReader40ProximityReaderDiscoveryAnalyticsManager_lastQuantile) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ProximityReaderDiscoveryAnalyticsManager();
  return [(ProximityReaderDiscoveryAnalyticsManager *)&v4 init];
}

- (void).cxx_destruct
{
}

- (void)discoveryItemWithIdentifier:(id)a3 position:(double)a4
{
  if (a3) {
    sub_228915C70();
  }
  v6 = self;
  sub_228855050(a4);

  swift_bridgeObjectRelease();
}

@end