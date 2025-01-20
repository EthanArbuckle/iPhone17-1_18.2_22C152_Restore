@interface SAUIDialogPunchout(AnalyticsContextVending)
- (id)af_dialogIdentifiersForAnalyticsContext;
- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending;
@end

@implementation SAUIDialogPunchout(AnalyticsContextVending)

- (id)af_dialogIdentifiersForAnalyticsContext
{
  v1 = [a1 utteranceView];
  v2 = objc_msgSend(v1, "af_dialogIdentifiersForAnalyticsContext");

  return v2;
}

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EEED7438;
  objc_msgSendSuper2(&v8, sel_af_addEntriesToAnalyticsContext_, v4);
  v5 = [a1 utteranceView];
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "af_analyticsContext");
    if (v7) {
      [v4 setObject:v7 forKey:@"utteranceView"];
    }
  }
}

@end