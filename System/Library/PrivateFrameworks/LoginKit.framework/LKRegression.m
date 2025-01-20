@interface LKRegression
+ (void)executeDelayByUserDefaultIfSet:(id)a3;
@end

@implementation LKRegression

+ (void)executeDelayByUserDefaultIfSet:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = +[LKPlatformSupport isInternalBuild];
  if (v3)
  {
    if (v4)
    {
      v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
      uint64_t v6 = [v5 integerForKey:v3];

      if (v6 >= 1)
      {
        v7 = (void *)LKLogRegression;
        if (os_log_type_enabled((os_log_t)LKLogRegression, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)MEMORY[0x263F08B88];
          v9 = v7;
          v10 = [v8 currentThread];
          int v11 = 138412802;
          v12 = v10;
          __int16 v13 = 2048;
          uint64_t v14 = v6;
          __int16 v15 = 2112;
          id v16 = v3;
          _os_log_impl(&dword_2221A9000, v9, OS_LOG_TYPE_DEFAULT, "Delaying %@ for %lu seconds because %@ (user default) is set.", (uint8_t *)&v11, 0x20u);
        }
        [MEMORY[0x263F08B88] sleepForTimeInterval:(double)v6];
      }
    }
  }
}

@end