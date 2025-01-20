@interface EnsurePrimaryBufferingPosition
@end

@implementation EnsurePrimaryBufferingPosition

uint64_t __fpic_EnsurePrimaryBufferingPosition_block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 40) + 979))
  {
    v1 = (void *)result;
    result = (uint64_t)fpic_GetCurrentlyPlayingEvent();
    if (result)
    {
      uint64_t v2 = result;
      result = (*(uint64_t (**)(void, void, uint64_t, double))(v1[5] + 128))(v1[6], v1[7], 1, NAN);
      uint64_t v3 = v1[5];
      *(unsigned char *)(v3 + 979) = result;
      if (result)
      {
        if ((*(unsigned char *)(v3 + 884) & 1) == 0)
        {
          uint64_t v4 = (*(uint64_t (**)(void, void, uint64_t))(v3 + 80))(v1[6], v1[7], v2);
          unsigned int SnapOptions = FigPlayerInterstitialEventGetSnapOptions(v4);
          result = fpic_ApplyResumptionOffset(v1[6], 1, (SnapOptions >> 1) & 1, v1[7], 0);
          *(_DWORD *)(*(void *)(v1[4] + 8) + 24) = result;
        }
      }
    }
  }
  return result;
}

@end