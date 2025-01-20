@interface QLItemViewControllerVendor
+ (id)qlItemViewControllerForItem:(id)a3;
+ (id)qlItemViewControllerForURL:(id)a3;
@end

@implementation QLItemViewControllerVendor

+ (id)qlItemViewControllerForURL:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(QLItemPresenterViewController);
  v5 = (void *)[objc_alloc(MEMORY[0x263F62978]) initWithURL:v3];

  [(QLItemPresenterViewController *)v4 loadPreviewControllerWithContents:v5 context:0 completionHandler:&__block_literal_global_278];

  return v4;
}

+ (id)qlItemViewControllerForItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(QLItemPresenterViewController);
  [(QLItemPresenterViewController *)v4 loadPreviewControllerWithContents:v3 context:0 completionHandler:&__block_literal_global_280];

  return v4;
}

@end