@interface SecKeychainRollKeys
@end

@implementation SecKeychainRollKeys

uint64_t ___SecKeychainRollKeys_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  return 1;
}

uint64_t ___SecKeychainRollKeys_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

@end