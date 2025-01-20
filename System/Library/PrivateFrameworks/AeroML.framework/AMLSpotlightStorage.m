@interface AMLSpotlightStorage
+ (id)clientDonationForPhotoId:(id)a3 aroundTime:(double)a4;
+ (id)clientDonationsForSession:(id)a3;
+ (id)featuresConfigurationForConfigurationId:(id)a3;
+ (id)featuresForSpotlightId:(id)a3;
+ (id)metadataForPhotoId:(id)a3 aroundTime:(double)a4;
+ (id)metadataForSession:(id)a3;
- (AMLSpotlightStorage)init;
@end

@implementation AMLSpotlightStorage

+ (id)featuresConfigurationForConfigurationId:(id)a3
{
  uint64_t v3 = sub_2477BD6D8();
  v5 = static AMLSpotlightStorage.featuresConfiguration(forConfigurationId:)(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)metadataForPhotoId:(id)a3 aroundTime:(double)a4
{
  return sub_247770918(a4, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, double))static AMLSpotlightStorage.metadata(forPhotoId:aroundTime:));
}

+ (id)metadataForSession:(id)a3
{
  uint64_t v3 = sub_2477BD6D8();
  static AMLSpotlightStorage.metadata(forSession:)(v3, v4);
  uint64_t v5 = swift_bridgeObjectRelease();
  type metadata accessor for AMLStorageMetadata(v5);
  v6 = (void *)sub_2477BD738();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)featuresForSpotlightId:(id)a3
{
  uint64_t v3 = sub_2477BD6D8();
  id v5 = static AMLSpotlightStorage.features(forSpotlightId:)(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)clientDonationsForSession:(id)a3
{
  sub_2477BD6D8();
  swift_getObjCClassMetadata();
  sub_24776FFE4();
  swift_bridgeObjectRelease();
  type metadata accessor for AMLClientDonations(0);
  uint64_t v3 = (void *)sub_2477BD738();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)clientDonationForPhotoId:(id)a3 aroundTime:(double)a4
{
  return sub_247770918(a4, (uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, double))sub_247770590);
}

- (AMLSpotlightStorage)init
{
  return (AMLSpotlightStorage *)AMLSpotlightStorage.init()();
}

@end