@interface CDPerfMetricFamily
@end

@implementation CDPerfMetricFamily

void __48___CDPerfMetricFamily_perfMetricFamilyWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_CDPerfMetricFamilies objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = [[_CDPerfMetricFamily alloc] initWithName:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v8 = (void *)_CDPerfMetricFamilies;
      objc_msgSend(v8, "setObject:forKeyedSubscript:");
    }
  }
}

void __49___CDPerfMetricFamily_perfMetricWithName_string___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    v5 = [[_CDMutablePerfMetric alloc] initWithName:a1[5] string:a1[6] family:a1[4]];
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

uint64_t __42___CDPerfMetricFamily_perfMetricWithName___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __37___CDPerfMetricFamily_allPerfMetrics__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

@end