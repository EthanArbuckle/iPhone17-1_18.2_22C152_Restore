@interface DDRTaskResetControlCenterSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetControlCenterSettings

- (void)run
{
  NSHomeDirectory();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 stringByAppendingPathComponent:@"Library"];
  v3 = [v2 stringByAppendingPathComponent:@"ControlCenter"];
  v4 = +[NSArray array];
  removeSubFiles(v3, v4);
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetControlCenterSettings";
}

@end