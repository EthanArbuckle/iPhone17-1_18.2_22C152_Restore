@interface CFHTTPServerConnectionIsValid
@end

@implementation CFHTTPServerConnectionIsValid

uint64_t ___CFHTTPServerConnectionIsValid_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 72);
  if (v2 >= 2)
  {
    if (v2 == 2)
    {
      uint64_t v3 = *(void *)(a2 + 88);
      if (v3) {
        LOBYTE(v3) = *(_DWORD *)(*(void *)(a2 + 96) + 40) != 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  return result;
}

@end