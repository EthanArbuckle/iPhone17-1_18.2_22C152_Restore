@interface LSDClient
@end

@implementation LSDClient

void __51___LSDClient_Private__handleXPCInvocation_isReply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18530F680]();
  [*(id *)(a1 + 32) invokeServiceInvocation:*(void *)(a1 + 40) isReply:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) didHandleInvocation:*(void *)(a1 + 40) isReply:*(unsigned __int8 *)(a1 + 48)];

  JUMPOUT(0x185310460);
}

@end