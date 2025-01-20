@interface _MPCPlaybackContextPlaybackIntentDataSource
- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4;
@end

@implementation _MPCPlaybackContextPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 tracklistToken];
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
}

@end