@interface AVPlayerItem(AVPlayerItem_AVMusicAppBehaviorContextAdditions)
- (uint64_t)avkit_musicAppBehaviorContext;
- (uint64_t)avkit_setMusicBehaviorData:()AVPlayerItem_AVMusicAppBehaviorContextAdditions;
@end

@implementation AVPlayerItem(AVPlayerItem_AVMusicAppBehaviorContextAdditions)

- (uint64_t)avkit_setMusicBehaviorData:()AVPlayerItem_AVMusicAppBehaviorContextAdditions
{
  return objc_msgSend(a1, "avkit_setValue:forAVKitProperty:", a3, @"avkit_musicAppBehaviorContext");
}

- (uint64_t)avkit_musicAppBehaviorContext
{
  return objc_msgSend(a1, "avkit_valueForAVKitProperty:", @"avkit_musicAppBehaviorContext");
}

@end