@interface SAUIAddViews
@end

@implementation SAUIAddViews

void __76__SAUIAddViews_ClientFeedbackPresented___af_enumerateClientFeedbackDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
  }
  uint64_t v4 = *(void *)(a1 + 40);
  __copy_constructor_8_8_s0_s8_s16_s24_t32w1((uint64_t)v5, a2);
  (*(void (**)(uint64_t, unsigned char *))(v4 + 16))(v4, v5);
  __destructor_8_s0_s8_s16_s24(a2);
}

@end