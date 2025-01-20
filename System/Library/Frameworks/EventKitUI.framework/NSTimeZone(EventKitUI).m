@interface NSTimeZone(EventKitUI)
- (id)cityName;
- (void)_cleanupDisallowedTimezonesIfNeeded;
- (void)setCityName:()EventKitUI;
@end

@implementation NSTimeZone(EventKitUI)

- (id)cityName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NSTimeZone_EventKitUI__cityName__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = a1;
  if (cityName_onceToken != -1) {
    dispatch_once(&cityName_onceToken, block);
  }
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 persistentDomainForName:@"com.apple.mobilecal.timezones"];

  if (v3)
  {
    v4 = [a1 name];
    v5 = [v3 objectForKey:v4];

    if (v5)
    {
      v6 = v3;
      goto LABEL_19;
    }
  }
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [v7 persistentDomainForName:@"com.apple.mobilecal"];

  if (v6)
  {
    v8 = [v6 objectForKey:*MEMORY[0x1E4F578C8]];
    if (v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v9 = (void *)[objc_alloc(MEMORY[0x1E4F4BE30]) initWithProperties:v8]) != 0)
    {
      v10 = v9;
      v11 = [v9 timeZone];
      if (v11
        && ([a1 name],
            v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isEqualToString:v11],
            v12,
            v13))
      {
        v5 = [v10 name];
      }
      else
      {
        v5 = 0;
      }

      if (v5) {
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
  v14 = [MEMORY[0x1E4F4BE38] sharedManager];
  v15 = [v14 defaultCityForTimeZone:a1];

  v5 = [v15 name];

  if (!v5)
  {
    v16 = [MEMORY[0x1E4F1CA20] currentLocale];
    v5 = [a1 localizedName:4 locale:v16];

    if (!v5)
    {
      v5 = [a1 name];
    }
  }
LABEL_19:

  return v5;
}

- (void)setCityName:()EventKitUI
{
  id v12 = a3;
  v4 = [a1 cityName];
  char v5 = [v12 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 persistentDomainForName:@"com.apple.mobilecal.timezones"];
    v8 = (void *)[v7 mutableCopy];

    if (!v8) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    v9 = [a1 name];
    [v8 setObject:v12 forKey:v9];

    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v10 setPersistentDomain:v8 forName:@"com.apple.mobilecal.timezones"];

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v11 synchronize];
  }
}

- (void)_cleanupDisallowedTimezonesIfNeeded
{
  if ([MEMORY[0x1E4F4BE38] willApplyTimeZoneChanges1])
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 persistentDomainForName:@"com.apple.mobilecal.timezones"];
    id v4 = (id)[v1 mutableCopy];

    if (v4)
    {
      [v4 removeObjectsForKeys:&unk_1F0D03AF0];
      v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v2 setPersistentDomain:v4 forName:@"com.apple.mobilecal.timezones"];

      v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v3 synchronize];
    }
  }
}

@end