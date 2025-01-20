@interface CalEventOccurrenceCacheCopyEventOccurrencesInDateRange
@end

@implementation CalEventOccurrenceCacheCopyEventOccurrencesInDateRange

CFTypeRef ___CalEventOccurrenceCacheCopyEventOccurrencesInDateRange_block_invoke(CFTypeRef result, CFTypeRef cf)
{
  if (cf)
  {
    uint64_t v2 = (uint64_t)result;
    result = CFRetain(cf);
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

@end