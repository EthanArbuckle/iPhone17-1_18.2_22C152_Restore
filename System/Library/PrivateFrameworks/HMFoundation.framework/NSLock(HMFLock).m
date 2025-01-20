@interface NSLock(HMFLock)
- (void)performBlock:()HMFLock;
@end

@implementation NSLock(HMFLock)

- (void)performBlock:()HMFLock
{
  v5 = a3;
  if (v5)
  {
    id v4 = a1;
    [v4 lock];
    v5[2]();
    [v4 unlock];
  }
}

@end