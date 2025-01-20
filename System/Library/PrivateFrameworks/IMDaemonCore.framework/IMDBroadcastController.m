@interface IMDBroadcastController
+ (IMDBroadcasterProviding)sharedProvider;
+ (void)registerSharedProvider:(id)a3;
@end

@implementation IMDBroadcastController

+ (IMDBroadcasterProviding)sharedProvider
{
  return (IMDBroadcasterProviding *)(id)qword_1EBE2BE68;
}

+ (void)registerSharedProvider:(id)a3
{
}

@end