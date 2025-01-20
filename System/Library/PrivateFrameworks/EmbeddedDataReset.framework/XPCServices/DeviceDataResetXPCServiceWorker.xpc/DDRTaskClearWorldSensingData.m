@interface DDRTaskClearWorldSensingData
- (double)estimatedTimeOfCompletion;
- (id)identifier;
@end

@implementation DDRTaskClearWorldSensingData

- (id)identifier
{
  return @"com.apple.devicedatareset.clearWorldSensingData";
}

- (double)estimatedTimeOfCompletion
{
  return 0.0;
}

@end