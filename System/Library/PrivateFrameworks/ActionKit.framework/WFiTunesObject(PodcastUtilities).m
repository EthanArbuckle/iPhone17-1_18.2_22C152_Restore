@interface WFiTunesObject(PodcastUtilities)
- (id)podcastQueryDictionaryWithPlaybackOrder:()PodcastUtilities;
@end

@implementation WFiTunesObject(PodcastUtilities)

- (id)podcastQueryDictionaryWithPlaybackOrder:()PodcastUtilities
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 kind];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F87730]];

  if (v6)
  {
    v10[0] = @"playbackOrder";
    v10[1] = @"storeTrackId";
    v11[0] = v4;
    v7 = [a1 identifier];
    v11[1] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end