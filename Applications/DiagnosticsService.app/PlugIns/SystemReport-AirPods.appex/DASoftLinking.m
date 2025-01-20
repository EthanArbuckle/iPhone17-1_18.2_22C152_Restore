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
  if (qword_1000153E0 != -1) {
    dispatch_once(&qword_1000153E0, &stru_100010398);
  }
  return byte_1000153D8;
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
  if (qword_1000153E8 != -1) {
    dispatch_once(&qword_1000153E8, &stru_1000103B8);
  }
  return byte_1000153D9;
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
  if (qword_1000153F0 != -1) {
    dispatch_once(&qword_1000153F0, &stru_1000103D8);
  }
  return byte_1000153DA;
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
  if (qword_1000153F8 != -1) {
    dispatch_once(&qword_1000153F8, &stru_1000103F8);
  }
  return byte_1000153DB;
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