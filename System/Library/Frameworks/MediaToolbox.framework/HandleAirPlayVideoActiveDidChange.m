@interface HandleAirPlayVideoActiveDidChange
@end

@implementation HandleAirPlayVideoActiveDidChange

void __fpic_HandleAirPlayVideoActiveDidChange_block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = fpic_isAirplayVideoActive(a1[8]);
  int v2 = *(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v3 = a1[9];
  if (v2 != *(unsigned __int8 *)(v3 + 1080))
  {
    *(unsigned char *)(v3 + 1080) = v2;
    if (CFArrayGetCount(*(CFArrayRef *)(v3 + 600)) >= 1)
    {
      if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
      {
        if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(a1[7]))
        {
          uint64_t v4 = a1[7];
          uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 24);
          DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
          if (DerivedStorage[975])
          {
            v7 = DerivedStorage;
            if (DerivedStorage[352] || DerivedStorage[353])
            {
              if (fpic_GetCurrentlyPlayingEvent())
              {
                uint64_t v8 = CMBaseObjectGetDerivedStorage();
                *(_DWORD *)(v8 + 720) = FPSupport_IncrementSeekID(*(_DWORD *)(v8 + 720));
                memset(&v17, 0, sizeof(v17));
                fpic_GetCurrentDepartureTime((__n128 *)&v17);
                CMTime v16 = *(CMTime *)(v7 + 16);
                fpic_AccumulateDuration(&v17, &v16);
                fpic_GetCurrentlyPlayingEventPlayoutDuration(v4, 0, v5, &v16);
                fpic_AccumulateDuration(&v17, &v16);
                uint64_t v9 = *((void *)v7 + 19);
                CMTime v15 = v17;
                long long v13 = *MEMORY[0x1E4F1F9F8];
                uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
                long long v11 = v13;
                uint64_t v12 = v14;
                FPSupport_SetCurrentTimeWithRangeIDAndReason(v9, (long long *)&v15.value, 5, &v13, &v11);
              }
            }
          }
        }
      }
      fpic_RescheduleCurrentEvents((const void *)a1[7], (CFTypeRef *)(*(void *)(a1[6] + 8) + 24), *(void *)(*(void *)(a1[5] + 8) + 24));
    }
    uint64_t v10 = a1[9];
    if (*(_DWORD *)(v10 + 1084) == 1)
    {
      fpic_PostNotification(v10, @"fpiEventsDidChange", (const void *)a1[7], 0);
      fpic_UpdatePlaybackItemEventList(a1[7], *(void *)(a1[9] + 152));
    }
  }
}

@end