@interface MKLineHeaderModel
@end

@implementation MKLineHeaderModel

uint64_t __35___MKLineHeaderModel_colorProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 textColor];
}

uint64_t __45___MKLineHeaderModel_contentAttributedString__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

@end