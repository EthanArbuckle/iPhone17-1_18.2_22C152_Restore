@interface HKDerivedCacheIndexAndDateComponents
@end

@implementation HKDerivedCacheIndexAndDateComponents

uint64_t ___HKDerivedCacheIndexAndDateComponents_block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) calendar];
  v3 = v2;
  if (!v2) {
    v3 = *(void **)(a1 + 40);
  }
  id v4 = v3;

  id v5 = *(id *)(a1 + 32);
  v6 = [v4 calendarIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = objc_msgSend(v5, "hk_translateDateComponentsToCalendar:calendarUnits:", *(void *)(a1 + 40), 30);

    id v5 = (id)v8;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCalendar:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setEra:", objc_msgSend(v5, "era"));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setYear:", objc_msgSend(v5, "year"));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setMonth:", objc_msgSend(v5, "month"));
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setDay:", objc_msgSend(v5, "day"));
  }
  v12 = [*(id *)(a1 + 40) dateFromComponents:v5];
  [v12 timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = llround(v13);

  return 1;
}

@end