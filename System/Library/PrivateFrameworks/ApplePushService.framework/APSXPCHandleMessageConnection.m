@interface APSXPCHandleMessageConnection
@end

@implementation APSXPCHandleMessageConnection

uint64_t ___APSXPCHandleMessageConnection_block_invoke(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

@end