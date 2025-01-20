@interface SFCardSection(AssistantCardService)
+ (id)acs_uniquelyIdentifiedCardSection;
- (id)acs_parameterKeyPathFromParameter:()AssistantCardService;
- (void)acs_addParameter:()AssistantCardService;
- (void)acs_setParameters:()AssistantCardService;
@end

@implementation SFCardSection(AssistantCardService)

+ (id)acs_uniquelyIdentifiedCardSection
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = [MEMORY[0x263F08C38] UUID];
  v2 = [v1 UUIDString];
  [v0 setCardSectionId:v2];

  return v0;
}

- (void)acs_setParameters:()AssistantCardService
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "acs_parameterKeyPathFromParameter:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [a1 setParameterKeyPaths:v5];
}

- (void)acs_addParameter:()AssistantCardService
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [a1 parameterKeyPaths];
  id v9 = [v4 arrayWithArray:v6];

  uint64_t v7 = objc_msgSend(a1, "acs_parameterKeyPathFromParameter:", v5);

  if ([v7 length]) {
    [v9 addObject:v7];
  }
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  [a1 setParameterKeyPaths:v8];
}

- (id)acs_parameterKeyPathFromParameter:()AssistantCardService
{
  id v3 = a3;
  id v4 = (void *)[v3 parameterClass];
  if ([v4 isSubclassOfClass:objc_opt_class()])
  {
    [v3 parameterClass];
    id v5 = INIntentSchemaGetIntentDescriptionWithFacadeClass();
  }
  else
  {
    if (![v4 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    [v3 parameterClass];
    id v5 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
  }
  id v6 = v5;
  uint64_t v7 = [v5 name];

  if (v7)
  {
    uint64_t v8 = NSString;
    id v9 = [v3 _subscriptedKeyPath];
    uint64_t v10 = [v8 stringWithFormat:@"%@.%@", v7, v9];

    goto LABEL_9;
  }
LABEL_8:
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

@end