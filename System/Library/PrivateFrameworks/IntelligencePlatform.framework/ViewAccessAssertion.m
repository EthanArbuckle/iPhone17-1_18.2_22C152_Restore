@interface ViewAccessAssertion
- (BOOL)alwaysAvailable;
- (NSString)viewArtifactTableName;
- (NSString)viewName;
- (NSURL)viewArtifactURL;
- (_TtC20IntelligencePlatformP33_68BBD1BF2B042DA1870C4C06E01085D319ViewAccessAssertion)init;
@end

@implementation ViewAccessAssertion

- (NSString)viewName
{
  sub_1B2D8C7C4();
  v2 = (void *)sub_1B2E82348();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSURL)viewArtifactURL
{
  uint64_t v2 = sub_1B2E80498();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2D8C8E4((uint64_t)v5);
  v6 = (void *)sub_1B2E803F8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v6;
}

- (NSString)viewArtifactTableName
{
  sub_1B2D8C9B0();
  if (v2)
  {
    uint64_t v3 = (void *)sub_1B2E82348();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)alwaysAvailable
{
  return sub_1B2D8CA14() & 1;
}

- (_TtC20IntelligencePlatformP33_68BBD1BF2B042DA1870C4C06E01085D319ViewAccessAssertion)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self
     + OBJC_IVAR____TtC20IntelligencePlatformP33_68BBD1BF2B042DA1870C4C06E01085D319ViewAccessAssertion_viewArtifactURL;
  uint64_t v4 = sub_1B2E80498();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self
     + OBJC_IVAR____TtC20IntelligencePlatformP33_68BBD1BF2B042DA1870C4C06E01085D319ViewAccessAssertion_token;
  uint64_t v6 = sub_1B2E80818();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end