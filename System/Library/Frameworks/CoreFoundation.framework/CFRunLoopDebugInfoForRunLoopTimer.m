@interface CFRunLoopDebugInfoForRunLoopTimer
@end

@implementation CFRunLoopDebugInfoForRunLoopTimer

void *____CFRunLoopDebugInfoForRunLoopTimer_block_invoke()
{
  result = dlopen("/System/Library/Frameworks/Foundation.framework/Foundation", 2);
  if (result)
  {
    v1 = result;
    __CFRunLoopDebugInfoForRunLoopTimer_foundationTimerFunc = (uint64_t)dlsym(result, "__NSFireTimer");
    __CFRunLoopDebugInfoForRunLoopTimer_foundationDescribeTimerCalloutFunc = dlsym(v1, "__NSDescribeTimerCallout");
    __CFRunLoopDebugInfoForRunLoopTimer_foundationDelayedPerformFunc = (uint64_t)dlsym(v1, "__NSFireDelayedPerform");
    __CFRunLoopDebugInfoForRunLoopTimer_foundationDescribeDelayedPerformFunc = dlsym(v1, "__NSDescribeDelayedPerformCallout");
    return (void *)dlclose(v1);
  }
  return result;
}

@end