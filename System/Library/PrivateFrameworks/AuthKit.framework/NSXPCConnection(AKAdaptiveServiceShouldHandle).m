@interface NSXPCConnection(AKAdaptiveServiceShouldHandle)
- (uint64_t)shouldHandleInvalidation;
- (void)setShouldHandleInvalidation:()AKAdaptiveServiceShouldHandle;
@end

@implementation NSXPCConnection(AKAdaptiveServiceShouldHandle)

- (uint64_t)shouldHandleInvalidation
{
  v1 = objc_getAssociatedObject(a1, &_AKAdaptiveServiceShouldHandleInvalidationKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setShouldHandleInvalidation:()AKAdaptiveServiceShouldHandle
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_AKAdaptiveServiceShouldHandleInvalidationKey, v2, (void *)0x301);
}

@end