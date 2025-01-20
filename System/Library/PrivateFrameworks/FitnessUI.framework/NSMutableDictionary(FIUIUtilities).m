@interface NSMutableDictionary(FIUIUtilities)
- (void)fiui_incrementValueForKey:()FIUIUtilities byValue:;
@end

@implementation NSMutableDictionary(FIUIUtilities)

- (void)fiui_incrementValueForKey:()FIUIUtilities byValue:
{
  id v6 = a4;
  v7 = [a1 objectForKey:v6];
  id v10 = v7;
  if (v7)
  {
    [v7 doubleValue];
    a2 = v8 + a2;
  }
  v9 = [NSNumber numberWithDouble:a2];
  [a1 setObject:v9 forKey:v6];
}

@end