@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __94__NSMutableAttributedString_RippleAnimation__removeRippleAnimation_includingFilterEffect_emk___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 scaleRippleAnimation];
  LOBYTE(v9) = v11 == v10;

  objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB0788], a3, a4);
  *a5 = (_BYTE)v9;
}

void __94__NSMutableAttributedString_RippleAnimation__removeRippleAnimation_includingFilterEffect_emk___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 glimmerFilterAnimation];
  LOBYTE(v9) = v11 == v10;

  objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", @"_NSTextFilterAnimation", a3, a4);
  *a5 = (_BYTE)v9;
}

@end