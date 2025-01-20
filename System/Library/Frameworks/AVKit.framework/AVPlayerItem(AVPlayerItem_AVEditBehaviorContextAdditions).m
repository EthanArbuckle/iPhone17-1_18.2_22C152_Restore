@interface AVPlayerItem(AVPlayerItem_AVEditBehaviorContextAdditions)
- (uint64_t)avkit_currentEditBehaviorContext;
- (uint64_t)avkit_setCurrentEditBehaviorContext:()AVPlayerItem_AVEditBehaviorContextAdditions;
@end

@implementation AVPlayerItem(AVPlayerItem_AVEditBehaviorContextAdditions)

- (uint64_t)avkit_setCurrentEditBehaviorContext:()AVPlayerItem_AVEditBehaviorContextAdditions
{
  return objc_msgSend(a1, "avkit_setValue:forAVKitProperty:", a3, @"avkit_currentEditBehaviorContext");
}

- (uint64_t)avkit_currentEditBehaviorContext
{
  return objc_msgSend(a1, "avkit_valueForAVKitProperty:", @"avkit_currentEditBehaviorContext");
}

@end