@interface UIKeyboardArbiterSceneFocusRequest
@end

@implementation UIKeyboardArbiterSceneFocusRequest

id __65___UIKeyboardArbiterSceneFocusRequest_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"shouldStealKeyboardOnSuccess"];
}

@end