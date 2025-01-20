@interface AXMCachedDateFormatterForFormat
@end

@implementation AXMCachedDateFormatterForFormat

void ___AXMCachedDateFormatterForFormat_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("AXDateFormatter", 0);
  v1 = (void *)_AXMCachedDateFormatterForFormat_AXDateFormatterQueue;
  _AXMCachedDateFormatterForFormat_AXDateFormatterQueue = (uint64_t)v0;
}

void ___AXMCachedDateFormatterForFormat_block_invoke_2(uint64_t a1)
{
  if (AXMediaUtilitiesErrorDomain_block_invoke_onceToken != -1) {
    dispatch_once(&AXMediaUtilitiesErrorDomain_block_invoke_onceToken, &__block_literal_global_83);
  }
  uint64_t v2 = [(id)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_allocWithZone(MEMORY[0x1E4F28C10]) init];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    id v11 = [v8 dateFormatFromTemplate:v9 options:0 locale:v10];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDateFormat:v11];
    [(id)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

void ___AXMCachedDateFormatterForFormat_block_invoke_3()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters;
  AXMediaUtilitiesErrorDomain_block_invoke_DateFormatters = (uint64_t)v0;
}

@end