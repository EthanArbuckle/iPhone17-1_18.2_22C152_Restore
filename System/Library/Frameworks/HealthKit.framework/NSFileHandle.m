@interface NSFileHandle
@end

@implementation NSFileHandle

uint64_t __62__NSFileHandle_HealthKit__hk_enumerateLinesWithError_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readDataUpToLength:4096 error:a2];
}

@end