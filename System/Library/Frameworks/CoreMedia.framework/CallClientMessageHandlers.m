@interface CallClientMessageHandlers
@end

@implementation CallClientMessageHandlers

void __figXPCConnection_CallClientMessageHandlers_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 32) + 16) + 48))(*(void *)(a1 + 40), *(void *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 48));
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __figXPCConnection_CallClientMessageHandlers_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 64))(*(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);

  xpc_release(v2);
}

@end