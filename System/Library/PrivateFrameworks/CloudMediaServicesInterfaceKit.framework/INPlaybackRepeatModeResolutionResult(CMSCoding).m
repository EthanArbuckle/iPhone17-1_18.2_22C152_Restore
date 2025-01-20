@interface INPlaybackRepeatModeResolutionResult(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
@end

@implementation INPlaybackRepeatModeResolutionResult(CMSCoding)

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
      v12 = [v10 cmsOptionalStringForKey:@"playbackRepeatModeToConfirm"];
      uint64_t v13 = INPlaybackRepeatModeFromString(v12);

      uint64_t v14 = [MEMORY[0x263F0FD78] confirmationRequiredWithPlaybackRepeatModeToConfirm:v13];
    }
    else
    {
      v15 = [v4 cmsOptionalDictionaryForKey:@"unsupported"];

      if (v15)
      {
        uint64_t v14 = [MEMORY[0x263F0FD78] unsupported];
      }
      else
      {
        v16 = [v4 cmsOptionalDictionaryForKey:@"needsValue"];

        if (v16)
        {
          uint64_t v14 = [MEMORY[0x263F0FD78] needsValue];
        }
        else
        {
          v9 = [v4 cmsOptionalDictionaryForKey:@"notRequired"];

          if (!v9)
          {
LABEL_14:

            goto LABEL_15;
          }
          uint64_t v14 = [MEMORY[0x263F0FD78] notRequired];
        }
      }
    }
    v9 = (void *)v14;
    goto LABEL_14;
  }
  v7 = [v5 cmsOptionalStringForKey:@"resolvedPlaybackRepeatMode"];
  uint64_t v8 = INPlaybackRepeatModeFromString(v7);

  v9 = [MEMORY[0x263F0FD78] successWithResolvedPlaybackRepeatMode:v8];
LABEL_15:

LABEL_16:
  return v9;
}

@end