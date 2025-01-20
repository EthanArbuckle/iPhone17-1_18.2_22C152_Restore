@interface NSURL(DBAdditions)
- (uint64_t)db_isNowPlayingURL;
@end

@implementation NSURL(DBAdditions)

- (uint64_t)db_isNowPlayingURL
{
  v2 = [a1 scheme];
  v3 = [v2 lowercaseString];
  if ([v3 isEqualToString:@"nowplaying"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 absoluteString];
    if ([v5 hasSuffix:@"nowplaying"])
    {
      uint64_t v4 = 1;
    }
    else
    {
      v6 = [a1 absoluteString];
      uint64_t v4 = [v6 isEqualToString:@"music://cardisplay/show-now-playing"];
    }
  }

  return v4;
}

@end