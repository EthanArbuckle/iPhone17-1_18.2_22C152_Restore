@interface DeregisterStream
@end

@implementation DeregisterStream

void __audioEngineCarPlay_DeregisterStream_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(unsigned char *)(v2 + 120))
  {
    APSLogErrorAt();
    uint64_t v5 = *(void *)(a1[4] + 8);
    int v6 = -72077;
LABEL_10:
    *(_DWORD *)(v5 + 24) = v6;
    return;
  }
  v3 = (const void *)a1[6];
  if (v3 != *(const void **)(v2 + 96))
  {
    APSLogErrorAt();
    uint64_t v5 = *(void *)(a1[4] + 8);
    int v6 = -72073;
    goto LABEL_10;
  }
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1[5] + 96) = 0;
    uint64_t v2 = a1[5];
  }
  *(void *)(v2 + 104) = 0;
  *(void *)(a1[5] + 112) = 0;
  v4 = *(const void **)(a1[5] + 88);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1[5] + 88) = 0;
  }
}

@end