@interface AXCachedDateFormatterForFormat
@end

@implementation AXCachedDateFormatterForFormat

uint64_t ___AXCachedDateFormatterForFormat_block_invoke()
{
  _AXCachedDateFormatterForFormat_AXDateFormatterQueue = (uint64_t)dispatch_queue_create("AXDateFormatter", 0);

  return MEMORY[0x1F41817F8]();
}

void ___AXCachedDateFormatterForFormat_block_invoke_2(uint64_t a1)
{
  if (_block_invoke_twiceToken != -1) {
    dispatch_once(&_block_invoke_twiceToken, &__block_literal_global_57);
  }
  uint64_t v2 = [(id)_block_invoke_DateFormatters objectForKey:*(void *)(a1 + 32)];
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
    [(id)_block_invoke_DateFormatters setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

uint64_t ___AXCachedDateFormatterForFormat_block_invoke_3()
{
  _block_invoke_DateFormatters = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

@end