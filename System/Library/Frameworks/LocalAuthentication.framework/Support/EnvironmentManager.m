@interface EnvironmentManager
+ (id)sharedInstance;
- (id)dumpStatus;
@end

@implementation EnvironmentManager

+ (id)sharedInstance
{
  if (qword_100046E30 != -1) {
    dispatch_once(&qword_100046E30, &stru_1000389C0);
  }
  v2 = (void *)qword_100046E28;

  return v2;
}

- (id)dumpStatus
{
  v8[0] = @"biometry";
  v2 = +[BiometryHelper sharedInstance];
  v3 = [v2 dumpStatus];
  v8[1] = @"passcode";
  v9[0] = v3;
  v4 = +[LAPasscodeHelper sharedInstance];
  v5 = [v4 dumpStatus];
  v9[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

@end