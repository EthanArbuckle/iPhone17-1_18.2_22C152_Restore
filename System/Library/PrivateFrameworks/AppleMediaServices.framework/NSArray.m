@interface NSArray
@end

@implementation NSArray

BOOL __68__NSArray_AppleMediaServices__ams_nonEmptyComponentsJoinedByString___block_invoke(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA98] null];

  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) == 0 || [v1 length] != 0;
  BOOL v4 = v2 != v1 && v3;

  return v4;
}

id __59__NSArray_AppleMediaServices__ams_sanitizedForSecureCoding__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v2, "ams_sanitizedForSecureCoding");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    BOOL v4 = v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(id)objc_opt_class() supportsSecureCoding])
  {
    id v3 = v2;
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 description];
    goto LABEL_8;
  }
  BOOL v4 = 0;
LABEL_9:

  return v4;
}

uint64_t __55__NSArray_AppleMediaServices__ams_allWithOptions_test___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __55__NSArray_AppleMediaServices__ams_anyWithOptions_test___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke_2;
  v7[3] = &unk_1E55A87B0;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a3;
  uint64_t v10 = a4;
  [a2 enumerateObjectsUsingBlock:v7];
}

uint64_t __72__NSArray_AppleMediaServices__ams_enumerateObjectsForArrays_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  **(unsigned char **)(a1 + 48) = v7;
  *a4 = v7;
  return result;
}

id __68__NSArray_AppleMediaServices__ams_invertedDictionaryUsingTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You cannot return nil from the block." userInfo:0];
    objc_exception_throw(v7);
  }
  v5 = (void *)v4;

  return v5;
}

@end