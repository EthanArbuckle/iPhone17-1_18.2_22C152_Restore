@interface NSCalendar(IntentsFoundation)
+ (id)if_currentCalendarWithLanguageCode:()IntentsFoundation;
@end

@implementation NSCalendar(IntentsFoundation)

+ (id)if_currentCalendarWithLanguageCode:()IntentsFoundation
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = v4;
  if (v3)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v7 = [v4 locale];
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v6, (CFLocaleIdentifier)[v7 localeIdentifier]);

    v9 = CFDictionaryGetValue(ComponentsFromLocaleIdentifier, @"numbers");
    CFRelease(ComponentsFromLocaleIdentifier);
    v10 = (void *)MEMORY[0x1E4F1CA20];
    if (v9)
    {
      v11 = [NSString stringWithFormat:@"%@@numbers=%@", v3, v9];
      v12 = [v10 localeWithLocaleIdentifier:v11];
      [v5 setLocale:v12];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
      [v5 setLocale:v11];
    }
  }
  return v5;
}

@end