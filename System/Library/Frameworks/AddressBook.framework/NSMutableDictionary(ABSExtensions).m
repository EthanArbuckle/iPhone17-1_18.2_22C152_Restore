@interface NSMutableDictionary(ABSExtensions)
- (void)abs_setNonNilObject:()ABSExtensions forKey:;
@end

@implementation NSMutableDictionary(ABSExtensions)

- (void)abs_setNonNilObject:()ABSExtensions forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

@end