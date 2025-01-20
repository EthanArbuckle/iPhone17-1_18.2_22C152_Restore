@interface UIAlertController
@end

@implementation UIAlertController

uint64_t __69__UIAlertController_AppleAccountUI___handlerWithSingleActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__UIAlertController_AppleAccountUI___handlerWithMultiActionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [a2 style] == 1;
  v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);
  return v4(v2, v3);
}

@end