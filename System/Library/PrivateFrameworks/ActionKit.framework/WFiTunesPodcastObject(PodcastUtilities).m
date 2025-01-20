@interface WFiTunesPodcastObject(PodcastUtilities)
- (id)podcastQueryDictionaryWithPlaybackOrder:()PodcastUtilities;
@end

@implementation WFiTunesPodcastObject(PodcastUtilities)

- (id)podcastQueryDictionaryWithPlaybackOrder:()PodcastUtilities
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"playbackOrder"];

  v6 = [a1 identifier];

  if (v6)
  {
    v7 = [a1 identifier];
    v8 = @"storeCollectionId";
  }
  else
  {
    v9 = [a1 podcastUUID];

    if (!v9) {
      goto LABEL_6;
    }
    v7 = [a1 podcastUUID];
    v8 = @"uuid";
  }
  [v5 setObject:v7 forKeyedSubscript:v8];

LABEL_6:
  return v5;
}

@end