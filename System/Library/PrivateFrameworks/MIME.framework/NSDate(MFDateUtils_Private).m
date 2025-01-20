@interface NSDate(MFDateUtils_Private)
+ (id)mf_copyLenientDateInCommonFormatsWithString:()MFDateUtils_Private;
@end

@implementation NSDate(MFDateUtils_Private)

+ (id)mf_copyLenientDateInCommonFormatsWithString:()MFDateUtils_Private
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  uint64_t v4 = [(__CFString *)v3 length];
  if (v4)
  {
    CFIndex v6 = [(__CFString *)v3 rangeOfString:@"UT" options:12];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      CFIndex v7 = v5;
      MutableCopy = CFStringCreateMutableCopy(0, v4 + 1, v3);
      v26.location = v6;
      v26.length = v7;
      CFStringReplace(MutableCopy, v26, @"UTC");

      v3 = MutableCopy;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
    [v9 setLocale:v10];

    v11 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setDefaultDate:v11];

    v12 = &commonFormats;
    while (1)
    {
      [v9 setDateFormat:*v12];
      v13 = [v9 dateFromString:v3];
      if (v13) {
        break;
      }
      ++v12;

      if (v12 >= (void *)&otherFormats)
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v14 setFormatterBehavior:1040];
        [v14 setLenient:1];
        v15 = [MEMORY[0x1E4F1C9C8] date];
        [v14 setDefaultDate:v15];

        v13 = [v14 dateFromString:v3];

        if (!v13)
        {
          v16 = (char **)&off_1E5F89978;
          do
          {
            [v9 setDateFormat:*(v16 - 1)];
            uint64_t v17 = [v9 dateFromString:v3];
            v13 = (void *)v17;
            if (v17) {
              break;
            }
          }
          while (v16++ < kDayStrs);
          if (!v17)
          {
            v19 = MFLogGeneral();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              int v22 = 138412290;
              v23 = v3;
              _os_log_impl(&dword_1AFB03000, v19, OS_LOG_TYPE_INFO, "Unable to parse date (%@)", (uint8_t *)&v22, 0xCu);
            }

            v13 = 0;
          }
        }
        break;
      }
    }
    id v20 = v13;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

@end