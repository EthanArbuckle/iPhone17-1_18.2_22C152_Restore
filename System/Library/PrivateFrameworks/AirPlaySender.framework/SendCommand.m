@interface SendCommand
@end

@implementation SendCommand

void __carEndpoint_SendCommand_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), 0, *(void *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end