@interface WOCyclingPowerZonesConfiguration
- (BOOL)isAutomaticEmpty;
- (BOOL)isAutomaticFromAppleFTP;
- (BOOL)isEditable;
- (BOOL)isEmpty;
- (NSArray)zones;
- (WOCyclingPowerZonesConfiguration)init;
- (WOFunctionalThresholdPower)automaticFTP;
- (WOFunctionalThresholdPower)functionalThresholdPower;
- (int64_t)configurationType;
@end

@implementation WOCyclingPowerZonesConfiguration

- (BOOL)isEmpty
{
  v2 = self;
  char v3 = sub_20130();

  return v3 & 1;
}

- (BOOL)isAutomaticEmpty
{
  v2 = self;
  char v3 = sub_200F0();

  return v3 & 1;
}

- (BOOL)isAutomaticFromAppleFTP
{
  v2 = self;
  char v3 = sub_20110();

  return v3 & 1;
}

- (BOOL)isEditable
{
  v2 = self;
  char v3 = sub_18A34();

  return v3 & 1;
}

- (int64_t)configurationType
{
  uint64_t v3 = sub_20150();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_20100();
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  int64_t v9 = 0;
  if (v8 == enum case for CyclingPowerZonesConfigurationType.automatic(_:)) {
    goto LABEL_4;
  }
  if (v8 == enum case for CyclingPowerZonesConfigurationType.manual(_:))
  {
    int64_t v9 = 1;
LABEL_4:

    return v9;
  }
  int64_t result = sub_20380();
  __break(1u);
  return result;
}

- (NSArray)zones
{
  v2 = self;
  sub_18DBC();

  type metadata accessor for CyclingPowerZoneBridge();
  v3.super.isa = sub_202D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (WOFunctionalThresholdPower)functionalThresholdPower
{
  return (WOFunctionalThresholdPower *)sub_18F60(self, (uint64_t)a2, (uint64_t (*)(void))&CyclingPowerZonesConfiguration.functionalThresholdPower.getter);
}

- (WOFunctionalThresholdPower)automaticFTP
{
  return (WOFunctionalThresholdPower *)sub_18F60(self, (uint64_t)a2, (uint64_t (*)(void))&CyclingPowerZonesConfiguration.automaticFTP.getter);
}

- (WOCyclingPowerZonesConfiguration)init
{
  int64_t result = (WOCyclingPowerZonesConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end