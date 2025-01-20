@interface SGTimeZone
+ (id)countryCodeForAddress:(id)a3;
+ (id)sharedDetector;
+ (id)timeZoneForAddress:(id)a3;
+ (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4;
@end

@implementation SGTimeZone

+ (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1A6265250]();
  v9 = [a1 sharedDetector];
  v10 = [v9 timeZoneNameForAddress:v6 withCountryCode:v7];

  v11 = [a1 sharedDetector];
  [v11 cleanupCache];

  return v10;
}

+ (id)countryCodeForAddress:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A6265250]();
  id v6 = [a1 sharedDetector];
  id v7 = [v6 countryCodeForAddress:v4];

  v8 = [a1 sharedDetector];
  [v8 cleanupCache];

  return v7;
}

+ (id)timeZoneForAddress:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A6265250]();
    id v6 = [a1 sharedDetector];
    id v7 = [v6 timeZoneFromAiportCodeForAddress:v4];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v7];
    }
    else
    {
      v9 = [a1 sharedDetector];
      id v7 = [v9 countryCodeForAddress:v4];

      if (v7
        && ([a1 sharedDetector],
            v10 = objc_claimAutoreleasedReturnValue(),
            [v10 timeZoneNameForAddress:v4 withCountryCode:v7],
            v11 = objc_claimAutoreleasedReturnValue(),
            v10,
            v11))
      {
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v11];
      }
      else
      {
        v8 = 0;
      }
      v12 = [a1 sharedDetector];
      [v12 cleanupCache];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)sharedDetector
{
  if (sharedDetector_onceToken != -1) {
    dispatch_once(&sharedDetector_onceToken, &__block_literal_global_5677);
  }
  v2 = (void *)sharedDetector__sharedDetector;

  return v2;
}

uint64_t __28__SGTimeZone_sharedDetector__block_invoke()
{
  sharedDetector__sharedDetector = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end