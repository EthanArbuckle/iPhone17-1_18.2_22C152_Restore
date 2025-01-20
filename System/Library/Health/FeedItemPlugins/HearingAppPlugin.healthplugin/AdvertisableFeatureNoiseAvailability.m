@interface AdvertisableFeatureNoiseAvailability
@end

@implementation AdvertisableFeatureNoiseAvailability

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin36AdvertisableFeatureNoiseAvailability_activeDeviceSource;
  uint64_t v3 = sub_240A03068();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end