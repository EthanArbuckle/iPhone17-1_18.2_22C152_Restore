@interface AXUIMakeTouch
@end

@implementation AXUIMakeTouch

uint64_t ___AXUIMakeTouch_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1E08]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = mach_absolute_time();
  unsigned int v6 = dword_1EA3832C0;
  if (!dword_1EA3832C0)
  {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo);
    unsigned int v6 = dword_1EA3832C0;
  }
  double v7 = (double)(v5 * MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo / v6) / 1000000000.0;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPhase:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTimestamp:v7];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTapCount:1];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setWindow:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setView:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "_setLocationInWindow:resetPrevious:", 1, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v8 _setIsFirstTouchForView:1];
}

@end