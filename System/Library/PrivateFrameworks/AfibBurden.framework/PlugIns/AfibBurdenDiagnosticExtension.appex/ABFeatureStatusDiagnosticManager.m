@interface ABFeatureStatusDiagnosticManager
- (ABFeatureStatusDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 healthStore:(id)a4;
- (id)_retrievePrettyPrintedFeatureStatusDiagnostics;
- (id)_retrievePrettyPrintedRegionAvailabilityDiagnostics;
- (id)extractDiagnosticContent;
- (void)_addSectionToString:(id)a3 withTitle:(id)a4;
@end

@implementation ABFeatureStatusDiagnosticManager

- (ABFeatureStatusDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 healthStore:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ABFeatureStatusDiagnosticManager;
  v8 = [(ABDiagnosticManager *)&v11 initWithDiagnosticName:@"FeatureStatus" loggingDirectoryPath:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_healthStore, a4);
  }

  return v9;
}

- (id)extractDiagnosticContent
{
  v3 = ab_get_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Starting feature status diagnostics", (uint8_t *)&v12, 0xCu);
  }

  id v4 = objc_alloc_init((Class)NSMutableString);
  [(ABFeatureStatusDiagnosticManager *)self _addSectionToString:v4 withTitle:@"Feature Status"];
  uint64_t v5 = [(ABFeatureStatusDiagnosticManager *)self _retrievePrettyPrintedFeatureStatusDiagnostics];
  v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"(Unable to Retrieve)";
  }
  [v4 appendString:v7];

  [v4 appendString:@"\n\n"];
  [(ABFeatureStatusDiagnosticManager *)self _addSectionToString:v4 withTitle:@"Region Availability"];
  uint64_t v8 = [(ABFeatureStatusDiagnosticManager *)self _retrievePrettyPrintedRegionAvailabilityDiagnostics];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"(Unable to Retrieve)";
  }
  [v4 appendString:v10];

  return v4;
}

- (void)_addSectionToString:(id)a3 withTitle:(id)a4
{
  id v5 = a3;
  [v5 appendFormat:@"%@\n", a4];
  [v5 appendString:@"======================================\n"];
}

- (id)_retrievePrettyPrintedFeatureStatusDiagnostics
{
  id v3 = objc_alloc((Class)HKFeatureStatusManager);
  uint64_t v4 = HKFeatureIdentifierAFibBurden;
  id v5 = [v3 initWithFeatureIdentifier:HKFeatureIdentifierAFibBurden healthStore:self->_healthStore];
  v6 = ab_get_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Retrieving feature status", buf, 0xCu);
  }

  id v12 = 0;
  CFStringRef v7 = [v5 featureStatusWithError:&v12];
  id v8 = v12;
  if (v8)
  {
    v9 = ab_get_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100006040();
    }
    CFStringRef v10 = 0;
  }
  else
  {
    v9 = [objc_alloc((Class)HKFeatureAvailabilityRequirementSatisfactionOverrides) initWithFeatureIdentifier:v4];
    CFStringRef v10 = HKPrettyPrintedFeatureStatus();
  }

  return v10;
}

- (id)_retrievePrettyPrintedRegionAvailabilityDiagnostics
{
  id v3 = objc_alloc((Class)HKFeatureAvailabilityStore);
  id v4 = [v3 initWithFeatureIdentifier:HKFeatureIdentifierAFibBurden healthStore:self->_healthStore];
  id v5 = ab_get_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Retrieving region availability", buf, 0xCu);
  }

  id v11 = 0;
  v6 = [v4 regionAvailabilityWithError:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = [v6 prettyPrintedDescription];
  }
  else
  {
    v9 = ab_get_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000060A8();
    }

    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end