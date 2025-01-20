@interface NSMutableDictionary(CoreRecentsUtilities)
- (void)cr_setNonNilObject:()CoreRecentsUtilities forKey:;
@end

@implementation NSMutableDictionary(CoreRecentsUtilities)

- (void)cr_setNonNilObject:()CoreRecentsUtilities forKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKey:");
    }
  }
  return a1;
}

@end