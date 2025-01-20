@interface LegacyEntitlementABCIssue
+ (void)reportClient:(id)a3 forReporter:(id)a4;
- (id)context;
- (id)tag;
- (unint64_t)abcReason;
@end

@implementation LegacyEntitlementABCIssue

+ (void)reportClient:(id)a3 forReporter:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = [NSString stringWithFormat:@"LegacyEntitlement/%@", v9];
  v7 = [v5 issueForTag:v6];

  if (!v7)
  {
    v8 = [[LegacyEntitlementABCIssue alloc] initWithClient:v9 forReporter:v5];
    [v5 addIssue:v8];
    [(EntitlementABCIssue *)v8 report];
    [v5 rescheduleTimer];
  }
}

- (id)tag
{
  v2 = NSString;
  v3 = [(EntitlementABCIssue *)self clientName];
  v4 = [v2 stringWithFormat:@"LegacyEntitlement/%@", v3];

  return v4;
}

- (unint64_t)abcReason
{
  return 4100;
}

- (id)context
{
  v2 = NSString;
  v3 = [(EntitlementABCIssue *)self clientName];
  v4 = [v2 stringWithFormat:@"clientName=%@", v3];

  return v4;
}

@end