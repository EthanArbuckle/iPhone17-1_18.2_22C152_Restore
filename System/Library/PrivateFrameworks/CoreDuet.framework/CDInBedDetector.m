@interface CDInBedDetector
@end

@implementation CDInBedDetector

uint64_t __62___CDInBedDetector_lockedTimesBetweenStartDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __76___CDInBedDetector_findMotionTerminusBetweenStartDate_endDate_latest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70___CDInBedDetector_stationaryIntervalsBetweenStartDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __102___CDInBedDetector_findDateIntervalOfEventInStream_datePredicate_valuePredicate_sortDescriptor_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

@end