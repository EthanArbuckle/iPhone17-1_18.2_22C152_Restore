@interface ABSevenDayAnalysisBreadcrumbDiagnosticManager
- (ABSevenDayAnalysisBreadcrumbDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 control:(id)a4;
- (id)extractDiagnosticContent;
@end

@implementation ABSevenDayAnalysisBreadcrumbDiagnosticManager

- (ABSevenDayAnalysisBreadcrumbDiagnosticManager)initWithLoggingDirectoryPath:(id)a3 control:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ABSevenDayAnalysisBreadcrumbDiagnosticManager;
  v8 = [(ABDiagnosticManager *)&v11 initWithDiagnosticName:@"SevenDayAnalysisBreadcrumb" loggingDirectoryPath:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_control, a4);
  }

  return v9;
}

- (id)extractDiagnosticContent
{
  v3 = ab_get_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Starting seven day analysis breadcrumb extraction", buf, 0xCu);
  }

  control = self->_control;
  id v10 = 0;
  v5 = [(HKHRAFibBurdenControl *)control fetchSevenDayAnalysisBreadcrumbsWithError:&v10];
  id v6 = v10;
  if (v5)
  {
    id v7 = HKHRPrettyPrintedAFibBurdenSevenDayAnalysisBreadcrumbs();
  }
  else
  {
    v8 = ab_get_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Seven day analysis breadcrumb extraction failed with error %@", buf, 0x16u);
    }

    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end