@interface NSArray
@end

@implementation NSArray

uint64_t __35__NSArray_ITK__itk_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __48__NSArray_ITK__itk_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

void __31__NSArray_ITK__itk_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itk_addNonNilObject:", v2);
}

void __24__NSArray_ITK__itk_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

void __28__NSArray_ITK__itk_flatMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObjectsFromArray:v2];
}

@end