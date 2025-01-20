@interface NSError(Analytics)
+ (uint64_t)sendCECErrorAnalyticsWithContext:()Analytics;
- (uint64_t)sendCECErrorAnalyticsWithContext:()Analytics;
@end

@implementation NSError(Analytics)

+ (uint64_t)sendCECErrorAnalyticsWithContext:()Analytics
{
  return AnalyticsSendEventLazy();
}

- (uint64_t)sendCECErrorAnalyticsWithContext:()Analytics
{
  v8[1] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF9A0];
  v7 = @"error";
  v8[0] = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(a1, "code"));
  v5 = objc_msgSend(v4, "dictionaryWithDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  [v5 addEntriesFromDictionary:a3];
  return [MEMORY[0x263F087E8] sendCECErrorAnalyticsWithContext:v5];
}

@end