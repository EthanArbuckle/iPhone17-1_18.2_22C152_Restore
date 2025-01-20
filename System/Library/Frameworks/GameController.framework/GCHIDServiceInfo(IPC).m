@interface GCHIDServiceInfo(IPC)
- (uint64_t)initWithService:()IPC;
@end

@implementation GCHIDServiceInfo(IPC)

- (uint64_t)initWithService:()IPC
{
  v5 = +[_GCControllerManager sharedInstance];
  uint64_t v6 = [a1 initWithService:a3 queue:v5[2]];

  return v6;
}

@end