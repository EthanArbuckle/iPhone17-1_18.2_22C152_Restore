@interface NSAttributedString
@end

@implementation NSAttributedString

void __81__NSAttributedString_BSUIPartialStylingAdditions___bsui_rangesOfTextAttachments___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && a3 != -1 && a4 != -1)
  {
    v7 = *(void **)(*(void *)(a1[4] + 8) + 40);
    v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v7 addObject:v8];

    v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40) + *(void *)(*(void *)(a1[6] + 8) + 32);
      v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v10, a3 - v10);
      [v9 addObject:v11];

      uint64_t v12 = *(void *)(a1[6] + 8);
      *(void *)(v12 + 32) = a3;
      *(void *)(v12 + 40) = a4;
    }
  }
}

@end