@interface GetAudioToBufferTimes
@end

@implementation GetAudioToBufferTimes

__n128 __audioHoseManagerBuffered_GetAudioToBufferTimes_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  __n128 result = a3[4];
  *(void *)(v3 + 40) = a3[5].n128_u64[0];
  *(__n128 *)(v3 + 24) = result;
  return result;
}

__n128 __audioHoseManagerBuffered_GetAudioToBufferTimes_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a3 + 8))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    CMTime time1 = *(CMTime *)(a3 + 64);
    CMTime v8 = *(CMTime *)(v5 + 24);
    if (CMTimeCompare(&time1, &v8) < 0)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      __n128 result = *(__n128 *)(a3 + 64);
      *(void *)(v7 + 40) = *(void *)(a3 + 80);
      *(__n128 *)(v7 + 24) = result;
    }
  }
  return result;
}

@end