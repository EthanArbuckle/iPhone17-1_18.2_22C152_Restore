@interface FSFStreamQuery
- (FSFStreamQuery)init;
- (NSArray)interactionIds;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (void)setEndDate:(id)a3;
- (void)setInteractionIds:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation FSFStreamQuery

- (NSDate)startDate
{
  return (NSDate *)@objc StreamQuery.startDate.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))StreamQuery.startDate.getter);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)@objc StreamQuery.startDate.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))StreamQuery.endDate.getter);
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)interactionIds
{
  StreamQuery.interactionIds.getter();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setInteractionIds:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  StreamQuery.interactionIds.setter(v4);
}

- (NSString)description
{
  NSArray v2 = self;
  uint64_t v3 = StreamQuery.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x223C0D7E0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (FSFStreamQuery)init
{
}

- (void).cxx_destruct
{
  outlined destroy of Date?((uint64_t)self + OBJC_IVAR___FSFStreamQuery_startDate);
  outlined destroy of Date?((uint64_t)self + OBJC_IVAR___FSFStreamQuery_endDate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end