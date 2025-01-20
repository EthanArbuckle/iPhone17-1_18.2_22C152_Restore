@interface NSXPCInterface(AFSiriTaskDelivering)
+ (uint64_t)af_siriTaskDeliveringInterface;
@end

@implementation NSXPCInterface(AFSiriTaskDelivering)

+ (uint64_t)af_siriTaskDeliveringInterface
{
  return [a1 interfaceWithProtocol:&unk_1EEEC2740];
}

@end