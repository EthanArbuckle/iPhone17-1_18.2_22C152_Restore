@interface ABMDiagnosticExtensionLogging
+ (os_log_s)getOSLogHandler;
@end

@implementation ABMDiagnosticExtensionLogging

+ (os_log_s)getOSLogHandler
{
  if (qword_100008A18 != -1) {
    dispatch_once(&qword_100008A18, &stru_100004170);
  }
  return (os_log_s *)qword_100008A10;
}

@end