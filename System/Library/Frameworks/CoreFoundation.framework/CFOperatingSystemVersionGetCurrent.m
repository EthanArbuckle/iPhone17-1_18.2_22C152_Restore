@interface CFOperatingSystemVersionGetCurrent
@end

@implementation CFOperatingSystemVersionGetCurrent

void ___CFOperatingSystemVersionGetCurrent_block_invoke()
{
  CFStringRef v0 = (const __CFString *)_CFCopySystemVersionDictionaryValue(@"ProductVersion");
  if (v0)
  {
    CFStringRef v1 = v0;
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v0, @".");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v3 = ArrayBySeparatingStrings;
      CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count < 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        uint64_t IntValue = -1;
      }
      else
      {
        unint64_t v5 = Count;
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, 0);
        uint64_t IntValue = CFStringGetIntValue(ValueAtIndex);
        if (v5 == 1)
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
        }
        else
        {
          CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(v3, 1);
          uint64_t v9 = CFStringGetIntValue(v10);
          if (v5 < 3)
          {
            uint64_t v8 = 0;
          }
          else
          {
            CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v3, 2);
            uint64_t v8 = CFStringGetIntValue(v11);
          }
        }
      }
      CFRelease(v3);
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t IntValue = -1;
    }
    CFRelease(v1);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t IntValue = -1;
  }
  *(void *)&_CFOperatingSystemVersionGetCurrent_version = IntValue;
  *((void *)&_CFOperatingSystemVersionGetCurrent_version + 1) = v9;
  qword_1EB1DD4D8 = v8;
}

@end