@interface ATXCoreAnalyticsFieldUtilities
+ (id)_getSalt;
+ (id)hashBoundString:(id)a3;
+ (id)hashBoundString:(id)a3 hashSpaceSize:(unint64_t)a4;
@end

@implementation ATXCoreAnalyticsFieldUtilities

+ (id)_getSalt
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v4 = [v3 stringForKey:@"coreAnalyticsFieldHashSaltKey"];
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
    v4 = [v5 UUIDString];

    [v3 setObject:v4 forKey:@"coreAnalyticsFieldHashSaltKey"];
  }

  return v4;
}

+ (id)hashBoundString:(id)a3
{
  return (id)[a1 hashBoundString:a3 hashSpaceSize:1000000];
}

+ (id)hashBoundString:(id)a3 hashSpaceSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _getSalt];
  v8 = [NSString stringWithFormat:@"%@.%@", v7, v6];

  unint64_t v9 = [v8 hash];
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v9 % a4);

  return v10;
}

@end