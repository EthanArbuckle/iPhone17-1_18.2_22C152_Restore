@interface ArmandValidationController
- (void)cancel;
- (void)start;
@end

@implementation ArmandValidationController

- (void)start
{
  uint64_t v3 = ODIServiceProviderIdAppleCare;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 bundleIdentifier];

  id v6 = [objc_alloc((Class)ODISession) initWithServiceIdentifier:v3 forDSIDType:2 andLocationBundleIdentifier:v5];
  v7 = v6;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000377C;
    v9[3] = &unk_1000040D0;
    v9[4] = self;
    id v10 = v6;
    [v10 getAssessment:v9];
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session failed.", buf, 2u);
    }

    [(ArmandValidationController *)self setFinished:1];
  }
}

- (void)cancel
{
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100003A08((uint64_t)self, v3);
  }

  [(ArmandValidationController *)self setFinished:1];
}

@end