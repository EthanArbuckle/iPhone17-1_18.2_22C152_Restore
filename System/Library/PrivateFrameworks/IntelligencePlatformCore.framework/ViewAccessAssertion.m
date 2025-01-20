@interface ViewAccessAssertion
- (BOOL)alwaysAvailable;
- (NSString)viewArtifactTableName;
- (NSString)viewName;
- (NSURL)viewArtifactURL;
- (_TtC24IntelligencePlatformCore19ViewAccessAssertion)init;
@end

@implementation ViewAccessAssertion

- (NSString)viewName
{
  sub_1C75DA1E4();
  v2 = (void *)sub_1C7925E30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)viewArtifactURL
{
  uint64_t v2 = sub_1C791F280();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C75DA304((uint64_t)v5);
  v6 = (void *)sub_1C791F1E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (NSString)viewArtifactTableName
{
  sub_1C75DA3C8();
  if (v2)
  {
    uint64_t v3 = (void *)sub_1C7925E30();
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
  return sub_1C75DA42C() & 1;
}

- (_TtC24IntelligencePlatformCore19ViewAccessAssertion)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC24IntelligencePlatformCore19ViewAccessAssertion_viewArtifactURL;
  sub_1C791F280();
  sub_1C6E04764();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
}

@end