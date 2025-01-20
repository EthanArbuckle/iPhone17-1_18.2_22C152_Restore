@interface NSString(DACPLogShared)
+ (__CFString)DACPLogMakeUUID;
@end

@implementation NSString(DACPLogShared)

+ (__CFString)DACPLogMakeUUID
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

@end