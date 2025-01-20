@interface SABaseAceObject(AnalyticsContextVending)
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SABaseAceObject(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&off_1EEED2518;
  objc_msgSendSuper2(&v12, sel_af_addEntriesToAnalyticsContext_, v4);
  v5 = [a1 metricsContext];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E4F28D90];
    v8 = [v5 dataUsingEncoding:4];
    id v11 = 0;
    v9 = [v7 JSONObjectWithData:v8 options:0 error:&v11];
    id v10 = v11;

    if (!v9 || v10)
    {
      [v4 setObject:v6 forKey:@"metricsContext"];
    }
    else
    {
      [v4 setObject:v9 forKey:@"metricsContext"];
      id v10 = 0;
    }
  }
}

@end