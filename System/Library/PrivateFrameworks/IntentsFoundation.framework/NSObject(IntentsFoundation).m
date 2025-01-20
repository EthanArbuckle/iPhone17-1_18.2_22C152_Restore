@interface NSObject(IntentsFoundation)
- (void)if_setValueIfNonNil:()IntentsFoundation forKey:;
- (void)if_setValueIfYES:()IntentsFoundation forKey:;
@end

@implementation NSObject(IntentsFoundation)

- (void)if_setValueIfNonNil:()IntentsFoundation forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setValue:forKey:");
  }
  return a1;
}

- (void)if_setValueIfYES:()IntentsFoundation forKey:
{
  if (a3)
  {
    v5 = NSNumber;
    id v6 = a4;
    id v7 = [v5 numberWithBool:1];
    [a1 setValue:v7 forKey:v6];
  }
}

@end