@interface ABMDiagnosticExtensionLogging
+ (os_log_s)getOSLogHandler;
@end

@implementation ABMDiagnosticExtensionLogging

+ (os_log_s)getOSLogHandler
{
  if (qword_100034640 != -1) {
    dispatch_once(&qword_100034640, &stru_1000311B0);
  }
  return (os_log_s *)qword_100034638;
}

@end