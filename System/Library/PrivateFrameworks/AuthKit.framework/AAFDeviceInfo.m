@interface AAFDeviceInfo
+ (BOOL)isDeviceInDiagnosticMode;
@end

@implementation AAFDeviceInfo

+ (BOOL)isDeviceInDiagnosticMode
{
  if (qword_100272670 != -1) {
    dispatch_once(&qword_100272670, &stru_10022B350);
  }
  return byte_100272668;
}

@end