@interface INAddMediaMediaDestinationResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INAddMediaMediaDestinationResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v4 = cmsSafeDictionary(a3);
  v5 = v4;
  if (!v4)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v6 = [v4 objectForKey:@"success"];

  if (v6)
  {
    v15.receiver = a1;
    v15.super_class = (Class)&off_26DE6F328;
    v7 = objc_msgSendSuper2(&v15, sel_instanceFromCMSCoded_, v5);
    if (!v7)
    {
      v9 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x263F0F948]) initWithMediaDestinationResolutionResult:v7];
  }
  else
  {
    v10 = [v5 objectForKey:@"unsupported"];
    v7 = v10;
    if (v10)
    {
      v11 = [v10 objectForKey:@"reason"];
      v12 = v11;
      if (v11) {
        [MEMORY[0x263F0F948] unsupportedForReason:INAddMediaMediaDestinationUnsupportedReasonFromString(v11)];
      }
      else {
      v9 = [MEMORY[0x263F0F948] unsupported];
      }

      goto LABEL_15;
    }
    v13 = [v5 cmsOptionalDictionaryForKey:@"needsValue"];

    if (v13)
    {
      uint64_t v8 = [MEMORY[0x263F0F948] needsValue];
    }
    else
    {
      v9 = [v5 cmsOptionalDictionaryForKey:@"notRequired"];

      if (!v9) {
        goto LABEL_15;
      }
      uint64_t v8 = [MEMORY[0x263F0F948] notRequired];
    }
  }
  v9 = (void *)v8;
LABEL_15:

LABEL_16:
  return v9;
}

@end