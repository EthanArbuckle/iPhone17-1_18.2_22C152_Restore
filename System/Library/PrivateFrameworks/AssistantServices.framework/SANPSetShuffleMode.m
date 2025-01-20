@interface SANPSetShuffleMode
- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4;
@end

@implementation SANPSetShuffleMode

- (void)_ad_performWithMediaRemoteService:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SANPSetShuffleMode *)self shuffleMode];
  unsigned __int8 v9 = [v8 isEqualToString:SANPShuffleModeOffValue];

  if (v9)
  {
    uint64_t v10 = 1;
  }
  else
  {
    v11 = [(SANPSetShuffleMode *)self shuffleMode];
    unsigned __int8 v12 = [v11 isEqualToString:SANPShuffleModeAlbumsValue];

    if (v12)
    {
      uint64_t v10 = 2;
    }
    else
    {
      v13 = [(SANPSetShuffleMode *)self shuffleMode];
      unsigned int v14 = [v13 isEqualToString:SANPShuffleModeSongsValue];

      if (v14) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = 0;
      }
    }
  }
  uint64_t v18 = kMRMediaRemoteOptionShuffleMode;
  v15 = +[NSNumber numberWithInt:v10];
  v19 = v15;
  v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  v17 = [v7 targetQueue];

  sub_10019BC88(26, self, v16, v17, v6);
}

@end