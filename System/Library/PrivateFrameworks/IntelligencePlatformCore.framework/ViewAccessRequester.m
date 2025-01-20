@interface ViewAccessRequester
- (_TtC24IntelligencePlatformCore19ViewAccessRequester)init;
- (id)requestAssertionForViewName:(id)a3 error:(id *)a4;
@end

@implementation ViewAccessRequester

- (id)requestAssertionForViewName:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1C7925E60();
  v7 = v6;
  v8 = self;
  id v9 = sub_1C75DA7B4(v5, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC24IntelligencePlatformCore19ViewAccessRequester)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC24IntelligencePlatformCore19ViewAccessRequester_artifactURL;
  sub_1C791F280();
  sub_1C6E04764();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end