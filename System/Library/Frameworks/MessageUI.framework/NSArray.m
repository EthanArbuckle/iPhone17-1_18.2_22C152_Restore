@interface NSArray
@end

@implementation NSArray

id __79__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 description];

  return v2;
}

id __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) objectAtIndex:a2];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

BOOL __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_legacy_sizeWithFont:", *(void *)(a1 + 32));
  return v3 <= *(double *)(a1 + 40);
}

void __67__NSArray_RecipientUtilities__mf_indexOfRecipientWithEmailAddress___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 rangeOfString:*(void *)(a1 + 32) options:1];
  if (!v7
    || v7 != 0x7FFFFFFFFFFFFFFFLL
    && ((unsigned int v8 = [v10 characterAtIndex:v7 - 1], v8 <= 0x3C)
      ? (BOOL v9 = ((1 << v8) & 0x1000100500000200) == 0)
      : (BOOL v9 = 1),
        !v9))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
    *a4 = 1;
  }
}

@end