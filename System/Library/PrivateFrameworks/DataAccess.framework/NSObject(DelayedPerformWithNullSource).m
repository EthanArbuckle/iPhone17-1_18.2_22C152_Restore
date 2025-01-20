@interface NSObject(DelayedPerformWithNullSource)
- (void)da_addNullRunLoopSourceAndPerformSelector:()DelayedPerformWithNullSource withObject:afterDelay:inModes:;
@end

@implementation NSObject(DelayedPerformWithNullSource)

- (void)da_addNullRunLoopSourceAndPerformSelector:()DelayedPerformWithNullSource withObject:afterDelay:inModes:
{
  id v10 = a6;
  id v12 = a5;
  Current = CFRunLoopGetCurrent();
  addNullRunLoopSourceForRunLoopAndModes(Current, v10);
  [a1 performSelector:a4 withObject:v12 afterDelay:v10 inModes:a2];
}

@end