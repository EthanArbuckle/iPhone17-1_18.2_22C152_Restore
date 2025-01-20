@interface WKTextManipulationItem
@end

@implementation WKTextManipulationItem

uint64_t __82___WKTextManipulationItem_isEqualToTextManipulationItem_includingContentEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a2, "isEqualToTextManipulationToken:includingContentEquality:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tokens"), "objectAtIndexedSubscript:", a3), *(unsigned __int8 *)(a1 + 48));
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __57___WKTextManipulationItem__descriptionPreservingPrivacy___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = [a2 description];
  }
  else {
    uint64_t v3 = [a2 debugDescription];
  }
  uint64_t v4 = v3;
  v5 = *(void **)(a1 + 32);

  return [v5 addObject:v4];
}

@end