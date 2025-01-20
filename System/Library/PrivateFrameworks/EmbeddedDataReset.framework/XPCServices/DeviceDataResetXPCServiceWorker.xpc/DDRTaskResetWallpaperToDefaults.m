@interface DDRTaskResetWallpaperToDefaults
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetWallpaperToDefaults

- (void)run
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002DE8;
  v5[3] = &unk_100010628;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = (id)objc_opt_new();
  id v2 = v7;
  v3 = v6;
  [v2 restoreDefaultWallpaperWithCompletion:v5];
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v3, v4);
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetWallpaperToDefaults";
}

- (double)estimatedTimeOfCompletion
{
  return 0.1;
}

@end