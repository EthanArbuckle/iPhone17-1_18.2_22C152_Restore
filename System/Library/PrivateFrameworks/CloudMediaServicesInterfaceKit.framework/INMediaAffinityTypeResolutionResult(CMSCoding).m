@interface INMediaAffinityTypeResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INMediaAffinityTypeResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v5 = [v3 cmsOptionalDictionaryForKey:@"success"];
  v6 = v5;
  if (!v5)
  {
    v10 = [v4 cmsOptionalDictionaryForKey:@"confirmationRequired"];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 cmsOptionalStringForKey:@"mediaAffinityTypeToConfirm"];
      uint64_t v13 = INMediaAffinityTypeFromString(v12);

      uint64_t v14 = [MEMORY[0x263F0FC18] confirmationRequiredWithMediaAffinityTypeToConfirm:v13];
    }
    else
    {
      v15 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

      if (v15)
      {
        uint64_t v14 = [MEMORY[0x263F0FC18] unsupported];
      }
      else
      {
        v16 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

        if (v16)
        {
          uint64_t v14 = [MEMORY[0x263F0FC18] needsValue];
        }
        else
        {
          v9 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

          if (!v9)
          {
LABEL_14:

            goto LABEL_15;
          }
          uint64_t v14 = [MEMORY[0x263F0FC18] notRequired];
        }
      }
    }
    v9 = (void *)v14;
    goto LABEL_14;
  }
  v7 = [v5 cmsOptionalStringForKey:@"resolvedMediaAffinityType"];
  uint64_t v8 = INMediaAffinityTypeFromString(v7);

  v9 = [MEMORY[0x263F0FC18] successWithResolvedMediaAffinityType:v8];
LABEL_15:

LABEL_16:
  return v9;
}

@end