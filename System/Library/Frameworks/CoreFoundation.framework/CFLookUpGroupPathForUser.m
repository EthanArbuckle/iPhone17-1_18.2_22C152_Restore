@interface CFLookUpGroupPathForUser
@end

@implementation CFLookUpGroupPathForUser

uint64_t ___CFLookUpGroupPathForUser_block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  identifier = (const char *)container_get_identifier();
  path = (const char *)container_get_path();
  xpc_dictionary_set_string(v1, identifier, path);
  return 1;
}

@end