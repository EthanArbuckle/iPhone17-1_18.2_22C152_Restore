@interface NSMutableDictionary(DMCUtilities)
- (void)DMCSetObjectIfNotNil:()DMCUtilities forKey:;
@end

@implementation NSMutableDictionary(DMCUtilities)

- (void)DMCSetObjectIfNotNil:()DMCUtilities forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

@end