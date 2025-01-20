@interface SANPSeekToPlaybackPosition
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSeekToPlaybackPosition

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(SANPSeekToPlaybackPosition *)self _ad_mediaRemoteOptions];
  v8 = [(SANPSeekToPlaybackPosition *)self positionInMilliseconds];
  id v9 = [v8 integerValue];

  v10 = +[NSNumber numberWithDouble:(double)(uint64_t)v9 / 1000.0];
  [v12 setValue:v10 forKey:kMRMediaRemoteOptionPlaybackPosition];

  v11 = [v7 targetQueue];

  AFMediaRemoteSendCommandWithOptions();
}

@end