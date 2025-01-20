@interface ICSCrashReporter
+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5;
+ (void)simulateCrashReportWithFormat:(id)a3;
+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5;
@end

@implementation ICSCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  id v7 = a3;
  v8 = dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AC288;
  v10[3] = &unk_1002CDD38;
  int v12 = a4;
  unsigned int v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = [objc_alloc((Class)NSString) initWithFormat:v8 arguments:&v10];

  [a1 simulateCrashReportWithReason:v9 pid:v6 code:v5];
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v6];

  [a1 simulateCrashReportWithReason:v5 pid:getpid() code:14593455];
}

@end