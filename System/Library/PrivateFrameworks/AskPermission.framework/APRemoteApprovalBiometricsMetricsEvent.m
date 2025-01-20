@interface APRemoteApprovalBiometricsMetricsEvent
- (APRemoteApprovalBiometricsMetricsEvent)init;
@end

@implementation APRemoteApprovalBiometricsMetricsEvent

- (APRemoteApprovalBiometricsMetricsEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)APRemoteApprovalBiometricsMetricsEvent;
  v2 = [(APRemoteApprovalBiometricsMetricsEvent *)&v5 initWithTopic:@"xp_amp_payments"];
  v3 = v2;
  if (v2)
  {
    [(APRemoteApprovalBiometricsMetricsEvent *)v2 setEventVersion:&unk_26D8E1638];
    [(APRemoteApprovalBiometricsMetricsEvent *)v3 setProperty:@"biometricsAnalyze" forBodyKey:@"actionType"];
    [(APRemoteApprovalBiometricsMetricsEvent *)v3 setProperty:@"SignIn" forBodyKey:@"dialogType"];
  }
  return v3;
}

@end