@interface NSXPCConnection(BMXPCListener)
- (uint64_t)bm_transport;
@end

@implementation NSXPCConnection(BMXPCListener)

- (uint64_t)bm_transport
{
  return 0;
}

@end