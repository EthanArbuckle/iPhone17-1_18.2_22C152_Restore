@interface Feature
+ (BOOL)isDeviceActivityBiomeEnabled;
+ (BOOL)isDeviceActivityEnabled;
+ (BOOL)isDeviceActivityUIEnabled;
- (_TtC14DeviceActivity7Feature)init;
@end

@implementation Feature

+ (BOOL)isDeviceActivityEnabled
{
  swift_beginAccess();
  if (byte_1EA458148 == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    unint64_t v6 = sub_1C6C23170();
    v4[0] = 0;
    char v2 = sub_1C6CAC598();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    char v2 = byte_1EA458148 & 1;
  }
  return v2 & 1;
}

+ (BOOL)isDeviceActivityBiomeEnabled
{
  swift_beginAccess();
  if (byte_1EA458149 == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    unint64_t v6 = sub_1C6C23170();
    v4[0] = 1;
    char v2 = sub_1C6CAC598();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    char v2 = byte_1EA458149 & 1;
  }
  return v2 & 1;
}

+ (BOOL)isDeviceActivityUIEnabled
{
  swift_beginAccess();
  if (byte_1EA45814A == 2)
  {
    v5 = &type metadata for Feature.FeatureFlags;
    unint64_t v6 = sub_1C6C23170();
    v4[0] = 2;
    char v2 = sub_1C6CAC598();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    char v2 = byte_1EA45814A & 1;
  }
  return v2 & 1;
}

- (_TtC14DeviceActivity7Feature)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Feature();
  return [(Feature *)&v3 init];
}

@end