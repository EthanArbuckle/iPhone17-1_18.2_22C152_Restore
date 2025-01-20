@interface INMediaDestinationResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INMediaDestinationResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (!v3)
  {
    v8 = 0;
    goto LABEL_21;
  }
  v5 = [v3 cmsOptionalDictionaryForKey:@"success"];
  if (!v5
    || ([v4 cmsOptionalDecodedClass:objc_opt_class() forKey:@"resolvedMediaDestination"],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [v4 cmsOptionalDictionaryForKey:@"disambiguation"];
    if (v7)
    {
      uint64_t v9 = [v4 cmsOptionalArrayOfClass:objc_opt_class() forKey:@"mediaDestinationsToDisambiguate"];
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = [MEMORY[0x263F0FC30] disambiguationWithMediaDestinationsToDisambiguate:v9];
LABEL_18:
        v8 = (void *)v11;
        goto LABEL_19;
      }
    }
    v10 = [v4 cmsOptionalDictionaryForKey:@"confirmationRequired"];
    if (v10
      && ([v4 cmsOptionalDecodedClass:objc_opt_class() forKey:@"mediaDestinationToConfirm"],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      v8 = [MEMORY[0x263F0FC30] confirmationRequiredWithMediaDestinationToConfirm:v12];
    }
    else
    {
      v14 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

      if (v14)
      {
        uint64_t v11 = [MEMORY[0x263F0FC30] unsupported];
        goto LABEL_18;
      }
      v15 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

      if (v15)
      {
        uint64_t v11 = [MEMORY[0x263F0FC30] needsValue];
        goto LABEL_18;
      }
      v8 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

      if (v8)
      {
        uint64_t v11 = [MEMORY[0x263F0FC30] notRequired];
        goto LABEL_18;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v7 = (void *)v6;
  v8 = [MEMORY[0x263F0FC30] successWithResolvedMediaDestination:v6];
LABEL_20:

LABEL_21:
  return v8;
}

@end