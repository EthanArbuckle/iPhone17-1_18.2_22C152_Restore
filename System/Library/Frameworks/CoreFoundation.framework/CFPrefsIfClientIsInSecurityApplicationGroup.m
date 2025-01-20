@interface CFPrefsIfClientIsInSecurityApplicationGroup
@end

@implementation CFPrefsIfClientIsInSecurityApplicationGroup

uint64_t ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke(uint64_t a1, CFTypeRef cf1, unsigned char *a3)
{
  uint64_t result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 40);
    *a3 = 1;
  }
  return result;
}

@end