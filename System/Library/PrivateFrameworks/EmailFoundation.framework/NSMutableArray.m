@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __102__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortFunction_context_allowDuplicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

uint64_t __81__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "compareObject:toObject:", v5, v6, (void)v15);
      uint64_t v12 = v11;
      if (v11 == -1 || v11 == 1) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v12 = 0;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __86__NSMutableArray_EmailFoundationAdditions__ef_removeObject_usingSortFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

@end