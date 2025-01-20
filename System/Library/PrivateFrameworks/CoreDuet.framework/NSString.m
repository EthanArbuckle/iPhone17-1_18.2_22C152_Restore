@interface NSString
@end

@implementation NSString

void __33__NSString__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)dk_dedup_set;
  dk_dedup_set = v0;

  dk_dedup_lock = 0;
}

@end