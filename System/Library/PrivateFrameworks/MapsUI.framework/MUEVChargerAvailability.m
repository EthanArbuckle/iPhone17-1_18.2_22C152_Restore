@interface MUEVChargerAvailability
- (MURealTimeEVCharger)aggregatedInfo;
- (NSArray)plugs;
- (NSArray)vehicles;
- (_TtC6MapsUI23MUEVChargerAvailability)init;
- (_TtC6MapsUI23MUEVChargerAvailability)initWithAggregatedCounts:(id)a3 plugs:(id)a4 vehicles:(id)a5;
@end

@implementation MUEVChargerAvailability

- (MURealTimeEVCharger)aggregatedInfo
{
  return (MURealTimeEVCharger *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_aggregatedInfo));
}

- (NSArray)plugs
{
  return (NSArray *)sub_19320BBF8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_plugs, &qword_1E930FF68);
}

- (NSArray)vehicles
{
  return (NSArray *)sub_19320BBF8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_vehicles, (unint64_t *)&unk_1E9310010);
}

- (_TtC6MapsUI23MUEVChargerAvailability)initWithAggregatedCounts:(id)a3 plugs:(id)a4 vehicles:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1931F9204(0, &qword_1E930FF68);
  v8 = (objc_class *)sub_193341460();
  sub_1931F9204(0, (unint64_t *)&unk_1E9310010);
  v9 = (objc_class *)sub_193341460();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_aggregatedInfo) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_plugs) = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI23MUEVChargerAvailability_vehicles) = v9;
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v10 = a3;
  return [(MUEVChargerAvailability *)&v12 init];
}

- (_TtC6MapsUI23MUEVChargerAvailability)init
{
  result = (_TtC6MapsUI23MUEVChargerAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end