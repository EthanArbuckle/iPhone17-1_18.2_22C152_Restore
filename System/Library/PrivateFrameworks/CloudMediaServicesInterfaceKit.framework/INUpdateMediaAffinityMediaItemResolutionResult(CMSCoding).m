@interface INUpdateMediaAffinityMediaItemResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INUpdateMediaAffinityMediaItemResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v4 = cmsSafeDictionary(a3);
  v5 = v4;
  if (!v4)
  {
    v13 = 0;
    goto LABEL_35;
  }
  v6 = [v4 objectForKey:@"unsupported"];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKey:@"reason"];
    v9 = v8;
    v10 = (void *)MEMORY[0x263F100B0];
    if (v8)
    {
      id v11 = v8;
      if ([v11 isEqualToString:@"loginRequired"])
      {
        uint64_t v12 = 1;
      }
      else if ([v11 isEqualToString:@"subscriptionRequired"])
      {
        uint64_t v12 = 2;
      }
      else if ([v11 isEqualToString:@"unsupportedMediaType"])
      {
        uint64_t v12 = 3;
      }
      else if ([v11 isEqualToString:@"explicitContentSettings"])
      {
        uint64_t v12 = 4;
      }
      else if ([v11 isEqualToString:@"cellularDataSettings"])
      {
        uint64_t v12 = 5;
      }
      else if ([v11 isEqualToString:@"restrictedContent"])
      {
        uint64_t v12 = 6;
      }
      else if ([v11 isEqualToString:@"serviceUnavailable"])
      {
        uint64_t v12 = 7;
      }
      else if ([v11 isEqualToString:@"regionRestriction"])
      {
        uint64_t v12 = 8;
      }
      else
      {
        uint64_t v12 = 7;
      }

      uint64_t v16 = [v10 unsupportedForReason:v12];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x263F100B0] unsupported];
    }
    goto LABEL_32;
  }
  v14 = [v5 cmsOptionalDictionaryForKey:@"needsValue"];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263F100B0] needsValue];
  }
  else
  {
    v17 = [v5 cmsOptionalDictionaryForKey:@"notRequired"];

    if (!v17)
    {
      v19.receiver = a1;
      v19.super_class = (Class)&off_26DE6F718;
      v9 = objc_msgSendSuper2(&v19, sel_instanceFromCMSCoded_, v5);
      if (!v9)
      {
        v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v16 = [objc_alloc(MEMORY[0x263F100B0]) initWithMediaItemResolutionResult:v9];
LABEL_32:
      v13 = (void *)v16;
      goto LABEL_33;
    }
    uint64_t v15 = [MEMORY[0x263F100B0] notRequired];
  }
  v13 = (void *)v15;
LABEL_34:

LABEL_35:
  return v13;
}

@end