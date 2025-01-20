@interface UIViewController
@end

@implementation UIViewController

void __108__UIViewController_AuthenticationServicesExtras___as_restorePresentedViewControllerStackForPasswordManager___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_as_restorePresentedViewControllerStackForPasswordManager:", v2);
}

@end