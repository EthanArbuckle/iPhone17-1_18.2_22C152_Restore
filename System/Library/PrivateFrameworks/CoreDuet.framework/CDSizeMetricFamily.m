@interface CDSizeMetricFamily
@end

@implementation CDSizeMetricFamily

void __48___CDSizeMetricFamily_sizeMetricFamilyWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_CDSizeMetricFamilies objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = -[_CDSizeMetricFamily initWithName:]([_CDSizeMetricFamily alloc], *(void **)(a1 + 32));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v8 = (void *)_CDSizeMetricFamilies;
      objc_msgSend(v8, "setObject:forKeyedSubscript:");
    }
  }
}

void __55___CDSizeMetricFamily_sizeMetricWithName_string_scale___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v5 = [[_CDMutableSizeMetric alloc] initWithName:a1[5] string:a1[6] scale:a1[8] family:a1[4]];
    uint64_t v6 = *(void *)(a1[7] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      v8 = *(void **)(a1[4] + 16);
      objc_msgSend(v8, "setObject:forKeyedSubscript:");
    }
  }
}

@end