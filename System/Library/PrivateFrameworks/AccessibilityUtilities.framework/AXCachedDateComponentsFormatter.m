@interface AXCachedDateComponentsFormatter
@end

@implementation AXCachedDateComponentsFormatter

uint64_t ___AXCachedDateComponentsFormatter_block_invoke()
{
  _AXCachedDateComponentsFormatter_AXDateComponentsFormatterQueue = (uint64_t)dispatch_queue_create("AXDateComponentsFormatter", 0);

  return MEMORY[0x1F41817F8]();
}

void ___AXCachedDateComponentsFormatter_block_invoke_2(uint64_t a1)
{
  if (_block_invoke_2_twiceToken != -1) {
    dispatch_once(&_block_invoke_2_twiceToken, &__block_literal_global_64);
  }
  v2 = (void *)_block_invoke_2_DateFormatters;
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setZeroFormattingBehavior:1];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setUnitsStyle:4];
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v10 = 224;
    }
    else {
      uint64_t v10 = 96;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setAllowedUnits:v10];
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v12 = (void *)_block_invoke_2_DateFormatters;
    id v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
}

uint64_t ___AXCachedDateComponentsFormatter_block_invoke_3()
{
  _block_invoke_2_DateFormatters = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

@end