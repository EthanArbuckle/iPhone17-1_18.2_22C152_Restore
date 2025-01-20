@interface SHRotatingInstallationID
+ (id)cachedInstallationForDays:(int64_t)a3;
+ (id)cachedInstallationIDForUTCDay;
+ (id)cachedInstallationIDWithMaxAge:(double)a3;
+ (id)creationDate;
+ (id)installationID;
+ (void)setCreationDate:(id)a3;
+ (void)setInstallationID:(id)a3;
@end

@implementation SHRotatingInstallationID

+ (id)cachedInstallationIDForUTCDay
{
  return (id)[a1 cachedInstallationForDays:0];
}

+ (id)cachedInstallationForDays:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setDay:-a3];
  v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  v7 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v6 setTimeZone:v7];

  v8 = [MEMORY[0x263EFF910] date];
  v9 = [v6 dateByAddingComponents:v5 toDate:v8 options:0];

  v10 = [v6 startOfDayForDate:v9];
  [v10 timeIntervalSinceNow];
  v12 = [a1 cachedInstallationIDWithMaxAge:(double)(uint64_t)fabs(v11)];

  return v12;
}

+ (id)cachedInstallationIDWithMaxAge:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [a1 installationID];
  v6 = [a1 creationDate];
  [v6 timeIntervalSinceNow];
  if (v5 && v6 && ((double v8 = fabs(v7), v7 < 0.0) ? (v9 = v8 > a3) : (v9 = 1), !v9))
  {
    v14 = sh_log_object();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_224B4B000, v14, OS_LOG_TYPE_DEBUG, "Using cached installation ID: %@", (uint8_t *)&v17, 0xCu);
    }

    id v11 = v5;
  }
  else
  {
    v10 = [MEMORY[0x263F08C38] UUID];
    id v11 = [v10 UUIDString];

    v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412290;
      id v18 = v11;
      _os_log_impl(&dword_224B4B000, v12, OS_LOG_TYPE_DEBUG, "Using new installation ID: %@", (uint8_t *)&v17, 0xCu);
    }

    [a1 setInstallationID:v11];
    v13 = [MEMORY[0x263EFF910] date];
    [a1 setCreationDate:v13];
  }

  return v11;
}

+ (void)setInstallationID:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"com.apple.shazamd.installation-id"];
}

+ (id)installationID
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"com.apple.shazamd.installation-id"];

  return v3;
}

+ (void)setCreationDate:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"com.apple.shazamd.installation-id-creation-date"];
}

+ (id)creationDate
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"com.apple.shazamd.installation-id-creation-date"];

  return v3;
}

@end