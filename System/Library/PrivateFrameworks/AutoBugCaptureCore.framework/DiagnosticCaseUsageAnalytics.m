@interface DiagnosticCaseUsageAnalytics
- (DiagnosticCaseUsageAnalytics)init;
- (DiagnosticCaseUsageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4;
@end

@implementation DiagnosticCaseUsageAnalytics

- (DiagnosticCaseUsageAnalytics)init
{
  v3 = +[AnalyticsWorkspace defaultWorkspace];
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseUsageAnalytics;
  v4 = [(ObjectAnalytics *)&v6 initWithWorkspace:v3 entityName:@"DiagnosticCaseUsage" withCache:1];

  return v4;
}

- (DiagnosticCaseUsageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseUsageAnalytics;
  return [(ObjectAnalytics *)&v5 initWithWorkspace:a3 entityName:@"DiagnosticCaseUsage" withCache:a4];
}

@end