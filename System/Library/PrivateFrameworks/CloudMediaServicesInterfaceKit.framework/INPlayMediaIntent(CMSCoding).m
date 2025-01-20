@interface INPlayMediaIntent(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INPlayMediaIntent(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  if (v3)
  {
    v4 = [v3 cmsOptionalArrayOfDecodedClass:objc_opt_class() forKey:@"mediaItems"];
    v5 = (void *)MEMORY[0x263F0FC40];
    v6 = [v3 cmsOptionalDictionaryForKey:@"mediaContainer"];
    v7 = [v5 instanceFromCMSCoded:v6];

    v8 = [v3 cmsOptionalBoolForKey:@"playShuffled"];
    v9 = [v3 cmsOptionalStringForKey:@"playbackRepeatMode"];
    uint64_t v10 = INPlaybackRepeatModeFromString(v9);

    v11 = [v3 cmsOptionalBoolForKey:@"resumePlayback"];
    v12 = [v3 cmsOptionalStringForKey:@"playbackQueueLocation"];
    uint64_t v13 = INPlaybackQueueLocationFromString(v12);

    v14 = [v3 cmsOptionalNumberForKey:@"playbackSpeed"];
    v15 = (void *)MEMORY[0x263F0FC50];
    v16 = [v3 cmsOptionalDictionaryForKey:@"mediaSearch"];
    v17 = [v15 instanceFromCMSCoded:v16];

    v18 = (void *)[objc_alloc(MEMORY[0x263F0FD48]) initWithMediaItems:v4 mediaContainer:v7 playShuffled:v8 playbackRepeatMode:v10 resumePlayback:v11 playbackQueueLocation:v13 playbackSpeed:v14 mediaSearch:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)cmsCoded
{
  v12.receiver = a1;
  v12.super_class = (Class)&off_26DE6CF78;
  v2 = objc_msgSendSuper2(&v12, sel_cmsCoded);
  [v2 setObject:@"PlayMediaIntent" forKey:@"class"];
  v3 = [a1 mediaItems];
  [v2 cmsSetOptionalCodedObject:v3 forKey:@"mediaItems"];

  v4 = [a1 mediaContainer];
  [v2 cmsSetOptionalCodedObject:v4 forKey:@"mediaContainer"];

  v5 = [a1 playShuffled];
  [v2 cmsSetOptionalObject:v5 forKey:@"playShuffled"];

  v6 = INPlaybackRepeatModeToString([a1 playbackRepeatMode]);
  [v2 setObject:v6 forKey:@"playbackRepeatMode"];

  v7 = [a1 resumePlayback];
  [v2 cmsSetOptionalObject:v7 forKey:@"resumePlayback"];

  v8 = INPlaybackQueueLocationToString([a1 playbackQueueLocation]);
  [v2 setObject:v8 forKey:@"playbackQueueLocation"];

  v9 = [a1 playbackSpeed];
  [v2 cmsSetOptionalObject:v9 forKey:@"playbackSpeed"];

  uint64_t v10 = [a1 mediaSearch];
  [v2 cmsSetOptionalCodedObject:v10 forKey:@"mediaSearch"];

  return v2;
}

@end