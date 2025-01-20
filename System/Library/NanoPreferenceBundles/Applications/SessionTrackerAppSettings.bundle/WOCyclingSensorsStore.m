@interface WOCyclingSensorsStore
- (WOCyclingSensorsStore)init;
- (void)isPowerMeterAvailableWithCompletion:(id)a3;
@end

@implementation WOCyclingSensorsStore

- (void)isPowerMeterAvailableWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_1FF40();

  swift_release();
}

- (WOCyclingSensorsStore)init
{
  uint64_t v3 = OBJC_IVAR___WOCyclingSensorsStore_cyclingSensorsStore;
  id v4 = objc_allocWithZone((Class)sub_1FF50());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CyclingSensorsStoreBridge();
  return [(WOCyclingSensorsStore *)&v7 init];
}

- (void).cxx_destruct
{
}

@end