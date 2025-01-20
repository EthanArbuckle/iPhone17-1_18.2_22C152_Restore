@interface HKObject(WDExtensions)
- (uint64_t)deleteObjectWithHealthStore:()WDExtensions options:completion:;
@end

@implementation HKObject(WDExtensions)

- (uint64_t)deleteObjectWithHealthStore:()WDExtensions options:completion:
{
  return objc_msgSend(a3, "deleteObject:options:withCompletion:", a1);
}

@end