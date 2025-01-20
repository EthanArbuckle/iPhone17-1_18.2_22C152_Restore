@interface SRBundleUtilities
+ (id)getSiriAppBundle;
- (_TtC4Siri17SRBundleUtilities)init;
@end

@implementation SRBundleUtilities

+ (id)getSiriAppBundle
{
  id v2 = [objc_allocWithZone((Class)type metadata accessor for SRBundleLookupClass()) init];
  swift_getObjectType();

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = [self bundleForClass:ObjCClassFromMetadata];

  return v4;
}

- (_TtC4Siri17SRBundleUtilities)init
{
  return (_TtC4Siri17SRBundleUtilities *)sub_100082DDC(self, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for SRBundleUtilities);
}

@end