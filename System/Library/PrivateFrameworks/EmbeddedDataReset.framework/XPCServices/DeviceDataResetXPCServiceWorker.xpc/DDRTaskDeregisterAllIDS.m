@interface DDRTaskDeregisterAllIDS
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskDeregisterAllIDS

- (void)run
{
}

- (double)estimatedTimeOfCompletion
{
  return 5.0;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.deregisterallIDS";
}

@end