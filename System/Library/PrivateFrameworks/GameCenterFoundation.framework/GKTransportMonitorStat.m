@interface GKTransportMonitorStat
- (GKTransportMonitorStat)init;
- (GKTransportMonitorStat)initWithPlayerStats:(id)a3;
- (NSArray)playerStats;
- (NSDictionary)overallAverageLatencies;
- (NSDictionary)overallLatencies;
- (NSString)description;
- (double)overallAverageLatency;
- (double)overallLatency;
- (double)overallPacketLoss;
@end

@implementation GKTransportMonitorStat

- (NSArray)playerStats
{
  TransportMonitorStat.playerStats.getter();
  type metadata accessor for TransportMonitorPlayerStat();
  v2 = (void *)sub_1C2E92478();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSDictionary)overallLatencies
{
  return (NSDictionary *)sub_1C2E82604(self, (uint64_t)a2, (void (*)(void))TransportMonitorStat.overallLatencies.getter);
}

- (double)overallLatency
{
  v2 = self;
  TransportMonitorStat.overallLatency.getter();
  double v4 = v3;

  return v4;
}

- (NSDictionary)overallAverageLatencies
{
  return (NSDictionary *)sub_1C2E82604(self, (uint64_t)a2, (void (*)(void))TransportMonitorStat.overallAverageLatencies.getter);
}

- (double)overallAverageLatency
{
  v2 = self;
  TransportMonitorStat.overallAverageLatency.getter();
  double v4 = v3;

  return v4;
}

- (double)overallPacketLoss
{
  v2 = self;
  TransportMonitorStat.overallPacketLoss.getter();
  double v4 = v3;

  return v4;
}

- (NSString)description
{
  return (NSString *)sub_1C2E82C78(self, (uint64_t)a2, (void (*)(void))TransportMonitorStat.description.getter);
}

- (GKTransportMonitorStat)initWithPlayerStats:(id)a3
{
  type metadata accessor for TransportMonitorPlayerStat();
  uint64_t v3 = sub_1C2E92488();
  return (GKTransportMonitorStat *)sub_1C2E82DF4(v3);
}

- (GKTransportMonitorStat)init
{
}

- (void).cxx_destruct
{
}

@end