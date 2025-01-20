@interface INAddMediaMediaItemResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INAddMediaMediaItemResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v4 = cmsSafeDictionary(a3);
  v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_35;
  }
  v6 = [v4 objectForKey:@"success"];

  if (!v6)
  {
    v10 = [v5 objectForKey:@"unsupported"];
    v7 = v10;
    if (v10)
    {
      v11 = [v10 objectForKey:@"reason"];
      v12 = v11;
      v13 = (void *)MEMORY[0x263F0F950];
      if (v11)
      {
        id v14 = v11;
        if ([v14 isEqualToString:@"loginRequired"])
        {
          uint64_t v15 = 1;
        }
        else if ([v14 isEqualToString:@"subscriptionRequired"])
        {
          uint64_t v15 = 2;
        }
        else if ([v14 isEqualToString:@"unsupportedMediaType"])
        {
          uint64_t v15 = 3;
        }
        else if ([v14 isEqualToString:@"explicitContentSettings"])
        {
          uint64_t v15 = 4;
        }
        else if ([v14 isEqualToString:@"cellularDataSettings"])
        {
          uint64_t v15 = 5;
        }
        else if ([v14 isEqualToString:@"restrictedContent"])
        {
          uint64_t v15 = 6;
        }
        else if ([v14 isEqualToString:@"serviceUnavailable"])
        {
          uint64_t v15 = 7;
        }
        else if ([v14 isEqualToString:@"regionRestriction"])
        {
          uint64_t v15 = 8;
        }
        else
        {
          uint64_t v15 = 7;
        }

        uint64_t v17 = [v13 unsupportedForReason:v15];
      }
      else
      {
        uint64_t v17 = [MEMORY[0x263F0F950] unsupported];
      }
      v9 = (void *)v17;

      goto LABEL_34;
    }
    v16 = [v5 cmsOptionalDictionaryForKey:@"needsValue"];

    if (v16)
    {
      uint64_t v8 = [MEMORY[0x263F0F950] needsValue];
      goto LABEL_5;
    }
    v18 = [v5 cmsOptionalDictionaryForKey:@"notRequired"];

    if (v18)
    {
      uint64_t v8 = [MEMORY[0x263F0F950] notRequired];
      goto LABEL_5;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_34;
  }
  v20.receiver = a1;
  v20.super_class = (Class)&off_26DE6F1E8;
  v7 = objc_msgSendSuper2(&v20, sel_instanceFromCMSCoded_, v5);
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = [objc_alloc(MEMORY[0x263F0F950]) initWithMediaItemResolutionResult:v7];
LABEL_5:
  v9 = (void *)v8;
LABEL_34:

LABEL_35:
  return v9;
}

@end