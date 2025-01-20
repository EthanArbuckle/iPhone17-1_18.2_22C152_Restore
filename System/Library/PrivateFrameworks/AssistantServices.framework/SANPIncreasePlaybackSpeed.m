@interface SANPIncreasePlaybackSpeed
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPIncreasePlaybackSpeed

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  uint64_t v10 = kMRMediaRemoteOptionPlaybackRate;
  v11 = &off_100523F68;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v9 = [v7 targetQueue];

  sub_10019BC88(19, self, v8, v9, v6);
}

@end