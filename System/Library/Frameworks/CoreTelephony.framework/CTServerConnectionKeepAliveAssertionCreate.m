@interface CTServerConnectionKeepAliveAssertionCreate
@end

@implementation CTServerConnectionKeepAliveAssertionCreate

void ___CTServerConnectionKeepAliveAssertionCreate_block_invoke(uint64_t a1)
{
  CFRetain(*(CFTypeRef *)(a1 + 40));
  xpc_object_t object = xpc_null_create();
  int v2 = SendXpcMessage(*(void *)(a1 + 40), (xpc_object_t *)(a1 + 48), &object);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  xpc_release(object);
}

@end