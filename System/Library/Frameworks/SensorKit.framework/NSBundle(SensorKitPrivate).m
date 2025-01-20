@interface NSBundle(SensorKitPrivate)
+ (void)sk_bundleWithIdentifier:()SensorKitPrivate;
- (uint64_t)sk_appName;
- (uint64_t)sk_perCategoryDetailDescription;
- (uint64_t)sk_requiredCategories;
- (uint64_t)sk_studyName;
- (uint64_t)sr_bundleType;
- (uint64_t)sr_normalizedBundleIdentifier;
- (void)sk_privacyURL;
- (void)sk_usageDescription;
@end

@implementation NSBundle(SensorKitPrivate)

+ (void)sk_bundleWithIdentifier:()SensorKitPrivate
{
  v4 = (void *)[NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];
  uint64_t v5 = MEMORY[0x263F086E0];

  return +[NSBundle sk_bundleWithIdentifier:partnerAppDirectoryURL:](v5, a3, v4);
}

- (uint64_t)sk_appName
{
  v2 = (void *)[a1 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  if (isValidString(v2)) {
    return (uint64_t)v2;
  }
  v2 = (void *)[a1 objectForInfoDictionaryKey:@"CFBundleName"];
  if (isValidString(v2)) {
    return (uint64_t)v2;
  }

  return [a1 bundleIdentifier];
}

- (uint64_t)sk_studyName
{
  v2 = (void *)[a1 objectForInfoDictionaryKey:@"NSSensorKitStudyName"];
  if (isValidString(v2)) {
    return (uint64_t)v2;
  }

  return objc_msgSend(a1, "sk_appName");
}

- (void)sk_privacyURL
{
  v1 = (void *)[a1 objectForInfoDictionaryKey:@"NSSensorKitPrivacyPolicyURL"];
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1 = (void *)[NSURL URLWithString:v1];
      if ((objc_msgSend((id)objc_msgSend(v1, "scheme"), "isEqualToString:", @"http") & 1) == 0
        && !objc_msgSend((id)objc_msgSend(v1, "scheme"), "isEqualToString:", @"https"))
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)sk_usageDescription
{
  v1 = (void *)[a1 objectForInfoDictionaryKey:@"NSSensorKitUsageDescription"];
  if (isValidString(v1)) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)sk_requiredCategories
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  v3 = (void *)[a1 objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__NSBundle_SensorKitPrivate__sk_requiredCategories__block_invoke;
    v6[3] = &unk_26452E788;
    v6[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v6];
    return [MEMORY[0x263EFFA08] setWithSet:v2];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    return [v5 set];
  }
}

- (uint64_t)sk_perCategoryDetailDescription
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = (void *)[a1 objectForInfoDictionaryKey:@"NSSensorKitUsageDetail"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__NSBundle_SensorKitPrivate__sk_perCategoryDetailDescription__block_invoke;
    v5[3] = &unk_26452E7B0;
    v5[4] = a1;
    v5[5] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
  return [NSDictionary dictionaryWithDictionary:v2];
}

- (uint64_t)sr_bundleType
{
  uint64_t v2 = (void *)MEMORY[0x223C5D6B0]();
  uint64_t v3 = -[NSBundle sr_bundleTypeWithPartnerAppDirectoryURL:](a1, [NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0]);
  return v3;
}

- (uint64_t)sr_normalizedBundleIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSURL fileURLWithPath:@"/var/mobile/Library/Research/Studies/" isDirectory:1 relativeToURL:0];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = -[NSBundle sr_bundleTypeWithPartnerAppDirectoryURL:](a1, v2);
  if (v3 == 1)
  {
    uint64_t v5 = @"com.apple.Research";
    if ((objc_msgSend((id)objc_msgSend(a1, "bundleIdentifier"), "hasPrefix:", @"com.apple.Research") & 1) == 0)
    {
      uint64_t v5 = @"com.appleinternal.health.Lime";
      if ((objc_msgSend((id)objc_msgSend(a1, "bundleIdentifier"), "hasPrefix:", @"com.appleinternal.health.Lime") & 1) == 0) {
        uint64_t v5 = (__CFString *)[a1 objectForInfoDictionaryKey:@"SRStudyApplicationGroupIdentifier"];
      }
    }
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v6 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
    {
      int v7 = 138543618;
      v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = [a1 bundleIdentifier];
      _os_log_impl(&dword_21FCA3000, v6, OS_LOG_TYPE_INFO, "Found parent app %{public}@ for study %{public}@", (uint8_t *)&v7, 0x16u);
    }
    return (uint64_t)v5;
  }
  if (v3 != 2) {
    return 0;
  }

  return [a1 bundleIdentifier];
}

@end