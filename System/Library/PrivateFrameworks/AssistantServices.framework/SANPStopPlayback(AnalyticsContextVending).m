@interface SANPStopPlayback(AnalyticsContextVending)
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SANPStopPlayback(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EEEDC6D0;
  objc_msgSendSuper2(&v7, sel_af_addEntriesToAnalyticsContext_, v4);
  v5 = [a1 hashedRouteUIDs];
  uint64_t v6 = [v5 count];

  if (v6) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"isWHA"];
  }
}

@end