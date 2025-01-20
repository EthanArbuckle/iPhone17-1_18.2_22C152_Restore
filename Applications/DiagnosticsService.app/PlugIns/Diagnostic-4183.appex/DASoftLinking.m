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
  if (qword_1000083C8 != -1) {
    dispatch_once(&qword_1000083C8, &stru_1000040E8);
  }
  return byte_1000083C0;
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
  if (qword_1000083D8 != -1) {
    dispatch_once(&qword_1000083D8, &stru_100004108);
  }
  return byte_1000083D0;
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
  if (qword_1000083E8 != -1) {
    dispatch_once(&qword_1000083E8, &stru_100004128);
  }
  return byte_1000083E0;
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
  if (qword_1000083F8 != -1) {
    dispatch_once(&qword_1000083F8, &stru_100004148);
  }
  return byte_1000083F0;
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