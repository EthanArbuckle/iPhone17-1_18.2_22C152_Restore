@interface ARWorldTrackingConfigurationForObjectCapture
+ (ARVideoFormat)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (BOOL)supportsUserFaceTracking;
- (_TtC6CoreOC44ARWorldTrackingConfigurationForObjectCapture)init;
- (id)initPrivate;
@end

@implementation ARWorldTrackingConfigurationForObjectCapture

+ (BOOL)supportsUserFaceTracking
{
  return 0;
}

+ (ARVideoFormat)recommendedVideoFormatForHighResolutionFrameCapturing
{
  v2 = sub_24B57C98C();

  return (ARVideoFormat *)v2;
}

- (_TtC6CoreOC44ARWorldTrackingConfigurationForObjectCapture)init
{
  return (_TtC6CoreOC44ARWorldTrackingConfigurationForObjectCapture *)sub_24B57C918(self, (uint64_t)a2, (SEL *)&selRef_init);
}

- (id)initPrivate
{
  return sub_24B57C918(self, (uint64_t)a2, (SEL *)&selRef_initPrivate);
}

@end