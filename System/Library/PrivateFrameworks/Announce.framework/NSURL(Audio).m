@interface NSURL(Audio)
- (double)audioDuration;
@end

@implementation NSURL(Audio)

- (double)audioDuration
{
  v1 = [MEMORY[0x263EFA8D0] URLAssetWithURL:a1 options:0];
  v2 = v1;
  if (v1)
  {
    memset(&v5[1], 0, sizeof(CMTime));
    [v1 duration];
    v5[0] = v5[1];
    double Seconds = CMTimeGetSeconds(v5);
  }
  else
  {
    double Seconds = -1.0;
  }

  return Seconds;
}

@end