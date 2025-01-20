@interface DDRTaskTerminateAllRunningApplications
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskTerminateAllRunningApplications

- (void)run
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = +[FBSSystemService sharedService];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001880;
  v6[3] = &unk_1000105C0;
  dispatch_semaphore_t v7 = v2;
  v4 = v2;
  [v3 terminateApplicationGroup:1 forReason:5 andReport:0 withDescription:@"data reset" completion:v6];

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
}

- (id)identifier
{
  return @"com.apple.devicedatareset.terminateAllRunningApplications";
}

- (double)estimatedTimeOfCompletion
{
  return 0.4;
}

@end