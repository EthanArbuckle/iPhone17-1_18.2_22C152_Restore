@interface UIFontMetrics(HKAdditions)
- (double)hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets:()HKAdditions compatibleWithTraitCollection:;
- (uint64_t)hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets:()HKAdditions;
@end

@implementation UIFontMetrics(HKAdditions)

- (uint64_t)hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets:()HKAdditions
{
  return objc_msgSend(a1, "hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets:compatibleWithTraitCollection:", 0);
}

- (double)hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets:()HKAdditions compatibleWithTraitCollection:
{
  id v12 = a7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__UIFontMetrics_HKAdditions__hk_scaledDirectionalEdgeInsetsForDirectionalEdgeInsets_compatibleWithTraitCollection___block_invoke;
  v17[3] = &unk_1E6D53B70;
  v17[4] = a1;
  id v18 = v12;
  id v13 = v12;
  v14 = (double (**)(double))_Block_copy(v17);
  double v15 = v14[2](a2);
  ((void (*)(double (**)(double), double))v14[2])(v14, a3);
  ((void (*)(double (**)(double), double))v14[2])(v14, a4);
  ((void (*)(double (**)(double), double))v14[2])(v14, a5);

  return v15;
}

@end