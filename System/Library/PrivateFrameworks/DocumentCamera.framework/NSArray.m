@interface NSArray
@end

@implementation NSArray

uint64_t __33__NSArray_DC__dc_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __29__NSArray_DC__dc_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dc_addNonNilObject:", v2);
}

void __22__NSArray_DC__dc_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

void __26__NSArray_DC__dc_flatMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  DCCheckedDynamicCast(v4, (uint64_t)v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObjectsFromArray:v6];
}

@end