@interface SANPSkipTimeInterval
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSkipTimeInterval

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SANPSkipTimeInterval *)self adjustmentInMilliseconds];
  uint64_t v9 = (uint64_t)[v8 integerValue];

  if (v9 >= 0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = -v9;
  }
  if (v9 >= 0) {
    uint64_t v11 = 17;
  }
  else {
    uint64_t v11 = 18;
  }
  uint64_t v15 = kMRMediaRemoteOptionSkipInterval;
  v12 = +[NSNumber numberWithDouble:(double)v10 / 1000.0];
  v16 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  v14 = [v7 targetQueue];

  sub_10019BC88(v11, self, v13, v14, v6);
}

@end