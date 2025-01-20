@interface DRTouchDetacher
- (BOOL)detachTouchesWithTouchIdentifiers:(id)a3 session:(id)a4 routingPolicy:(id)a5 touchOffset:(CGPoint)a6;
- (_TtC5druid15DRTouchDetacher)init;
- (void)setTouchOffset:(CGPoint)a3 forSession:(unsigned int)a4;
- (void)updateRoutingPolicy:(id)a3 forSession:(id)a4;
@end

@implementation DRTouchDetacher

- (BOOL)detachTouchesWithTouchIdentifiers:(id)a3 session:(id)a4 routingPolicy:(id)a5 touchOffset:(CGPoint)a6
{
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  char v13 = sub_100032ED8(v9, v10);

  swift_bridgeObjectRelease();
  return v13 & 1;
}

- (void)updateRoutingPolicy:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [v7 identifier];
  id v9 = sub_1000325E4(v7);
  BKSHIDEventDigitizerSetTouchRoutingPolicy();
}

- (void)setTouchOffset:(CGPoint)a3 forSession:(unsigned int)a4
{
}

- (_TtC5druid15DRTouchDetacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DRTouchDetacher();
  return [(DRTouchDetacher *)&v3 init];
}

@end