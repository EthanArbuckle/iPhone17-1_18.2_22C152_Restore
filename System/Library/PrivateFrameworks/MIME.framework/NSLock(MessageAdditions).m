@interface NSLock(MessageAdditions)
- (uint64_t)mf_waitForLock;
@end

@implementation NSLock(MessageAdditions)

- (uint64_t)mf_waitForLock
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((objc_msgSend(a1, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 2.0)) & 1) == 0)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D410];
    do
      CFRunLoopRunInMode(v3, 0.5, 0);
    while (!objc_msgSend(a1, "lockBeforeDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 2.0)));
  }
  return [v2 drain];
}

@end