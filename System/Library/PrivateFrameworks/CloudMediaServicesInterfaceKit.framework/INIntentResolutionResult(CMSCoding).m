@interface INIntentResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (void)cmsCoded;
@end

@implementation INIntentResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3 = a3;
  v4 = cmsSafeDictionary(v3);
  if (!v4)
  {
    v9 = 0;
    goto LABEL_16;
  }
  if (instanceFromCMSCoded__onceToken != -1) {
    dispatch_once(&instanceFromCMSCoded__onceToken, &__block_literal_global_520);
  }
  v5 = [v4 cmsOptionalStringForKey:@"class"];
  if (v5)
  {
    id v6 = (id)[(id)instanceFromCMSCoded__classmap objectForKey:v5];
    if (v6)
    {
      uint64_t v7 = [v6 instanceFromCMSCoded:v3];
LABEL_14:
      v9 = (void *)v7;
      goto LABEL_15;
    }
  }
  v8 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

  if (v8)
  {
    uint64_t v7 = [MEMORY[0x263F0FBC0] needsValue];
    goto LABEL_14;
  }
  v10 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

  if (v10)
  {
    uint64_t v7 = [MEMORY[0x263F0FBC0] notRequired];
    goto LABEL_14;
  }
  v9 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

  if (v9)
  {
    uint64_t v7 = [MEMORY[0x263F0FBC0] unsupported];
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  return v9;
}

- (void)cmsCoded
{
  uint64_t v1 = [a1 resolutionResultCode];
  if ((unint64_t)(v1 - 1) > 4) {
    return &unk_26DE63F98;
  }
  else {
    return *(&off_2648885B0 + v1 - 1);
  }
}

@end