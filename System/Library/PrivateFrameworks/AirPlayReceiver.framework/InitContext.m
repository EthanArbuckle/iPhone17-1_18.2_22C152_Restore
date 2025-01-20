@interface InitContext
@end

@implementation InitContext

void __apReceiverFairPlayHelper_InitContext_block_invoke(uint64_t a1)
{
  v3[3] = *MEMORY[0x263EF8340];
  memset(v3, 0, 24);
  zxcm2Qme0x(0, 0, (uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    DataToHexCStringEx();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = XtCqEf5X(0, (uint64_t)v3, (uint64_t)"/var/mobile/Media/iTunes_Control/iTunes/AirTunes/", (uint64_t)&gFairPlayContextID);
  }
}

@end