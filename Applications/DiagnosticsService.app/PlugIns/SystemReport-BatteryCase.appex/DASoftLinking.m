@interface DASoftLinking
+ (BOOL)isBiometricKitFrameworkAvailable;
+ (BOOL)isCoreRepairFrameworkAvailable;
+ (BOOL)isNearFieldAccessoryFrameworkAvailable;
+ (BOOL)isNearFieldFrameworkAvailable;
+ (Class)biometricKitClass:(id)a3;
+ (Class)coreRepairClass:(id)a3;
+ (Class)nearFieldAccessoryClass:(id)a3;
+ (Class)nearFieldClass:(id)a3;
@end

@implementation DASoftLinking

+ (BOOL)isBiometricKitFrameworkAvailable
{
  if (qword_100011158 != -1) {
    dispatch_once(&qword_100011158, &stru_10000C340);
  }
  return byte_100011150;
}

+ (Class)biometricKitClass:(id)a3
{
  v3 = (NSString *)a3;
  if (+[DASoftLinking isBiometricKitFrameworkAvailable])
  {
    v4 = NSClassFromString(v3);
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (BOOL)isNearFieldFrameworkAvailable
{
  if (qword_100011160 != -1) {
    dispatch_once(&qword_100011160, &stru_10000C360);
  }
  return byte_100011151;
}

+ (Class)nearFieldClass:(id)a3
{
  v3 = (NSString *)a3;
  if (+[DASoftLinking isNearFieldFrameworkAvailable])
  {
    v4 = NSClassFromString(v3);
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (BOOL)isNearFieldAccessoryFrameworkAvailable
{
  if (qword_100011168 != -1) {
    dispatch_once(&qword_100011168, &stru_10000C380);
  }
  return byte_100011152;
}

+ (Class)nearFieldAccessoryClass:(id)a3
{
  v3 = (NSString *)a3;
  if (+[DASoftLinking isNearFieldAccessoryFrameworkAvailable])
  {
    v4 = NSClassFromString(v3);
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (BOOL)isCoreRepairFrameworkAvailable
{
  if (qword_100011170 != -1) {
    dispatch_once(&qword_100011170, &stru_10000C3A0);
  }
  return byte_100011153;
}

+ (Class)coreRepairClass:(id)a3
{
  v3 = (NSString *)a3;
  if (+[DASoftLinking isCoreRepairFrameworkAvailable])
  {
    v4 = NSClassFromString(v3);
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

@end