@interface NSArray
@end

@implementation NSArray

BOOL __71__NSArray_AXSSDocumentTextRuleExtension__containsString_caseSensitive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 compare:*(void *)(a1 + 32) options:*(unsigned char *)(a1 + 40) == 0] == 0;
}

@end