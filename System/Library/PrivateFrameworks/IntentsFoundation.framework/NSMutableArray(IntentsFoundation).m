@interface NSMutableArray(IntentsFoundation)
- (void)if_addObjectIfNonNil:()IntentsFoundation;
@end

@implementation NSMutableArray(IntentsFoundation)

- (void)if_addObjectIfNonNil:()IntentsFoundation
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end