@interface NSXPCConnection(Announce)
- (uint64_t)an_isRemotePlaybackSession;
@end

@implementation NSXPCConnection(Announce)

- (uint64_t)an_isRemotePlaybackSession
{
  v1 = [a1 serviceName];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F4A7C0]];

  return v2;
}

@end