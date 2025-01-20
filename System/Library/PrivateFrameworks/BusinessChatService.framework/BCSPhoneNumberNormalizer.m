@interface BCSPhoneNumberNormalizer
+ (id)countryCode;
+ (id)normalizedPhoneNumberForPhoneNumber:(id)a3;
@end

@implementation BCSPhoneNumberNormalizer

+ (id)normalizedPhoneNumberForPhoneNumber:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(_NBPhoneNumberUtil);
  v6 = [a1 countryCode];
  id v18 = 0;
  v7 = [(_NBPhoneNumberUtil *)v5 parse:v4 defaultRegion:v6 error:&v18];
  id v8 = v18;
  if (![v6 caseInsensitiveCompare:@"us"])
  {
    v9 = [v7 countryCode];
    uint64_t v10 = [v9 integerValue];

    if (v10 == 1)
    {
      if ([(_NBPhoneNumberUtil *)v5 truncateTooLongNumber:v7])
      {
        v11 = ABSLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
          _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s Successfully truncated a too long phone number", buf, 0xCu);
        }
      }
    }
  }
  if (v8)
  {
    v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v8 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to get normalized phone number with error %@", buf, 0x16u);
    }
    v14 = v4;
LABEL_11:

    goto LABEL_12;
  }
  id v17 = 0;
  v14 = [(_NBPhoneNumberUtil *)v5 format:v7 numberFormat:0 error:&v17];
  id v8 = v17;

  if (v8)
  {
    v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v8 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v20 = "+[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:]";
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to get E164 formated phone number with error %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

+ (id)countryCode
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 countryCode];
  id v4 = [v3 lowercaseString];

  return v4;
}

@end