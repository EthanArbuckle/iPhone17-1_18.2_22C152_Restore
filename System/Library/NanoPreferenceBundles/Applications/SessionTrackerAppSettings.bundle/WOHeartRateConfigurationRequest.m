@interface WOHeartRateConfigurationRequest
- (WOHeartRateConfigurationRequest)init;
- (void)fetchActiveAndInactiveConfigurationWithCompletion:(id)a3;
- (void)fetchHeartRateConfigurationWithCompletion:(id)a3;
@end

@implementation WOHeartRateConfigurationRequest

- (void)fetchHeartRateConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_200E0();
  swift_allocObject();
  v6 = self;
  sub_200D0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1BA58;
  *(void *)(v7 + 24) = v5;
  swift_retain();
  sub_200A0();

  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchActiveAndInactiveConfigurationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_200E0();
  swift_allocObject();
  v6 = self;
  sub_200D0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1DCE0;
  *(void *)(v7 + 24) = v5;
  swift_retain();
  sub_200A0();

  swift_release();
  swift_release();

  swift_release();
}

- (WOHeartRateConfigurationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeartRateConfigurationRequestBridge();
  return [(WOHeartRateConfigurationRequest *)&v3 init];
}

@end