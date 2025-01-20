@interface TokenCoder
+ (_TtC27DeviceActivityReportService10TokenCoder)internal;
- (_TtC27DeviceActivityReportService10TokenCoder)init;
- (id)decodeApplications:(id)a3;
- (id)decodeCategories:(id)a3;
- (id)decodeWebDomains:(id)a3;
- (id)encodeApplication:(id)a3;
- (id)encodeApplications:(id)a3;
- (id)encodeCategories:(id)a3;
- (id)encodeCategory:(id)a3;
- (id)encodeWebDomain:(id)a3;
- (id)encodeWebDomains:(id)a3;
@end

@implementation TokenCoder

+ (_TtC27DeviceActivityReportService10TokenCoder)internal
{
  if (qword_100029440 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100029E50;

  return (_TtC27DeviceActivityReportService10TokenCoder *)v2;
}

- (_TtC27DeviceActivityReportService10TokenCoder)init
{
  return (_TtC27DeviceActivityReportService10TokenCoder *)sub_10001B680();
}

- (id)decodeApplications:(id)a3
{
  sub_10000F944();
  uint64_t v4 = sub_10001E7D8();
  v5 = self;
  sub_10001D9B0((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_10001BD54);

  swift_bridgeObjectRelease();
  v6.super.isa = sub_10001E7C8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)decodeCategories:(id)a3
{
  sub_10000F944();
  uint64_t v4 = sub_10001E7D8();
  v5 = self;
  sub_10001D9B0((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_10001BE48);

  swift_bridgeObjectRelease();
  v6.super.isa = sub_10001E7C8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)decodeWebDomains:(id)a3
{
  sub_10000F944();
  uint64_t v4 = sub_10001E7D8();
  v5 = self;
  sub_10001D9B0((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_10001BF3C);

  swift_bridgeObjectRelease();
  v6.super.isa = sub_10001E7C8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)encodeApplications:(id)a3
{
  return sub_10001C498(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(bundleIdentifier:));
}

- (id)encodeCategories:(id)a3
{
  return sub_10001C498(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(categoryIdentifier:));
}

- (id)encodeWebDomains:(id)a3
{
  return sub_10001C498(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(webDomain:));
}

- (id)encodeApplication:(id)a3
{
  return sub_10001C590(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(bundleIdentifier:));
}

- (id)encodeCategory:(id)a3
{
  return sub_10001C590(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(categoryIdentifier:));
}

- (id)encodeWebDomain:(id)a3
{
  return sub_10001C590(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(webDomain:));
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end