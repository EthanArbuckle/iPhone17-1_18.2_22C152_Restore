@interface FBKLicenseAgreement
+ (BOOL)hasAgreedToCurrentLicenseAgreement;
+ (NSAttributedString)currentLicenseAgreement;
+ (void)agreeToCurrentLicenseAgreement;
@end

@implementation FBKLicenseAgreement

+ (NSAttributedString)currentLicenseAgreement
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 objectForKey:*MEMORY[0x263EFF508]];
  v5 = [v2 URLForResource:@"License" withExtension:@"rtf" subdirectory:0 localization:v4];
  if (!v5)
  {
    v5 = [v2 URLForResource:@"License" withExtension:@"rtf"];
  }
  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v7 = *MEMORY[0x263F81558];
  uint64_t v8 = *MEMORY[0x263F814C0];
  v12[0] = *MEMORY[0x263F814D0];
  v12[1] = v8;
  v13[0] = v7;
  v13[1] = &unk_26DE1E900;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v6 initWithURL:v5 options:v9 documentAttributes:0 error:0];

  return (NSAttributedString *)v10;
}

+ (void)agreeToCurrentLicenseAgreement
{
  id v2 = +[FBKSharedConstants sharedUserDefaults];
  objc_msgSend(v2, "setInteger:forKey:", +[FBKSharedConstants currentLegalVersion](FBKSharedConstants, "currentLegalVersion"), @"AgreedLegalVersion");
}

+ (BOOL)hasAgreedToCurrentLicenseAgreement
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int64_t v2 = +[FBKSharedConstants currentLegalVersion];
  v3 = +[FBKSharedConstants sharedUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"AgreedLegalVersion"];

  if (v4 > v2)
  {
    if (Log_onceToken != -1) {
      dispatch_once(&Log_onceToken, &__block_literal_global_31);
    }
    v5 = Log_log;
    if (os_log_type_enabled((os_log_t)Log_log, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218240;
      uint64_t v8 = v4;
      __int16 v9 = 2048;
      int64_t v10 = v2;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "Agreed legal version [%ld] exceeds current version [%ld].", (uint8_t *)&v7, 0x16u);
    }
  }
  return v4 >= v2;
}

@end