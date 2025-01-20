@interface CFFileDescriptorPerform
@end

@implementation CFFileDescriptorPerform

uint64_t ____CFFileDescriptorPerform_block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 72) + 16) == 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    v1 = (void *)result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 72) + 50);
    if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
    {
      uint64_t v2 = *(void *)(result + 72);
      *(unsigned char *)(v2 + 50) = 0;
      result = cffd_is_readable(*(_DWORD *)(v2 + 24));
      *(unsigned char *)(*(void *)(v1[5] + 8) + 24) = result;
    }
    *(unsigned char *)(*(void *)(v1[6] + 8) + 24) = *(unsigned char *)(v1[9] + 51);
    if (*(unsigned char *)(*(void *)(v1[6] + 8) + 24))
    {
      uint64_t v3 = v1[9];
      *(unsigned char *)(v3 + 51) = 0;
      result = cffd_is_writeable(*(_DWORD *)(v3 + 28));
      *(unsigned char *)(*(void *)(v1[6] + 8) + 24) = result;
    }
    uint64_t v4 = v1[9];
    v5 = *(uint64_t (**)(void))(v4 + 88);
    if (v5 && (*(unsigned char *)(*(void *)(v1[5] + 8) + 24) || *(unsigned char *)(*(void *)(v1[6] + 8) + 24)))
    {
      result = v5(*(void *)(v4 + 80));
      *(void *)(*(void *)(v1[7] + 8) + 24) = result;
      uint64_t v6 = v1[8];
      uint64_t v7 = *(void *)(v1[9] + 96);
    }
    else
    {
      uint64_t v7 = *(void *)(v4 + 80);
      uint64_t v6 = v1[7];
    }
    *(void *)(*(void *)(v6 + 8) + 24) = v7;
  }
  return result;
}

@end