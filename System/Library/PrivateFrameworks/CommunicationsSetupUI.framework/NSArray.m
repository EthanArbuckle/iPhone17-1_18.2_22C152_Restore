@interface NSArray
@end

@implementation NSArray

void __52__NSArray_CNFRegUtilities__CNFRegArrayPassingTests___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = (*(uint64_t (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
        if (a4 && v18)
        {
          *a4 = 1;
LABEL_15:

          goto LABEL_16;
        }
        char v13 = v12 ^ 1;
        if (v18) {
          char v13 = 1;
        }
        if (v13) {
          goto LABEL_15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6, (void)v14);
LABEL_16:
}

@end