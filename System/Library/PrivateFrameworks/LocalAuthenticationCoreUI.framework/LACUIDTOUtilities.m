@interface LACUIDTOUtilities
+ (NSURL)dtoLearnMoreLinkURL;
- (LACUIDTOUtilities)init;
@end

@implementation LACUIDTOUtilities

+ (NSURL)dtoLearnMoreLinkURL
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  result = (NSURL *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (NSURL *)v12;
  }
  return result;
}

- (LACUIDTOUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)LACUIDTOUtilities;
  return [(LACUIDTOUtilities *)&v3 init];
}

@end