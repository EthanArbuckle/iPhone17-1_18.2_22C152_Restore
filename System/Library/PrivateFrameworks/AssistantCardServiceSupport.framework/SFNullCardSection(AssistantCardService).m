@interface SFNullCardSection(AssistantCardService)
+ (id)acs_wildCardSection;
@end

@implementation SFNullCardSection(AssistantCardService)

+ (id)acs_wildCardSection
{
  v0 = objc_msgSend(MEMORY[0x263F67980], "acs_uniquelyIdentifiedCardSection");
  objc_msgSend(v0, "acs_setParameters:", MEMORY[0x263EFFA68]);
  return v0;
}

@end