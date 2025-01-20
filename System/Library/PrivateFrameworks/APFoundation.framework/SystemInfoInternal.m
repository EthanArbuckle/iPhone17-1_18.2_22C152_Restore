@interface SystemInfoInternal
+ (BOOL)firstRunSinceReboot;
+ (NSString)bundleIdentifier;
+ (NSString)deviceModel;
+ (NSString)locale;
+ (NSString)longBuildVersion;
+ (NSString)modelType;
+ (NSString)osIdentifier;
+ (NSString)osName;
+ (NSString)osVersion;
+ (NSString)shortBuildVersion;
+ (NSString)systemDescription;
- (SystemInfoInternal)init;
@end

@implementation SystemInfoInternal

+ (NSString)osIdentifier
{
  v2 = (void *)sub_1D71DC838();
  return (NSString *)v2;
}

+ (NSString)osName
{
  v2 = (void *)sub_1D71DC838();
  return (NSString *)v2;
}

+ (NSString)osVersion
{
  return (NSString *)sub_1D70E8F30((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC9osVersionSSvgZ_0);
}

+ (NSString)longBuildVersion
{
  id v2 = objc_msgSend(self, sel_kBuildVersionString);
  v3 = (void *)MGGetStringAnswer();

  if (v3)
  {
    sub_1D71DC848();

    v5 = (void *)sub_1D71DC838();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (NSString)shortBuildVersion
{
  _s12APFoundation10SystemInfoC17shortBuildVersionSSSgvgZ_0();
  if (v2)
  {
    v3 = (void *)sub_1D71DC838();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (NSString)systemDescription
{
  return (NSString *)sub_1D70E8F30((uint64_t)a1, (uint64_t)a2, _s12APFoundation10SystemInfoC17systemDescriptionSSvgZ_0);
}

+ (NSString)bundleIdentifier
{
  id v2 = objc_msgSend(self, sel_mainBundle);
  id v3 = objc_msgSend(v2, sel_bundleIdentifier);

  if (v3)
  {
    sub_1D71DC848();

    id v3 = (id)sub_1D71DC838();
    swift_bridgeObjectRelease();
  }
  return (NSString *)v3;
}

+ (NSString)locale
{
  uint64_t v2 = sub_1D71DC708();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D71DC6F8();
  sub_1D71DC6E8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v6 = (void *)sub_1D71DC838();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (NSString)deviceModel
{
  return (NSString *)sub_1D70E8F30((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC11deviceModelSSvgZ_0);
}

+ (NSString)modelType
{
  return (NSString *)sub_1D70E8F30((uint64_t)a1, (uint64_t)a2, (void (*)(void))_s12APFoundation10SystemInfoC9modelTypeSSvgZ_0);
}

+ (BOOL)firstRunSinceReboot
{
  if (qword_1EB788F40 != -1) {
    swift_once();
  }
  return byte_1EB788560;
}

- (SystemInfoInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SystemInfo();
  return [(SystemInfoInternal *)&v3 init];
}

@end