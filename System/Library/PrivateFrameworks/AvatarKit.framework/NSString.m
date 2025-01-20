@interface NSString
@end

@implementation NSString

uint64_t __80__NSString_AVTExtension__avt_diffAgainst_suppressCommonLines_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 length];
  if (v3 <= result + 1) {
    unint64_t v5 = result + 1;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end