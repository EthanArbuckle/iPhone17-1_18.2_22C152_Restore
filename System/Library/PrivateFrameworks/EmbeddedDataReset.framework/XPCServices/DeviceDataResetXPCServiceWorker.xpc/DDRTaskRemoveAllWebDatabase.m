@interface DDRTaskRemoveAllWebDatabase
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveAllWebDatabase

- (void)run
{
  NSHomeDirectory();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v6 stringByAppendingPathComponent:@"Library"];
  v3 = [v2 stringByAppendingPathComponent:@"WebKit"];
  v4 = [v3 stringByAppendingPathComponent:@"Databases"];
  v5 = +[NSArray array];
  removeSubFiles(v4, v5);
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeAllWebDatabase";
}

@end