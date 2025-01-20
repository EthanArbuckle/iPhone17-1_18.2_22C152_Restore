@interface DDRTaskRemoveAllWebCookies
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveAllWebCookies

- (void)run
{
  NSHomeDirectory();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 stringByAppendingPathComponent:@"Library"];
  v3 = [v2 stringByAppendingPathComponent:@"Cookies"];
  v4 = +[NSArray array];
  removeSubFiles(v3, v4);
}

- (double)estimatedTimeOfCompletion
{
  return 0.5;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeAllWebCookies";
}

@end