@interface CalDAVUtils
+ (id)dropBoxLocationForUID:(id)a3 dropBoxPath:(id)a4;
+ (id)headersFromHeaders:(id)a3 replacingPreconditionsWithScheduleTag:(id)a4;
+ (id)stringFromUIDWithPathSafeCharacters:(id)a3;
@end

@implementation CalDAVUtils

+ (id)dropBoxLocationForUID:(id)a3 dropBoxPath:(id)a4
{
  id v5 = a4;
  v6 = +[CalDAVUtils stringFromUIDWithPathSafeCharacters:a3];
  v7 = [NSString stringWithFormat:@"%@.dropbox", v6];
  v8 = [v5 stringByAppendingPathComponent:v7];

  v9 = [v8 appendSlashIfNeeded];

  return v9;
}

+ (id)stringFromUIDWithPathSafeCharacters:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if ([v3 length])
  {
    v4 = v3;
    if ([v3 hasPrefix:@"http://"])
    {
      v4 = [v3 stringByReplacingOccurrencesOfString:@"http://" withString:&stru_26C4CD4C0];
    }
    if ([v4 hasPrefix:@"https://"])
    {
      uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"https://" withString:&stru_26C4CD4C0];

      v4 = (void *)v5;
    }
    [v4 rangeOfString:@":"];
    if (v6)
    {
      uint64_t v7 = [v4 stringByReplacingOccurrencesOfString:@":" withString:&stru_26C4CD4C0];

      v4 = (void *)v7;
    }
    [v4 rangeOfString:@"/"];
    if (v8)
    {
      uint64_t v9 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

      v4 = (void *)v9;
    }
    [v4 rangeOfString:@"."];
    if (v10)
    {
      uint64_t v11 = [v4 stringByReplacingOccurrencesOfString:@"." withString:&stru_26C4CD4C0];

      v4 = (void *)v11;
    }
  }
  if ([v4 length]) {
    v12 = v4;
  }
  else {
    v12 = @"attachment-directory-for-events-with-malformed-uri";
  }

  return v12;
}

+ (id)headersFromHeaders:(id)a3 replacingPreconditionsWithScheduleTag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = v7;
  if ([v6 length])
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v8 removeObjectForKey:*MEMORY[0x263F34A70]];
    [v8 removeObjectForKey:*MEMORY[0x263F34A68]];
    [v8 setObject:v6 forKey:@"If-Schedule-Tag-Match"];
  }
  return v8;
}

@end