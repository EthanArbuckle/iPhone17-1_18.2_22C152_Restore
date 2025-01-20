@interface AnalysisContext
- (NSString)geoLMRegionID;
- (_TtC6Speech15AnalysisContext)init;
- (id)_contextualStringsForKey:(id)a3;
- (id)_userDataForKey:(id)a3;
- (void)_setContextualStrings:(id)a3 forKey:(id)a4;
- (void)_setUserData:(id)a3 forKey:(id)a4;
- (void)setGeoLMRegionID:(id)a3;
@end

@implementation AnalysisContext

- (id)_contextualStringsForKey:(id)a3
{
  sub_1B7237188();
  v4 = self;
  uint64_t v5 = sub_1B71975B4();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_1B7237418();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_setContextualStrings:(id)a3 forKey:(id)a4
{
  if (a3) {
    sub_1B7237428();
  }
  sub_1B7237188();
  uint64_t v5 = self;
  sub_1B71976C4();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)_userDataForKey:(id)a3
{
  sub_1B7237188();
  v4 = self;
  sub_1B7197888((uint64_t)v12);

  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  if (v13)
  {
    v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = (void *)sub_1B72381F8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setUserData:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    sub_1B7237C48();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    id v8 = a4;
    v9 = self;
  }
  uint64_t v10 = sub_1B7237188();
  uint64_t v12 = v11;

  sub_1B7197AD0((uint64_t)v13, v10, v12);
  swift_bridgeObjectRelease();

  sub_1B719E2D0((uint64_t)v13, &qword_1EB8366D8);
}

- (NSString)geoLMRegionID
{
  v2 = self;
  sub_1B7198748();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_1B7237178();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setGeoLMRegionID:(id)a3
{
  if (a3)
  {
    char v4 = sub_1B7237188();
    uint64_t v6 = v5;
  }
  else
  {
    char v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_1B719887C(v4, v6);
}

- (_TtC6Speech15AnalysisContext)init
{
  return (_TtC6Speech15AnalysisContext *)AnalysisContext.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end