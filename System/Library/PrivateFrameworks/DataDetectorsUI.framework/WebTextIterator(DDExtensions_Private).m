@interface WebTextIterator(DDExtensions_Private)
- (BOOL)dd_checkCurrentRangeAgainstString:()DDExtensions_Private;
@end

@implementation WebTextIterator(DDExtensions_Private)

- (BOOL)dd_checkCurrentRangeAgainstString:()DDExtensions_Private
{
  v5 = [a1 currentRange];
  v6 = [v5 startContainer];
  v7 = [v5 endContainer];

  if (v6 == v7)
  {
    v9 = [v5 startContainer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UniChar *)[a1 currentTextPointer], objc_msgSend(a1, "currentTextLength"));
      CFComparisonResult v12 = CFStringCompare(v11, a3, 0);
      BOOL v8 = v12 == kCFCompareEqualTo;
      if (v12) {
        DDLog();
      }
      CFRelease(v11);
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    DDLog();
    BOOL v8 = 0;
  }

  return v8;
}

@end