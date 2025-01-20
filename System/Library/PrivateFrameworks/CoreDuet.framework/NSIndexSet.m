@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __61__NSIndexSet_CoreDuetConvencience___cd_commaSeparatedIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(v4 + 8) + 8) + 24)) {
    return objc_msgSend(v3, "appendFormat:", @",%lu", a2);
  }
  uint64_t result = objc_msgSend(v3, "appendFormat:", @"%lu", a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

@end