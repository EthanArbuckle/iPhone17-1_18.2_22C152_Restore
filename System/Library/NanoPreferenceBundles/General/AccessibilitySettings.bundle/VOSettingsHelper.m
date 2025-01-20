@interface VOSettingsHelper
+ (float)speakingRate;
+ (void)setSpeakingRate:(float)a3;
- (_TtC21AccessibilitySettings16VOSettingsHelper)init;
@end

@implementation VOSettingsHelper

+ (float)speakingRate
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = ObjCClassMetadata;
  sub_246A67244((uint64_t)&unk_2691BFF80, v3);
  float v5 = v4;
  swift_release();
  return v5;
}

+ (void)setSpeakingRate:(float)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = ObjCClassMetadata;
  *(float *)(v5 + 24) = a3;
  sub_246A67558((uint64_t)&unk_2691BFF78, v5);

  swift_release();
}

- (_TtC21AccessibilitySettings16VOSettingsHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VOSettingsHelper();
  return [(VOSettingsHelper *)&v3 init];
}

@end