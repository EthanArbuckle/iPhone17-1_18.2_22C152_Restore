@interface DADevice(NowPlaying)
- (id)nowPlayingSubtitle;
@end

@implementation DADevice(NowPlaying)

- (id)nowPlayingSubtitle
{
  if (![a1 mediaPlaybackState]) {
    goto LABEL_4;
  }
  uint64_t v2 = [a1 mediaContentTitle];
  if (!v2) {
    goto LABEL_4;
  }
  v3 = (void *)v2;
  v4 = [a1 mediaContentTitle];
  char v5 = [v4 isEqualToString:&stru_1F06524E0];

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [a1 mediaContentArtistName];
    if (v8
      && (v9 = (void *)v8,
          [a1 mediaContentArtistName],
          v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:&stru_1F06524E0],
          v10,
          v9,
          (v11 & 1) == 0))
    {
      v12 = NSString;
      v13 = [a1 mediaContentTitle];
      v14 = [a1 mediaContentArtistName];
      v6 = [v12 stringWithFormat:@"%@ — %@", v13, v14];
    }
    else
    {
      v6 = [a1 mediaContentTitle];
    }
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

@end