@interface COPY
@end

@implementation COPY

void __COPY_SETTER_IMPL_block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)[*(id *)(a1 + 32) copyWithZone:0];
  [a2 setObject:v4 forKey:*(void *)(a1 + 40)];
}

uint64_t __COPY_GETTER_IMPL_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *(void *)(a1 + 32)), "copyWithZone:", 0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end