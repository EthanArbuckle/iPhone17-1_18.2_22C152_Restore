@interface GKTransportMonitorPlayerStat
- (GKTransportMonitorPlayerStat)init;
- (GKTransportMonitorPlayerStat)initWithMonitoring:(id)a3 latency:(double)a4 averageLatency:(double)a5 sentCount:(int64_t)a6 receivedCount:(int64_t)a7;
- (NSString)description;
- (NSString)monitoring;
- (double)averageLatency;
- (double)latency;
- (int64_t)receivedCount;
- (int64_t)sentCount;
@end

@implementation GKTransportMonitorPlayerStat

- (NSString)monitoring
{
  TransportMonitorPlayerStat.monitoring.getter();
  v2 = (void *)sub_1C2E922C8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (double)latency
{
  return TransportMonitorPlayerStat.latency.getter();
}

- (double)averageLatency
{
  return TransportMonitorPlayerStat.averageLatency.getter();
}

- (int64_t)sentCount
{
  return TransportMonitorPlayerStat.sentCount.getter();
}

- (int64_t)receivedCount
{
  return TransportMonitorPlayerStat.receivedCount.getter();
}

- (NSString)description
{
  return (NSString *)sub_1C2E82C78(self, (uint64_t)a2, (void (*)(void))TransportMonitorPlayerStat.description.getter);
}

- (GKTransportMonitorPlayerStat)initWithMonitoring:(id)a3 latency:(double)a4 averageLatency:(double)a5 sentCount:(int64_t)a6 receivedCount:(int64_t)a7
{
  return (GKTransportMonitorPlayerStat *)TransportMonitorPlayerStat.init(monitoring:latency:averageLatency:sentCount:receivedCount:)();
}

- (GKTransportMonitorPlayerStat)init
{
}

- (void).cxx_destruct
{
}

@end