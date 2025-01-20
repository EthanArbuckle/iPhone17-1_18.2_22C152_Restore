@interface SAMPSetPlaybackPosition
- (void)_ad_performNextItemWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performPreviousItemWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performSeekToBeginningWithTargetQueue:(id)a3 completion:(id)a4;
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SAMPSetPlaybackPosition

- (void)_ad_performPreviousItemWithTargetQueue:(id)a3 completion:(id)a4
{
  uint64_t v9 = kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition;
  v10 = &__kCFBooleanTrue;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  sub_10019BC88(5, self, v8, v7, v6);
}

- (void)_ad_performNextItemWithTargetQueue:(id)a3 completion:(id)a4
{
}

- (void)_ad_performSeekToBeginningWithTargetQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  v10 = v6;
  id v8 = v5;
  id v9 = v6;
  AFGetNowPlayingInfoDictionary();
}

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  v10 = (void (**)(id, id, void))a4;
  id v6 = a3;
  unsigned int v7 = [(SAMPSetPlaybackPosition *)self position];
  id v8 = [v6 targetQueue];

  switch(v7)
  {
    case 3u:
      [(SAMPSetPlaybackPosition *)self _ad_performSeekToBeginningWithTargetQueue:v8 completion:v10];
      break;
    case 2u:
      [(SAMPSetPlaybackPosition *)self _ad_performPreviousItemWithTargetQueue:v8 completion:v10];
      break;
    case 1u:
      [(SAMPSetPlaybackPosition *)self _ad_performNextItemWithTargetQueue:v8 completion:v10];
      break;
    default:
      if (v10)
      {
        id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unsupported playback position request"];
        v10[2](v10, v9, 0);
      }
      break;
  }
}

@end