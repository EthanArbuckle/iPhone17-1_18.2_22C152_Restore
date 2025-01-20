@interface GKTransportMonitor
- (GKTransportMonitor)init;
- (GKTransportMonitor)initWithMaxIteration:(int64_t)a3 pingInterval:(int64_t)a4 pingTimeout:(int64_t)a5 reportFrequency:(int64_t)a6;
- (GKTransportMonitor)initWithPingInterval:(int64_t)a3 pingTimeout:(int64_t)a4 reportFrequency:(int64_t)a5;
- (GKTransportMonitorDelegate)clientDelegate;
- (void)monitoringStopped:(id)a3;
- (void)receivedPing:(id)a3 sequenceNumber:(int64_t)a4;
- (void)receivedPong:(id)a3 sequenceNumber:(int64_t)a4;
- (void)setClientDelegate:(id)a3;
- (void)startMonitor:(id)a3;
- (void)stopMonitor:(id)a3;
- (void)stopMonitoringAll;
@end

@implementation GKTransportMonitor

- (GKTransportMonitorDelegate)clientDelegate
{
  v2 = (void *)TransportMonitor.clientDelegate.getter();

  return (GKTransportMonitorDelegate *)v2;
}

- (void)setClientDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  TransportMonitor.clientDelegate.setter();
}

- (GKTransportMonitor)initWithMaxIteration:(int64_t)a3 pingInterval:(int64_t)a4 pingTimeout:(int64_t)a5 reportFrequency:(int64_t)a6
{
  return (GKTransportMonitor *)TransportMonitor.init(maxIteration:pingInterval:pingTimeout:reportFrequency:)(a3, a4, a5, a6);
}

- (GKTransportMonitor)initWithPingInterval:(int64_t)a3 pingTimeout:(int64_t)a4 reportFrequency:(int64_t)a5
{
  return (GKTransportMonitor *)TransportMonitor.init(pingInterval:pingTimeout:reportFrequency:)(a3, a4, a5);
}

- (void)startMonitor:(id)a3
{
}

- (void)stopMonitor:(id)a3
{
}

- (void)stopMonitoringAll
{
  v2 = self;
  TransportMonitor.stopMonitoringAll()();
}

- (void)receivedPing:(id)a3 sequenceNumber:(int64_t)a4
{
  uint64_t v6 = sub_1C2E922F8();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  TransportMonitor.receivedPing(_:sequenceNumber:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)receivedPong:(id)a3 sequenceNumber:(int64_t)a4
{
  uint64_t v6 = sub_1C2E922F8();
  v8 = v7;
  Swift::String v10 = self;
  v9._countAndFlagsBits = v6;
  v9._object = v8;
  TransportMonitor.receivedPong(_:sequenceNumber:)(v9, a4);
  swift_bridgeObjectRelease();
}

- (GKTransportMonitor)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___GKTransportMonitor_clientDelegate;

  sub_1C2E0D6DC((uint64_t)v3);
}

- (void)monitoringStopped:(id)a3
{
  uint64_t v4 = sub_1C2E922F8();
  uint64_t v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  TransportMonitor.monitoringStopped(_:)(v8);

  swift_bridgeObjectRelease();
}

@end