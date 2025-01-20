@interface NSArray
@end

@implementation NSArray

uint64_t __40__NSArray_BaseBoard__bs_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __60__NSArray_BaseBoard__bs_enumerateObjectsOfClass_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

uint64_t __44__NSArray_BaseBoard__bs_firstObjectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end