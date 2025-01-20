@interface MPCQueueDescriptorPlaybackIntentDataSource
- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4;
@end

@implementation MPCQueueDescriptorPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, void *, void))a4;
  id v8 = [a3 tracklistToken];
  v6 = [v8 playbackContexts];
  v7 = [v6 firstObject];
  v5[2](v5, v7, 0);
}

@end