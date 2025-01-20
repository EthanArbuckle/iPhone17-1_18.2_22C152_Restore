@interface OSLogFileFindExhaustivePoint
@end

@implementation OSLogFileFindExhaustivePoint

uint64_t ___OSLogFileFindExhaustivePoint_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 24587)
  {
    if (*(_DWORD *)(a2 + 4) > 0x10u)
    {
      uint64_t result = 0;
      **(void **)(a1 + 48) = *(void *)(a2 + 32);
      return result;
    }
    uint64_t result = 0;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 2;
LABEL_9:
    *(_DWORD *)(v4 + 24) = v5;
    return result;
  }
  if (*(_DWORD *)a2 != 4096) {
    return 1;
  }
  if (*(void *)(a2 + 8) <= 0xA7uLL)
  {
    uint64_t result = 0;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 22;
    goto LABEL_9;
  }
  *(_OWORD *)*(void *)(a1 + 40) = *(_OWORD *)(a2 + 144);
  if ((*(unsigned char *)(a2 + 52) & 2) == 0) {
    return 1;
  }
  uint64_t result = 0;
  **(void **)(a1 + 48) = 0;
  return result;
}

@end