@interface CKAdaptSizeToRectWithRounding
@end

@implementation CKAdaptSizeToRectWithRounding

uint64_t (*__CKAdaptSizeToRectWithRounding_block_invoke(uint64_t a1))(void)
{
  result = *(uint64_t (**)(void))(a1 + 32);
  if (result) {
    return (uint64_t (*)(void))result();
  }
  return result;
}

@end