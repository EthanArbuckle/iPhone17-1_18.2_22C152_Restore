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
  if (qword_100008B50 != -1) {
    dispatch_once(&qword_100008B50, &stru_100004188);
  }
  return byte_100008B48;
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
  if (qword_100008B60 != -1) {
    dispatch_once(&qword_100008B60, &stru_1000041A8);
  }
  return byte_100008B58;
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
  if (qword_100008B70 != -1) {
    dispatch_once(&qword_100008B70, &stru_1000041C8);
  }
  return byte_100008B68;
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
  if (qword_100008B80 != -1) {
    dispatch_once(&qword_100008B80, &stru_1000041E8);
  }
  return byte_100008B78;
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