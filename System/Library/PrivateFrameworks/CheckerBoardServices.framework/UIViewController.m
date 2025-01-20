@interface UIViewController
@end

@implementation UIViewController

void __47__UIViewController_InfoButton__setupInfoButton__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 infoButton];
  [v2 infoButtonTapped:v1];
}

@end