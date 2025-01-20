@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __79__NSMutableAttributedString_FIUISizing__scaleFontSizeByAmount_minimumFontSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  [v7 pointSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8 * *(double *)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(double *)(v9 + 24);
  if (v10 < *(double *)(a1 + 56)) {
    double v10 = *(double *)(a1 + 56);
  }
  *(double *)(v9 + 24) = v10;
  id v12 = [v7 fontWithSize:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  uint64_t v11 = *MEMORY[0x263F814F0];
  objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F814F0], a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v11, v12, a3, a4);
}

void __72__NSMutableAttributedString_FIUISizing__scaleNumericAttribute_byAmount___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    [a2 doubleValue];
  }
  else {
    double v7 = 1.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7 * *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(void *)(a1 + 40), a3, a4);
  double v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [NSNumber numberWithDouble:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  objc_msgSend(v8, "addAttribute:value:range:", v9, v10, a3, a4);
}

@end