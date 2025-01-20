@interface FVDUtilsAGXPixelFormatsSupported
@end

@implementation FVDUtilsAGXPixelFormatsSupported

CFDictionaryRef __FVDUtilsAGXPixelFormatsSupported_block_invoke()
{
  CFDictionaryRef result = (const __CFDictionary *)CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x1E4F24EE0]);
    if (result)
    {
      CFArrayRef v1 = result;
      CFTypeID v2 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v2 == result)
      {
        CFArrayGetValueAtIndex(v1, 0);
        return (const __CFDictionary *)FigCFDictionaryGetInt32IfPresent();
      }
    }
  }
  return result;
}

@end