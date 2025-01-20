@interface INBooleanResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INBooleanResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (!v3)
  {
    v10 = 0;
    goto LABEL_11;
  }
  v5 = [v3 cmsOptionalDictionaryForKey:@"success"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 cmsOptionalBoolForKey:@"resolvedValue"];
    v8 = v7;
    if (!v7)
    {
      v10 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x263F0F9D0], "successWithResolvedValue:", objc_msgSend(v7, "BOOLValue"));
  }
  else
  {
    v11 = [v4 cmsOptionalDictionaryForKey:@"confirmationRequired"];
    v8 = v11;
    if (v11)
    {
      v12 = (void *)MEMORY[0x263F0F9D0];
      v13 = [v11 cmsOptionalBoolForKey:@"valueToConfirm"];
      v10 = [v12 confirmationRequiredWithValueToConfirm:v13];

      goto LABEL_10;
    }
    v15 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

    if (v15)
    {
      uint64_t v9 = [MEMORY[0x263F0F9D0] unsupported];
    }
    else
    {
      v16 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

      if (v16)
      {
        uint64_t v9 = [MEMORY[0x263F0F9D0] needsValue];
      }
      else
      {
        v10 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

        if (!v10) {
          goto LABEL_10;
        }
        uint64_t v9 = [MEMORY[0x263F0F9D0] notRequired];
      }
    }
  }
  v10 = (void *)v9;
LABEL_10:

LABEL_11:
  return v10;
}

@end