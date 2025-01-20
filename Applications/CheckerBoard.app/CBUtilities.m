@interface CBUtilities
+ (BOOL)isInternalInstall;
+ (BOOL)isRunningOnPhysicalHardware;
+ (BOOL)wasRemoteSetupPerformed;
@end

@implementation CBUtilities

+ (BOOL)isRunningOnPhysicalHardware
{
  if (qword_10008FDF8 != -1) {
    dispatch_once(&qword_10008FDF8, &stru_100079D00);
  }
  return byte_10008EF00;
}

+ (BOOL)wasRemoteSetupPerformed
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"remoteSetupCompleted"];

  return v3;
}

+ (BOOL)isInternalInstall
{
  if (qword_10008FE08 != -1) {
    dispatch_once(&qword_10008FE08, &stru_100079D20);
  }
  return byte_10008FE00;
}

@end