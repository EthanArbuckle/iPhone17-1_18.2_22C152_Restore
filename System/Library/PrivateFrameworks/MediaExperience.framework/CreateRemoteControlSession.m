@interface CreateRemoteControlSession
@end

@implementation CreateRemoteControlSession

uint64_t __central_CreateRemoteControlSession_block_invoke(uint64_t a1)
{
  if (**(unsigned char **)(a1 + 40))
  {
    uint64_t result = 4294954511;
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2
      && ((uint64_t v3 = *(void *)(a1 + 56), v4 = *(void *)(a1 + 64), (v5 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0)
        ? (uint64_t v6 = 0)
        : (uint64_t v6 = v5),
          (v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 80)) != 0))
    {
      uint64_t result = v7(v2, v3, v4);
    }
    else
    {
      uint64_t result = 4294954514;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end