@interface NSArray
@end

@implementation NSArray

id __52__NSArray_BacklightServices__bls_boundedDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __60__NSArray_BacklightServices__bls_boundedDescriptionWithMax___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(a1 + 40) withName:@"count"];
}

void __72__NSArray_BacklightServices__bls_boundedDescriptionWithMax_transformer___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end