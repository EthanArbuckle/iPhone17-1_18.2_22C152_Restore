@interface HTInternalSettings
- (BOOL)isHUDEnabled;
- (int64_t)hudThreshold;
- (void)applySettings;
- (void)setHUDEnabled:(BOOL)a3;
- (void)setHUDThreshold:(int64_t)a3;
@end

@implementation HTInternalSettings

- (BOOL)isHUDEnabled
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F42798];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263F42798], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F42800], v2, 0);
  if (AppBooleanValue)
  {
    if (CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F42810], v2, &keyExistsAndHasValidFormat[1])) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = keyExistsAndHasValidFormat[1] == 0;
    }
    if (v4)
    {
      if (CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F42878], v2, keyExistsAndHasValidFormat)) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = keyExistsAndHasValidFormat[0] == 0;
      }
      LOBYTE(AppBooleanValue) = v5;
    }
    else
    {
      LOBYTE(AppBooleanValue) = 0;
    }
  }
  return AppBooleanValue;
}

- (void)setHUDEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HTInternalSettings *)self isHUDEnabled] != a3)
  {
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263F42800];
    if (v3)
    {
      v6 = [NSNumber numberWithBool:1];
      CFStringRef v7 = (const __CFString *)*MEMORY[0x263F42798];
      CFPreferencesSetAppValue(v5, v6, (CFStringRef)*MEMORY[0x263F42798]);

      CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F42810], 0, v7);
      CFStringRef v5 = (const __CFString *)*MEMORY[0x263F42878];
    }
    else
    {
      CFStringRef v7 = (const __CFString *)*MEMORY[0x263F42798];
    }
    CFPreferencesSetAppValue(v5, 0, v7);
    [(HTInternalSettings *)self applySettings];
  }
}

- (int64_t)hudThreshold
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263F42798];
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263F42798], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  BOOL v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F42808], v2);
  BOOL v4 = v3;
  if (v3) {
    int64_t v5 = (int)[v3 intValue];
  }
  else {
    int64_t v5 = 500;
  }

  return v5;
}

- (void)setHUDThreshold:(int64_t)a3
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F42808];
  if (a3 == 500)
  {
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F42808], 0, (CFStringRef)*MEMORY[0x263F42798]);
  }
  else
  {
    int64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    CFPreferencesSetAppValue(v4, v5, (CFStringRef)*MEMORY[0x263F42798]);
  }

  [(HTInternalSettings *)self applySettings];
}

- (void)applySettings
{
  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x263F42798], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFStringRef v2 = (const char *)*MEMORY[0x263F427A0];

  notify_post(v2);
}

@end