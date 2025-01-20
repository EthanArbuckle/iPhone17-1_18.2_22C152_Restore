@interface MPPlaybackContext(MPCPlaybackQueue)
- (void)getRemotePlaybackQueueRepresentationWithCompletion:()MPCPlaybackQueue;
@end

@implementation MPPlaybackContext(MPCPlaybackQueue)

- (void)getRemotePlaybackQueueRepresentationWithCompletion:()MPCPlaybackQueue
{
  v4 = (void *)MEMORY[0x263F087E8];
  v5 = a3;
  id v6 = [v4 errorWithDomain:@"MPCError" code:0 userInfo:0];
  ((void (**)(void, void, id))a3)[2](v5, 0, v6);
}

@end