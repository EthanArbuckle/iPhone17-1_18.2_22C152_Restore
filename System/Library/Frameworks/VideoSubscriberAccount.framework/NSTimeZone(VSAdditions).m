@interface NSTimeZone(VSAdditions)
+ (uint64_t)vs_isTimeZoneSet;
@end

@implementation NSTimeZone(VSAdditions)

+ (uint64_t)vs_isTimeZoneSet
{
  v0 = (void *)CFPreferencesCopyAppValue(@"timezoneset", @"com.apple.preferences.datetime");
  v1 = v0;
  if (v0)
  {
    id v2 = v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v4 = *MEMORY[0x1E4F1C3C8];
        v5 = (objc_class *)objc_opt_class();
        v6 = NSStringFromClass(v5);
        [v3 raise:v4, @"Unexpectedly, value was %@, instead of NSNumber.", v6 format];
      }
      uint64_t v7 = [v2 BOOLValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end