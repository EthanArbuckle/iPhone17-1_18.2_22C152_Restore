@interface NSNumber
@end

@implementation NSNumber

uint64_t __45__NSNumber_CATCasting__cat_numberWithObject___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)cat_numberWithObject__formatter;
  cat_numberWithObject__formatter = (uint64_t)v0;

  v2 = (void *)cat_numberWithObject__formatter;

  return [v2 setNumberStyle:1];
}

@end