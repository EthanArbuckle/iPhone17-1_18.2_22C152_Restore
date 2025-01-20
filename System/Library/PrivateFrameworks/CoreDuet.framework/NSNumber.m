@interface NSNumber
@end

@implementation NSNumber

void __33__NSNumber__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)dk_dedup_set_4;
  dk_dedup_set_4 = v0;

  dk_dedup_lock_5 = 0;
}

@end