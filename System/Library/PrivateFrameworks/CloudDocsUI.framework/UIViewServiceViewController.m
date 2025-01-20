@interface UIViewServiceViewController
@end

@implementation UIViewServiceViewController

void __55___UIViewServiceViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 preferredContentSize];
  double v5 = v4;
  double v7 = v6;

  objc_msgSend(WeakRetained, "_updatedContentSizeForPreferredContentSize:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "setPreferredContentSize:", v9, v11);
}

@end