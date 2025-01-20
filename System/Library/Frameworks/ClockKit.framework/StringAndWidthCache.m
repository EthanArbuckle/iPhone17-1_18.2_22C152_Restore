@interface StringAndWidthCache
@end

@implementation StringAndWidthCache

void __60___StringAndWidthCache_attributedStringAndSize_forMaxWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 CGSizeValue];
  double v9 = v8;
  if (v8 <= *(double *)(a1 + 48))
  {
    uint64_t v10 = v7;
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:a3];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    v14 = *(double **)(a1 + 56);
    if (v14)
    {
      double *v14 = v9;
      *((void *)v14 + 1) = v10;
    }
    *a4 = 1;
  }
}

uint64_t __56___StringAndWidthCache_smallestAttributedStringAndSize___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 CGSizeValue];
  uint64_t v8 = *(void *)(a1[5] + 8);
  if (v6 <= *(double *)(v8 + 32))
  {
    *(double *)(v8 + 32) = v6;
    *(void *)(v8 + 40) = v7;
    uint64_t v9 = [*(id *)(a1[4] + 8) objectAtIndexedSubscript:a3];
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void *)(v10 + 40);
    *(void *)(v10 + 40) = v9;
    return MEMORY[0x270F9A758](v9, v11);
  }
  return result;
}

@end