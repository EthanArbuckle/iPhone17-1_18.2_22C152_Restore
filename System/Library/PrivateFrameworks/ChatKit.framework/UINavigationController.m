@interface UINavigationController
@end

@implementation UINavigationController

uint64_t __81__UINavigationController_CKAdditions____ck_popViewControllerAnimated_completion___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __84__UINavigationController_CKAdditions____ck_popToViewController_animated_completion___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __87__UINavigationController_CKAdditions____ck_popToRootViewControllerAnimated_completion___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

@end