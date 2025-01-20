@interface DDRTaskSendSignoutEvent
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskSendSignoutEvent

- (void)run
{
}

- (double)estimatedTimeOfCompletion
{
  return 5.0;
}

- (id)identifier
{
  return @"com.apple.deivicedatareset.sendSignoutEvents";
}

@end