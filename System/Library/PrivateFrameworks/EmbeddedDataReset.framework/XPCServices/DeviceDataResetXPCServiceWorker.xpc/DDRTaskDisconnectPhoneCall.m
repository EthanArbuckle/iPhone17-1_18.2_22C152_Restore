@interface DDRTaskDisconnectPhoneCall
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskDisconnectPhoneCall

- (void)run
{
}

- (id)identifier
{
  return @"com.apple.devicedatareset.disconnectPhoneCall";
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

@end