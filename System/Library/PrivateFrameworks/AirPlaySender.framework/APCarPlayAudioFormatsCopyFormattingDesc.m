@interface APCarPlayAudioFormatsCopyFormattingDesc
@end

@implementation APCarPlayAudioFormatsCopyFormattingDesc

uint64_t ___APCarPlayAudioFormatsCopyFormattingDesc_block_invoke(uint64_t a1, const void *a2)
{
  return AppendPrintF();
}

uint64_t ___APCarPlayAudioFormatsCopyFormattingDesc_block_invoke_2(uint64_t a1, const void *a2, const __CFArray *a3)
{
  AppendPrintF();
  if (CFArrayGetCount(a3) >= 1)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a2);
    CFDataGetBytePtr(Value);
    CFDataRef v7 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), a2);
    CFDataGetBytePtr(v7);
    CFArrayGetValueAtIndex(a3, 0);
  }
  AppendPrintF();
  return AppendPrintF();
}

@end