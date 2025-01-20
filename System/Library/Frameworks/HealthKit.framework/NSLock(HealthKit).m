@interface NSLock(HealthKit)
- (void)hk_withLock:()HealthKit;
@end

@implementation NSLock(HealthKit)

- (void)hk_withLock:()HealthKit
{
  v6 = a3;
  if (!v6)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:a1 file:@"NSLock+HealthKit.m" lineNumber:18 description:@"block must be non-nil."];
  }
  [a1 lock];
  v6[2]();
  [a1 unlock];
}

@end