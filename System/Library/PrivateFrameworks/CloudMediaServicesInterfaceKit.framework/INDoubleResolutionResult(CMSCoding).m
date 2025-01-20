@interface INDoubleResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INDoubleResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (!v3)
  {
    v11 = 0;
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
      v11 = 0;
      goto LABEL_10;
    }
    v9 = (void *)MEMORY[0x263F0FAB0];
    [v7 doubleValue];
    uint64_t v10 = objc_msgSend(v9, "successWithResolvedValue:");
  }
  else
  {
    v12 = [v4 cmsOptionalDictionaryForKey:@"confirmationRequired"];
    v8 = v12;
    if (v12)
    {
      v13 = (void *)MEMORY[0x263F0FAB0];
      v14 = [v12 cmsOptionalNumberForKey:@"valueToConfirm"];
      v11 = [v13 confirmationRequiredWithValueToConfirm:v14];

      goto LABEL_10;
    }
    v16 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

    if (v16)
    {
      uint64_t v10 = [MEMORY[0x263F0FAB0] unsupported];
    }
    else
    {
      v17 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

      if (v17)
      {
        uint64_t v10 = [MEMORY[0x263F0FAB0] needsValue];
      }
      else
      {
        v11 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

        if (!v11) {
          goto LABEL_10;
        }
        uint64_t v10 = [MEMORY[0x263F0FAB0] notRequired];
      }
    }
  }
  v11 = (void *)v10;
LABEL_10:

LABEL_11:
  return v11;
}

@end