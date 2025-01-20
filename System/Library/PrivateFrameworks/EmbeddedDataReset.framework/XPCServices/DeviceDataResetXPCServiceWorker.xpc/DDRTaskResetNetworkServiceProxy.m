@interface DDRTaskResetNetworkServiceProxy
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetNetworkServiceProxy

- (void)run
{
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetNetworkServiceProxy";
}

@end