@interface InitOnce
@end

@implementation InitOnce

void __assetPALoggingHelper_InitOnce_block_invoke()
{
  uint64_t v0 = PrivacyAccountingLibraryCore();
  s_PAFrameworkAvailable = v0 != 0;
  if (v0)
  {
    CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"usestubpaapplication", @"com.apple.coremedia");
    s_shouldUseStubPAApplication = FigCFEqual();
    if (v1)
    {
      CFRelease(v1);
    }
  }
}

@end