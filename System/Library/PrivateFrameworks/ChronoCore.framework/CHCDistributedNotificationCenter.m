@interface CHCDistributedNotificationCenter
+ (id)sharedInstance;
@end

@implementation CHCDistributedNotificationCenter

+ (id)sharedInstance
{
  return (id)[MEMORY[0x1E4F28C40] defaultCenter];
}

@end