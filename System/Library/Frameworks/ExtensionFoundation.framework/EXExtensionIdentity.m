@interface EXExtensionIdentity
@end

@implementation EXExtensionIdentity

void __38___EXExtensionIdentity_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)&OBJC_METACLASS____EXExtensionIdentity;
  id v2 = objc_msgSendSuper2(&v4, sel_allocWithZone_, v1);
  v3 = (void *)allocWithZone__factory;
  allocWithZone__factory = (uint64_t)v2;
}

@end