@interface HUUtilityConfigurationHelper
- (HUUtilityConfigurationHelper)init;
- (NSArray)fields;
- (NSArray)sections;
- (NSString)logoURL;
- (NSString)name;
- (NSURL)OAuthURL;
- (void)isTAFEnabledWithCompletionHandler:(id)a3;
@end

@implementation HUUtilityConfigurationHelper

- (NSArray)fields
{
  type metadata accessor for HUTAFField();
  sub_1BE9C36A8();
  v2 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (NSString)name
{
  v2 = self;
  sub_1BE9C21D8();
  if (!v3) {
    sub_1BE9C21B8();
  }

  v4 = (void *)sub_1BE9C49B8();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSURL)OAuthURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1142D0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1BE9C21C8();

  uint64_t v7 = sub_1BE9C1018();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1BE9C0FD8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (NSString)logoURL
{
  v2 = self;
  uint64_t v3 = (void *)sub_1BE9C21A8();
  uint64_t v4 = (void *)sub_1BE9C2168();

  sub_1BE9C22F8();
  v5 = (void *)sub_1BE9C49B8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSArray)sections
{
  v2 = self;
  UtilityConfigurationHelper.sections.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA116050);
  uint64_t v3 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)isTAFEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA116928;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA113230;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1167F0, (uint64_t)v12);
  swift_release();
}

- (HUUtilityConfigurationHelper)init
{
  result = (HUUtilityConfigurationHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end