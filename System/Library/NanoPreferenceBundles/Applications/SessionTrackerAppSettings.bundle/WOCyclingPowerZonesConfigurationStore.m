@interface WOCyclingPowerZonesConfigurationStore
- (WOCyclingPowerZonesConfigurationStore)init;
- (WOCyclingPowerZonesConfigurationStore)initWithHealthStore:(id)a3;
- (void)fetchCyclingPowerZonesConfigurationWithCompletion:(id)a3;
- (void)saveCyclingPowerZonesConfiguration:(id)a3;
@end

@implementation WOCyclingPowerZonesConfigurationStore

- (WOCyclingPowerZonesConfigurationStore)initWithHealthStore:(id)a3
{
  sub_20190();
  id v5 = a3;
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___WOCyclingPowerZonesConfigurationStore_configurationStore) = (Class)sub_20180();

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for CyclingPowerZonesConfigurationStoreBridge();
  v7 = [(WOCyclingPowerZonesConfigurationStore *)&v9 init];

  return v7;
}

- (void)fetchCyclingPowerZonesConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1BA58;
  *(void *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_20170();

  swift_release();

  swift_release();
}

- (void)saveCyclingPowerZonesConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20160();
}

- (WOCyclingPowerZonesConfigurationStore)init
{
  result = (WOCyclingPowerZonesConfigurationStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end