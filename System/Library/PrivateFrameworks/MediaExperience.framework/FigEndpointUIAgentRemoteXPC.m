@interface FigEndpointUIAgentRemoteXPC
@end

@implementation FigEndpointUIAgentRemoteXPC

void __FigEndpointUIAgentRemoteXPC_EnsureClientEstablished_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v1 = objc_msgSend(v0, "initWithObjectsAndKeys:", @"EndpointUIAgent_ServerConnectionDied", *MEMORY[0x1E4F22080], 0);
  FigEndpointUIAgentRemoteXPC_EnsureClientEstablished_err = FigXPCRemoteClientCreate();
}

@end