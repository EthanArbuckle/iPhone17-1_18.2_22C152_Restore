@interface DDRTaskRemoveBulletinBoardSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveBulletinBoardSettings

- (void)run
{
  NSHomeDirectory();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 stringByAppendingPathComponent:@"Library"];
  v3 = [v2 stringByAppendingPathComponent:@"BulletinBoard"];
  v4 = +[NSArray arrayWithObject:@"ClearedSections.plist"];
  removeSubFiles(v3, v4);
}

- (double)estimatedTimeOfCompletion
{
  return 0.05;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeBulletinBoardSettings";
}

@end