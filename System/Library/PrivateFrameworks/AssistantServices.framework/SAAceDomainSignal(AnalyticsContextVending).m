@interface SAAceDomainSignal(AnalyticsContextVending)
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SAAceDomainSignal(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EEED86C8;
  id v4 = a3;
  objc_msgSendSuper2(&v8, sel_af_addEntriesToAnalyticsContext_, v4);
  uint64_t v5 = objc_msgSend(a1, "domain", v8.receiver, v8.super_class);
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"nil";
  }
  [v4 setObject:v7 forKey:@"domain"];
}

@end