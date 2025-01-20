@interface OnDevicePersonalizationDataManager
- (_TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager)init;
- (void)appEnteredWhileAppeared;
- (void)storeAccountDidChange;
@end

@implementation OnDevicePersonalizationDataManager

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_1E16552CC();
}

- (void)storeAccountDidChange
{
  v2 = self;
  sub_1E1BC99D8();
}

- (_TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager)init
{
  result = (_TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_requestQueue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_amsEngagement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_dataCacheAvailabilityConditionLock));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_activeStoreAccount));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal34OnDevicePersonalizationDataManager_timeoutTimer);
}

@end