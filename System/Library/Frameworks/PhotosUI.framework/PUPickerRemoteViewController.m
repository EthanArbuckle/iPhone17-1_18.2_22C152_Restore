@interface PUPickerRemoteViewController
+ (void)requestViewControllerForExtension:(id)a3 proposedSize:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation PUPickerRemoteViewController

+ (void)requestViewControllerForExtension:(id)a3 proposedSize:(CGSize)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v6)
  {
    if (v7)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke;
      v10[3] = &unk_2642C5140;
      id v11 = v7;
      id v8 = v7;
      [v6 instantiateViewControllerWithInputItems:MEMORY[0x263EFFA68] connectionHandler:v10];

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  uint64_t v9 = _PFAssertFailHandler();
  __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke(v9);
}

uint64_t __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end