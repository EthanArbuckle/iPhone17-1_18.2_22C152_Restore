@interface ABMDiagnosticExtensionLogging
+ (os_log_s)getOSLogHandler;
@end

@implementation ABMDiagnosticExtensionLogging

+ (os_log_s)getOSLogHandler
{
  if (qword_100034648 != -1) {
    dispatch_once(&qword_100034648, &stru_1000311A8);
  }
  return (os_log_s *)qword_100034640;
}

@end