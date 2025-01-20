@interface SANPSetPlaybackSpeed
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetPlaybackSpeed

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  uint64_t v11 = kMRMediaRemoteOptionPlaybackRate;
  id v6 = a4;
  id v7 = a3;
  [(SANPSetPlaybackSpeed *)self scalingFactor];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  v10 = [v7 targetQueue];

  sub_10019BC88(19, self, v9, v10, v6);
}

@end