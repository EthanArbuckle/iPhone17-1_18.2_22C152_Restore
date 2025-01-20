@interface FBKAppScan
+ (id)allInstalledApps;
+ (id)thirdPartyInstalledApps;
- (_TtC12FeedbackCore10FBKAppScan)init;
@end

@implementation FBKAppScan

+ (id)allInstalledApps
{
  swift_getObjCClassMetadata();
  static FBKAppScan.allInstalledApps()();
  sub_22A413DA8();
  v2 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v2;
}

+ (id)thirdPartyInstalledApps
{
  swift_getObjCClassMetadata();
  unint64_t v2 = static FBKAppScan.allInstalledApps()();
  sub_22A413C1C(v2);
  swift_bridgeObjectRelease();
  sub_22A413DA8();
  v3 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC12FeedbackCore10FBKAppScan)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBKAppScan();
  return [(FBKAppScan *)&v3 init];
}

@end