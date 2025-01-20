@interface WOHeartRateConfiguration
+ (void)setConfigurationType:(int64_t)a3;
+ (void)setConfiguredZones:(id)a3;
- (BOOL)hasDefaultRestingHeartRate;
- (BOOL)isEditable;
- (HKQuantity)maximumHeartRate;
- (HKQuantity)restingHeartRate;
- (NSArray)zones;
- (WOHeartRateConfiguration)init;
- (int64_t)configurationType;
- (void)setZones:(id)a3;
@end

@implementation WOHeartRateConfiguration

- (int64_t)configurationType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___WOHeartRateConfiguration_configurationType);
}

- (BOOL)isEditable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WOHeartRateConfiguration_isEditable);
}

- (HKQuantity)maximumHeartRate
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WOHeartRateConfiguration_maximumHeartRate));
}

- (HKQuantity)restingHeartRate
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WOHeartRateConfiguration_restingHeartRate));
}

- (BOOL)hasDefaultRestingHeartRate
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WOHeartRateConfiguration_hasDefaultRestingHeartRate);
}

- (NSArray)zones
{
  swift_beginAccess();
  type metadata accessor for HeartRateZoneBridge();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_202D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setZones:(id)a3
{
  type metadata accessor for HeartRateZoneBridge();
  uint64_t v4 = sub_202E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___WOHeartRateConfiguration_zones);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

+ (void)setConfigurationType:(int64_t)a3
{
}

+ (void)setConfiguredZones:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  if (a3)
  {
    type metadata accessor for HeartRateZoneBridge();
    unint64_t v3 = sub_202E0();
  }
  _s25SessionTrackerAppSettings28HeartRateConfigurationBridgeC13setConfigured5zonesySayAA0ef4ZoneH0CGSg_tFZ_0(v3);

  swift_bridgeObjectRelease();
}

- (WOHeartRateConfiguration)init
{
  result = (WOHeartRateConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end