@interface SchedulePrimaryTransitionTimerProc
@end

@implementation SchedulePrimaryTransitionTimerProc

void __fpic_SchedulePrimaryTransitionTimerProc_block_invoke(uint64_t a1)
{
  v2 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  uint64_t LastCurrentItem = fpic_GetLastCurrentItem(*(void *)(a1 + 40), (uint64_t)v2);
  if (LastCurrentItem
    && (uint64_t v4 = LastCurrentItem, v7 = 0, fpic_ApplyResumptionOffset(*(void *)(a1 + 40), 1, 0, (uint64_t)v2, &v7), !v7))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    fpic_GetItemEndTime(v4, (uint64_t)&v6);
    fpic_scheduleInterstitialAudioTransition(v5, &v6, 0);
    if (!v2) {
      return;
    }
  }
  else if (!v2)
  {
    return;
  }
  CFRelease(v2);
}

@end