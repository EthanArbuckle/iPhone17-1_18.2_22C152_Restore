@interface ABMDiagnosticExtensionLogging
+ (os_log_s)getOSLogHandler;
@end

@implementation ABMDiagnosticExtensionLogging

+ (os_log_s)getOSLogHandler
{
  if (qword_1000159D8 != -1) {
    dispatch_once(&qword_1000159D8, &stru_100010440);
  }
  return (os_log_s *)qword_1000159D0;
}

@end