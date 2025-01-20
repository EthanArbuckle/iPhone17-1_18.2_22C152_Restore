@interface NSDate
@end

@implementation NSDate

void __32__NSDate__DKDeduping___os_dedup__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08760] set];
  v1 = (void *)_os_dedup_set_10;
  _os_dedup_set_10 = v0;

  _os_dedup_lock_11 = 0;
}

void __32__NSDate__DKDeduping___os_dedup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)objc_msgSend((id)_os_dedup_set_10, "countForObject:") <= 2) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end