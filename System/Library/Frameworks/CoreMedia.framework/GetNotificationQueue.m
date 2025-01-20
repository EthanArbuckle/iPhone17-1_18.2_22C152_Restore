@interface GetNotificationQueue
@end

@implementation GetNotificationQueue

dispatch_queue_t __figMobileAsset_GetNotificationQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.coremedia.mobileasset", 0);
  figMobileAsset_GetNotificationQueue_mobileAssetNotificationQueue = (uint64_t)result;
  return result;
}

@end