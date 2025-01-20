@interface NSObject
@end

@implementation NSObject

uint64_t __76__NSObject_NSObject_KVOBlock__addOneShotKVOBlockForKeyPath_options_handler___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v2 removeKVOBlockForToken:v3];
}

@end