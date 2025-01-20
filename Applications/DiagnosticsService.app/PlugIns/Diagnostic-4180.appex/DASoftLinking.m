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
  if (qword_1000089E0 != -1) {
    dispatch_once(&qword_1000089E0, &stru_100004100);
  }
  return byte_1000089D8;
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
  if (qword_1000089F0 != -1) {
    dispatch_once(&qword_1000089F0, &stru_100004120);
  }
  return byte_1000089E8;
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
  if (qword_100008A00 != -1) {
    dispatch_once(&qword_100008A00, &stru_100004140);
  }
  return byte_1000089F8;
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
  if (qword_100008A10 != -1) {
    dispatch_once(&qword_100008A10, &stru_100004160);
  }
  return byte_100008A08;
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