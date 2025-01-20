@interface ApplePhotonDetectorServicesGetLux
@end

@implementation ApplePhotonDetectorServicesGetLux

unsigned __int8 *__ApplePhotonDetectorServicesGetLux_block_invoke_8(unsigned __int8 *result)
{
  v1 = result;
  uint64_t v2 = result[76];
  if (result[76])
  {
    uint64_t v3 = *((void *)result + 4);
    if (*(void *)v3)
    {
      memcpy(*(void **)v3, *((const void **)result + 5), 4 * v2);
      uint64_t v3 = *((void *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    v4 = *(void **)(v3 + 8);
    if (v4)
    {
      memcpy(v4, *((const void **)v1 + 6), 4 * v2);
      uint64_t v3 = *((void *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    v5 = *(void **)(v3 + 16);
    if (v5)
    {
      memcpy(v5, *((const void **)v1 + 7), 8 * v2);
      uint64_t v3 = *((void *)v1 + 4);
      LODWORD(v2) = v1[76];
    }
    result = *(unsigned __int8 **)(v3 + 24);
    if (result)
    {
      result = (unsigned __int8 *)memcpy(result, *((const void **)v1 + 8), v2);
      LOBYTE(v2) = v1[76];
    }
  }
  uint64_t v6 = *((void *)v1 + 4);
  *(unsigned char *)(v6 + 36) = v2;
  *(_DWORD *)(v6 + 32) = *((_DWORD *)v1 + 18);
  return result;
}

@end