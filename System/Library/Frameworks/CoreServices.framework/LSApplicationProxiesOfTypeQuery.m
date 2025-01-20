@interface LSApplicationProxiesOfTypeQuery
@end

@implementation LSApplicationProxiesOfTypeQuery

uint64_t __70___LSApplicationProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1)
{
  v2 = (void *)_CSStringCopyCFString();
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 isEqual:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

@end