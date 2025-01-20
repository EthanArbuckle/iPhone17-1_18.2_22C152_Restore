@interface AVPlayerItem(MPAdditions)
- (id)nowPlayingInfo;
- (void)setNowPlayingInfo:()MPAdditions;
@end

@implementation AVPlayerItem(MPAdditions)

- (id)nowPlayingInfo
{
  return objc_getAssociatedObject(a1, sel_nowPlayingInfo);
}

- (void)setNowPlayingInfo:()MPAdditions
{
  objc_setAssociatedObject(a1, sel_nowPlayingInfo, a3, (void *)1);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MPPlayerItemNowPlayingInfoDidChangeNotification" object:a1];
}

@end