@interface RegisterStream
@end

@implementation RegisterStream

uint64_t __audioEngineCarPlay_RegisterStream_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 96))
  {
LABEL_7:
    uint64_t result = APSLogErrorAt();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = -72071;
    goto LABEL_8;
  }
  if (!*(unsigned char *)(v2 + 120))
  {
    APAudioFormatToASBD();
    if (*(_DWORD *)(*(void *)(a1 + 40) + 32) != 1819304813)
    {
      uint64_t result = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 56));
      *(void *)(*(void *)(a1 + 40) + 96) = result;
      *(void *)(*(void *)(a1 + 40) + 104) = **(void **)(a1 + 64);
      *(void *)(*(void *)(a1 + 40) + 112) = *(void *)(*(void *)(a1 + 64) + 24);
      return result;
    }
    goto LABEL_7;
  }
  uint64_t result = APSLogErrorAt();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  int v5 = -72077;
LABEL_8:
  *(_DWORD *)(v4 + 24) = v5;
  return result;
}

@end