@interface MPCPodcastsPlaybackIntentDataSource
- (MPCPodcastsPlaybackIntentDataSource)init;
- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5;
@end

@implementation MPCPodcastsPlaybackIntentDataSource

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_21BCD03A4(v9, a4, (uint64_t)v10, (void (**)(void, void, void))v8);
  _Block_release(v8);
}

- (MPCPodcastsPlaybackIntentDataSource)init
{
  return (MPCPodcastsPlaybackIntentDataSource *)MPCPodcastsPlaybackIntentDataSource.init()();
}

@end