@interface CTServerConnectionGetSIMSubscriptionStatus
@end

@implementation CTServerConnectionGetSIMSubscriptionStatus

void ___CTServerConnectionGetSIMSubscriptionStatus_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    if (!v4) {
      goto LABEL_5;
    }
  }
  if (MEMORY[0x1853203E0](v4) == v3)
  {
    xpc_retain(v4);
    xpc_object_t v5 = v4;
    goto LABEL_7;
  }
LABEL_5:
  xpc_object_t v5 = xpc_null_create();
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x1853203E0](v5) == v3 && xpc_dictionary_get_value(v5, "kCPSIMSubscriptionStatus"))
  {
    CFTypeRef cf = 0;
    xpc_dictionary_get_value(v5, "kCPSIMSubscriptionStatus");
    uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v6);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  xpc_release(v5);
}

@end