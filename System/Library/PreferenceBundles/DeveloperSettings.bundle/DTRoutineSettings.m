@interface DTRoutineSettings
- (DTRoutineSettings)init;
@end

@implementation DTRoutineSettings

- (DTRoutineSettings)init
{
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v4 = [v3 firstObject];
  v5 = [&off_38390 componentsJoinedByString:@"/"];
  v6 = [v4 stringByAppendingPathComponent:v5];

  v7 = +[NSBundle bundleWithPath:v6];
  v8 = (DTRoutineSettings *)objc_alloc_init((Class)[v7 principalClass]);

  return v8;
}

@end