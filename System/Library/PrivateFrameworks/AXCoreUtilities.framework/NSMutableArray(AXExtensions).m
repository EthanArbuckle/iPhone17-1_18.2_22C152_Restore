@interface NSMutableArray(AXExtensions)
- (void)axSafelyAddObject:()AXExtensions;
- (void)axSafelyAddObjectsFromArray:()AXExtensions;
@end

@implementation NSMutableArray(AXExtensions)

- (void)axSafelyAddObject:()AXExtensions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)axSafelyAddObjectsFromArray:()AXExtensions
{
  id v4 = a3;
  char v7 = 0;
  v5 = __UIAccessibilitySafeClass(@"NSArray", v4, 1, &v7);
  if (v7) {
    abort();
  }
  v6 = v5;

  if (v6) {
    [a1 addObjectsFromArray:v4];
  }
}

@end