@interface SAMPSubscribeToPodcastCollection(AnalyticsContextVending)
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SAMPSubscribeToPodcastCollection(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EEEDA780;
  objc_msgSendSuper2(&v7, sel_af_addEntriesToAnalyticsContext_, v4);
  v5 = [a1 hashedRouteUID];
  uint64_t v6 = [v5 length];

  if (v6) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"isWHA"];
  }
}

@end