@interface NSCloudKitMirroringDelegateSetupRequest
- (id)createDefaultOptions;
@end

@implementation NSCloudKitMirroringDelegateSetupRequest

- (id)createDefaultOptions
{
  return objc_alloc_init(NSCloudKitMirroringDelegateSetupRequestOptions);
}

@end