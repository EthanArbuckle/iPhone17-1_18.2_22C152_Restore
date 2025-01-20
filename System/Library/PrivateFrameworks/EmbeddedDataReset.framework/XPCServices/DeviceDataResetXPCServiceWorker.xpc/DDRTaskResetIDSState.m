@interface DDRTaskResetIDSState
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetIDSState

- (void)run
{
}

- (double)estimatedTimeOfCompletion
{
  return 5.0;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.IDSClearState";
}

@end