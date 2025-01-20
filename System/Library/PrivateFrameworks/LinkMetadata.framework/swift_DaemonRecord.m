@interface swift_DaemonRecord
+ (NSArray)enumerated;
+ (id)fromBundleIdentifier:(id)a3;
+ (void)setEnumerated:(id)a3;
- (NSString)bundleIdentifier;
- (swift_DaemonRecord)init;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation swift_DaemonRecord

- (NSString)bundleIdentifier
{
  DaemonRecord.bundleIdentifier.getter();
  v2 = (void *)sub_19CBBF500();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_19CBBF530();
  uint64_t v6 = v5;
  v7 = self;
  DaemonRecord.bundleIdentifier.setter(v4, v6);
}

+ (NSArray)enumerated
{
  swift_getObjCClassMetadata();
  static DaemonRecord.enumerated.getter();
  v2 = (void *)sub_19CBBF700();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (void)setEnumerated:(id)a3
{
  swift_getObjCClassMetadata();
  uint64_t v3 = sub_19CBBF710();
  static DaemonRecord.enumerated.setter(v3);
}

+ (id)fromBundleIdentifier:(id)a3
{
  uint64_t v3 = sub_19CBBF530();
  uint64_t v5 = static DaemonRecord.from(bundleIdentifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (swift_DaemonRecord)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end