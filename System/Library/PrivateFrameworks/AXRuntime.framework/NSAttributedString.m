@interface NSAttributedString
@end

@implementation NSAttributedString

void __103__NSAttributedString_AXPropertyListCoersion___axRecursivelyPropertyListCoercedRepresentationWithError___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  unint64_t v17 = bswap64(a4);
  unint64_t v18 = bswap64(a3);
  v7 = (void *)MEMORY[0x1E4F1CA58];
  id v8 = a2;
  v9 = [v7 data];
  [v9 appendBytes:&v18 length:8];
  [v9 appendBytes:&v17 length:8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = [v8 _axRecursivelyPropertyListCoercedRepresentationWithError:&obj];

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    v19[0] = @"Range";
    v19[1] = @"Attrs";
    v20[0] = v9;
    v20[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [*(id *)(a1 + 32) addObject:v12];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    *a5 = 1;
  }
}

@end