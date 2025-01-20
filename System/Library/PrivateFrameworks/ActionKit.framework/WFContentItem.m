@interface WFContentItem
@end

@implementation WFContentItem

uint64_t __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__WFContentItem_ShareableObjects__getShareableObjectOfTypes_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  id v7 = [a2 platformImage];
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);
}

@end