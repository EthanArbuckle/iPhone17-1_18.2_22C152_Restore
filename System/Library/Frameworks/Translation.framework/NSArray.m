@interface NSArray
@end

@implementation NSArray

uint64_t __44__NSArray_LTArrayExtensions___ltCompactMap___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __56__NSArray_LTArrayExtensions__lt_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __51__NSArray_LTArrayExtensions__lt_ensureElementType___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

@end