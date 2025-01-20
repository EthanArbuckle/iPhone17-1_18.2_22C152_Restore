@interface NSArray
@end

@implementation NSArray

uint64_t __47__NSArray_EmailFoundationAdditions__ef_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __52__NSArray_EmailFoundationAdditions__ef_mapSelector___block_invoke(uint64_t a1, id a2)
{
  v2 = [a2 *(SEL *)(a1 + 32)];
  return v2;
}

uint64_t __44__NSArray_EmailFoundationAdditions__ef_all___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

id __59__NSArray_EmailFoundationAdditions__ef_compactMapSelector___block_invoke(uint64_t a1, id a2)
{
  v2 = [a2 *(SEL *)(a1 + 32)];
  return v2;
}

uint64_t __67__NSArray_EmailFoundationAdditions__ef_indicesOfStringsWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __80__NSArray_EmailFoundationAdditions__ef_indexOfObject_usingSortFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

void __62__NSArray_EmailFoundationAdditions__ef_lastObjectPassingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

id __59__NSArray_EmailFoundationAdditions__ef_longestCommonPrefix__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v6 description];
  }
  v9 = v8;
  if (v8)
  {
    if (v5)
    {
      id v7 = [v5 commonPrefixWithString:v8 options:2];
      if (![v7 length]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
      goto LABEL_13;
    }
    id v10 = v8;
  }
  else
  {
    id v10 = v5;
  }
  id v7 = v10;
LABEL_13:

LABEL_14:
  return v7;
}

@end