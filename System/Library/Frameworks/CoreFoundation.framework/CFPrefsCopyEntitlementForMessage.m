@interface CFPrefsCopyEntitlementForMessage
@end

@implementation CFPrefsCopyEntitlementForMessage

xpc_object_t ___CFPrefsCopyEntitlementForMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), *(char **)(a1 + 48), a2);
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    xpc_object_t result = xpc_copy(result);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

@end