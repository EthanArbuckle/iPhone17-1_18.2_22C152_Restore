@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

uint64_t __64__NSMutableDictionary_MediaAnalysis__vcp_addEntriesFromResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "vcp_setResult:forKey:", a3, a2);
}

uint64_t __56__NSMutableDictionary_MediaAnalysis__vcp_appendResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "vcp_appendResult:forKey:", a3, a2);
}

@end