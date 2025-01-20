@interface UnsetTimeoutTimer
@end

@implementation UnsetTimeoutTimer

void __figXPC_UnsetTimeoutTimer_block_invoke(uint64_t a1)
{
  context = dispatch_get_context(*(dispatch_object_t *)(*(void *)(a1 + 40) + 192));
  if (context)
  {
    xpc_release(context);
    dispatch_set_context(*(dispatch_object_t *)(*(void *)(a1 + 40) + 192), 0);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 216);
  if (v4)
  {
    *(void *)(v3 + 216) = 0;
    xpc_release(v4);
  }
}

@end