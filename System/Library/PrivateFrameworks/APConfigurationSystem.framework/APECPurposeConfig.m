@interface APECPurposeConfig
+ (Class)_classForPurpose:(int64_t)a3;
+ (id)purposeConfig:(int64_t)a3;
@end

@implementation APECPurposeConfig

+ (id)purposeConfig:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend__classForPurpose_(a1, a2, a3);
  if (v4)
  {
    v6 = objc_msgSend_configurationForClass_(APConfigurationMediator, v5, v4);
  }
  else
  {
    if (a3 >= 1)
    {
      v7 = APLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138478083;
        id v13 = (id)objc_opt_class();
        __int16 v14 = 2048;
        int64_t v15 = a3;
        id v8 = v13;
        _os_log_impl(&dword_24718C000, v7, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, class not implemented for purpose: %lu.", buf, 0x16u);
      }
      v10 = objc_msgSend_stringWithFormat_(NSString, v9, @"Error: Class not implemented for purpose: %lu.", a3);
      APSimulateCrash();
    }
    v6 = 0;
  }
  return v6;
}

+ (Class)_classForPurpose:(int64_t)a3
{
  uint64_t v4 = 0;
  if (a3 > 102)
  {
    if (a3 == 103 || a3 == 8501) {
      goto LABEL_7;
    }
  }
  else if (a3 == 100 || a3 == 101)
  {
LABEL_7:
    uint64_t v4 = objc_opt_class();
  }
  return (Class)v4;
}

@end