@interface NSString(MCUtilities)
+ (__CFString)DMCMakeUUID;
- (id)DMCAppendGreenteaSuffix;
@end

@implementation NSString(MCUtilities)

+ (__CFString)DMCMakeUUID
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

- (id)DMCAppendGreenteaSuffix
{
  if (DMCIsGreenTea())
  {
    id v2 = [NSString stringWithFormat:@"%@_CH", a1];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

@end