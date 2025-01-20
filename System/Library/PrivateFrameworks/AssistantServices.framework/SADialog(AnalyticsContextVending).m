@interface SADialog(AnalyticsContextVending)
- (id)af_dialogIdentifiersForAnalyticsContext;
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SADialog(AnalyticsContextVending)

- (id)af_dialogIdentifiersForAnalyticsContext
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 dialogIdentifier];
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&off_1EEED8528;
  objc_msgSendSuper2(&v6, sel_af_addEntriesToAnalyticsContext_, v4);
  v5 = [a1 dialogIdentifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"dialogIdentifier"];
  }
}

@end