@interface DDRTask
- (NSString)identifier;
- (double)estimatedTimeOfCompletion;
- (void)main;
@end

@implementation DDRTask

- (void)main
{
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.devicedatareset.task";
}

- (double)estimatedTimeOfCompletion
{
  return 0.0;
}

@end