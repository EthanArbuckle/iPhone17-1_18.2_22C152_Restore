@interface NSArray
@end

@implementation NSArray

void __62__NSArray_AssistantUIAdditions__afui_arrayByMappingWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

@end