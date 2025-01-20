@interface NSMutableDictionary(IntentsFoundation)
- (id)if_popObjectForKey:()IntentsFoundation;
- (void)if_setBoolIfYES:()IntentsFoundation forKey:;
- (void)if_setObjectIfNonNil:()IntentsFoundation forKey:;
@end

@implementation NSMutableDictionary(IntentsFoundation)

- (void)if_setObjectIfNonNil:()IntentsFoundation forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (id)if_popObjectForKey:()IntentsFoundation
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (v5) {
    [a1 removeObjectForKey:v4];
  }

  return v5;
}

- (void)if_setBoolIfYES:()IntentsFoundation forKey:
{
  if (a3)
  {
    v5 = NSNumber;
    id v6 = a4;
    id v7 = [v5 numberWithBool:1];
    [a1 setObject:v7 forKey:v6];
  }
}

@end