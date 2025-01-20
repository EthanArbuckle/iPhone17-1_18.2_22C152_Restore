@interface UtilityMeter
- (NSString)commodity;
- (NSString)make;
- (NSString)meterID;
- (NSString)model;
- (NSString)serialNumber;
- (NSString)usagePointID;
- (_TtC19HomeUtilityServices12UtilityMeter)init;
@end

@implementation UtilityMeter

- (NSString)meterID
{
  return (NSString *)sub_25278CACC();
}

- (NSString)serialNumber
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices12UtilityMeter_serialNumber);
}

- (NSString)make
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices12UtilityMeter_make);
}

- (NSString)model
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices12UtilityMeter_model);
}

- (NSString)commodity
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices12UtilityMeter_commodity);
}

- (NSString)usagePointID
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices12UtilityMeter_usagePointID);
}

- (_TtC19HomeUtilityServices12UtilityMeter)init
{
  result = (_TtC19HomeUtilityServices12UtilityMeter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end