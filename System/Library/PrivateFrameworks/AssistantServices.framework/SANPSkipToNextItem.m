@interface SANPSkipToNextItem
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSkipToNextItem

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 targetQueue];
  sub_10019BC88(4, self, 0, v7, v6);
}

@end