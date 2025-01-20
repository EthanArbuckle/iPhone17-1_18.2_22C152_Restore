@interface OSLogIndexEnumerator
@end

@implementation OSLogIndexEnumerator

uint64_t __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    if (*(_DWORD *)a2 == 1)
    {
      if (*(void *)(a2 + 64)) {
        return 1;
      }
    }
    else if ((*(_DWORD *)a2 - 1) >= 2)
    {
      *(unsigned char *)(v3 + 24) = 1;
    }
  }
  if (((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
  {
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    return result;
  }
  return 1;
}

@end