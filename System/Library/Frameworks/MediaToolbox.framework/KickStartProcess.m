@interface KickStartProcess
@end

@implementation KickStartProcess

void __figMediaParserdUtilities_KickStartProcess_block_invoke()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    CFMutableDictionaryRef v1 = Mutable;
    FigCFDictionarySetValue();
    figMediaParserdUtilities_KickStartProcess_connectionError = FigXPCRemoteClientCreate();
    CFRelease(v1);
  }
  else
  {
    figMediaParserdUtilities_KickStartProcess_connectionError = -12786;
  }
}

@end