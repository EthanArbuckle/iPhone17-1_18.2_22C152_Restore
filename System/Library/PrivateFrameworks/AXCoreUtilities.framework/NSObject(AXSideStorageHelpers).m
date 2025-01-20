@interface NSObject(AXSideStorageHelpers)
- (uint64_t)_axIsWrappedPointer;
- (void)_axSetIsWrappedPointer:()AXSideStorageHelpers;
@end

@implementation NSObject(AXSideStorageHelpers)

- (uint64_t)_axIsWrappedPointer
{
  return __UIAccessibilityGetAssociatedBool(a1, &__NSObject___axIsWrappedPointer);
}

- (void)_axSetIsWrappedPointer:()AXSideStorageHelpers
{
}

@end